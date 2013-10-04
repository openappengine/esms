<%@ page import="com.esms.model.party.Organization"%>

<script>
	$('document').ready(function() {
		$("#copyToBillingAddressLink").click(function() {
			$('#billingAddress1').val($('#shippingAddress1').val());
			$('#billingAddress2').val($('#shippingAddress2').val());
			$('#billingBuildingName').val($('#shippingBuildingName').val());
			$('#billingCity').val($('#shippingCity').val());
			$('#billingState').val($('#shippingState').val());
			$('#billingCountry').val($('#shippingCountry').val());
			$('#billingPostalCode').val($('#shippingPostalCode').val());
		});
	});
</script>

<g:hiddenField name="salesStatus" value="LEAD"/>
<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')} required">
	<label for="externalId" class="control-label"><g:message
			code="organization.externalId.label" default="External Id" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="externalId" required="" readOnly="readOnly"
			value="${organizationInstance?.externalId}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'externalId', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'name', 'error')} ">
	<label for="name" class="control-label"><g:message
			code="organization.name.label" default="Name" /></label>
	<div class="controls">
		<g:textField name="name" value="${organizationInstance?.name}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'name', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'assignedTo', 'error')} ">
	<label for="assignedTo" class="control-label"><g:message
			code="organization.assignedTo.label" default="Assigned To" /></label>
	<div class="controls">
		<g:textField name="assignedTo"
			value="${organizationInstance?.assignedTo}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'assignedTo', 'error')}
		</span>
	</div>
</div>

<div class="page-header">
	<h3>
		Is One Time
	</h3>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'isOneTimeCustomer', 'error')} ">
	<label for="isOneTimeCustomer" class="control-label"><g:message
			code="organization.isOneTimeCustomer.label" default="Is One Time ?" /></label>
	<div class="controls">
		<g:checkBox name="isOneTimeCustomer"
			value="${organizationInstance?.isOneTimeCustomer}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'isOneTimeCustomer', 'error')}
		</span>
	</div>
</div>

<div class="page-header">
	<h3>
		Primary Contact
	</h3>
</div>
<%--<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'salutation', 'error')} ">
	<label for="salutation" class="control-label"><g:message
			code="contact.salutation.label" default="Salutation" /></label>
	<div class="controls">
		<g:textField name="primary.salutation" value="${contactInstance?.salutation}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'salutation', 'error')}
		</span>
	</div>
</div>
--%>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'designation', 'error')} ">
	<label for="primary.designation" class="control-label"><g:message
			code="contact.designation.label" default="Designation" /></label>
	<div class="controls">
		<g:select name="primary.designation"
			from="${contactInstance.constraints.designation.inList}"
			value="${contactInstance?.designation}"
			valueMessagePrefix="primary.designation" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'designation', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName" class="control-label"><g:message
			code="contact.firstName.label" default="First Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="primary.firstName" required=""
			value="${contactInstance?.firstName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'firstName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
	<label for="middleName" class="control-label"><g:message
			code="contact.middleName.label" default="Middle Name" /></label>
	<div class="controls">
		<g:textField name="primary.middleName" value="${contactInstance?.middleName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'middleName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} ">
	<label for="lastName" class="control-label"><g:message
			code="contact.lastName.label" default="Last Name" /></label>
	<div class="controls">
		<g:textField name="primary.lastName" value="${contactInstance?.lastName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'lastName', 'error')}
		</span>
	</div>
</div>

<!-- PhoneBook -->
<div class="page-header">
	<h3>
		Phones, Emails etc.
	</h3>
</div>
<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
	<label for="email" class="control-label"><g:message
			code="phoneBook.email.label" default="Primary Email" /></label>
	<div class="controls">
		<g:textField name="primary.email" value="${phoneBookInstance?.email}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
	<label for="secondaryEmail" class="control-label"><g:message
			code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
	<div class="controls">
		<g:textField name="primary.secondaryEmail"
			value="${phoneBookInstance?.secondaryEmail}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
	<label for="homePhone" class="control-label"><g:message
			code="phoneBook.homePhone.label" default="Home Phone" /></label>
	<div class="controls">
		<g:textField name="primary.homePhone" value="${phoneBookInstance?.homePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
	<label for="mobilePhone" class="control-label"><g:message
			code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
	<div class="controls">
		<g:textField name="primary.mobilePhone"
			value="${phoneBookInstance?.mobilePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
	<label for="officePhone" class="control-label"><g:message
			code="phoneBook.officePhone.label" default="Office Phone" /></label>
	<div class="controls">
		<g:textField name="primary.officePhone"
			value="${phoneBookInstance?.officePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
	<label for="otherPhone" class="control-label"><g:message
			code="phoneBook.otherPhone.label" default="Other Phone" /></label>
	<div class="controls">
		<g:textField name="primary.otherPhone"
			value="${phoneBookInstance?.otherPhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
		</span>
	</div>
