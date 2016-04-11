<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/pages/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				<a class="navbar-brand" href="/"><fmt:message
						key="stepapp.title" /></a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="/"><fmt:message key="stepapp.home" /></a></li>
				<li><a href="about"><fmt:message key="stepapp.about" /></a></li>
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

		<div class="content row">
			<div class="col-md-2 col-sm-2">
				<!-- Sidebar -->
				<%@ include file="/pages/sidebar.jsp"%>
				<!-- /#sidebar-wrapper -->

			</div>
			<div
				class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-1 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<fmt:message key="stepapp.signup.header" />
						</h3>
					</div>
					<div class="panel-body">
						<c:choose>
							<c:when test="${success}">
								<p style="font-size: 14px !important;"><fmt:message key="stepapp.signup.success" /></p>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${signUpError != null}">
										<p>${signUpError}</p>
									</c:when>
								</c:choose>
								<form:form id="registrationForm" role="form" method="POST"
									onsubmit="return validateForm()" action="/registration">
									<div class="row">
										<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="text" name="first_name" id="first_name"
													class="form-control input-sm"
													placeholder="<fmt:message key="stepapp.signup.firstname" />">
											</div>
										</div>
										<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="text" name="last_name" id="last_name"
													class="form-control input-sm"
													placeholder="<fmt:message key="stepapp.signup.lastname" />">
											</div>
										</div>
									</div>

									<div class="form-group">
										<input type="email" name="email" id="email"
											class="form-control input-sm"
											placeholder="<fmt:message key="stepapp.signup.email" />">
									</div>
									<div class="form-group">
										<input type="sid" name="sid" id="sid"
											class="form-control input-sm"
											placeholder="<fmt:message key="stepapp.signup.sid" />">
									</div>

									<div class="row">
										<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="password" name="password" id="password"
													class="form-control input-sm"
													placeholder="<fmt:message key="stepapp.signup.password" />">
											</div>
										</div>
										<div class="col-xs-6 col-sm-6 col-md-6">
											<div class="form-group">
												<input type="password" name="password_confirmation"
													id="password_confirmation" class="form-control input-sm"
													placeholder="<fmt:message key="stepapp.signup.passwordconfirm" />">
											</div>
										</div>
									</div>

									<input type="submit" value="Register"
										class="btn btn-info btn-block">

								</form:form>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-sm-2"></div>

		</div>


	</div>
	<%@ include file="/pages/footer.jsp"%>

	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
	<script>
		(function($, W, D) {
			var JQUERY4U = {};

			JQUERY4U.UTIL = {
				setupFormValidation : function() {
					//form validation rules
					$("#registrationForm")
							.validate(
									{
										rules : {
											first_name : "required",
											last_name : "required",
											email : {
												required : true,
												email : true
											},
											password : {
												required : true,
												minlength : 5
											},
											sid : {
												required : true,
											},
										},
										messages : {
											firstname : "Please enter your first name",
											lastname : "Please enter your last name",
											password : {
												required : "Please provide a password",
												minlength : "Your password must be at least 5 characters long"
											},
											email : "Please enter a valid email address",
											sid : "Please enter a valid account name",
										},
										submitHandler : function(form) {
											form.submit();
										}
									});
				}
			}

			//when the dom has loaded setup form validation rules
			$(D).ready(function($) {
				JQUERY4U.UTIL.setupFormValidation();
			});

		})(jQuery, window, document);
	</script>

</body>
</html>