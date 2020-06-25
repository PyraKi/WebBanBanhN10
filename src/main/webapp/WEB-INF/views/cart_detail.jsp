<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	font-family: arial, sans-serif;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
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

#btnsub {
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
			<h2>Thêm Bánh mới</h2>
		</div>
		<div class="row">
			<div class="col-25">
				<label for="ten">Tên người nhận</label>
			</div>
			<div class="col-75">
				<c:out value="${donHang.khachHang.hoKH} ${donHang.khachHang.tenKH}"></c:out>
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="gia">Địa chỉ người nhận</label>
			</div>
			<div class="col-75">
				<c:out value="${donHang.diaChiGiaoHang}"></c:out>
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="giamgia">Số điện thoại người nhận</label>
			</div>
			<div class="col-75">
				<c:out value="${donHang.soDT}"></c:out>
			</div>
		</div>

		<div class="row">
			<div class="col-25">
				<label for="dangban">Hình thức giao dịch</label><br />
			</div>
			<div class="col-75">
				<c:if test="${donHang.hinhThucGiaoDich == 0}">
					<c:out value="Thanh toán trực tiếp"></c:out>
				</c:if>
				<c:if test="${donHang.hinhThucGiaoDich == 1}">
					<c:out value="Thẻ tín dụng"></c:out>
				</c:if>
			</div>
		</div>
		<c:if test="${donHang.hinhThucGiaoDich == 1}">
			<div class="row">
				<div class="col-25">
					<label for="chitiet">Số thẻ và mật mã</label>
				</div>
				<div class="col-75">
					<c:out value="${donHang.soTheNganHang} | ${donHang.soMatMa}"></c:out>
				</div>
			</div>
		</c:if>

		<div class="row">
			<div class="col-25">
				<label for="loaiBanh">Danh sách giỏ hàng</label>
			</div>
			<div class="col-75">
				<table>
					<tr>
						<th>Tên bánh</th>
						<th>Số lượng</th>
					</tr>
					<c:forEach items="${donHang.dsCTDT}" var="it">
						<tr>
							<td><c:out value="${it.banh.tenBanh}"></c:out></td>
							<td><c:out value="${it.soLuong}"></c:out></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div class="row" id="btnsub">
			<form action="adminCartVerification" method="POST">
				<input type="hidden" name="maDHBiMat" value="${donHang.maDH}">
				<input type="submit" value="Duyệt đơn hàng" name="cartVerif">
			</form>
			<br />
			<form action="adminCartManager">
				<input type="submit" value="Quay lại" name="cartVerif">
			</form>
		</div>
	</div>
</body>
</html>