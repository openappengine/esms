<div class="pull-right">
	<a
		href="<g:createLink controller="event" action="create" params="['party.id':organizationInstance.id]" />"
		role="button" class="btn btn-default btn-sm"> New Event
	</a>
</div>


<!-- Quotes -->
<table class="table table-striped table-condensed table-bordered expandableTable">
	<thead>
		<tr>
			<g:sortableColumn property="eventType"
				title="${message(code: 'event.eventType.label', default: 'Event Type')}" />
				
			<g:sortableColumn property="title"
				title="${message(code: 'event.title.label', default: 'Title')}" />
				
			<g:sortableColumn property="startTime"
				title="${message(code: 'event.startTime.label', default: 'Start Date Time')}" />
				
			<g:sortableColumn property="endTime"
				title="${message(code: 'event.endTime.label', default: 'End Date Time')}" />	
				
			<g:sortableColumn property="status"
				title="${message(code: 'event.assignedTo.label', default: 'Assigned To')}" />
				
			<g:sortableColumn property="description"
				title="${message(code: 'event.status.label', default: 'Status')}" />	

			<th></th>
			
			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${organizationInstance?.events?.findAll{it.sourceEvent == null}?.sort{a,b -> b.startTime <=> a.startTime}}" var="eventInstance">
			<tr>
			
				<td>
					${fieldValue(bean: eventInstance, field: "eventType")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "title")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "startTime")}
				</td>
				
				<td>
					${fieldValue(bean: eventInstance, field: "endTime")}
				</td>
				
				<td>
					${fieldValue(bean: eventInstance, field: "assignedTo")}
				</td>

				<td>
					${fieldValue(bean: eventInstance, field: "status")}
				</td>

				<td class="link"><g:link controller="event" action="show"
						id="${eventInstance.id}" class="lnk">Show &raquo;</g:link></td>
				
				<td>
					<a class="expandRow" href="${createLink(controller:'event',action:'associatedEvents',id:eventInstance?.id)}">
						+
					</a>
				</td>		
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pgn">
	<bootstrap:paginate
		total="${organizationInstance?.events?organizationInstance?.events.size():0}" />
</div>
