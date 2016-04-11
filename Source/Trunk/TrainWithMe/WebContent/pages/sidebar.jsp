<div class="jumbotron sidebar-stepapp">
	<ul class="sidebar-nav">
		<li class="sidebar-brand"><a href="#"> <fmt:message
					key="stepapp.profile" />
		</a></li>
		<div id="profile">
			<c:choose>
				<c:when test="${user != null}">
					<p style="font-size: 14px !important;">Welcome : ${user}</p>
					<a href="<c:url value="/logout" />"> Logout</a>
				</c:when>
				<c:otherwise>
					<div id="loginPane">
						<p style="font-size: 14px !important;">
							<fmt:message key="not.logged.in" />
							<br> <a href="javascript: void(0)" onclick="showLoginWindow()"><fmt:message
									key="stepapp.login" /></a><br> <a
								href="<c:url value="/signup" />"><fmt:message
									key="stepapp.signup" /></a>
						</p>
					</div>
					<div id="loginForm">
						<%@ include file="/pages/login.jsp"%>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</ul>
</div>