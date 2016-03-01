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
	<form>
		<select id="language" name="language" onchange="submit()">
			<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
			<option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
		</select>
	</form>
	<div class="content">

		<h1>
			<fmt:message key="twm.title" />
		</h1>

		<h2>${msg}</h2>
		<h3>My name is ${name}</h3>
		<div id="map" style="width: 400px; height: 400px"></div>

	</div>
	<script>
		$('.content').addClass('alert');
		var mapCanvas = document.getElementById("map");
		var mapOptions = {
			center : new google.maps.LatLng(42.697429, 23.321541),
			zoom : 10
		}
		var map = new google.maps.Map(mapCanvas, mapOptions);
	</script>
</body>
</html>