<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <%@include file="allCss.jsp"%>
 <style type="text/css">
 a{
 text-decoration: none;
 color: black;
 
 }
 a:hover{
 text-decoration: none;
 color: black;
 }
 
  </style>
</head>
<body>
 <%@include file="navbar.jsp"%>
 
<c:if test="${empty userobj }">
<c:redirect url ="../login.jsp"></c:redirect>
</c:if>


   
    <div class="container mt-4">
        <div class="row p-5">
        
        
            <div class="col-md-3">
            <a href = "add_book.jsp">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fa-solid fa-square-plus fa-3x text-primary"></i>
                        <h4 class="mt-2">Add Book</h4>
                        ----------
                    </div>
                </div>
            </div>
           
           </a>
          
           
           <div class="col-md-3">
           <a href = "all_books.jsp">
                <div class="card text-center">
                    <div class="card-body">
                    <i class="fa-solid fa-book-open fa-3x text-danger"></i>
                        <h4 class="mt-2">All Books</h4>
                        ----------
                    </div>
                </div>
                </a>
            </div>
           
            <div class="col-md-3">
            <a href = "orders.jsp">
                <div class="card text-center">
                    <div class="card-body">
                        <i class="fa-solid fa-box-open fa-3x text-warning"></i>
                        <h4 class="mt-2">Orders</h4>
                        ----------
                    </div>
                </div>
                </a>
            </div>
           
           
            <div class="col-md-3">
                <a data-toggle="modal" data-target="#exampleModalCenter">
                
                <div class="card text-center">
                    <div class="card-body">
                       <i class="fa-sharp fa-solid fa-right-from-bracket fa-3x text-primary"></i>
                        <h4 class="mt-2">Logout</h4>
                        ----------
                    </div>
                </div>
                
                
                </a>
                
            </div>
           
           
           
        </div>
    </div>
    
    <!-- Logout Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Logout</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<h4>Do You Want to Logout?</h4>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="../logout" class="btn btn-primary text-white">Logout</a>
			</div>
		</div>
	</div>
</div>
    
    
    <div style = "margin-top: 400px;">
    
     <%@include file= "footer.jsp" %>
    </div>
   
</body>
</html>
