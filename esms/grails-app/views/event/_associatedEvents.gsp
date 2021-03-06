<%@ page import="com.esms.model.calendar.Event"%>
<table class="table table-striped table-bordered mediaTable">
	<thead>
		<tr>
			<th>
				${message(code: 'event.party.label', default: 'Building Name')}
			</th>

			<th>
				${message(code: 'event.eventType.label', default: 'Event Type')}
			</th>

			<th>
				${message(code: 'event.startTime.label', default: 'Time')}
			</th>

			<th>
				${message(code: 'event.assignedTo.label', default: 'Assigned To')}
			</th>

			<th>
				${message(code: 'event.status.label', default: 'Status')}
			</th>

			<th></th>
		</tr>
	</thead>
	<tbody>
		<g:if
			test="${eventInstance?.associatedEvents() != null && eventInstance?.associatedEvents().size() != 0}">
			<g:each in="${eventInstance?.associatedEvents()}" var="associatedEvent">
				<tr>

					<td>
						${associatedEvent.party?.name}
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "eventType")}
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "startTime")}
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "assignedTo")}
					</td>

					<td>
						${fieldValue(bean: associatedEvent, field: "status")}
					</td>

					<td class="link"><g:link action="show" controller="event"
							class="lnk " id="${associatedEvent.id}">Show &raquo;</g:link></td>
				</tr>
			</g:each>
		</g:if>
	</tbody>
</table>
