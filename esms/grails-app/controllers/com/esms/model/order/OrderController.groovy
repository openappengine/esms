package com.esms.model.order

import grails.converters.JSON;

import org.grails.plugin.filterpane.FilterPaneUtils
import org.springframework.dao.DataIntegrityViolationException

import com.esms.model.calendar.Event;
import com.esms.model.inventory.InventoryJournal
import com.esms.model.invoice.Invoice
import com.esms.model.invoice.InvoiceLine
import com.esms.model.party.Organization
import com.esms.model.product.Product
import com.esms.model.quote.Quote

class OrderController {

	static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	def filterPaneService

	def index() {
		redirect action: 'list', params: params
	}

	def list() {
		if(!params.offset) {
			params.offset= 0
		} 
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		def c = Order.createCriteria()
		def orders = c.list {
			'in'('type', [
				'REPAIR',
				'MODERNIZATION',
				'INSTALLATION'
			])
			firstResult(params.offset?.toInteger())
			maxResults(params.max?.toInteger())
		}
		
		def c1 = Order.createCriteria()
		def orderInstanceTotal = c1.get {
			'in'('type', [
				'REPAIR',
				'MODERNIZATION',
				'INSTALLATION'
			])
			projections {
		        countDistinct "id"
		    }
		}

		[orderInstanceList: orders, orderInstanceTotal: orderInstanceTotal]
	}

	def filter = {
		if(!params.offset) {
			params.offset= 0
		} 
		if(!params.max) {
			params.max= grailsApplication.config.esms.settings.max?.toInteger()
		}
		
		render( view:'list', model:[ orderInstanceList: filterPaneService.filter( params, Order),
			orderInstanceTotal: filterPaneService.count( params, Order), filterParams: FilterPaneUtils.extractFilterParams(params), params:params ] )
	}

	def confirmSale() {
		def orderInstance = Order.get(params.id)
		if(orderInstance) {
			orderInstance.status = "CONFIRM_SALE"

			//TODO : Create OrderInventoryAssignments for this Sales Order
			orderInstance.orderItems?.each{
				def productNumber = it.productNumber
				def product = Product.findByProductName(productNumber)
				if(product.requiresInventory && product.inventory) {
					def orderInventory = new InventoryJournal()
					orderInventory.order = orderInstance
					orderInventory.productInventory = product.inventory
					orderInventory.quantity = it.quantity
					orderInventory.isPosted = false
					orderInventory.status = 'PENDING_DELIVERY' //TODO
					orderInventory.save(flush:true)
				} else {
					//
				}
			}
		}

		flash.message = 'Marked as Sales Complete: ' + orderInstance.orderNumber
		redirect action: 'show', id: orderInstance.id
	}

