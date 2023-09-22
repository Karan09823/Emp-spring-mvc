<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isELIgnored="false" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Employee Management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addEmp">Add Emp</a>
        </li>
       
        
      </ul>
    </div>
  </div>
</nav>

<h3>Edit page</h3>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card-header text-center">Edit Employee
				
				<!-- ///use to show message -->
				
				<c:if   test="${not empty msg }">
				
				<h5 class="text-center">${msg}</h5>
				<c:remove var="msg"/>
				
				</c:if>
				</div>
				<!-- ================================== -->
				
				
				<div class="card-body">

					<form action="${pageContext.request.contextPath}/updateEmp" method="Post"><%-- ///${pageContext.request.contextPath} --%> <!-- it is very useful for getting particular user detail to update -->
					<input type="hidden" name="id" value="${emp.id}">

						<div class="mb-3">
							<label> Enter Full Name</label><input type="text" name="name"
								class="form-control" value="${emp.name }">
						</div>
						<div class="mb-3">
							<label>Enter Address</label><input type="text"
								class="form-control" name="address" value="${emp.address }">
						</div>

						<div class="mb-3">
							<label>Enter Email</label><input type="email"
								class="form-control" name="email" value="${emp.email }">
						</div>

						<div class="mb-3">
							<label>Enter Password</label><input type="password"
								class="form-control" name="password" value="${emp.password }">
						</div>

						<div class="mb-3">
							<label>Enter Desgination</label><input type="text"
								class="form-control" name="designation" value="${emp.designation }">
						</div>

						<div class="mb-3">
							<label>Enter Salary</label><input type="text"
								class="form-control" name="salary" value="${emp.salary }">
						</div>

						<button class=" container btn btn-success">Update</button>


					</form>

				</div>
			</div>
		</div>
	</div>


</body>
</html>