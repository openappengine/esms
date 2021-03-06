<div class="well">
	<g:form class="form-horizontal" action="createPrice"
		controller="product">
		<fieldset>
			<g:hiddenField name="id" value="${productPriceInstance?.id}" />
			<div class="row">
				<div class="col-md-6">
					<div
						class="form-group fieldcontain ${hasErrors(bean: productPriceInstance, field: 'fromDate', 'error')} required">
						<label for="fromDate" class="col-md-3 control-label"><g:message
								code="productPrice.fromDate.label" default="From Date" /><span
							class="required-indicator">*</span></label>
						<div class="col-md-9">
							<richui:dateChooser name="fromDate" readonly="readonly"
								value="${productPriceInstance?.fromDate}" class="form-control" />
							<span class="help-inline"> ${hasErrors(bean: productPriceInstance, field: 'fromDate', 'error')}
							</span>
						</div>
					</div>

					<div
						class="form-group fieldcontain ${hasErrors(bean: productPriceInstance, field: 'toDate', 'error')} required">
						<label for="toDate" class="col-md-3 control-label"><g:message
								code="productPrice.toDate.label" default="To Date" /><span
							class="required-indicator">*</span></label>
						<div class="col-md-9">
							<richui:dateChooser name="toDate" readonly="readonly"
								value="${productPriceInstance?.toDate}" class="form-control" />
							<span class="help-inline"> ${hasErrors(bean: productPriceInstance, field: 'toDate', 'error')}
							</span>
						</div>
					</div>

					<div
						class="form-group fieldcontain ${hasErrors(bean: productPriceInstance, field: 'price', 'error')} required">
						<label for="price" class="col-md-3 control-label"><g:message
								code="productPrice.price.label" default="Price" /><span
							class="required-indicator">*</span></label>
						<div class="col-md-9">
							<g:field type="number" name="price" step="any" required=""
								class="form-control" value="${productPriceInstance.price}" />
							<span class="help-inline"> ${hasErrors(bean: productPriceInstance, field: 'price', 'error')}
							</span>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-10 col-md-offset-2">
					<button type="submit" class="btn btn-sm btn-primary">
						<g:message code="default.button.create.label" default="Create" />
					</button>
				</div>
			</div>
		</fieldset>
	</g:form>
</div>