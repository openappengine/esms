<!-- 
This modal is used to show a button that initiates the delete action.
-->

<!-- Button to trigger modal -->
	<a href="#DeleteModal" role="button" class="btn btn-default btn-sm" data-toggle="modal" title="${message(code: 'default.button.delete.label', default: 'Delete')}">
		<i class="glyphicon glyphicon-trash glyphicon glyphicon-large"></i>
	</a>

	<g:render template="/_common/modals/deleteDialog" model="[item: item]"/>
