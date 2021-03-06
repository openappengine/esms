

<%@ page import="com.esms.model.party.Contact"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'contact.label', default: 'Contact')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					Contact :
					${contactInstance?.externalId}
					:
					${contactInstance?.firstName} ${contactInstance?.lastName}
				</h3>
			</div>
			
				<div class="well">
					<g:link class="btn btn-default btn-sm" action="edit" id="${contactInstance?.id}">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<g:link class="btn btn-default btn-sm deleteBtn" action="delete" id="${contactInstance?.id}">
						<g:message code="default.button.delete.label" default="Delete" />
					</g:link>
				</div>


			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">
						<dt>
							<g:message code="contact.salutation.label" default="Salutation" />
						</dt>

						<dd>
							<g:fieldValue bean="${contactInstance}" field="salutation" />
						</dd>

						<dt>
							<g:message code="contact.externalId.label" default="External Id" />
						</dt>

						<dd>
							<g:fieldValue bean="${contactInstance}" field="externalId" />
						</dd>


						<dt>
							<g:message code="contact.firstName.label" default="First Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${contactInstance}" field="firstName" />
						</dd>


						<dt>
							<g:message code="contact.middleName.label" default="Middle Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${contactInstance}" field="middleName" />
						</dd>

						<dt>
							<g:message code="contact.lastName.label" default="Last Name" />
						</dt>

						<dd>
							<g:fieldValue bean="${contactInstance}" field="lastName" />
						</dd>
						<dt>
							<g:message code="contact.organization.label"
								default="Organization" />
						</dt>

						<dd>
							<g:if
								test="${contactInstance?.organization?.salesStatus == 'LEAD'}">
								<g:link controller="lead" action="show"
									id="${contactInstance?.organization?.id}">
									${contactInstance?.organization?.name}
								</g:link>
							</g:if>
							<g:else>
								<g:link controller="organization" action="show"
									id="${contactInstance?.organization?.id}">
									${contactInstance?.organization?.name}
								</g:link>
							</g:else>
						</dd>


						<dt>
							<g:message code="contact.description.label" default="Description" />
						</dt>

						<dd>
							<g:fieldValue bean="${contactInstance}" field="description" />
						</dd>

					</dl>
				</div>
			</div>

			<div class="col-md-12">
				<richui:tabView id="tabView">
					<richui:tabLabels>
						<richui:tabLabel selected="true" title="Phone Book" />
					</richui:tabLabels>

					<richui:tabContents>
						<richui:tabContent>
							<g:render template="phoneBookList" />
						</richui:tabContent>
					</richui:tabContents>
				</richui:tabView>
			</div>
		</div>
	</div>
</body>
</html>
