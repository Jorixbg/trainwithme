<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/pages/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="language"
	value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}"
	scope="session" />

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.leaps.lang.text" />
<html lang="${language}">
<body>



	<nav role="navigation" class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/"><fmt:message
						key="leaps.title" /></a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/"><fmt:message
							key="leaps.home" /></a></li>
				<li><a href="about"><fmt:message key="leaps.about" /></a></li>
			</ul>
			<div class="text-right">
				<form>
					<select id="language" name="language" onchange="submit()">
						<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
						<option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
					</select>
				</form>
				<div id="status">
					<fb:login-button scope="public_profile,email"
						onlogin="checkLoginState();">
					</fb:login-button>
				</div>
			</div>
		</div>
	</nav>
	<div class="container-fluid" role="main">
		<!-- <div class="logo-center">
		<img class="logo-bg" src="<c:url value="/resources/images/logo_bg.jpg" />">
	</div> -->
		<hr>
		<div id="searchPane" class="jumbotron twm">
			<div id="searchBar" class="container text-center">
				<h1>
					<img class="logo-jumbotron"
						src="<c:url value="/resources/images/logo_transp_beta.png" />" style="padding-bottom: 10px;">
				</h1>

				<!-- <h2>${msg}</h2>
				<h3>My name is ${name}</h3> -->
				<form role="form" action="name">
					<div class="form-group">
						<input type="name" class="form-control" name="name" id="name"
							placeholder="<fmt:message key="leaps.search.event"/>">
					</div>
					<!-- <button type="submit" class="btn btn-default">Submit</button> -->
				</form>
				<button
					onclick="tempSubmit('<fmt:message key="leaps.under.construction" />')"
					class="btn btn-default">Submit</button>
			</div>
		</div>
		<div class="content row">
			<div class="col-md-2 col-sm-2">
				<!-- Sidebar -->
				<%@ include file="/pages/sidebar.jsp"%>
				<!-- /#sidebar-wrapper -->

			</div>
			<div id="map" class="col-md-8 col-sm-8"
				style="height: 700px; !important"></div>
			<div class="col-md-2 col-sm-2"></div>

		</div>


	</div>
	<%@ include file="/pages/footer.jsp"%>

	<script>
		$(document).ready(function() {

		});

		// Note: This example requires that you consent to location sharing when
		// prompted by your browser. If you see the error "The Geolocation service
		// failed.", it means you probably did not give permission for the browser to
		// locate you.

		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : -34.397,
					lng : 150.644
				},
				zoom : 6
			});
			var infoWindow = new google.maps.InfoWindow({
				map : map
			});

			// Try HTML5 geolocation.
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var pos = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};

					infoWindow.setPosition(pos);
					infoWindow.setContent('<a href="#">Create event</a>');
					map.setCenter(pos);
				}, function() {
					//handleLocationError(true, infoWindow, map.getCenter());
				});
			} else {
				//Browser doesn't support Geolocation
				handleLocationError(false, infoWindow, map.getCenter());
			}
		}

		function handleLocationError(browserHasGeolocation, infoWindow, pos) {
			infoWindow.setPosition(pos);
			infoWindow
					.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
							: 'Error: Your browser doesn\'t support geolocation.');
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBqgn89NanQzJ6Ftk-KjMoM13JZ16M-fxY&callback=initMap">
		
	</script>
</body>
</html>