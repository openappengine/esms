

<%@ page import="com.esms.model.calendar.EventLog" %>
<!doctype html>
<html>
<head>
<meta name="layout" content="bootstrap3">
<g:set var="entityName"
	value="${message(code: 'eventLog.label', default: 'EventLog')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="page-header">
				<h3>
					<g:message code="default.show.label" args="[entityName]" />
				</h3>
			</div>
			
			<div class="well">
				<g:form>
					<g:hiddenField name="id" value="${eventLogInstance?.id}" />
					<div class="form-group">
						<g:link class="btn btn-default btn-sm" action="edit" id="${eventLogInstance?.id}">
							
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-sm btn-default" type="submit" name="_action_delete">
							
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>
			</div>

			<div class="panel panel-default">
				<div class="panel-body">
					<dl class="dl-horizontal">

						<dt>
							<g:message code="eventLog.loggedDate.label" default="Logged Date" />
						</dt>

						<dd>
							<g:formatDate date="${eventLogInstance?.loggedDate}" />
						</dd>


						<dt>
							<g:message code="eventLog.workDoneBy.label"
								default="Work Done By" />
						</dt>

						<dd>
							<g:fieldValue bean="${eventLogInstance}" field="workDoneBy" />
						</dd>


						<dt>
							<g:message code="eventLog.reviewedBy.label" default="Reviewed By" />
						</dt>

						<dd>
							<g:fieldValue bean="${eventLogInstance}" field="reviewedBy" />
						</dd>


						<dt>
							<g:message code="eventLog.comments.label" default="Comments" />
						</dt>

						<dd>
							<g:fieldValue bean="${eventLogInstance}" field="comments" />
						</dd>


						<dt>
							<g:message code="eventLog.isProblemReported.label"
								default="Is Problem Reported" />
						</dt>

						<dd>
							<g:formatBoolean boolean="${eventLogInstance?.isProblemReported}" />
						</dd>


						<dt>
							<g:message code="eventLog.urgency.label" default="Urgency" />
						</dt>

						<dd>
							<g:fieldValue bean="${eventLogInstance}" field="urgency" />
						</dd>


						<dt>
							<g:message code="eventLog.event.label" default="Event" />
						</dt>

						<dd>
							<g:link controller="event" action="show"
								id="${eventLogInstance?.event?.id}">
								${eventLogInstance?.event?.encodeAsHTML()}
							</g:link>
						</dd>


					</dl>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
