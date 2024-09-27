<%@ page import="com.entity.Admin"%>
<%@page import="com.entity.User"%>


<!-- login button css -->

<style>
li{
list-style: none;
}
</style>

<!-- login button css End-->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<a class="navbar-brand" href="index.jsp"><i
		class="fa-solid fa-phone"></i> Cab Booking</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">
					<i class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			

		</ul>
		<%
		User u = (User) session.getAttribute("user");
		if (u == null) {
		%>
		<form class="form-inline my-2 my-lg-0">



			<li class="dropdown">
			<a class="dropdown-toggle btn btn-success ml-2"
				data-toggle="dropdown" href="#">LogIn <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="user_login.jsp">User LogIn</a></li>
					<li><a href="driver_login.jsp">Driver LogIn</a></li>
					<li><a href="adminLogin.jsp">Admin LogIn</a></li>
				</ul>
			
			</li> 
			
			<li class="dropdown">
			<a class="dropdown-toggle btn btn-danger ml-2"
				data-toggle="dropdown" href="#"><i
				class="fa-regular fa-user"></i> Register<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="register.jsp">User Register</a></li>
					<li><a href="driver_registration.jsp">Driver Register</a></li>
					
				</ul>
			
			</li> 
			
		</form>

		<%
		} else {
		%>

		<form class="form-inline my-2 my-lg-0">
			<button class="btn btn-success"><%=u.getName()%></button>
			<a data-toggle="modal" data-target="#staticBackdrop"
				class="btn btn-danger ml-2 text-white">Logout</a>
		</form>

		<%
		}
		%>



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
					<a href="logout" class="btn btn-primary">Logout</a>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- 	logout pop -->
</nav>