<%@page import="com.entity.BookDtls"%>
<%@page import="com.DBConn.DBConnect"%>
<%@page import="com.Daore.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h2 class="text-center">Edit Books</h2>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
						BookDtls b = dao.getBooById(id);
						%>



						<form action="../editbooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="mb-3">
								<label for="bookName" class="form-label">Book Name*</label> <input
									type="text" class="form-control" id="bookName" name="bookName"
									required value=<%=b.getBookname()%>>


							</div>
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name*</label>
								<input type="text" class="form-control" id="authorName"
									name="authorName" required value=<%=b.getAuthor()%>>
							</div>
							<div class="mb-3">
								<label for="price" class="form-label">Price*</label> <input
									type="number" class="form-control" id="price" name="price"
									required value=<%=b.getPrice()%>>
							</div>

							
							<div class="mb-3">
								<label for="status" class="form-label">Book Status</label> <select
									class="form-select" id="status" name="status">
									<option value="Active"
										<%="Active".equals(b.getStatus()) ? "selected" : ""%>>Active</option>
									<option value="Inactive"
										<%="Inactive".equals(b.getStatus()) ? "selected" : ""%>>Inactive</option>
								</select>
							</div>



							</select>
					</div>

					<button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div style="margin-top: 100px;">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
