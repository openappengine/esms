<div id="Content" class="container">

	<!-- Main menu in one line (e.g., controller entry points -->
	<div class="row">
			<aside id="application-status" class="col-md-3">
				<div class="sidebar-nav"
					style="min-height: 480px; max-height: 100%; margin-top: 10px;border-right:1px solid #e3e3e3; ">
					<div class="">
						<!--Sidebar content-->
						<g:render template="/_menu/menubar" />
					</div>
				</div>
			</aside>
				<section id="main" class="col-md-9">
				
				<div class="row">
					<div class="col-md-12">
						<g:render template="/_menu/submenubar" />
					</div>
				</div>
					
				<div class="row">
					<div class="col-md-12">
						<!--Body content-->
						<!-- Secondary menu in one line (e.g., actions for current controller) -->
						<g:if test="${flash.message}">
							<div style="margin: 5px;">
								<bootstrap:alert class="alert-info">
									${flash.message}
								</bootstrap:alert>
							</div>
						</g:if>
						<div style="margin-top: 5px;">
							<g:layoutBody />
							<g:pageProperty name="page.body" />
						</div>
					</div>
				</div>

			</section>
	</div>
</div>