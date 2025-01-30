<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entityRe.User"%>

<%@page import="com.DBConn.DBConnect"%>
<%@page import="com.Daore.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Old Books</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #e9eef2;">
    <%@ include file="all_component/navbar.jsp"%>

    <div class="container p-5">
        <table class="table table-striped">
            <thead class="bg-primary text-white">
                <tr>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                User u = (User) session.getAttribute("userobj");
                if (u != null) { 
                    String email = u.getEmail();
                    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
                    List<BookDtls> list = dao.getBookByOld(email, "Old");

                    if (list.isEmpty()) {
                        out.println("<tr><td colspan='5' class='text-center text-warning'>No old books available.</td></tr>");
                    } else {
                        for (BookDtls b : list) {
                %>
                <tr>
                    <td><%= b.getBookname() %></td>
                    <td><%= b.getAuthor() %></td>
                    <td><%= b.getPrice() %></td>
                    <td><%= b.getBookCategory() %></td>
                    <td>
                        <a href="delete_book.jsp?bid=<%= b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
                <%
                        } 
                    }
                } else {
                    out.println("<tr><td colspan='5' class='text-center text-danger'>User not logged in</td></tr>");
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
