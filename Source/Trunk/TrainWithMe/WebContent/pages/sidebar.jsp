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
					<p style="font-size: 14px !important;">
						<fmt:message key="not.logged.in" /><br>
						<a href="<c:url value="/login" />"><fmt:message
					key="stepapp.login" /></a><br>
						<a href="<c:url value="/signup" />"><fmt:message
					key="stepapp.signup" /></a>
					</p>
				</c:otherwise>
			</c:choose>
		</div>
	</ul>
</div>