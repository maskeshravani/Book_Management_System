<%@page import="java.io.PrintWriter"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.entityRe.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DBConn.DBConnect"%>
<%@page import="com.Daore.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>EBook: Index</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/book1.jpg") no-repeat center center;
	background-size: cover;
	height: 80vh;
	width: 100%;
}

.crd-ho:hover {
	background: #fff9f2;
	transition: background 0.3s ease;
}
</style>
</head>
<body style="background-color: #e9eef2;">
	<%
	User u = (User) session.getAttribute("userobj");
	Connection conn = DBConnect.getConnection();
	BookDAOImpl bookDao = new BookDAOImpl(conn);
	%>
	<%@ include file="all_component/navbar.jsp"%>

	<!-- Hero Section -->
	<div
		class="container-fluid back-img d-flex justify-content-center align-items-start"
		style="height: 84vh; padding-top: 20px;">
		<div class="text-center text-white"
			style="background: rgba(0, 0, 0, 0.4); padding: 20px;">
			<h2 class="text-center">EBook Management System</h2>
		</div>
	</div>

	<!-- Recent Books Section -->
	<div class="container-fluid mt-4">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">
			<%
			List<BookDtls> recentBooks = bookDao.getRecentBook();
			if (recentBooks != null && !recentBooks.isEmpty()) {
				for (BookDtls book : recentBooks) {
			%>
			<div class="col-md-3 mt-4">
				<div class="card crd-ho h-100">
					<div class="card-body text-center">
						<img class="card-img-top mb-3" src="book/<%=book.getPhotoName()%>"
							alt="<%=book.getBookname()%>"
							style="height: 220px; width: 200px; object-fit: cover;">
						<h5 class="card-title"><%=book.getBookname()%></h5>
						<p class="card-text">
							Author:
							<%=book.getAuthor()%></p>
						<p>
							Category:
							<%=book.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2">
							<%
							if (book.getBookCategory().equals("Old")) {
							%>
							<a href="view_book.jsp?bid=<%=book.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-2"><%=book.getPrice()%> <i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>
							<%
							} else {
							%>
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-sharp fa-solid fa-cart-plus ml-2"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=book.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"> <i
								class="fa-sharp fa-solid fa-cart-plus ml-2"></i> Add Cart
							</a>
							<%
							}
							%>

							<a href="view_book.jsp?bid=<%=book.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-2"><%=book.getPrice()%> <i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			%>
			<div class="col-12">
				<p class="text-center text-muted">No recent books available.</p>
			</div>
			<%
			}
			%>
		</div>
		<div class="d-flex justify-content-center mt-3">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>

	<hr>

	<!-- New Books Section -->
	
	<div class="container-fluid mt-4">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			<%
			List<BookDtls> newBooks = bookDao.getNewBook();
			for (BookDtls book : newBooks) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center mt-4">
						<img class="card-img-top" src="book/<%=book.getPhotoName()%>"
							alt="<%=book.getBookname()%>"
							style="height: 220px; width: 200px; object-fit: cover;">
						<h5 class="card-title"><%=book.getBookname()%></h5>
						<p class="card-text"><%=book.getAuthor()%></p>
						<p>
							Categories:
							<%=book.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fa-sharp fa-solid fa-cart-plus ml-2"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=book.getBookId()%>&&uid=<%=u.getId()%>"
							
								class="btn btn-danger btn-sm"> <i
								class="fa-sharp fa-solid fa-cart-plus ml-2"></i> Add Cart
							</a>
							<%
						PrintWriter write=	response.getWriter();
							write.println(u.getId());
							}
							%>
							<a href="view_book.jsp?bid=<%=book.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-2"><%=book.getPrice()%> <i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>

							

						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="d-flex justify-content-center mt-3">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<hr>

	<!-- Old Books Section -->
	<div class="container-fluid mt-4">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			<%
			List<BookDtls> oldBooks = bookDao.getOldBook();
			for (BookDtls book : oldBooks) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img class="card-img-top" src="book/<%=book.getPhotoName()%>"
							alt="<%=book.getBookname()%>"
							style="height: 220px; width: 200px; object-fit: cover;">
						<h5 class="card-title"><%=book.getBookname()%></h5>
						<p class="card-text"><%=book.getAuthor()%></p>
						<p>
							Categories:
							<%=book.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2">
							<a href="view_book.jsp?bid=<%=book.getBookId()%>"
								class="btn btn-success btn-sm ml-2">View Details</a> <a href="#"
								class="btn btn-danger btn-sm ml-2"><%=book.getPrice()%> <i
								class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="d-flex justify-content-center mt-3">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>

	<hr>

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>
