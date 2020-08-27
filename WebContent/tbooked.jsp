<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="controller.TicketList"%>
<%@ page import="interf.Ticket"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Ticket Booked</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bi.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" href="/BusBooking/TicketPage.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
function Search(){		  
    var value = $("#myInput").val().toLowerCase();
    $("#myCard .card-body ").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });		  
}
$(document).ready(function() {
	$("#myInput").keydown(function(e) {
		if (e.which === 13) {
			$("#myBtn").click();
		}
	});
});
</script>
</head>
<body>
	<div class="container-fluid"></div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="height: 60px;">
		<a href="tbooked.jsp" class="navbar-brand" >Ticket Seller</a>
		<a href="logout"
				class="btn btn-dark ml-auto mr-5"><i class="fa fa-sign-out"
				aria-hidden="true"></i> Log Out</a>
	</nav>
	
	<div class="row">
		<div class="col-md-2">
			
			<div class="list-group pl-2 pr-0">
				<a href="tbooked.jsp"
					class="list-group-item list-group-item-action active borderless">View
					Tickets booked</a> <a href="BusList.jsp"
					class="list-group-item list-group-item-action borderless">View
					all of available seat</a>
			</div>
			

		</div>
		<div class="col-md-10">
			<div class="card overflow-auto">
				<div class="row" id="row-1">
					<div class="col-md-4">
						<h4>Tickets Booked</h4>
					</div>
					<div class="d-inline-block mb-2">
	
								<input class="form-control mr-2" type="text"
									style="width: 350px; height: 40px" id="myInput"
									placeholder="Search..."
									aria-label="Search">
							</div>
					<div class="d-inline-block"	style="margin-left: -30px; margin-top:7px ">
	
								<a href=""
									onclick="document.getElementById('myInput').value = ''"
									style="margin-left: 0px; color: grey; font-size: 18px">x</a>
							</div>
							<div class="d-inline-block" style="margin-left: 2px; margin-top:5px">
								<button type="button" id="myBtn"
									style="height: 39px; width: 50px; margin-top: -5px; font-size: 16px; margin-left: 20px"
									class="btn btn-secondary" onclick="Search()">
									<i class="fas fa-search" aria-hidden="true"></i>
								</button>
	
							</div>

				</div>
				<%
					TicketList tl = new TicketList();
					for (Ticket item : tl.TicketBooked()) {
				%>
				<div class="form-card" id="myCard">
					<div>
						<div class="card-body">
							<h3 class="card-title">
								<a href="#" id="title"><%=item.getDiemXuatPhat() + "  ---->  " + item.getDiemDen()%></a>
							</h3>
							<br>
							<div class="row">
								<p id="seat">
									<i class="fa fa-ticket col-md-3" aria-hidden="true" style="padding-right: 20px"></i> <%=item.getSeatPosition()%></p>
								<p class="col-md-3">
									<i class="fa fa-clock-o" aria-hidden="true" style="padding-right: 5px; padding-left: 30px"></i> <%=item.getNgayXuatPhat() + "  " + item.getGioXuatPhat()%></p>
								<p class="col-md-3">
									<i class="fa fa-money" aria-hidden="true" style="padding-right: 5px"></i> <fmt:formatNumber value="<%=item.getGia()%>"/> VND</p>
							</div>
							<div class="row">
								<p class="card-text col-md-3">
									Name:
									<%=item.getTenKhach()%></p>
								<p class="card-text col-md-3">
									Phone:
									<%=item.getSDT()%></p>
							</div>
							<p class="card-text col-md-3" style="padding: 0;">
								Date:
								<%=item.getNgayDat()%></p>
							<a href="DeleteTicket?spos=<%=item.getSeatPosition()%>&ticketid=<%=item.getTicketID()%>" id="Delete" class="btn btn-danger float-right"  
							onclick="return confirm('Are you sure you want to remove this ticket?')">Remove</a> 
							
							<a href="DetailSeller?name=<%=item.getTenKhach()%>&cmnd=<%=item.getCMND()%>&phone=<%=item.getSDT()%>
							&from=<%=item.getDiemXuatPhat()%>&to=<%=item.getDiemDen()%>&date=<%=item.getNgayXuatPhat()%>
							&price=<%=item.getGia()%>&spos=<%=item.getSeatPosition()%>&status=<%=item.getStatus()%>
							&ticketid=<%=item.getTicketID()%>" id="edit" class="btn btn-warning float-right">Check</a>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>



</body>
</html>