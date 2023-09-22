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
			<a class="navbar-brand" href="#">Emp Management System</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="addEmp">Add
							Emp</a></li>


				</ul>
			</div>
		</div>
	</nav>
	<h1>add emp</h1>

	<!-- card -->

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card-header text-center">Add Employee
				<c:if test="${not empty msg }">
				
				<h5>${msg}</h5>
				<c:remove var="msg"/>
				
				</c:if>
				
				</div>
				<div class="card-body">

					<form action="createEmp" method="Post">

						<div class="mb-3">
							<label> Enter Full Name</label><input type="text" name="name"
								class="form-control">
						</div>
						<div class="mb-3">
							<label>Enter Address</label><input type="text"
								class="form-control" name="address">
						</div>

						<div class="mb-3">
							<label>Enter Email</label><input type="email"
								class="form-control" name="email">
						</div>

						<div class="mb-3">
							<label>Enter Password</label><input type="password"
								class="form-control" name="password">
						</div>

						<div class="mb-3">
							<label>Enter Desgination</label><input type="text"
								class="form-control" name="designation">
						</div>

						<div class="mb-3">
							<label>Enter Salary</label><input type="text"
								class="form-control" name="salary">
						</div>

						<button class="btn btn-success">Submit</button>


					</form>

				</div>
			</div>
		</div>
	</div>


</body>
</html>