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
			<div class="col-md-4 offset-md-4">

				<div class="card"></div>
				<div class="card-body border border-secondary">
					<h4 class="text-center text-success">Admin Login Page</h4>

					<%
					String errMsg = (String) session.getAttribute("errMsg");
					if (errMsg != null) {
					%>
					<p class="text-danger text-center"><%=errMsg%></p>
					<%
					session.removeAttribute("errMsg");
					}
					%>
						<%
					String logMsg = (String) session.getAttribute("logMsg");
					if (logMsg != null) {
					%>
					<p class="text-danger text-center"><%=logMsg%></p>
					<%
					session.removeAttribute("logMsg");
					}
					%>
					<form action="adminlogin1" method="post" class="bg-white">

						<div class="form-group">
							<label for="exampleInputEmail1">Enter Email</label> <input
								type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								name="pass">
						</div>

						<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Login</button>
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