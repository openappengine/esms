<%@ page import="com.esms.model.maintenance.WorkDoneCertificate" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'workDoneCertificate.label', default: 'WorkDoneCertificate')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${workDoneCertificateInstance}">
				<bootstrap:alert class="alert-danger">
					<ul>
						<g:eachError bean="${workDoneCertificateInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h3>
					<g:message code="default.edit.label" args="[entityName]" />
				</h3>
			</div>
			
			<div class="well">
				<g:form class="form-horizontal" action="edit"
					id="${workDoneCertificateInstance?.id}">
					<g:hiddenField name="version" value="${workDoneCertificateInstance?.version}" />
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-group">
							<button type="submit" class="btn btn-primary">

								<g:message code="default.button.update.label" default="Update" />
							</button>
							<button type="submit" class="btn btn-sm btn-default"
								name="_action_delete" formnovalidate>
								<g:message code="default.button.delete.label" default="Delete" />
							</button>
						</div>
					</fieldset>
				</g:form>
			</div>
			
		</div>
	</div>
</body>
</html>
