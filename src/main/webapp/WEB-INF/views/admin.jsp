<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>Insert title here</title>
</head>

<body>
<c:if test="${not empty addSuccess}">
		<script type="text/javascript">
			alert("${addSuccess}");
		</script>
	</c:if>
	<c:if test="${not empty editSuccess}">
		<script type="text/javascript">
			alert("${editSuccess}");
		</script>
	</c:if>
	<form action="adminIndex" method="get">
		<input id="btnsub" type="submit" value="Danh sách bánh">
	</form>
	<form action="adminLoaiBanh" method="get">
		<input id="btnsub" type="submit" value="Danh sách loại bánh">
	</form>
	<form action="adminCartManager" method="get">
		<input id="btnsub" type="submit" value="Danh sách đơn hàng">
	</form>
	<table>
		<tr>
			<th>Hình ảnh</th>
			<th>Mã</th>
			<th>Tên</th>
			<th>Giá</th>
			<th>Giảm giá</th>
			<th>Loại</th>
			<th>Đang bán</th>
			<th><form action="adminInsertPage">
					<input type="submit" class="button"
						style="background-color: #4CAF50;" value="Insert New">
				</form></th>
		</tr>
		<c:forEach items="${ds}" var="item">

			<tr>
				<td><img src="<c:out value="resources/${item.pathHinhAnh}"/>"
					alt=""></td>
				<td><c:out value="${item.maBanh}" /></td>
				<td><c:out value="${item.tenBanh}" /></td>
				<td><c:out value="${item.gia}" /></td>
				<td><c:out value="${item.giamGia}" /></td>
				<td><c:out value="${item.loaiBanh.tenLoaiBanh}" /></td>
				<td><c:out value="${item.dangBan}" /></td>
				<td>
					<form action="adminEditPage" method="POST">
						<input type="hidden" name="maBanhBiMat" value="${item.maBanh}">
						<input type="submit" class="button"
							style="background-color: #008CBA;" value="Sửa">
					</form>
					<form action="adminIndexHuy" method="POST">
						<input type="hidden" name="maBanhBiMat" value="${item.maBanh}">
						<input type="submit" class="button"
							style="background-color: #f44336;" name="huy" value="Bán/Hủy bán">
					</form>
				</td>


			</tr>

		</c:forEach>

	</table>
</body>
</html>