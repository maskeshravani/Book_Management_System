<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook Register</title>
<%@ include file="all_component/allCss.jsp" %>

<style>
.back-img {
    background: url("img/book1.jpg") no-repeat center center;
    background-size: cover;
    height: 80vh;
    width: 100%;
}
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp" %>
<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Register Page</h4>

                    <c:if test="${not empty sussMsg}">
                        <p class="text-center text-success">${sussMsg}</p>
                        <c:remove var="sussMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty failedMsg}">
                        <p class="text-center text-danger">${failedMsg}</p>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

                    <form action="register" method="post">
                        <div class="form-group">
                            <label for="fullName">Enter Name</label>
                            <input type="text" class="form-control" id="fullName" placeholder="Enter Full Name" required="required" name="fname">
                        </div>

                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" placeholder="Enter Email" required="required" name="email">
                        </div>

                        <div class="form-group">
                            <label for="phoneNumber">Phone Number</label>
                            <input type="number" class="form-control" id="phoneNumber" placeholder="Enter Mobile No" required="required" name="pNo">
                        </div>

                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" placeholder="Password" required="required" name="pass">
                        </div>

                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="termsCheck" name="check">
                            <label class="form-check-label" for="termsCheck">Accept Terms and Conditions</label>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary mt-3">Register</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
