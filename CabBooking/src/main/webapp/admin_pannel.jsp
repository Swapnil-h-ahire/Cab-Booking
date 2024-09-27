
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>

<body>


	<!-- navbar -->

	<%@ page import="com.entity.Admin"%>
	<%@page import="com.entity.User"%>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-phone"></i> Phone Book</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="admin_pannel.jsp"> <i class="fa-solid fa-house"></i> Home <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="admin_user_list.jsp"><i class="fa-solid fa-square-plus"></i>
						User List</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="admin_driver_list.jsp"><i class="fa-sharp fa-regular fa-eye"></i>
						Diver List</a></li>

			</ul>
			<%
			Admin a = (Admin) session.getAttribute("admin");
			%>

			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-success"><%=a.getName()%></button>
				<a data-toggle="modal" data-target="#staticBackdrop"
					class="btn btn-danger ml-2 text-white">Logout</a>
			</form>





		</div>

		<!-- 	logout pop -->
		<!-- Button trigger modal -->

		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body text-center">
						<h6>Do You Want Logout...</h6>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="Adminlogout" class="btn btn-primary">Logout</a>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- 	logout pop -->
	</nav>
	<!-- navbar end -->

</body>
</html>