<div class="pull-right">
	<a data-toggle="modal" href="#" data-target="#addressModal" role="button" class="btn btn-default btn-sm"> 
		 New Address
	</a>
</div>


<!-- Contacts -->
<table class="table table-striped table-condensed table-bordered">
	<thead>
		<tr>

			<g:sortableColumn property="address1"
				title="${message(code: 'address.address1.label', default: 'Address1')}" />

			<g:sortableColumn property="address2"
				title="${message(code: 'address.address2.label', default: 'Address2')}" />

			<g:sortableColumn property="buildingName"
				title="${message(code: 'address.buildingName.label', default: 'Building Name')}" />

			<g:sortableColumn property="city"
				title="${message(code: 'address.city.label', default: 'City')}" />

			<g:sortableColumn property="country"
				title="${message(code: 'address.country.label', default: 'Country')}" />
				
			<g:sortableColumn property="addressType"
				title="${message(code: 'address.addressType.label', default: 'Address Type')}" />

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${employeeInstance?.addresses}" var="addressInstance">
			<tr>

				<td>
					${fieldValue(bean: addressInstance, field: "address1")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "address2")}
				</td>
				
				<td>
					${fieldValue(bean: addressInstance, field: "buildingName")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "city")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "country")}
				</td>

				<td>
					${fieldValue(bean: addressInstance, field: "addressType")}
				</td>

				<td class="link"><g:link action="show" controller="address"
						id="${addressInstance.id}" class="btn btn-default btn-sm">Show &raquo;</g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate total="${employeeInstance?.addresses?.size()}" />
</div>

<!-- Modal -->
<div id="addressModal" class="modal hide fade" tabindex="-1" role="dialog" 
	data-remote="<g:createLink controller="organization" action="createAddress"/>"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h3 id="myModalLabel">New Address</h3>
	</div>
	<g:form controller="organization" action="createAddress" method="POST">
		<g:hiddenField name="party.id" value="${employeeInstance?.id}" />
		<div class="modal-body">
			
		</div>
		<div class="modal-footer">
			<div class="form-group">
				<button type="submit" class="btn btn-primary">
					
					<g:message code="default.button.create.label" default="Create" />
				</button>
			</div>
		</div>
	</g:form>
</div>