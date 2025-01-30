<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DBConn.DBConnect"%>
<%@page import="com.Daore.BookDAOImpl"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All New Books</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.crd-ho:hover {
	background: #fff9f2;
	transition: background 0.3s ease;
}
#toast {
	position: fixed;
	top: 10%;
	right: 10%;
	background: #28a745;
	color: white;
	padding: 10px;
	border-radius: 5px;
	display: none;
	z-index: 1000;
}
#toast.display {
	display: block;
}
</style>
</head>
<body>
<%
	// Get user session object
	com.entityRe.User u = (com.entityRe.User) session.getAttribute("userobj");
%>

<%@ include file="all_component/navbar.jsp"%>

<c:if test="${not empty addCart}">
	<div id="toast">${addCart}</div>
	<script type="text/javascript">
		showToast("${addCart}");
		function showToast(content) {
			let toast = document.getElementById('toast');
			toast.classList.add("display");
			toast.innerHTML = content;
			setTimeout(() => {
				toast.classList.remove("display");
			}, 2000);
		}
	</script>
</c:if>

<div class="container-fluid">
	<div class="row p-3">
		<%
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
		List<BookDtls> list = dao.getAllNewBook();
		
		if (list != null && !list.isEmpty()) {
			for (BookDtls b : list) {
		%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img class="card-img-top" src="book/<%=b.getPhotoName()%>" alt="<%=b.getBookname()%>"
						style="height: 220px; width: 200px; object-fit: cover;">
					<h5 class="card-title"><%=b.getBookname()%></h5>
					<p class="card-text">Author: <%=b.getAuthor()%></p>
					<p>Category: <%=b.getBookCategory()%></p>
					<div class="d-flex justify-content-center gap-2">
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
						<a href="#" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> 
							<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>
						</a>
						<%
						} else {
							if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-danger btn-sm">
							<i class="fa-sharp fa-solid fa-cart-plus"></i> Add Cart
						</a>
						<%
							} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ">
							<i class="fa-sharp fa-solid fa-cart-plus"></i> Add Cart
						</a>
						<%
							}
						%>
						<a href="view_book.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-2">View Details</a>
						<a href="#" class="btn btn-danger btn-sm ml-2"><%=b.getPrice()%> 
							<i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<%
			}%>
		<% } %>
		<div class="col-12 text-center">
			<p class="text-muted">No new books available...</p>
		</div>
		<%
		}
		%>
	</div>
</div>

</body>
</html>
