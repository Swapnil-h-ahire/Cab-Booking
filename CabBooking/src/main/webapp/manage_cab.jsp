<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DriverDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewContact</title>
<%@include file="component/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}
</style>
</head>
<body>

	<!-- navbar -->
	<%@page import="com.entity.Driver"%>
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
					href="index.jsp"> <i class="fa-solid fa-house"></i> Home <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="add_cab.jsp"><i class="fa-solid fa-square-plus"></i> Add
						Cab</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="manage_cab.jsp"><i class="fa-sharp fa-regular fa-eye"></i>
						Manage Cab</a></li>

			</ul>
			<%
			Driver d = (Driver) session.getAttribute("Driver");
			%>

			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-success"><%=d.getName()%></button>
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
						<a href="driver_logout" class="btn btn-primary">Logout</a>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- 	logout pop -->
	</nav>
	<!-- navbar end -->




	<%
	if (d == null) {
		session.setAttribute("invalidMsg", "Login please...");
		response.sendRedirect("login.jsp");
	}
	%>



	<div class="container">
		<div class="row p-4">
			<%
			if(d!=null){
			DriverDAO dao = new DriverDAO(DBConnect.getConn());
			List<Cab> cab=dao.allCabs(d.getId());
			for(Cab c: cab){
				%>
				
				
			

			<div class="col-md-3 p-2">
			<img alt="image" src="image//5.jpg">
				<div class="card crd-ho">
					<div class="card-body">
						<h5>Cab No:-<%=c.getCabNo() %></h5>
						<p>Cab Type:-<%=c.getCabType() %></p>
						<p>No Of Seats:-<%=c.getNoSeats() %></p>

						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
						<% 
			 } 
			  }
			%> 

			
		</div>
	</div>

</body>
</html>