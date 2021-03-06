<%@ page import="com.esms.model.product.Product"%>
<div class="row">
	<div class="col-md-12">
		<g:hasErrors bean="${orderInstance}">
			<bootstrap:alert class="alert-danger">
				<ul>
					<g:eachError bean="${orderInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</bootstrap:alert>
		</g:hasErrors>

		<div class="page-header">
			<h3>
				Reason for Revision.
			</h3>
		</div>
		
		<div class="well">
			<g:form class="form-horizontal" controller="quote" action="markAsRevised" id="${quoteInstance?.id}">
				<fieldset>
					<div
						class="form-group fieldcontain ${hasErrors(bean: quoteInstance, field: 'revisedReason', 'error')} ">
						<div class="col-md-10">
							<g:textArea name="description"
								value="${quoteInstance?.revisedReason}" cols="40" rows="5"
								maxlength="1000" style="width:80%;" />
							<span class="help-inline"> ${hasErrors(bean: quoteInstance, field: 'revisedReason', 'error')}
							</span>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-10 col-md-offset-2">
							<button type="submit" class="btn btn-sm btn-primary">
								<g:message code="default.button.save.label" default="Save" />
							</button>
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
	</div>
</div>