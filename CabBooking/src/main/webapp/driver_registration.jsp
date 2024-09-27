<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body style="background-color: #f7faf8;">
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">

				<div class="card"></div>
				<div class="card-body border border-secondary">
					<h4 class="text-center text-success">Driver Registration Page</h4>
					<%
					String sucMsg = (String) session.getAttribute("sucMsg");
					String errMsg = (String) session.getAttribute("errMsg");
					if (sucMsg != null) {
					%>
					<p class="text-success text-center"><%= sucMsg %></p>

					<%
					session.removeAttribute("sucMsg");
					}
					if(errMsg!=null){
					%>
					<p class="text-danger text-center"><%= errMsg %></p>
					<%
					session.removeAttribute("errMsg");
					}
					%>
					
					<form action="driver_register" method="post" class="bg-white">
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Full Name:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="fname">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Address:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="address">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Enter Email:</label> <input
								type="email" class="form-control" id="exampleInputPassword1"
								name="email">
						</div>
						
							<div class="form-group">
							<label for="exampleInputEmail1">Enter License No:</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="license">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Adhar No:</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="adhar">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">User Id:</label> <input
								type="number" class="form-control" id="exampleInputPassword1"
								name="userid">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="pass">
						</div>

						<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Register</button>
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<%@ include file="component/footer.jsp"%>
	</div>

</body>
</html>