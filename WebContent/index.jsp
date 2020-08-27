<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Online Booking Bus</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="index.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<link rel='stylesheet'
	href='https://cdn.rawgit.com/daneden/animate.css/v3.1.0/animate.min.css'>
<script src='https://cdn.rawgit.com/matthieua/WOW/1.0.1/dist/wow.min.js'></script>
<script src="js/wow.min.js"></script>

<script>
	$(document).ready(function() {

		new WOW().init();

		// Add smooth scrolling to all links
		$("a").on('click', function(event) {

			// Make sure this.hash has a value before overriding default behavior
			if (this.hash !== "") {
				// Prevent default anchor click behavior
				event.preventDefault();

				// Store hash
				var hash = this.hash;

				// Using jQuery's animate() method to add smooth page scroll
				// The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
				$('html, body').animate({
					scrollTop : $(hash).offset().top
				}, 800, function() {

					// Add hash (#) to URL when done scrolling (default click behavior)
					window.location.hash = hash;
				});
			} // End if
		});
	});
</script>

</head>
<body>
	<%
		if (session.getAttribute("success") != null) {
	%>
	<script type="text/javascript">
		alert("Đặt vé thành công!");
	</script>
	<%
		session.setAttribute("success", null);
	}
	%>
	<div class=".container-fluid">

		<nav class="navbar navbar-expand-md sticky-top" id="navbar">
			<a class="navbar-brand text-light ml-5" href=""><img id="logo"
				src="img/logo.png"></a>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
				
				<%if(session.getAttribute("cus") != null) { %>
					<li class="nav-item mr-4 wow bounceInUp " data-wow-delay="0.5s"><a
						class="nav-link " href="viewBooked?accid=<%= session.getAttribute("IDinfo")%>">My Booking</a></li> 
						
						<% } else if(session.getAttribute("cus") == null) { %>
						<li class="nav-item mr-4 text-light wow bounceInUp" data-wow-delay="0.5s"><a
						class="nav-link" href="#" onclick="myFunction()">My Booking</a></li>
					<script>
						function myFunction() {
							alert("Please Log In To See Your Ticket");
						}
					</script>
					<% } %>
					
					<li class="nav-item mr-4 wow bounceInUp" data-wow-delay="0.7s"><a
						class="nav-link " href="#bus">Bus Routes</a></li>
					<li class="nav-item mr-4 wow bounceInUp " data-wow-delay="0.9s"><a
						class="nav-link " href="#why">Why Choose Us</a></li>
					<li class="nav-item mr-4 wow bounceInUp" data-wow-delay="1.1s"><a
						class="nav-link " href="#contact">Contact Us</a></li>
					<%
						if (session.getAttribute("cus") == null) {
					%>
					<li class="nav-item mr-5 wow bounceInUp" data-wow-delay="1.3s"><a
						href="login" class="btn btn-outline-secondary" id="login"
						role="button">Login</a></li>
					<%
						} else if(session.getAttribute("cus") != null) {
					%>
					<li class="nav-item mr-5 wow bounceInUp" data-wow-delay="1.3s">
						<div class="dropdown show">
							<a href="#" class=" text-light dropdown-toggle"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								style="font-size: 15px"><i class="fas fa-user-circle" style="font-size: 25px; margin-top: 5px"></i> ${sayhi}</a>

							<div class="dropdown-menu dropdown-menu-right" style="margin-top: 15px" aria-labelledby="dropdownMenuLink">
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

		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner wow fadeInUp ">
				<div class="carousel-item active">
					<img class="d-block w-100" src="img/dl.jpg" alt="First slide"
						style="height: 695px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/ha.jpg" alt="Second slide"
						style="height: 695px;">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="img/he.jpg" alt="Third slide"
						style="height: 695px;">
				</div>
			</div>

			<div class="carousel-caption " style="margin-bottom: 80px;">
				<a href="https://fontmeme.com/fonts/gavabon-font/"><img
					class="mb-4"
					src="https://fontmeme.com/permalink/200717/d2e5a21ded46c08e3de2cbe463b21325.png"
					alt="gavabon-font" border="0"></a>
				<form action="searchingBus" method="get" onclick="">
					<div class="search-bar"
						style="background-color: rgba(1, 1, 1, 0.4);">

						<div class="row">
							<div class="col-md-10 align-self-center">
								<div class="row mx-3">
									<div class=" col-md-4">

										<select class="form-control" name="from">
											<c:forEach items="${searching1}" var="from">
												<option id="from" value="${from.getName()}">${from.getName()}</option>
											</c:forEach>
										</select>

									</div>

									<div class=" col-md-4 ">

										<select class="form-control" name="to">
											<c:forEach items="${searching}" var="to">
												<option id="to" value="${to.getName()}">${to.getName()}</option>
											</c:forEach>
										</select>

									</div>

									<div class="col-md-4">

										<input id="datepicker" name="datepicker" type="text">

										<script>
											var date = new Date();

											var today = new Date(date
													.getFullYear(), date
													.getMonth(), date.getDate());
											var day = ("0" + date.getDate())
													.slice(-2);
											var month = ("0" + (date.getMonth() + 1))
													.slice(-2);
											var now = date.getFullYear() + "-"
													+ (month) + "-" + (day);
											$('#datepicker').datepicker({
												uiLibrary : 'bootstrap4',
												timepicker : false,
												datepicker : true,
												format : 'yyyy-mm-dd',
												value : now,
												minDate : today,
												weeks : true,

											});
										</script>
									</div>
								</div>
							</div>

							<div class="col-md-2" style="padding: 10px 0;">
								<input type="submit" class="btn btn-outline-danger mr-5"
									style="width: 150px" value="Search">
							</div>

						</div>

					</div>
				</form>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true" hidden></span>
				<span class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true" hidden></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<div id="bus">
			<div class="col text-center wow bounceInUp" data-wow-delay="1s">
				<a href="https://fontmeme.com/script-fonts/"><img
					src="https://fontmeme.com/permalink/200717/a29680f7e8b5e4cb42e2a8da1b25ca3c.png"
					alt="script-fonts" border="0"></a>

				<hr style="max-width: 25%;">
			</div>

			<div class="container">

				<div class="row mt-4">
					<c:set var="count" value="0" scope="page" />
					<c:forEach items="${searching1}" var="localfrom">

						<div class="col-md-4 wow bounceInLeft" data-wow-delay="0.5s"
							id="loca">
							<form action="seeingRoute" method="get">
								<c:if test="${count < 6}">
									<c:set var="count" value="${count + 1}" scope="page" />
									<div class="card">

										<img class="card-img-top" src="${localfrom.getRouteimg()}"
											id="location" class="img-fluid" style="height: 162px">

										<div class="card-body">


											<p class="card-text">
												<b><i class='fas fa-bus-alt'></i> Start From: </b>${localfrom.getName()}
											</p>


											<p class="card-text">
												<b><i class="fas fa-phone"></i> Hotline: </b>(028).63636363
											</p>


											<a href="seeingRoute?localfrom=${localfrom.getName()}"
												class="btn btn-danger text-light">Book</a>
										</div>

									</div>
								</c:if>
							</form>
						</div>

					</c:forEach>
				</div>

			</div>
		</div>

		<div id="why">

			<div class="col text-center wow bounceInUp" data-wow-delay="0.5s">
				<a href="https://fontmeme.com/script-fonts/"><img
					src="https://fontmeme.com/permalink/200717/2c4d24e18be257fdcef57fdd745c5d97.png"
					alt="script-fonts" border="0"></a>
				<hr style="max-width: 25%;">
			</div>

			<div class="container mt-3">
				<div class="row text-center">
					<div class="col-md-3 wow bounceInUp" data-wow-delay="0.5s">
						<img src="http://s3.rdbuz.com/Images/safety/srp/safety.svg"
							id="service">
						<h4 style="color: #B2001F">SAFETY</h4>
						<p style="margin-top: 50px; color: #707070; font-size: 17px">We
							provide safe and fast transfer service, ensuring a secure
							experience for our customers on every journey that you take with
							us.</p>
					</div>
					<div class="col-md-3 wow bounceInUp" data-wow-delay="1s">
						<img src="http://s1.rdbuz.com/web/images/home/customer_care.png"
							id="service">
						<h4 style="color: #B2001F">SUPERIOR CUSTOMER SERVICE</h4>
						<p style="margin-top: 20px; color: #707070; font-size: 17px">We
							provide the best customer service today, 24/7 call center ready
							to meet all the needs of customers.</p>
					</div>
					<div class="col-md-3 wow bounceInUp" data-wow-delay="1.5s">
						<img src="http://s1.rdbuz.com/web/images/home/lowest_Fare.png"
							id="service">
						<h4 style="color: #B2001F">LOWEST PRICES</h4>
						<p style="margin-top: 50px; color: #707070; font-size: 17px">We
							offer the most affordable fares in the market to help our
							customers experience the trip more and more appropriately.</p>
					</div>
					<div class="col-md-3 wow bounceInUp" data-wow-delay="2s">
						<img src="http://s2.rdbuz.com/web/images/home/benefits.png"
							id="service">
						<h4 style="color: #B2001F">UNMATCHED BENEFITS</h4>
						<p style="margin-top: 20px; color: #707070; font-size: 17px">In
							addition, customers can use a variety of payment methods, have a
							shuttle to the place you want and free a few essential items when
							traveling.</p>
					</div>
				</div>
			</div>
		</div>

		<footer id="footer">
			<div class="container">
				<div class="row text-light">
					<div class="col-md-4 wow bounceInUp" data-wow-delay="0.5s">

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
					<div class="col-md-4 wow bounceInUp" data-wow-delay="0.8s"
						id="company">

						<h3>Company</h3>
						<ul>
							<li><a href="#">My Booking</a></li>
							<li><a href="#bus">Bus Routes</a></li>
							<li><a href="#why">Why Choose Us</a></li>
							<li><a href="#contact">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-4 wow bounceInUp" data-wow-delay="1s"
						id="contact">

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
		</footer>


	</div>
</body>
</html>