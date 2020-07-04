<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cake - Bakery</title>

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

<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/responsive.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/css.css"
	rel="stylesheet">

</head>
<body>
	<c:if test="${not empty orderSuccess}">
		<script type="text/javascript">
			alert("${orderSuccess}");
		</script>
	</c:if>
	<!--================Main Header Area =================-->
	<header class="main_header_area">
		<div class="top_header_area row m0">
			<div class="container">
				<div class="float-left">
					<a href="tell:+18004567890"><i class="fa fa-phone"
						aria-hidden="true"></i> +84979691</a> <a
						href="mainto:info@cakebakery.com"><i class="fa fa-envelope-o"
						aria-hidden="true"></i> info@cakebakery.com</a>
				</div>
				<div class="float-right">
					<ul class="h_social list_style">
						<li><a href=signInForm><i class="fa fa-user-circle-o"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_menu_area">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="home"> <img
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt=""> <img
						src="${pageContext.request.contextPath}/resources/img/logo-2.png"
						alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="my_toggle_menu"> <span></span> <span></span> <span></span>
						</span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="active"><a href="home">Trang Chủ</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
	<!--================End Main Header Area =================-->

	<!--================End Main Header Area =================-->
	<section class="banner_area">
		<div class="container">
			<div class="banner_text">
				<h3>Edit profile</h3>
			</div>
		</div>
	</section>


	<!--================End Main Header Area =================-->

	<!--================Product Area =================-->
	<section class="product_area p_100">
		<div class="container">
			<div class="row product_inner_row">
				<div class="col-lg-12">
					<div class="row product_item_inner">
						<div class="container">
							<h1>Edit Profile</h1>
							<hr>
							<div class="row">
								<!-- left column -->
								<div class="col-md-3">
									<div class="text-center">
										<img src="${user.urlAvatar}" class="avatar img-circle"
											alt="avatar" width="250px" height="250px">
										<h6>Chọn ảnh khác...</h6>

										<input type="file" class="form-control">
									</div>
								</div>

								<!-- edit form column -->
								<div class="col-md-9 personal-info">
									<div class="alert alert-info alert-dismissable">
										<a class="panel-close close" data-dismiss="alert">×</a> <i
											class="fa fa-coffee"></i> This is an <strong>.alert</strong>.
										Use this to show important messages to the user.
									</div>
									<h3>Thông tin cá nhân</h3>
									<form:form action="updateProfile" method="POST"
										modelAttribute="user">
										<form class="form-horizontal" role="form">
											<div class="form-group">
												<label class="col-lg-3 control-label">Tên:</label>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập Tên">
													<form:input class="input100 form-control" id="ten"
														path="ten" />
													<span class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">Họ:</label>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập Họ">
													<form:input class="input100 form-control" id="ho" path="ho" />
													<span class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Username:</label>
												<div class="col-md-8">
													<input type="text" class="input100 form-control"
														value="${user.username}" disabled="disabled" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Password:</label>
												<div class="wrap-input100 validate-input col-md-8"
													data-validate="Password không được để trống">
													<input class="input100 form-control" type="text"
														name="password" id="password"> <span
														class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">CMND:</label>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập CMND">
													<form:input id="cmnd" path="cmnd"
														class="input100 form-control" />
													<span class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">Ngày Sinh:</label>
												<c:if test="${not empty errorBirthSub18}">
													<p style="color: red">
														<i><c:out value="${errorBirthSub18}"></c:out></i>
													</p>
												</c:if>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập Ngày Sinh">
													<input type="date" id="ngaySinh" name="ngaySinh"
														class="input100 form-control" value="${user.ngaySinh}">
													<span class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-lg-3 control-label">Email:</label>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập Email">
													<form:input class="input100 form-control" id="email"
														path="email" />
													<span class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Phone:</label>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập số điện thoại">
													<form:input class="input100 form-control" id="soDT"
														path="soDT" />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">Địa Chỉ:</label>
												<div class="col-lg-8 wrap-input100 validate-input"
													data-validate="Bạn Phải Nhập địa chỉ">
													<form:input class="input100 form-control" id="diachi"
														path="diachi" />
													<span class="focus-input100"></span>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label"></label>
												<div class="col-md-8">
													<input type="submit"
														class="btn btn-primary container-login100-form-btn"
														value="Save Changes"> <span></span> <input
														type="reset" class="btn btn-default" value="Cancel">
												</div>
											</div>
										</form>
									</form:form>
								</div>
							</div>
						</div>
						<hr>


					</div>
					<div class="product_pagination">
						<div class="middle_list">
							<nav aria-label="Page navigation example">
								<ul class="pagination">
									<c:set var="pageTotal" scope="session" value="${TotalPage}" />
									<c:set var="pageCurrent" scope="session" value="${PageBanh}" />
									<c:if test="${pageTotal < 7}">
										<c:forEach var="i" begin="1" end="${pageTotal}">
											<c:choose>
												<c:when test="${pageCurrent == i}">
													<li class="page-item active"><a class="page-link"
														href="index?PageBanh=${i}"><c:out value="${i}"></c:out></a></li>
												</c:when>

												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="index?PageBanh=${i}"> <c:out value="${i}"></c:out></a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:if>
									<c:if test="${pageTotal >= 7}">
										<!-- Case 1: beginning -->
										<c:if test="${pageCurrent <= 3}">
											<c:forEach var="i" begin="1" end="3">
												<c:choose>
													<c:when test="${pageCurrent == i}">
														<li class="page-item active"><a class="page-link"
															href="index?PageBanh=${i}"><c:out value="${i}"></c:out></a></li>
													</c:when>

													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="index?PageBanh=${i}"><c:out value="${i}"></c:out></a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:forEach var="i" begin="1" end="2">
												<li class="page-item"><a class="page-link" href="#"><c:out
															value="..."></c:out></a></li>
											</c:forEach>
											<li class="page-item"><a class="page-link"
												href="index?PageBanh=${pageTotal}"><c:out
														value="${pageTotal}"></c:out></a></li>
										</c:if>
										<!-- Case 2: middle -->
										<c:if
											test="${pageCurrent >= 3 && pageCurrent <= pageTotal - 3}">
											<li class="page-item"><a class="page-link"
												href="index?PageBanh=1"><c:out value="1"></c:out></a></li>
											<li class="page-item"><a class="page-link" href="#"><c:out
														value="..."></c:out></a></li>
											<c:forEach var="i" begin="${pageCurrent-1}"
												end="${pageCurrent+1}">
												<c:choose>
													<c:when test="${pageCurrent == i}">
														<li class="page-item active"><a class="page-link"
															href="index?PageBanh=${i}"><c:out value="${i}"></c:out></a></li>
													</c:when>

													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="index?PageBanh=${i}"><c:out value="${i}"></c:out></a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<li class="page-item"><a class="page-link" href="#"><c:out
														value="..."></c:out></a></li>
											<li class="page-item"><a class="page-link"
												href="index?PageBanh=${pageTotal}"><c:out
														value="${pageTotal}"></c:out></a></li>
										</c:if>
										<!-- Case 3: end -->
										<c:if test="${pageCurrent > (pageTotal - 3)}">
											<li class="page-item"><a class="page-link"
												href="index?PageBanh=1"><c:out value="1"></c:out></a></li>
											<li class="page-item"><a class="page-link" href="#"><c:out
														value="..."></c:out></a></li>
											<c:forEach var="i" begin="${pageTotal-2}" end="${pageTotal}">
												<c:choose>
													<c:when test="${pageCurrent == i}">
														<li class="page-item active"><a class="page-link"
															href="index?PageBanh=1"><c:out value="${i}"></c:out></a></li>
													</c:when>

													<c:otherwise>
														<li class="page-item"><a class="page-link"
															href="index?PageBanh=${i}"><c:out value="${i}"></c:out></a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:if>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Product Area =================-->
	<!--================Footer Area =================-->
	<footer class="footer_area">
		<div class="footer_widgets">
			<div class="container">
				<div class="row footer_wd_inner">
					<div class="col-lg-3 col-6">
						<aside class="f_widget f_about_widget">
							<img
								src="${pageContext.request.contextPath}/resources/img/footer-logo.png"
								alt="">
							<p>Hãy đến với chúng tôi để được phục vụ tận tình nhất</p>
							<ul class="nav">
								<li><a><i class="fa fa-facebook"></i></a></li>
								<li><a><i class="fa fa-linkedin"></i></a></li>
								<li><a><i class="fa fa-twitter"></i></a></li>
								<li><a><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</aside>
					</div>
					<div class="col-lg-3 col-6">
						<aside class="f_widget f_link_widget">
							<div class="f_title">
								<h3>Cam Kết</h3>
							</div>
							<ul class="list_style">
								<li><a>Giao Hàng Nhanh Chóng</a></li>
								<li><a>Uy Tín</a></li>
								<li><a>Bảo Mật</a></li>
							</ul>
						</aside>
					</div>
					<div class="col-lg-3 col-6">
						<aside class="f_widget f_link_widget">
							<div class="f_title">
								<h3>Thời Gian Làm Việc</h3>
							</div>
							<ul class="list_style">
								<li><a>Monday-Fri : 8 am - 8 pm</a></li>
								<li><a>Sat : 9am - 4pm</a></li>
								<li><a>Sun : Closed</a></li>
							</ul>
						</aside>
					</div>
					<div class="col-lg-3 col-6">
						<aside class="f_widget f_contact_widget">
							<div class="f_title">
								<h3>Liên Hệ Với Chúng Tôi</h3>
							</div>
							<h4>(+84)974979691</h4>
							<p>
								Cake Bakery <br />12, Nguyễn Văn Bảo, Hồ Chí Minh City
							</p>
							<h5>cakebakery@contact.co.in</h5>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--================End Footer Area =================-->


	<!--================Search Box Area =================-->
	<div class="search_area zoom-anim-dialog mfp-hide" id="test-search">
		<div class="search_box_inner">
			<h3>Search</h3>
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">
						<i class="icon icon-Search"></i>
					</button>
				</span>
			</div>
		</div>
	</div>
	<!--================End Search Box Area =================-->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/loginmain.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Rev slider js -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/extensions/revolution.extension.actions.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/extensions/revolution.extension.video.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
	<!-- Extra plugin js -->
	<script
		src="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/isotope/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/datetime-picker/js/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/jquery-ui/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
	<!-- bắt lỗi -->
