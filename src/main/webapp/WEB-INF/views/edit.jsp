<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	* {
		box-sizing: border-box;
	}
	
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
		color: white;
		padding: 12px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	
	input[type=submit]:hover {
		background-color: #45a049;
	}
	
	.container {
		border-radius: 5px;
		background-color: #f2f2f2;
		padding: 20px;
		width: 80%;
		
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
	img {
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  padding: 5px;
	  width: 300px;
	}
	
	img:hover {
	  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
	}
	#btnsub{
		vertical-align: middle;
		text-align: center;
	}
	
	/* Clear floats after the columns */
	.row:after {
		content: "";
		display: table;
		clear: both;
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

	<div class="container">
		<form:form action="adminEdit" method="POST" modelAttribute="banh">
			<form:hidden path="maBanh" />
			<div class="row" style="vertical-align: middle; text-align: center;">
				<img src="<c:out value="resources/${banh.urlImg}"/>" alt="">
			</div>
			<div class="row">
				<div class="col-25">
					<label for="path">urlImg</label>
				</div>
				<div class="col-75">
					<form:input id="path" path="urlImg" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="ten">Tên</label>
				</div>
				<div class="col-75">
					<form:input id="tenbanh" path="tenBanh" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="gia">Giá</label>
				</div>
				<div class="col-75">
					<form:input id="gia" path="gia" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="giamgia">Giảm giá</label>
				</div>
				<div class="col-75">
					<form:input id="giamgia" path="giamGia" />
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="chitiet">Mô tả</label>
				</div>
				<div class="col-75" class="wrap-input100 validate-input">
					<form:textarea id="chitiet" path="moTa"></form:textarea>
				</div>
			</div>

			<div class="row" id="btnsub">
				<input type="submit" value="Submit">
			</div>
		</form:form>
	</div>
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
	<script>
		bootstrapValidate('#tenbanh', 'max:20:Tên dài quá 20 ký tự');
		bootstrapValidate('#chitiet', 'max:50:Dài quá 50 ký tự');
		bootstrapValidate('#gia', 'regex:^[0-9_.]+$:Chỉ nhập các ký số');
		bootstrapValidate('#gia', 'max:6 :Giá phải dưới 1.000.000$');
		bootstrapValidate('#gia', 'min:1 :Giá phải lớn hơn 0$');
		bootstrapValidate('#giamgia', 'regex:^[0-9_.]+$:Chỉ nhập các ký số');
		bootstrapValidate('#giamgia', 'max:2 :Giảm quá 100% rồi');
		bootstrapValidate('#giamgia', 'min:1 :Giá phải lớn hơn 0$');
		bootstrapValidate('#path',
				'regex:^[a-zA-Z0-9]+$:Không nhập chữ cái có dấu');
	</script>
</body>
</html>