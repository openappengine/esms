

<%@ page import="com.esms.model.party.Organization"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'organization.label', default: 'Organization')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div class="row-fluid" style="margin-top: -15px;">
		<div class="span12">
			<div class="page-header">
				<h1>
					Organization :
					${organizationInstance?.externalId}
				</h1>
				<h3>
					<small> ${organizationInstance?.name}
					</small>
				</h3>
			</div>
			
			<g:form>
				<g:hiddenField name="id" value="${organizationInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${organizationInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
					<a data-toggle="modal" href="#" data-target="#contactModal" role="button" class="btn"> 
						<i class="icon-plus"></i> New Contact
					</a>
					<a data-toggle="modal" href="#" data-target="#addressModal" role="button" class="btn"> 
						<i class="icon-plus"></i> New Address
					</a>
					<a data-toggle="modal" href="#" data-target="#phoneBookModal"
						role="button" class="btn"> <i class="icon-plus"></i> New Phone Book
					</a>
				</div>
			</g:form>

			<dl class="dl-horizontal" style="margin-left: -30px;">
				<dt>
					<g:message code="organization.name.label" default="Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${organizationInstance}" field="name" />
				</dd>

				<dt>
					<g:message code="organization.externalId.label"
						default="External Id" />
				</dt>

				<dd>
					<g:fieldValue bean="${organizationInstance}" field="externalId" />
				</dd>


				<dt>
					<g:message code="organization.description.label"
						default="Description" />
				</dt>

				<dd>
					<g:fieldValue bean="${organizationInstance}" field="description" />
				</dd>


				<dt>
					<g:message code="organization.assignedTo.label"
						default="Assigned To" />
				</dt>

				<dd>
					<g:fieldValue bean="${organizationInstance}" field="assignedTo" />
				</dd>

			</dl>
		</div>

		<div class="span12">
			<div class="accordion" id="detailViewAccordion" style="margin-left: -30px;">
				<!-- Contacts -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseContact"> <span class="left"> <i
								class="icon-user"></i> Contacts
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseContact" class="accordion-body collapse in">
						<div class="accordion-inner">
							<g:render template="contactList" />
						</div>
					</div>
				</div>

				<!-- Addresses -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseAddress"> <span class="left"> <i
								class="icon-book"></i> Addresses
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseAddress" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="addressList" />
						</div>
					</div>
				</div>

				<!-- Phones -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapsePhoneBook"> <span class="left"> <i
								class="icon-book"></i> Phones
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapsePhoneBook" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="phoneBookList" />
						</div>
					</div>
				</div>
				
				<!-- Quote -->
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							href="#collapseQuote"> <span class="left"> <i
								class="icon-envelope"></i> Quotes
								<div class="pull-right">
									<i class="icon-plus"></i>
								</div>
						</span>
						</a>
					</div>
					<div id="collapseQuote" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:render template="quoteList" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
