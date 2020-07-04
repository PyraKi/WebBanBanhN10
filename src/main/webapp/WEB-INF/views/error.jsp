<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/img/fav-icon.png"
	type="image/x-icon" />
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
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

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<style>
	input[type=text], select, textarea {
		width: 100%;
		padding: 12px;
		border: 1px solid #ccc;
		border-radius: 4px;
		resize: vertical;
	}
	
	label {
		padding: 12px 12px 12px 0;
		display: inline-block;
	}
	
	input[type=submit] {
		background-color: #4CAF50;
		width: 100%;
		color: white;
		padding: 12px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	
	.col-25 {
		float: left;
		width: 25%;
		margin-top: 6px;
	}
	
	.col-75 {
		float: left;
		width: 75%;
		margin-top: 6px;
	}
	
	input[type=submit]:hover {
		background-color: #45a049;
	}
	
	#btnsub{
		vertical-align: middle;
		text-align: center;
	}
	
	.row:after {
		content: "";
		display: table;
		clear: both;
	}
	
	@media screen and (max-width: 600px) {
		.col-25, .col-75, input[type=submit] {
			width: 100%;
			margin-top: 0;
		}
	}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>
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
	
	<section class="banner_area">
		<div class="container">
			<div class="banner_text">
				<h3>Rất tiếc đã có lỗi</h3>
			</div>
		</div>
	</section>
	<!--================End Main Header Area =================-->
	<section class="banner_area">
		<div class="container">
		</div>
	</section>

	<div class="container" style="margin-top: 60px; margin-bottom: 30px;">
		<h4>${error}</h4>
		<h5>Vui lòng liên hệ admin để sử lý vấn đề.</h5>
	</div>
		

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
	<script
		src="${pageContext.request.contextPath}/resources/js/loginmain.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-validate.js"></script>
</body>
</html>