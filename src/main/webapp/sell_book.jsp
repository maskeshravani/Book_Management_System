<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sell_book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj }">
<c:redirect url = "Login.jsp"></c:redirect>
</c:if>

	<%@ include file="all_component/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h5 class="text-center text-primary p-2">Sell Old Book</h5>
						
						  <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session"/>
                        </c:if>
                        
                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session"/>
                        </c:if>

						<form action=" add_old_book" method="post"
							enctype="multipart/form-data">



							<input type="hidden" value=" ${userobj.email}" name = "user">
							
							<div class="mb-3">
								<label for="bookName" class="form-label">Book Name*</label> <input
									type="text" class="form-control" id="bookName" name="bookName"
									required>
							</div>
							<div class="mb-3">
								<label for="authorName" class="form-label">Author Name*</label>
								<input type="text" class="form-control" id="authorName"
									name="authorName" required>
							</div>
							<div class="mb-3">
								<label for="price" class="form-label">Price*</label> <input
									type="number" class="form-control" id="price" name="price"
									required>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1" required>
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>