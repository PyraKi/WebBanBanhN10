<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart manager</title>
<style>
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	
	td, th {
	  
	  text-align: left;
	  padding: 8px;
	}
	
	tr:nth-child(even) {
	  background-color: #dddddd;
	}
	img {
	  border: 1px solid #ddd;
	  border-radius: 4px;
	  padding: 5px;
	  width: 150px;
	}
	
	img:hover {
	  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
	}
	.button {
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 20px;
	  margin: 4px 2px;
	  cursor: pointer;
	  width: 180px;
	  height: 75px; 
	  border-radius: 8px;
	}
	.button:hover {
		background-color: #3e8e41;
	}

	
</style>
</head>
<body>
	<form action="adminIndex" method="get"><input id="btnsub" type="submit" value="Danh sách bánh"></form>
	<form action="adminLoaiBanh" method="get"><input id="btnsub" type="submit" value="Danh sách loại bánh"></form>
	<form action="adminCartManager" method="get"><input id="btnsub" type="submit" value="Danh sách đơn hàng"></form>
	<br>
	<table>
		<tr>
			<th>Mã đơn hàng</th>
			<th>Tên khách hàng đặt hàng</th>
			<th>Đã duyệt?</th>
			<th>Ngày đặt hàng</th>
			<th>Địa chỉ giao hàng của người nhận hàng</th>
			<th>Họ và tên của người nhận hàng</th>
			<th>Tổng tiền</th>
			<th>Hình thức thanh toán</th>
			<th>Chọn xem chi tiết giỏ<br>hàng và duyệt đơn hàng</th>
		</tr>
		<c:forEach items="${ds}" var="donHang">
		
			<tr>
				<td><c:out value="${donHang.maDH}"/></td>
				<td><c:out value="${donHang.khachHang.hoKH} ${donHang.khachHang.tenKH}" /></td>
				<td><c:out value="${donHang.daXacNhan}" /></td>
				<td><c:out value="${donHang.ngayDatHang}" /></td>
				<td><c:out value="${donHang.diaChiGiaoHang}" /></td>
				<td><c:out value="${donHang.hoKH} ${donHang.tenKH}" /></td>
				<td><c:out value="${donHang.tongTien}" /></td>
				<td>
				<c:if test="${donHang.hinhThucGiaoDich == 0}">
					<c:out value="Thanh toán trực tiếp" />
				</c:if>
				<c:if test="${donHang.hinhThucGiaoDich == 1}">
					<c:out value="Thẻ tín dụng:" />
					<br></br>
					<c:out value="Số thẻ: ${donHang.soTheNganHang}" />
					<br></br>
					<c:out value="Mật mã: ${donHang.soMatMa}" />
				</c:if>
				<td>
					<form action="adminCartDetail" method="POST">
						<input type="hidden" name="maDHBiMat" value="${donHang.maDH}">
						<input type="submit" class="button" style="background-color: #008CBA;" value="Xem chi tiết">
					</form>
				</td>				
			</tr>
		
		</c:forEach>
	</table>
</body>
</html>
