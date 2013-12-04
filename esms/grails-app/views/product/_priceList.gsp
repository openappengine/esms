<div class="pull-right">
	<modalbox:createLink controller="product" action="createPrice" id="${productInstance?.id}"
		title="Create Price" width="900">New Price</modalbox:createLink>
</div>

<table
	class="table table-striped table-hover table-condensed table-bordered">
	<thead>
		<tr>
			<g:sortableColumn property="fromDate"
				title="${message(code: 'product.fromDate.label', default: 'From Date')}" />
			<g:sortableColumn property="toDate"
				title="${message(code: 'product.toDate.label', default: 'To Date')}" />
			<g:sortableColumn property="price"
				title="${message(code: 'product.price.label', default: 'Price')}" />
		</tr>
	</thead>
	<tbody>
		<g:each in="${productInstance.prices}" var="p">
			<tr>
				<td>
					${fieldValue(bean: p, field: "fromDate")}
				</td>
				<td>
					${fieldValue(bean: p, field: "toDate")}
				</td>
				<td>
					${fieldValue(bean: p, field: "price")}
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
<div class="pagination">
	<bootstrap:paginate
		total="${productInstanceInstance?.prices?.size()?productInstanceInstance?.prices?.size():0}" />
</div>