<%@ page import="com.esms.model.maintenance.LiftInfo" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'liftInfo.label', default: 'LiftInfo')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${liftInfoInstance}">
				<bootstrap:alert class="alert-danger">
					<ul>
						<g:eachError bean="${liftInfoInstance}" var="error">
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
				<g:form class="form-horizontal" action="edit"id="${liftInfoInstance?.id}">
					<g:hiddenField name="version" value="${liftInfoInstance?.version}" />
					<g:hiddenField name="organization.id" value="${liftInfoInstance?.organization?.id}" />
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-primary">
									<g:message code="default.button.update.label" default="Update" />
								</button>
								<button type="submit" class="btn btn-sm btn-default"
									name="_action_delete" formnovalidate>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</div>						
					</fieldset>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>