3	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-validate.js"></script>
	<script>
		bootstrapValidate(
				'#ho',
				'regex:^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$:Chỉ nhập các ký tự chữ cái không khoảng trắng');
		bootstrapValidate('#ho', 'max:10:Họ dài quá 10 ký tự');
		bootstrapValidate(
				'#ten',
				'regex:^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ ]+$:Chỉ nhập các ký tự chữ cái');
		bootstrapValidate('#ten', 'max:30:Tên dài quá 30 ký tự');
		bootstrapValidate('#cmnd', 'regex:^[0-9]+$:Chỉ nhập các ký số');
		bootstrapValidate('#cmnd', 'min:9:CMND phải nhập đủ 9 tới 13 số');
		bootstrapValidate('#cmnd', 'max:13:CMND phải nhập đủ 9 tới 13 số');
		bootstrapValidate('#soDT', 'regex:^[0-9]+$:Chỉ nhập các ký số');
		bootstrapValidate('#soDT',
				'min:8:Số điện thoại phải nhập đủ 8 tới 11 số');
		bootstrapValidate('#soDT',
				'max:11:Số điện thoại phải nhập đủ 8 tới 11 số');
		bootstrapValidate('#email', 'email:Vui lòng nhập đúng định dạng email');
		bootstrapValidate('#username',
				'regex:^[a-zA-Z0-9]+$:Không nhập chữ cái có dấu');
		bootstrapValidate('#username', 'min:6:Username ít nhất phải từ 6 ký tự');
		bootstrapValidate('#username', 'max:32:Username không quá 32 ký tự');
		bootstrapValidate('#password',
				'regex:^[0]{1}/[0-$:Không nhập chữ cái có dấu');
		bootstrapValidate('#password', 'min:6:Password ít nhất phải từ 6 ký tự');
		bootstrapValidate('#password', 'max:32:Password không quá từ 32 ký tự');
	</script>
</body>

</html>