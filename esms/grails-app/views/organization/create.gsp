<%@ page import="com.esms.model.party.Organization" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="Organization" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<g:hasErrors bean="${organizationInstance}">
				<bootstrap:alert class="alert-danger">
					<ul>
						<g:eachError bean="${organizationInstance}" var="error">
							<li
								<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</bootstrap:alert>
			</g:hasErrors>

			<div class="page-header">
				<h3>
					<g:message code="default.create.label" args="[entityName]" />
				</h3>
			</div>
			
			<div class="well">
				<g:form class="form-horizontal" action="create">
					<fieldset>
						<g:render template="form"></g:render>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-2">
								<button type="submit" class="btn btn-sm btn-primary">
									
									<g:message code="default.button.create.label" default="Create" />
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