</div>

<div class="page-header">
	<h3>
		Secondary Contact
	</h3>
</div>

<%--<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'salutation', 'error')} ">
	<label for="salutation" class="control-label"><g:message
			code="contact.salutation.label" default="Salutation" /></label>
	<div class="controls">
		<g:textField name="secondary.salutation" value="${contactInstance?.salutation}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'salutation', 'error')}
		</span>
	</div>
</div>
--%>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'designation', 'error')} ">
	<label for="secondary.designation" class="control-label"><g:message
			code="contact.designation.label" default="Designation" /></label>
	<div class="controls">
		<g:select name="secondary.designation"
			from="${contactInstance.constraints.designation.inList}"
			value="${contactInstance?.designation}"
			valueMessagePrefix="secondary.designation" noSelection="['': '']" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'designation', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'firstName', 'error')} required">
	<label for="firstName" class="control-label"><g:message
			code="contact.firstName.label" default="First Name" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="secondary.firstName" required=""
			value="${contactInstance?.firstName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'firstName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'middleName', 'error')} ">
	<label for="middleName" class="control-label"><g:message
			code="contact.middleName.label" default="Middle Name" /></label>
	<div class="controls">
		<g:textField name="secondary.middleName" value="${contactInstance?.middleName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'middleName', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: contactInstance, field: 'lastName', 'error')} ">
	<label for="lastName" class="control-label"><g:message
			code="contact.lastName.label" default="Last Name" /></label>
	<div class="controls">
		<g:textField name="secondary.lastName" value="${contactInstance?.lastName}" />
		<span class="help-inline">
			${hasErrors(bean: contactInstance, field: 'lastName', 'error')}
		</span>
	</div>
</div>

<!-- PhoneBook -->
<div class="page-header">
	<h3>
		Phones, Emails etc.
	</h3>
</div>
<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'email', 'error')} ">
	<label for="email" class="control-label"><g:message
			code="phoneBook.email.label" default="secondary Email" /></label>
	<div class="controls">
		<g:textField name="secondary.email" value="${phoneBookInstance?.email}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'email', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')} ">
	<label for="secondaryEmail" class="control-label"><g:message
			code="phoneBook.secondaryEmail.label" default="Secondary Email" /></label>
	<div class="controls">
		<g:textField name="secondary.secondaryEmail"
			value="${phoneBookInstance?.secondaryEmail}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'secondaryEmail', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')} ">
	<label for="homePhone" class="control-label"><g:message
			code="phoneBook.homePhone.label" default="Home Phone" /></label>
	<div class="controls">
		<g:textField name="secondary.homePhone" value="${phoneBookInstance?.homePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'homePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')} ">
	<label for="mobilePhone" class="control-label"><g:message
			code="phoneBook.mobilePhone.label" default="Mobile Phone" /></label>
	<div class="controls">
		<g:textField name="secondary.mobilePhone"
			value="${phoneBookInstance?.mobilePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'mobilePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')} ">
	<label for="officePhone" class="control-label"><g:message
			code="phoneBook.officePhone.label" default="Office Phone" /></label>
	<div class="controls">
		<g:textField name="secondary.officePhone"
			value="${phoneBookInstance?.officePhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'officePhone', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')} ">
	<label for="otherPhone" class="control-label"><g:message
			code="phoneBook.otherPhone.label" default="Other Phone" /></label>
	<div class="controls">
		<g:textField name="secondary.otherPhone"
			value="${phoneBookInstance?.otherPhone}" />
		<span class="help-inline">
			${hasErrors(bean: phoneBookInstance, field: 'otherPhone', 'error')}
		</span>
	</div>
</div>

<div class="page-header">
	<h3>
		Address
	</h3>
</div>
<div class="row-fluid">
	<div class="span6">
		<h3>Site Address (<a id="copyToBillingAddressLink" href="#copyToBillingAddressLink">Copy To Billing Address</a>)</h3>
		<g:render template="/address/shippingAddressForm"></g:render>
	</div>
	
	<div class="span6">
		<div class="billingAddress">
			<h3>Billing Address</h3>
			<g:render template="/address/billingAddressForm"></g:render>
		</div>	
	</div>
</div>
<div class="page-header">
	<h3>
		About the Lift
	</h3>
</div>
<g:render template="/liftInfo/form"></g:render>

<div class="page-header">
	<h3>
		Reason for Change
	</h3>
</div>
<div
	class="control-group fieldcontain ${hasErrors(bean: organizationInstance, field: 'description', 'error')} ">
	<div class="controls">
		<g:textArea name="description" cols="40" rows="5" maxlength="1000" style="width:80%;"
			value="${organizationInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: organizationInstance, field: 'description', 'error')}
		</span>
	</div>
</div>