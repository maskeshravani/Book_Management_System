<%@page import="com.entity.BookDtls"%>
<%@page import="com.DBConn.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Daore.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@ include file="all_component/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	BookDtls b = dao.getBooById(bid);
	%>



	<div class="container p-3">
		<div class="row p-5">
			<!-- First Column: Book Details -->
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/hib.jpg" style="height: 150px; width: 150px"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory()%></span>
				</h4>
			</div>

			<!-- Second Column: Additional Information -->
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname()%></h2>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
					<i class="fa-solid fa-envelope"></i> Email:
					<%=b.getEmail()%></h5>
				<%
				}
				%>



				<div class="row mt-2">
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-sharp fa-solid fa-rotate-left fa-2x mx-3"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Shipping</p>

					</div>


				</div>
				<%
				if ("Old".equals(b.getBookCategory())) {
				%>
				<div class="text-center p3 ">
					<a href="Index.jsp " class="btn btn-success"> <i
						class="fa-sharp fa-solid fa-cart-plus"></i> Continue Shopping
					</a> <a href=" " class="btn btn-danger"><i
						class="fa-sharp fa-solid fa-indian-rupee-sign"></i> 300</a>
				</div>
				<%
				}else{%>
					<div class="text-center p3 ">
					<a href=" " class="btn btn-success"> <i
						class="fa-sharp fa-solid fa-cart-plus"></i> Add Cart
					</a> <a href=" " class="btn btn-danger"><i
						class="fa-sharp fa-solid fa-indian-rupee-sign"></i> 300</a>
				</div>
					<%
				}
				%>
				

			</div>
		</div>
	</div>
	</div>
</body>
</html>
