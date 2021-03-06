
<%@ page import="com.esms.model.maintenance.WorkDoneCertificate" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap3">
		<g:set var="entityName" value="${message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate')}" />
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
						
							<g:sortableColumn property="workDoneDate" title="${message(code: 'workDoneCertificate.workDoneDate.label', default: 'Work Done Date')}" />
						
							<g:sortableColumn property="customerName" title="${message(code: 'workDoneCertificate.customerName.label', default: 'Customer Name')}" />
						
							<g:sortableColumn property="contract" title="${message(code: 'workDoneCertificate.contract.label', default: 'Contract')}" />
						
							<g:sortableColumn property="machineNumber" title="${message(code: 'workDoneCertificate.machineNumber.label', default: 'Machine Number')}" />
						
							<g:sortableColumn property="routeNumber" title="${message(code: 'workDoneCertificate.routeNumber.label', default: 'Route Number')}" />
						
							<g:sortableColumn property="location" title="${message(code: 'workDoneCertificate.location.label', default: 'Location')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${workDoneCertificateInstanceList}" var="workDoneCertificateInstance">
						<tr>
						
							<td><g:formatDate date="${workDoneCertificateInstance.workDoneDate}" /></td>
						
							<td>${fieldValue(bean: workDoneCertificateInstance, field: "customerName")}</td>
						
							<td>${fieldValue(bean: workDoneCertificateInstance, field: "contract")}</td>
						
							<td>${fieldValue(bean: workDoneCertificateInstance, field: "machineNumber")}</td>
						
							<td>${fieldValue(bean: workDoneCertificateInstance, field: "routeNumber")}</td>
						
							<td>${fieldValue(bean: workDoneCertificateInstance, field: "location")}</td>
						
							<td class="link">
								<g:link action="show" id="${workDoneCertificateInstance.id}" class="lnk">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pgn">
					<bootstrap:paginate total="${workDoneCertificateInstanceTotal}" />
				</div>
			</div>
		</div>
	</body>
</html>
