<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="controller.BusList"%>
<%@ page import="interf.Bus"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

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
<script>
		$(function () { 
		    var duration = 4000; // 4 seconds
		    setTimeout(function () { $('#announcement').hide(); }, duration);
		});
	</script>
</head>

<body>
	<%if(session.getAttribute("success")!=null){ %>
	<div class="alert alert-success alert-dismissible" id="announcement">
		<strong>Đặt vé thành công!</strong>
	</div>
	<%
		session.setAttribute("success", null);
	}%>
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
				<li class="nav-item mr-5"><a href="login"
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

						<div class="dropdown-menu dropdown-menu-right" style="margin-top: 12px;" aria-labelledby="dropdownMenuLink">
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

	<div class="container">
		<table class="table table-striped text-center">
			<thead>
				<tr>
					<th>Biển số</th>
					<th>Ngày khởi hành</th>
					<th>Giờ khởi hành</th>
					<th>Ngày đến</th>
					<th>Giờ đến</th>
					<th>Điểm xuất phát</th>
					<th>Điểm đến</th>
					<th>Giá vé</th>
				</tr>
			</thead>


			<tbody>
				<c:if test="${searchingbus != null}">
					<c:forEach items="${searchingbus }" var="bus">
						<tr>
							<td>${bus.getBienSo() }</td>
							<td>${bus.getNgayXuatPhat() }</td>
							<td>${bus.getGioXuatPhat() }</td>
							<td>${bus.getNgayDen() }</td>
							<td>${bus.getGioDen() }</td>
							<td>${bus.getDiemXuatPhat() }</td>
							<td>${bus.getDiemDen() }</td>
							<td><fmt:formatNumber type="number" value="${bus.getGia()}"></fmt:formatNumber> VND</td>
							<%
								if (session.getAttribute("cus") == null) {
							%>
							<td>
							<!-- Modal Please Login -->
							<button type="button" class="btn btn-danger"
									data-toggle="modal" data-target="#exampleModal">Book</button>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">You're
													not login</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">Please Log In To Continue</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>  
								</td>
							<% } else { %>
							<td><a
								href="BookingCustomer?action=Send&id=${bus.getIDLocation() }&bienso=${bus.getBienSo() }&gioxp=${bus.getGioXuatPhat() }&giod=${bus.getGioDen() }
				          		&ngayxp=${bus.getNgayXuatPhat() }&ngayd=${bus.getNgayDen() }&diemxp=${bus.getDiemXuatPhat() }
				          		&diemd=${bus.getDiemDen() }&benxe=${bus.getBenXe() }&gia=${bus.getGia() }&acc=0"
								type="button" class="btn btn-danger">Book</a></td>
							<%} %>
						
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${searchingbus == null}">
					<c:forEach items="${seeingroute }" var="bus">
						<tr>
							<td>${bus.getBienSo() }</td>
							<td>${bus.getNgayXuatPhat() }</td>
							<td>${bus.getGioXuatPhat() }</td>
							<td>${bus.getNgayDen() }</td>
							<td>${bus.getGioDen() }</td>
							<td>${bus.getDiemXuatPhat() }</td>
							<td>${bus.getDiemDen() }</td>
							<td><fmt:formatNumber type="number" value="${bus.getGia()}"></fmt:formatNumber> VND</td>
							<%
								if (session.getAttribute("cus") == null) {
							%>
							<td>
							<!-- Modal Please Login -->
							<button type="button" class="btn btn-danger"
									data-toggle="modal" data-target="#exampleModal">Book</button>
								<div class="modal fade" id="exampleModal" tabindex="-1"
									role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">You're
													not login</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">Please Log In To Continue</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div></td>
							<% } else { %>
							<td><a
								href="BookingCustomer?action=Send&id=${bus.getBusID() }&bienso=${bus.getBienSo() }&gioxp=${bus.getGioXuatPhat() }&giod=${bus.getGioDen() }
				          		&ngayxp=${bus.getNgayXuatPhat() }&ngayd=${bus.getNgayDen() }&diemxp=${bus.getDiemXuatPhat() }
				          		&diemd=${bus.getDiemDen() }&benxe=${bus.getBenXe() }&gia=${bus.getGia() }&accid=<%= session.getAttribute("IDinfo") %>"
								type="button" class="btn btn-danger">Book</a></td>
							<%} %>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
	</div>

	<div id="footer">
		<div class="container">
			<div class="row text-light">
				<div class="col-md-4">

					<h3>About</h3>
					<p>BusBooking has developed a nationwide chain of stores in 63
						provinces and cities, building trust from customers as a retailer.</p>
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