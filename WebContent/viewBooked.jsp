<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="controller.*"%>
<%@ page import="interf.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Booking Bus | Searching Route</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

<style type="text/css">
html {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100%;
}

.container {
	flex: 1;
	padding: 20px;
}
</style>

</head>
<body>
	
	<nav class="navbar navbar-expand-md sticky-top" id="navbar">
		<a class="navbar-brand text-light ml-5" href="searchingLocation"><img
			id="logo" src="img/logo.png"></a>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item mr-4"><a class="nav-link " href="#">My
						Booking</a></li>
				<li class="nav-item mr-4"><a class="nav-link " href="#bus">Bus
						Routes</a></li>
				<li class="nav-item mr-4"><a class="nav-link " href="#why">Why
						Choose Us</a></li>
				<li class="nav-item mr-4"><a class="nav-link " href="#contact">Contact
						Us</a></li>
				<%
					if (session.getAttribute("cus") == null) {
				%>
				<li class="nav-item mr-5"><a href="login.jsp"
					class="btn btn-outline-secondary btn-sm mt-2" id="login"
					role="button">Login</a></li>
				<%
					} else {
				%>
				<li class="nav-item mr-5">
					<div class="dropdown show">
						<a href="#" class=" text-light mt-2 dropdown-toggle" role="button"
							id="dropdownMenuLink" data-toggle="dropdown"
							style="font-size: 25px"><i class="fas fa-user-circle"></i></a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item" href="info">Change Information</a> <a
								class="dropdown-item" href="logout">Log Out</a>
						</div>
					</div>
				</li>
				<%
					}
				%>

			</ul>
		</div>
	</nav>

	<div class="container px-0">
	<div class= "row">
		<div class= "col-md-12 text-center" style=" font-family: Agenda-Light, Agenda Light, Agenda,Arial Narrow, sans-serif;"><h1 style="letter-spacing: .3rem;text-transform: uppercase;font-size: 3rem;">Ticket Book<span style ="color:#990000">ed</span></h1></div>
	</div>
	
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th>Tên khách đặt</th>
					<th>Biển số xe</th>								
					<th>Ngày khởi hành</th>
					<th>Thời gian khởi hành</th>	
					<th>Điểm xuất phát</th>
					<th>Điểm đến</th>
					<th>Ghế đã đặt</th>
					<th>Giá (VND)</th>
					<th></th>
				</tr>
			</thead>


			<tbody>
			<c:forEach items="${viewbookedticket}" var="BookedTicket">
						<tr>
							<td>${BookedTicket.getTenKhach() }</td>
							<td>${BookedTicket.getBienSo() }</td>
							<td>${BookedTicket.getNgayXuatPhat() }</td>
							<td>${BookedTicket.getGioXuatPhat() }</td>
							<td>${BookedTicket.getDiemXuatPhat() }</td>
							<td>${BookedTicket.getDiemDen() }</td>
							<td>${BookedTicket.getSeatPosition() }</td>
							<td><fmt:formatNumber type="number" value="${BookedTicket.getGia() }"></fmt:formatNumber> VND</td>
							<td>
								<a href="DeleteTicket?spos=${BookedTicket.getSeatPosition() }&ticketid=${BookedTicket.getTicketID() }
								&customer=customer" id="Delete" class="btn btn-danger" 
								onclick="return confirm('Are you sure you want to remove this ticket?')">Remove</a>								
							</td>
						</tr>
		</c:forEach>
			</tbody>
		</table>
	</div>
	
		<div id="footer">
			<div class="container">
				<div class="row text-light">
					<div class="col-md-4">

						<h3>About</h3>
						<p>BusBooking has developed a nationwide chain of stores in 63
							provinces and cities, building trust from customers as a
							retailer.</p>
						<ul style="padding: 0 0;">
							<li><a href="#" class="btn-floating btn-lg btn-fb"
								type="button" role="button"><i class="fab fa-facebook-f"></i></a>
								<a href="#" class="btn-floating btn-lg btn-tw" type="button"
								role="button"><i class="fab fa-twitter"></i></a></li>
						</ul>

					</div>
					<div class="col-md-4" id="company">

						<h3>Company</h3>
						<ul>
							<li><a href="#">My Booking</a></li>
							<li><a href="#bus">Bus Routes</a></li>
							<li><a href="#why">Why Choose Us</a></li>
							<li><a href="#contact">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-4" id="contact">

						<h3>Contact</h3>
						<ul>
							<li><a href="#"><i class="fa fa-map-marker pr-3"
									aria-hidden="true"></i>Lot T2, Street D1, High-tech Park, Tan
									Phu Ward, District 9, Ho Chi Minh city, Vietnam</a></li>
							<li><a href="#"><i class="fa fa-phone pr-3"
									aria-hidden="true"></i> 0123456789</a></li>
							<li><a href="#"><i class="fa fa-envelope-o pr-3"
									aria-hidden="true"></i>abc@gmail.com</a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>


</body>
</html>