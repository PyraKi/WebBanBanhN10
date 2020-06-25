<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<!-- Icon css link -->
<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/linearicons/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/flat-icon/flaticon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/stroke-icon/style.css"
	rel="stylesheet">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Rev slider css -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/revolution/css/settings.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/revolution/css/layers.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/revolution/css/navigation.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/animate-css/animate.css"
	rel="stylesheet">

<!-- Extra plugin css -->
<link
	href="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/magnifc-popup/magnific-popup.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/jquery-ui/jquery-ui.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendors/nice-select/css/nice-select.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/loginutil.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/loginmain.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="POST">
					<h1>
						<span class="login100-form-title p-b-43"> Đăng Ký Tài Khoản
						</span>
					</h1>
					Họ:
					<div class="wrap-input100 validate-input"
						data-validate="Bạn Phải Nhập Họ">
						<input class="input100" type="text" id="hoKH" name="hoKH">
						<span class="focus-input100"></span>

					</div>
					Tên:
					<div class="wrap-input100 validate-input"
						data-validate="Bạn Phải Nhập Tên">
						<input class="input100" type="text" id="tenKH" name="tenKH">
						<span class="focus-input100"></span>
					</div>

					Ngày sinh:<br />
					<c:if test="${not empty errorBirthSub18}">
						<p style="color: red">
							<i><c:out value="${errorBirthSub18}"></c:out></i>
						</p>
					</c:if>
					<div class="wrap-input100 validate-input"
						data-validate="Bạn Phải Nhập Ngày Sinh">
						<input class="input100" type="date" id="ngaySinh" name="ngaySinh">
						<span class="focus-input100"></span>
					</div>
					Số CMND:
					<div class="wrap-input100 validate-input"
						data-validate="Bạn Phải Nhập CMND">
						<input class="input100" type="text" id="soCMND" name="soCMND">
						<span class="focus-input100"></span>
					</div>
					Địa chỉ:
					<div class="wrap-input100 validate-input"
						data-validate="Bạn Phải Nhập Địa Chỉ">
						<input class="input100" type="text" id="diaChi" name="diaChi">
						<span class="focus-input100"></span>
					</div>
					Số điện thoại:
					<div class="wrap-input100 validate-input"
						data-validate="Bạn Phải Nhập Số Điện Thoại">
						<input class="input100" type="text" id="soDT" name="soDT"
							value="${status.value}"> <span class="focus-input100"></span>
					</div>
					Email:
					<div class="wrap-input100 validate-input"
						data-validate="Email phải đúng định dạng ví dụ ex@abc.xyz">
						<input class="input100" type="text" id="email" name="text"
							value="${status.value}"> <span class="focus-input100"></span>
					</div>
					Username:
					<c:if test="${not empty errorUserNameExists}">
						<p style="color: red">
							<i><c:out value="${errorUserNameExists}"></c:out></i>
						</p>
					</c:if>
					<div class="wrap-input100 validate-input"
						data-validate="Username không được để trống">
						<input class="input100" type="text" id="userName" name="userName"
							value="${status.value}"> <span class="focus-input100"></span>
					</div>
					Password:
					<div class="wrap-input100 validate-input"
						data-validate="Password không được để trống">
						<input class="input100" type="password" name="hashedPassword"
							id="hashedPassword"> <span
							class="focus-input100"></span>
					</div>
					<c:if test="${not empty errorUnknown}">
						<p style="color: red">
							<i><c:out value="${errorUnknown}"></c:out></i>
						</p>
					</c:if>
					<div class="container-login100-form-btn">
						<input type="submit" value="Đăng ký">
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<p style="font-size: 15px">Bạn đã có tài khoản?</p>
						<div>
							<a style="font-size: 15px" href="signInForm">Đăng nhập ngay</a>
						</div>
					</div>
				</form>

				<div class="login100-more"
					style="background-image: url('${pageContext.request.contextPath}/resources/img/comming-bg.jpg');"></div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/loginmain.js"></script>
	<!-- bắt lỗi -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-validate.js"></script>
	<script>
		bootstrapValidate(
				'#hoKH',
				'regex:^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$:Chỉ nhập các ký tự chữ cái không khoảng trắng');
		bootstrapValidate('#hoKH', 'max:10:Họ dài quá 10 ký tự');
		bootstrapValidate(
				'#tenKH',
				'regex:^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$:Chỉ nhập các ký tự chữ cái');
		bootstrapValidate('#tenKH', 'max:30:Tên dài quá 30 ký tự');
		bootstrapValidate('#soCMND', 'regex:^[0-9]+$:Chỉ nhập các ký số');
		bootstrapValidate('#soCMND', 'min:9:CMND phải nhập đủ 9 tới 13 số');
		bootstrapValidate('#soCMND', 'max:13:CMND phải nhập đủ 9 tới 13 số');
		bootstrapValidate('#soDT', 'regex:^[0-9]+$:Chỉ nhập các ký số');
		bootstrapValidate('#soDT',
				'min:8:Số điện thoại phải nhập đủ 8 tới 11 số');
		bootstrapValidate('#soDT',
				'max:11:Số điện thoại phải nhập đủ 8 tới 11 số');
		bootstrapValidate('#email', 'email:Vui lòng nhập đúng định dạng email');
		bootstrapValidate('#userName',
				'regex:^[a-zA-Z0-9]+$:Không nhập chữ cái có dấu');
		bootstrapValidate('#userName', 'min:6:Username ít nhất phải từ 6 ký tự');
		bootstrapValidate('#userName', 'max:32:Username không quá 32 ký tự');
		bootstrapValidate('#hashedPassword',
				'regex:^[0]{1}/[0-$:Không nhập chữ cái có dấu');
		bootstrapValidate('#hashedPassword',
				'min:6:Password ít nhất phải từ 6 ký tự');
		bootstrapValidate('#hashedPassword',
				'max:32:Password không quá từ 32 ký tự');
	</script>
</body>
</html>