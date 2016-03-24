<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/pages/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.twm.lang.text" />
<html lang="${language}">
<body>



	<nav role="navigation" class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="home"><fmt:message
						key="stepapp.title" /></a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="home"><fmt:message key="stepapp.home" /></a></li>
				<li class="active"><a href="about"><fmt:message
							key="stepapp.about" /></a></li>
			</ul>
			<div class="text-right">
				<form>
					<select id="language" name="language" onchange="submit()">
						<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
						<option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
					</select>
				</form>
			</div>
			<div id="status" class="text-right">
				<fb:login-button scope="public_profile,email"
					onlogin="checkLoginState();">
				</fb:login-button>
			</div>
		</div>
	</nav>
	<div class="container-fluid" role="main">
		<!-- <div class="jumbotron twm">
			<div id="searchBar" class="container text-center">
				<h1>
					<fmt:message key="stepapp.title" />
				</h1>
			</div>
		</div> -->
		<div class="content row">
			<div class="col-md-2 col-sm-2">
				<!-- Sidebar -->
				<div id="sidebar-wrapper" class="sidebar">
					<ul class="sidebar-nav">
						<li class="sidebar-brand"><a href="#"> <fmt:message
									key="stepapp.profile" />
						</a></li>
						<li>
							<div id="profile">
								<p>You are not logged in.</p>
							</div>
						</li>
					</ul>
				</div>
				<!-- /#sidebar-wrapper -->
			</div>
			<div class="col-md-8 col-sm-8">
				<div class="logo-center">
					<img class="logo-bg"
						src="<c:url value="/resources/images/logo_bg.jpg" />">
				</div>
				<p class="content-paragraph">
				<h4>
					<fmt:message key="stepapp.about.content" />
				</h4>
				</p>
			</div>
			<div class="col-md-2 col-sm-2"></div>


		</div>


	</div>
	<%@ include file="/pages/footer.jsp"%>
	<script>
		var mapCanvas = document.getElementById("map");
		var mapOptions = {
			center : new google.maps.LatLng(42.697429, 23.321541),
			zoom : 10
		}
		var map = new google.maps.Map(mapCanvas, mapOptions);
	</script>
</body>
</html>