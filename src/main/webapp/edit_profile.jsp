<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit profile</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">

	<%@ include file="all_component/navbar.jsp"%>


	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succssMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>



						<form action="update_profile" method="post">

							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="fullName">Enter Name</label> <input type="text"
									class="form-control" id="fullName"
									placeholder="Enter Full Name" required="required" name="fname"
									value="${userobj.name }">
							</div>

							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" placeholder="Enter Email"
									required="required" name="email" value="${userobj.email }">
							</div>

							<div class="form-group">
								<label for="phoneNumber">Phone Number</label> <input
									type="number" class="form-control" id="phoneNumber"
									placeholder="Enter Mobile No" required="required" name="pNo"
									value="${userobj.phno }">
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" placeholder="Password"
									required="required" name="pass">
							</div>

							<div class="text-center p-2">
								<button type="submit" class="btn btn-primary btn-block btn-sm">Update</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>