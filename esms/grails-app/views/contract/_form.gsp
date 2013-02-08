<%@ page import="com.esms.model.sales.Contract"%>



<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'contractNumber', 'error')} required">
	<label for="contractNumber" class="control-label"><g:message
			code="contract.contractNumber.label" default="Contract Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="contractNumber" required=""
			value="${contractInstance?.contractNumber}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'contractNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'customerNumber', 'error')} required">
	<label for="organization" class="control-label"><g:message
			code="quote.organization.label" default="Organization" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<richui:autoComplete name="customerNumber" 
			action="${createLinkTo('dir': 'organization/searchAJAX')}"
			forceSelection="true" typeAhead="true" shadow="true" minQueryLength ="2"/>
		<span class="help-inline">
			${hasErrors(bean: quoteInstance, field: 'organization', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'status', 'error')} ">
	<label for="status" class="control-label"><g:message
			code="contract.status.label" default="Status" /></label>
	<div class="controls">
		<g:select name="status"
			from="${contractInstance.constraints.status.inList}"
			value="${contractInstance?.status}"
			valueMessagePrefix="contract.status" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'status', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'fromDate', 'error')} required">
	<label for="fromDate" class="control-label"><g:message
			code="contract.fromDate.label" default="From Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="fromDate"
			value="${contractInstance?.fromDate}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'fromDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'toDate', 'error')} required">
	<label for="toDate" class="control-label"><g:message
			code="contract.toDate.label" default="To Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bootstrap:jqDatePicker name="toDate"
			value="${contractInstance?.toDate}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'toDate', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'invoicingIsFixedPrice', 'error')} ">
	<label for="invoicingIsFixedPrice" class="control-label"><g:message
			code="contract.invoicingIsFixedPrice.label"
			default="Invoicing Is Fixed Price" /></label>
	<div class="controls">
		<g:checkBox name="invoicingIsFixedPrice"
			value="${contractInstance?.invoicingIsFixedPrice}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'invoicingIsFixedPrice', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'invoicingIsTimesheets', 'error')} ">
	<label for="invoicingIsTimesheets" class="control-label"><g:message
			code="contract.invoicingIsTimesheets.label"
			default="Invoicing Is Timesheets" /></label>
	<div class="controls">
		<g:checkBox name="invoicingIsTimesheets"
			value="${contractInstance?.invoicingIsTimesheets}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'invoicingIsTimesheets', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'invoicingIsExpenses', 'error')} ">
	<label for="invoicingIsExpenses" class="control-label"><g:message
			code="contract.invoicingIsExpenses.label"
			default="Invoicing Is Expenses" /></label>
	<div class="controls">
		<g:checkBox name="invoicingIsExpenses"
			value="${contractInstance?.invoicingIsExpenses}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'invoicingIsExpenses', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo" class="control-label"><g:message
			code="contract.assignedTo.label" default="Assigned To" /></label>
	<div class="controls">
		<g:textField name="assignedTo" value="${contractInstance?.assignedTo}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'description', 'error')} ">
	<label for="description" class="control-label"><g:message
			code="contract.description.label" default="Description" /></label>
	<div class="controls">
		<g:textArea name="description" rows="5" cols="10"
			value="${contractInstance?.description}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contractInstance, field: 'termsAndConditions', 'error')} ">
	<label for="termsAndConditions" class="control-label"><g:message
			code="contract.termsAndConditions.label"
			default="Terms And Conditions" /></label>
	<div class="controls">
		<g:textArea name="termsAndConditions" rows="5" cols="10"
			value="${contractInstance?.termsAndConditions}" />
		<span class="help-inline">
			${hasErrors(bean: contractInstance, field: 'termsAndConditions', 'error')}
		</span>
	</div>
</div>
