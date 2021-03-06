
<%@ page import="com.esms.model.sales.Contract" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'contract.label', default: 'Contract')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h3>
						<g:message code="default.list.label" args="[entityName]" />
					</h3>
				</div>
				
				<table class="table table-striped table-condensed table-bordered">
					<thead>
						<tr>
						
							<g:sortableColumn property="contractNumber" title="${message(code: 'contract.contractNumber.label', default: 'Contract Number')}" />
						
							<g:sortableColumn property="organization.id" title="${message(code: 'contract.organization.id.label', default: 'Organization')}" />
						
							<g:sortableColumn property="status" title="${message(code: 'contract.status.label', default: 'Status')}" />
						
							<g:sortableColumn property="fromDate" title="${message(code: 'contract.fromDate.label', default: 'From Date')}" />
						
							<g:sortableColumn property="toDate" title="${message(code: 'contract.toDate.label', default: 'To Date')}" />
						
							<g:sortableColumn property="invoicingIsFixedPrice" title="${message(code: 'contract.invoicingIsFixedPrice.label', default: 'Invoicing Is Fixed Price')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${contractInstanceList}" var="contractInstance">
						<tr>
						
							<td>${fieldValue(bean: contractInstance, field: "contractNumber")}</td>
						
							<td>${fieldValue(bean: contractInstance, field: "organization.id")}</td>
						
							<td>${fieldValue(bean: contractInstance, field: "status")}</td>
						
							<td><g:formatDate date="${contractInstance.fromDate}" /></td>
						
							<td><g:formatDate date="${contractInstance.toDate}" /></td>
						
							<td><g:formatBoolean boolean="${contractInstance.invoicingIsFixedPrice}" /></td>
						
							<td class="link">
								<g:link action="show" id="${contractInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate total="${contractInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
