

<%@ page import="com.esms.model.party.Address"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap">
<g:set var="entityName"
	value="${message(code: 'address.label', default: 'Address')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row-fluid">
		<div class="span12">
			<div class="page-header">
				<h1>
					<g:message code="default.show.label" args="[entityName]" />
				</h1>
			</div>

			<dl class="dl-horizontal">

				<dt>
					<g:message code="address.address1.label" default="Address1" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="address1" />
				</dd>


				<dt>
					<g:message code="address.addressType.label" default="Address Type" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="addressType" />
				</dd>


				<dt>
					<g:message code="address.address2.label" default="Address2" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="address2" />
				</dd>


				<dt>
					<g:message code="address.buildingName.label"
						default="Building Name" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="buildingName" />
				</dd>


				<dt>
					<g:message code="address.city.label" default="City" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="city" />
				</dd>


				<dt>
					<g:message code="address.country.label" default="Country" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="country" />
				</dd>


				<dt>
					<g:message code="address.party.label" default="Party" />
				</dt>

				<dd>
					<g:link controller="party" action="show"
						id="${addressInstance?.party?.id}">
						${addressInstance?.party?.encodeAsHTML()}
					</g:link>
				</dd>


				<dt>
					<g:message code="address.postalCode.label" default="Postal Code" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="postalCode" />
				</dd>


				<dt>
					<g:message code="address.state.label" default="State" />
				</dt>

				<dd>
					<g:fieldValue bean="${addressInstance}" field="state" />
				</dd>


			</dl>

			<g:form>
				<g:hiddenField name="id" value="${addressInstance?.id}" />
				<div class="form-actions">
					<g:link class="btn" action="edit" id="${addressInstance?.id}">
						<i class="icon-pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
					<button class="btn btn-danger" type="submit" name="_action_delete">
						<i class="icon-trash icon-white"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</button>
				</div>
			</g:form>
		</div>
	</div>
</body>
</html>