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


	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-6">
				<form>
					<select id="language" name="language" onchange="submit()">
						<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
						<option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
					</select>
				</form>
			</div>
			<div class="col-md-6 col-sm-6 text-right">
				<fb:login-button scope="public_profile,email"
					onlogin="checkLoginState();">
				</fb:login-button>
			</div>
		</div>

		<h1>
			<fmt:message key="twm.title" />
		</h1>

		<h2>${msg}</h2>
		<h3>My name is ${name}</h3>
		<div class="row">
		
			<div class="col-md-2 col-sm-2"></div>
			<div id="map" class="col-md-8 col-sm-8" style="height:700px; !important"></div>
			<div class="col-md-2 col-sm-2"></div>

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