	def convertQuoteToOrder() {
		def list = Order.list();
		int no = (list?list.size():0) + 1;
		String orderNumber = "ORD" + String.format("%05d", no)

		def quote = Quote.get(params.id)

		//Convert Lead, (if applicable)
		quote.organization?.convertLead()
		quote.organization?.save(flush:true)

		def order = new Order()
		order.orderNumber = orderNumber
		order.contactName = quote.contactName
		order.status = "PENDING_INVOICE"
		if(quote.type == 'CONTRACT') {
			quote.status = "CONVERTED_TO_SERVICE_CONTRACT	"
			order.type = "SERVICE"
			order.relatedTo = "CONTRACT"

			order.contractFromDate = quote.contractFromDate
			order.contractToDate = quote.contractToDate
			order.invoicingIsFixedPrice = quote.invoicingIsFixedPrice
			order.invoicingIsTimesheets = quote.invoicingIsTimesheets
			order.invoicingIsExpenses = quote.invoicingIsExpenses
			order.assignedTo = quote.assignedTo
			order.termsAndConditions = quote.termsAndConditions

		} else {
			order.type = quote.type
			order.relatedTo = "CONTRACT"
			quote.status = "CONVERTED_TO_SALES_ORDER"
		}

		//Invoiced And Pending Invoiced Grand Total
		order.organization = quote.organization
		
		if(!order.save(flush:true)) {
			redirect controller: 'quote',action: 'show', id: quote.id
			return
		}

		order.orderItems = new HashSet<OrderItem>()
		
		def unitPrice = 0.0
		def tax = 0.0
		def discount = 0.0
		def lineTotalAmount = 0.0
		
		int lineNo = 1
		quote.quoteItems.each { it ->
			def orderItem = new OrderItem()
			orderItem.lineNumber = lineNo
			orderItem.quantity = it.quantity
			orderItem.unitPrice = it.unitPrice
			orderItem.tax = it.tax
			orderItem.discount = it.discount
			orderItem.lineTotalAmount = it.quantity*it.unitPrice + it.tax - it.discount
			orderItem.productNumber= it.productNumber
			orderItem.order = order
			orderItem.save(flush:true)
			lineNo++
			
			unitPrice += it.unitPrice
			tax += it.tax
			discount += it.discount
			lineTotalAmount += it.lineTotalAmount
		}

		order.totalAmount = unitPrice
		order.totalTax = tax
		order.totalDiscount = discount
		order.adjustment = 0.0
		order.grandTotal = unitPrice + tax - discount
		order.referenceQuoteNumber = quote.quoteNumber
		order.notes = quote.notes
		order.invoicedGrandTotal = 0.0
		order.pendingInvoiceGrandTotal = order.grandTotal
		order.save(flush:true)
		
		flash.message = 'Order Created from Quote: ' + quote.quoteName
		redirect action: 'show', id: order.id
	}

