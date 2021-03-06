<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/pages/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.stepapp.lang.text" />
<html lang="${language}">
<body>



	<nav role="navigation" class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="home"><fmt:message
						key="stepapp.title" /></a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="home"><fmt:message
							key="stepapp.home" /></a></li>
				<li><a href="about"><fmt:message key="stepapp.about" /></a></li>
			</ul>
			<div class="text-right">
				<form>
					<select id="language" name="language" onchange="submit()">
						<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
						<option value="fr" ${language == 'fr' ? 'selected' : ''}>Fran�ais</option>
					</select>
				</form>
			</div>
			<div class="text-right">
				<fb:login-button scope="public_profile,email"
					onlogin="checkLoginState();">
				</fb:login-button>
			</div>
		</div>
	</nav>
	<div class="container-fluid" role="main">
		<div class="jumbotron twm">
			<div id="searchBar" class="container text-center">
				<h1>
					<fmt:message key="stepapp.title" />
				</h1>

				<!-- <h2>${msg}</h2>
				<h3>My name is ${name}</h3> -->
				<form role="form" action="name">
					<div class="form-group">
						<label for="name"><fmt:message key="stepapp.search.event" /></label>
						<input type="name" class="form-control" name="name" id="name">
					</div>
					<!-- <button type="submit" class="btn btn-default">Submit</button> -->
				</form>
				<button onclick="tempSubmit()" class="btn btn-default">Submit</button>
			</div>
		</div>
		<div class="row">

			<div class="col-md-2 col-sm-2"></div>
			<div id="map" class="col-md-8 col-sm-8"
				style="height: 700px; !important"></div>
			<div class="col-md-2 col-sm-2"></div>

		</div>


	</div>
	<div class="footer">
		<div class="container-fluid">
			<p>Footer placeholder</p>
		</div>
	</div>
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