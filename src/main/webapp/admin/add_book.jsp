<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: Add Books</title>
    <%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
    <%@include file="navbar.jsp"%>
    
    
    <c:if test="${empty userobj }">
<c:redirect url ="../login.jsp"></c:redirect>
</c:if>
    
    <div class="container">
        <div class="row mt-4">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center">Add Books</h2>
                        
                        <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        
                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>
                        
                        <form action="../add_books" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="bookName" class="form-label">Book Name*</label>
                                <input type="text" class="form-control" id="bookName" name="bookName" required>
                            </div>
                            <div class="mb-3">
                                <label for="authorName" class="form-label">Author Name*</label>
                                <input type="text" class="form-control" id="authorName" name="authorName" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price*</label>
                                <input type="number" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="mb-3">
                                <label for="category" class="form-label">Book Categories</label>
                                <select class="form-select" id="category" name="category">
                                    <option value="">--select--</option>
                                    <option value="new">New-Book</option>
                                    <option value="old">Old-Book</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="status" class="form-label">Book Status</label>
                                <select class="form-select" id="status" name="status">
                                    <option value="">--select--</option>
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlFile1">Upload Photo</label>
                                <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Book</button>
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
