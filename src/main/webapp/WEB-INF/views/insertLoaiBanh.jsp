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
		<div>
			<h2>Thêm Loại Bánh Mới</h2>
		</div>
		<form:form action="adminInsertLoaiBanh" method="POST" modelAttribute="loaibanh">
			<form:hidden path="maLoaiBanh"/>
			<div class="row">
				<div class="col-25">
					<label for="ten">Tên</label>
				</div>
				<div class="col-75">
					<form:input path="tenLoaiBanh"/>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="chitiet">Chi tiết</label>
				</div>
				<div class="col-75">
					<form:textarea path="dacTaLoaiBanh"></form:textarea>
				</div>
			</div>
			
			<div class="row" id="btnsub">
				<input type="submit" value="Submit">
			</div>
		</form:form>
	</div>
</body>
</html>