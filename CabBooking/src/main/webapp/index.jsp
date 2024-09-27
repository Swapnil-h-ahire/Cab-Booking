<%@page import="com.conn.DBConnect"%>

<html>
<head>
<title>index</title>
<%@include file="component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/1.jpg");
	width: 100%;
	height: 90%;
	background-size: cover ;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>



	<div class="container-fluid bg-danger back-img">
		<h1 class="text-success text-center">Welcome to Cab Booking App</h1>
	</div>
	<div class="footer">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>
