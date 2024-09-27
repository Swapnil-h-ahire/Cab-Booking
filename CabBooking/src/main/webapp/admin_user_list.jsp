<%@ page import="com.entity.*"%>
<%@ page import="com.conn.*"%>
<%@ page import="java.util.*"%>

<%@page import="com.dao.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>users list</title>
<%@include file="component/allCss.jsp"%>
</head>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Arial', sans-serif;
}

.div-body {
	background-color: #f7f9fc;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50vh;
}

.table-users {
	width: 80%;
	margin: 20px auto;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.table-users table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

.table-users th, .table-users td {
	padding: 15px;
	border-bottom: 1px solid #f2f2f2;
}

.table-users th {
	background-color: #4CAF50;
	color: white;
	font-size: 18px;
}

.table-users td {
	font-size: 16px;
}

.table-users tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table-users tr:hover {
	background-color: #f1f1f1;
}

.table-users td:first-child {
	font-weight: bold;
}

.table-users td {
	color: #555;
}

@media ( max-width : 768px) {
	.table-users {
		width: 95%;
	}
	.table-users table, .table-users tr, .table-users td {
		display: block;
		width: 100%;
	}
	.table-users tr {
		margin-bottom: 15px;
	}
	.table-users th {
		display: none;
	}
	.table-users td {
		text-align: right;
		padding-left: 50%;
		position: relative;
	}
	.table-users td:before {
		content: attr(data-label);
		position: absolute;
		left: 10px;
		text-align: left;
		width: 45%;
		font-weight: bold;
		color: #333;
	}
}
</style>


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

				<li class="nav-item active"><a class="nav-link" href="admin_driver_list.jsp"><i
						class="fa-sharp fa-regular fa-eye"></i> Diver List</a></li>

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



	<div class="">
		<h1 align="center">User Registration List</h1>

	</div>
	<div class="div-body">
		<div class="table-users">
			<table cellspacing="0">
				<tr>
					<th>Full Name</th>
					<th>Email</th>
				</tr>
				<%
				AdminDAO dao = new AdminDAO(DBConnect.getConn());
				List<User> list = dao.allUsers();
				for (User u1 : list) {
				%>
				<tr>
					<td><%=u1.getName()%></td>
					<td><%=u1.getEmail()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>



</body>
</html>
