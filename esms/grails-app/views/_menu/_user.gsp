<%--<ul class="nav pull-right">
	<li class="dropdown">
		<i class="glyphicon glyphicon-user glyphicon glyphicon-white"></i><sec:username /> (<g:link controller="logout">sign out</g:link>)
	</li>
</ul>	
--%>
<ul class="nav pull-right">
	<li class="dropdown">
		<a class="user-link dropdown-toggle" data-toggle="dropdown" href="#">
			<i class="glyphicon glyphicon-user glyphicon glyphicon-white"></i>
			Welcome, <sec:username />
			<b class="caret"></b>
		</a>
		<ul class="dropdown-menu">
			<li>
				<g:link controller="logout"><i class="glyphicon glyphicon-off"></i> Sign Out</g:link>
			</li>
		</ul>
	</li>
</ul>

<noscript>
<ul class="nav pull-right">
	<li class="">
		<g:link controller="user" action="config"><g:message code="user.config.label" default="Config"/></g:link>
	</li>
</ul>
</noscript>

		