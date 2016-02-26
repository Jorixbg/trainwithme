<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/pages/header.jsp"%>
<html>
<body>
	<h1>Spring MVC Hello World Annotation Example</h1>

	<h2>${msg}</h2>
	<h3>My name is ${name}</h3>
	<div id="map" style="width: 400px; height: 400px"></div>

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