	def create() {
		switch (request.method) {
			case 'GET':
				def list = Order.list();
				int no = (list?list.size():0) + 1;
				String orderNumber = "ORD" + String.format("%05d", no)
				params.orderNumber = orderNumber

				def order = new Order(params)

				if(params.relatedTo == 'CONTRACT' && params.customerNumber) {
					String customerNumber = params.customerNumber
					def organization = Organization.findByExternalId(customerNumber)
					order.organization = organization
				}

				[orderInstance: order]
				break
			case 'POST':
				def orderInstance = new Order(params)
				if (!orderInstance.save(flush: true)) {
					render view: 'create', model: [orderInstance: orderInstance]
					return
				}

				flash.message = message(code: 'default.created.message', args: [
					message(code: 'order.label', default: 'Order'),
					orderInstance.id
				])
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

	def show() {
		def orderInstance = Order.get(params.id)
		
		if(request.xhr) {
			render orderInstance as JSON
		} else {
			if (!orderInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'order.label', default: 'Order'),params.id])
                redirect action: 'list'
			}
			
			def productName
			
			orderInstance?.orderItems?.each {
				def p = Product.findByProductNumber(it.productNumber)
						if(p.productType == 'SERVICE') {
							productName = p.productName
						}
			}
			
			def invoices = Invoice.findAllByReferenceOrderNumber(orderInstance?.orderNumber)
			
			def events = Event.findAllByRelatedToValue(orderInstance?.orderNumber)
			
			[orderInstance: orderInstance,contractName:productName,invoices:invoices,events:events]
		}
		
	}

	def edit() {
		switch (request.method) {
			case 'GET':
				def orderInstance = Order.get(params.id)
				if (!orderInstance) {
					flash.message = message(code: 'default.not.found.message', args: [
						message(code: 'order.label', default: 'Order'),
						params.id
					])
					redirect action: 'list'
					return
				}

				[orderInstance: orderInstance]
				break
			case 'POST':
				def orderInstance = Order.get(params.id)
				if (!orderInstance) {
					flash.message = message(code: 'default.not.found.message', args: [
						message(code: 'order.label', default: 'Order'),
						params.id
					])
					redirect action: 'list'
					return
				}

				if (params.version) {
					def version = params.version.toLong()
					if (orderInstance.version > version) {
						orderInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
								[
									message(code: 'order.label', default: 'Order')] as Object[],
								"Another user has updated this Order while you were editing")
						render view: 'edit', model: [orderInstance: orderInstance]
						return
					}
				}

				orderInstance.properties = params

				if (!orderInstance.save(flush: true)) {
					render view: 'edit', model: [orderInstance: orderInstance]
					return
				}

				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'order.label', default: 'Order'),
					orderInstance.id
				])
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

	def delete() {
		def orderInstance = Order.get(params.id)
		if (!orderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'order.label', default: 'Order'),
				params.id
			])
			redirect action: 'list'
			return
		}

		try {
			orderInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'order.label', default: 'Order'),
				params.id
			])
			redirect action: 'list'
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'order.label', default: 'Order'),
				params.id
			])
			redirect action: 'show', id: params.id
		}
	}

	def assignOrderItem() {
		switch (request.method) {
			case 'GET':
				def list = PurchaseOrder.list();
				int no = (list?list.size():0) + 1;
				String orderNumber = "PO" + String.format("%05d", no)
				params.purchaseOrderNumber = orderNumber

				def order = PurchaseOrder.get(params.orderId)

				def c = PurchaseOrderItem.createCriteria()
				def maxLineNumber = c.get {
					eq("purchaseOrder", order)
					projections { max ("lineNumber") }
				}
				params.lineNumber = maxLineNumber?maxLineNumber:0 + 1
				[purchaseOrderInstance: new PurchaseOrder(params)]
				break
			case 'POST':
				def purchaseOrderInstance = new PurchaseOrder(params)

				if (!purchaseOrderInstance.save(flush: true)) {
					render view: 'show', model: [purchaseOrderItemInstance: purchaseOrderInstance]
					return
				}

				def orderItem = OrderItem.get(params.orderItemInstanceId.toInteger())
				orderItem.relatedOrderNumber = purchaseOrderInstance?.purchaseOrderNumber

				def unitPrice = new BigDecimal("0.0")
				def tax = new BigDecimal("0.0")
				def discount = new BigDecimal("0.0")
				def lineTotalAmount = new BigDecimal("0.0")
				BigDecimal totalDiscount = new BigDecimal("0.0")
				BigDecimal grandTotal = new BigDecimal("0.0")

				purchaseOrderInstance.save(flush:true)

				redirect action: 'show', id: orderItem?.order?.id

				break
		}
	}

	def createOrderItem() {
		switch (request.method) {
			case 'GET':
				def order = Order.get(params.orderId)

				def c = OrderItem.createCriteria()
				def maxLineNumber = c.get {
					eq("order", order)
					projections { max ("lineNumber") }
				}
				params.lineNumber = maxLineNumber?maxLineNumber:0 + 1
				[orderItemInstance: new OrderItem(params)]
				break
			case 'POST':
				def orderItemInstance = new OrderItem(params)

				if (!orderItemInstance.save(flush: true)) {
					render view: 'create', model: [orderItemInstance: orderItemInstance]
					return
				}

				def order = orderItemInstance.order
				def orderItems = order.orderItems

				def unitPrice = new BigDecimal("0.0")
				def tax = new BigDecimal("0.0")
				def discount = new BigDecimal("0.0")
				def lineTotalAmount = new BigDecimal("0.0")
				def pendingInvoiceGrandTotal = new BigDecimal("0.0")
				def invoiceGrandTotal = new BigDecimal("0.0")

				orderItems?.each { it ->
					unitPrice += it.unitPrice
					tax +=  it.tax
					discount +=  it.discount
					lineTotalAmount +=  it.lineTotalAmount
				}

				BigDecimal totalDiscount = new BigDecimal("0.0")
				BigDecimal grandTotal = new BigDecimal("0.0")

				order.totalAmount = unitPrice
				order.totalTax = tax
				order.totalDiscount = discount
				order.grandTotal = lineTotalAmount
				order.pendingInvoiceGrandTotal = grandTotal

				order.save(flush:true)

				flash.message = message(code: 'default.created.message', args: [
					message(code: 'quoteItem.label', default: 'QuoteItem'),
					orderItemInstance.id
				])
				redirect action: 'show', id: orderItemInstance.order.id
				break
		}
	}

	def createInvoice = {
		def order = Order.get(params.id)
		order.status = "INVOICED"
		order.openGrandTotal = order.grandTotal
		order.receviedGrandTotal = new BigDecimal("0.0")
		
		if(order.adjustment == null) {
			order.adjustment = new BigDecimal("0.0")
		}
		
		order.save(flush:true)

		//Create Invoice -- Start
		def invoice = new Invoice()
		def list = Invoice.list();
		int no = (list?list.size():0) + 1;
		String invoiceNumber = "INV" + String.format("%05d", no)

		invoice.invoiceNumber = invoiceNumber
		invoice.contactName = order.contactName
		invoice.status = "CREATED"

		invoice.relatedTo = "ORDER"
		invoice.relatedToValue = order.orderNumber

		invoice.assignedTo = order.assignedTo
		invoice.termsAndConditions = order.termsAndConditions

		invoice.contractFromDate = order.contractFromDate
		invoice.contractToDate = order.contractToDate
		invoice.type = order.type
		
		invoice.totalAmount = order.totalAmount + order.totalTax - order.totalDiscount - order.adjustment - order.invoicedGrandTotal //Doesnt include negotitation discount,
		invoice.totalTax = 0.0
		invoice.totalDiscount = 0.0
		invoice.adjustment = 0.0
		invoice.grandTotal = invoice.totalAmount
		invoice.referenceOrderNumber = order.orderNumber

		invoice.organization = order.organization
		int lineNumber = 1;

		def invoiceLines = []

		order.orderItems?.each {
			def invoiceLine = new InvoiceLine()
			invoiceLine.lineNumber = (lineNumber++)
			invoiceLine.quantity = it.quantity

			invoiceLine.unitPrice = it.unitPrice
			invoiceLine.tax = it.tax
			invoiceLine.lineTotalAmount = it.lineTotalAmount
			invoiceLine.discount = it.discount
			invoiceLine.productNumber = it.productNumber
			invoiceLine.relatedOrderNumber = it.relatedOrderNumber
			invoiceLine.percentageInvoiced = 100.0 - it.percentageInvoiced
			invoiceLine.amountInvoiced = it.lineTotalAmount - it.amountInvoiced
			
			invoiceLines.add(invoiceLine)
		}

		invoice?.invoiceLines = invoiceLines
		
		//flash.message = "Invoiced.."
		//redirect action: 'show', id: order.id
		chain controller:'invoice',action: 'create', model: [invoiceInstance:invoice,order:order]
	}

	def registerPayment() {

	}

	def ordersPendingPayment() {
		def openOrders = Order.findAllByStatus('INVOICED',params)
		[ordersPendingPayments:openOrders]
	}

	def tagForRenewal() {
		def orderInstance = Order.get(params.id)
		orderInstance.taggedForRenewal = true
		orderInstance.renewalStage = 'TAGGED_FOR_RENEWAL'
		orderInstance.save(flush:true)
		redirect action: 'show', id: orderInstance.id
	}

	def renewalLetterSent() {
		switch (request.method) {
			case 'GET':
				def orderInstance = Order.get(params.id)
				[orderInstance : orderInstance]
				break
			case 'POST' :
				def orderInstance = Order.get(params.id)
				orderInstance.renewalStage = 'RENEWAL_LETTER_SENT'
				orderInstance.recepientContactName = params.recepientContactName
				orderInstance.recepientContactNumber = params.recepientContactNumber
				orderInstance.receivedDateTime = params.receivedDateTime
				orderInstance.handedOveryBy = params.handedOveryBy

				orderInstance.save(flush:true)
				flash.message = 'Renewal Letter Sent.'
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

	def renewalWon() {
		switch (request.method) {
			case 'GET':
				def orderInstance = Order.get(params.id)

				def fromCal = orderInstance?.contractToDate?.plus(1)

				def endCal = Calendar.instance
				endCal.setTime(fromCal)
				int d = endCal.get(Calendar.DATE)
				int y = endCal.get(Calendar.YEAR)
				endCal.set Calendar.DATE, d
				endCal.set Calendar.YEAR, (y+1)

				def newEndDate = endCal.getTime().minus(1)

				params.renewedContractFromDate = fromCal
				params.renewedContractToDate = newEndDate
				params.renewedGrandTotal = orderInstance?.grandTotal
				
				
				params.tax = 0.0
				params.discount= 0.0
				
				//
				def serviceListItemsMap = [:]
				if(orderInstance.type == 'SERVICE') {
					def serviceItems = Product.findAllByProductType('SERVICE')
					serviceItems?.each {
						serviceListItemsMap.put(it.productNumber, it.productName)
					}
				}
				[orderInstance : orderInstance,serviceListItemsMap:serviceListItemsMap]
				break
			case 'POST' :
				def orderInstance = Order.get(params.id)
				orderInstance.renewalStage = 'RENEWAL_WON'

				//Copy Order
				def list = Order.list();
				int no = (list?list.size():0) + 1;
				String orderNumber = "ORD" + String.format("%05d", no)

				def newOrder = new Order()
				newOrder.orderNumber = orderNumber
				newOrder.contactName = orderInstance.contactName
				newOrder.status = "PENDING_INVOICE"
				newOrder.contractFromDate = params.renewedContractFromDate
				newOrder.contractToDate = params.renewedContractToDate
				newOrder.type = "SERVICE"
				newOrder.relatedTo = "ORDER"
				newOrder.relatedToValue = orderInstance?.orderNumber

				newOrder.invoicingIsFixedPrice = orderInstance.invoicingIsFixedPrice
				newOrder.invoicingIsTimesheets = orderInstance.invoicingIsTimesheets
				newOrder.invoicingIsExpenses = orderInstance.invoicingIsExpenses
				newOrder.assignedTo = orderInstance.assignedTo
				newOrder.termsAndConditions = orderInstance.termsAndConditions

				newOrder.totalAmount = params.unitPrice?.toBigDecimal()
				newOrder.totalTax = params.tax?.toBigDecimal()
				newOrder.totalDiscount = params.discount?.toBigDecimal()
				newOrder.grandTotal = params.renewedGrandTotal?.toBigDecimal()
				newOrder.referenceQuoteNumber = orderInstance.referenceQuoteNumber

				newOrder.organization = orderInstance.organization

				newOrder.save(flush:true)

				newOrder.orderItems = new HashSet<OrderItem>()

				int lineNo = 1
				def orderItem = new OrderItem()
				orderItem.lineNumber = lineNo
				orderItem.quantity = 1.0
				orderItem.unitPrice = params.unitPrice?.toBigDecimal()
				orderItem.tax = params.tax?.toBigDecimal()
				orderItem.lineTotalAmount = params.renewedGrandTotal?.toBigDecimal()
				orderItem.discount = params.discount?.toBigDecimal()
				orderItem.productNumber= params.selectedService
				orderItem.order = newOrder
				orderItem.save(flush:true)
				lineNo++
				
				newOrder.save(flush:true)

				flash.message = 'Renewal Won !. Renewal Service Contract Created.'
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

	def renewalLost() {
		switch (request.method) {
			case 'GET':
				def orderInstance = Order.get(params.id)
				[orderInstance : orderInstance]
				break
			case 'POST' :
				def orderInstance = Order.get(params.id)
				orderInstance.renewalStage = 'RENEWAL_LOST'
				orderInstance.renewalLostReason = params.renewalLostReason
				orderInstance.save(flush:true)
				
				def organization = orderInstance?.organization
				organization.salesStatus = "LOST_IN_RENEWAL"
				organization.save(flush:true)
				
				flash.message = 'Renewal Lost !. Organization ' + organization.name + ' marked as lost in renewal.'
				redirect action: 'show', id: orderInstance.id
				break
		}
	}

}

