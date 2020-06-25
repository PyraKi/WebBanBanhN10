<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<!-- Icon css link -->
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/linearicons/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/flat-icon/flaticon.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/stroke-icon/style.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Rev slider css -->
<link href="${pageContext.request.contextPath}/resources/vendors/revolution/css/settings.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/revolution/css/layers.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/revolution/css/navigation.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/animate-css/animate.css" rel="stylesheet">

<!-- Extra plugin css -->
<link href="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/magnifc-popup/magnific-popup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/jquery-ui/jquery-ui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendors/nice-select/css/nice-select.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginutil.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/loginmain.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="signIn"
					method="POST">
					<h1>
						<span class="login100-form-title p-b-43"> Đăng nhập Tài
							khoản </span>
					</h1>
					<c:if test="${not empty errorNotFound}">
						<p style="color:red"><i><c:out value="${errorNotFound}"></c:out></i></p>
					</c:if>
					<div class="wrap-input100 validate-input"
						data-validate="Username không được để trống">
						<input class="input100" type="text" name="username"> <span
							class="focus-input100"></span> <span class="label-input100">Username</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password không được để trống">
						<input class="input100" type="password" name="pass"> <span
							class="focus-input100"></span> <span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="txt1" style="font-size: 15px; color: #999999">
							Bạn chưa có tài khoản? <a style="font-size: 15px"
								href="signUpForm" class="txt1">Đăng ký ngay</a>
						</div>
					</div>
					<div class="container-login100-form-btn">
						<input type="submit" value="Đăng nhập" class="login100-form-btn">
					</div>
				</form>
				<div class="login100-more"
					style="background-image: url('${pageContext.request.contextPath}/resources/img/comming-bg.jpg');"></div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/loginmain.js"></script>
</body>
</html>