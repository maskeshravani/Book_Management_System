<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DBConn.DBConnect"%>
<%@page import="com.Daore.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Book</title>
<%@ include file="all_component/allCss.jsp"%>
<style>


.crd-ho:hover {
	background: #fff9f2;
	transition: background 0.3s ease;
}
</style>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			
			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			List<BookDtls> list = dao.getAllOldBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img class="card-img-top" src="book/<%=b.getPhotoName()%>"
							alt="<%=b.getBookname()%>"
							style="height: 220px; width: 200px; object-fit: cover;">
						<h5 class="card-title"><%=b.getBookname()%></h5>
						<p class="card-text"><%=b.getAuthor()%></p>
						<p>
							Categories:
							<%=b.getBookCategory()%></p>
						<div class="d-flex justify-content-center gap-2">
							 <a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-2">View Details</a> 
								<a href="#" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%>
								<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			
			</div>
		</div>


</body>
</html>