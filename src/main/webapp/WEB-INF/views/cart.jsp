<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" href="${pageContext.request.contextPath}/resources/img/fav-icon.png" type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Cake - Bakery</title>

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

<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/responsive.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
</head>
<body>

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
						<li><a href="signInForm"><i class="fa fa-user-circle-o"></i></a></li>
						<li><a href="checkoutCart"><i class="fa fa-sign-out"></i></a></li>
					</ul>
					<ul class="h_search list_style">
						<li><a href="shoppingCart"><i class="fa fa-shopping-cart"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="main_menu_area">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<a class="navbar-brand" href="home"> <img
						src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""> <img src="${pageContext.request.contextPath}/resources/img/logo-2.png" alt="">
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
							<li><a href="">Khuyễn Mãi</a></li>
						</ul>

						<ul class="navbar-nav justify-content-end">
							<li><a href="">Đặt Hàng</a></li>
							<li><a href="">Liên Hệ</a></li>
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
				<h3>Cart</h3>
				<ul>
					<li><a href="home">Home</a></li>
					<li><a href="shoppingCart">Cart</a></li>
				</ul>
			</div>
		</div>
	</section>
	<!--================End Main Header Area =================-->

	<!--================Cart Table Area =================-->
	<section class="cart_table_area p_100">
		<div class="container">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Preview</th>
							<th scope="col">Product</th>
							<th scope="col">Price</th>
							<th scope="col">Quantity</th>
							<th scope="col">Total</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${gioHang}" var="item" varStatus="counter">
							<tr>
								<td><img src="<c:out value="resources/${item.banh.urlImg}"></c:out>" width="170"
									height="170" alt=""></td>
								<td>${item.banh.tenBanh}</td>
								<td>${item.banh.gia}</td>
								<td>
									<form action="" method="POST">
										<input type="hidden" name="maBanh" value="${item.banh.maBanh}">
										<input type="hidden" name="index" value="${counter.count}">
										<input type="number" style="width: 5em;" name="soLuong"
											min="1" max="200" required="required" value="${item.soLuong}">
										<input type="submit" name="submit" value="Cập nhật" class="btn btn-primary">
									</form>
								</td>
								<td>${item.banh.gia * item.soLuong}</td>
								<td>
									<form action="removeGioHang" method="POST">
										<input type="hidden" name="index" value="${counter.count}">
										<input type="hidden" name="maBanh" value="${item.banh.maBanh}">
										<input type="submit" name="submit" value="xoa" class="btn btn-primary">
									</form>
								</td>
							</tr>
						</c:forEach>
						<tr>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row cart_total_inner">
				<div class="col-lg-7"></div>
				<div class="col-lg-5">
					<div class="cart_total_text">
						<div class="cart_head">Tổng tiền</div>
						<div class="sub_total">
							<h5>
								Tổng tiền <span>${tongDonHang}</span>
							</h5>
						</div>
						<div class="total">
							<h4>
								Tổng tiền bao gồm thuế <span>${tongDonHang}</span>
							</h4>
						</div>
						<div class="cart_footer">
							<a class="pest_btn" href="checkoutCart">Thanh toán đơn hàng</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Cart Table Area =================-->


	<!--================Footer Area =================-->
	<footer class="footer_area">
		<div class="footer_widgets">
			<div class="container">
				<div class="row footer_wd_inner">
					<div class="col-lg-3 col-6">
						<aside class="f_widget f_about_widget">
							<img src="img/footer-logo.png" alt="">
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
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Rev slider js -->
	<script src="${pageContext.request.contextPath}/resources/vendors/revolution/js/jquery.themepunch.tools.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/revolution/js/jquery.themepunch.revolution.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/magnifc-popup/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/isotope/imagesloaded.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/isotope/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/datetime-picker/js/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendors/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/nice-select/js/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/lightbox/simpleLightbox.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>
</body>

</html>