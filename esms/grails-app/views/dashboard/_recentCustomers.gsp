<%@page import="com.esms.model.product.Product"%>
<%@ page import="com.esms.model.party.*"%>

<div class="dashboard-widget-header">
	<h3>Recent Service Contracts</h3>
</div>


<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'organization.name.label', default: 'Name')}
			</th>
			<th>
				Type of Contract
			</th>	
			<th>
				Contact Person
			</th>	
			<th>
				Contact Number
			</th>
			<th>
				Assigned To
			</th>	
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${recentOrders}" var="order">
			<g:set var="organization"
				value="${order.organization}" />
			<g:set var="addressInstance"
				value="${Address.findByAddressTypeAndParty('BILLING',organization) }" />
			<tr>
				<td>
					<g:link controller="organization" action="show" id="${organization?.id}">
						${fieldValue(bean: organization, field: "name")}
					</g:link>
				</td>
				<td>
					<g:if test="${order?.orderItems?.size() != 0}">
						${Product.findByProductNumber(order?.orderItems?.first().productNumber)?.productName}
					</g:if>
					<g:else>
						-
					</g:else>
				</td>
				<td>
					<%
						if(!organization?.contacts?.isEmpty()) {
							def contact = organization?.contacts.first()
							println contact?.firstName
						}
					 %>
				</td>
				<td>
					<%
						if(!organization?.contacts?.isEmpty()) {
							def contact = organization?.contacts.first()
							println contact?.phoneBooks?.first()?.mobilePhone
						}
					 %>
				</td>
				<td>
					${order.assignedTo}
				</td>
				<td class="link"><g:link controller="order" action="show" id="${order?.id}" class="btn btn-default btn-xs">Show &raquo;</g:link></td>
			</tr>
		</g:each>
	</tbody>
	<tfoot>
			<tr>
				<th colspan="6" class="link">
					<g:link controller="order" action="list" class="btn btn-default btn-xs">Show All &raquo;</g:link>
				</th>				
			</tr>
		</tfoot>
</table>