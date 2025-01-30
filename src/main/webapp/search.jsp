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
<title>All Recent Book</title>
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
			 String ch  = request.getParameter("ch");
        BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
        List<BookDtls> list1 = dao2.getBookBySerch(ch);

        if (list1 != null && !list1.isEmpty()) {
            for (BookDtls b : list1) {
        %>
        <div class="col-md-3 mb-4">
            <div class="card crd-ho h-100">
                <div class="card-body text-center">
                    <!-- Book Image -->
                    <img class="card-img-top mb-3" src="book/<%= b.getPhotoName() %>" 
                         alt="<%= b.getBookname() %>" 
                         style="height: 220px; width: 200px; object-fit: cover;">

                    <!-- Book Details -->
                    <h5 class="card-title"><%= b.getBookname() %></h5>
                    <p class="card-text">Author: <%= b.getAuthor() %></p>
                    <p>Category: <%= b.getBookCategory() %></p>

                    <!-- Action Buttons -->
                    <div class="d-flex justify-content-center gap-2">
                        <% if (b.getBookCategory().equals("Old")) { %>
                            <a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-2">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm ml-2"><%= b.getPrice() %>
                                <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        <% } else { %>
                           
                            <a href="view_book.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-2">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm ml-2"><%= b.getPrice() %>
                                <i class="fa-sharp fa-solid fa-indian-rupee-sign"></i>
                            </a>
                        <% } %>
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
		</div>


</body>
</html>