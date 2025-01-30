<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DBConn.DBConnect"%>
<%@page import="com.Daore.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All-Orders</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	 
    <c:if test="${empty userobj }">
<c:redirect url ="../login.jsp"></c:redirect>
</c:if>
	

	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>

	<table class="table table-striped">
		<thead class=" bg-primary text-white">
			<tr>
				<th scope="col">Order_Id</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
			List<Book_Order> blist =  dao.getAllorder();
			for(Book_Order b : blist){
				%>
				
				<tr>
				<th scope="row"><%=b.getOrderId() %></th>
				<td><%=b.getUserName() %></td>
				<td><%=b.getEmail() %></td>
				<td><%=b.getFulladd() %></td>
				<td><%=b.getPhno() %></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getPaymentType() %></td>

			</tr>
				
				
				<%
			}
			%>

			




		</tbody>
	</table>
	</div>
	<div style="margin-top: 435px;">

		<%@include file="footer.jsp"%>
	</div>
</body>
</html>