<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
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
<link rel="stylesheet" href="/MockProject/TicketPage.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
		<strong>Cập nhật thành công!</strong>
	</div>
	<%
	session.setAttribute("success", null);
	}%>
	<%if(session.getAttribute("failed")!=null){ %>
	<div class="alert alert-danger alert-dissmible" id="announcement">
		<strong>Cập nhật thất bại!</strong>
	</div>
	<%
	session.setAttribute("failed", null);
	}%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="height: 60px;">
		<a href="tbooked.jsp" class="navbar-brand" >Ticket Seller</a>
		<a href="logout"
				class="btn btn-dark ml-auto mr-5"><i class="fa fa-sign-out"
				aria-hidden="true"></i> Log Out</a>
	</nav>
	<div class="row mx-0">
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
			<div class="card">
				<div class="row" id="row-1">
					<div class="col-md-12">
						<h4>Tickets Booked</h4>
					</div>
				</div>
				<div class="card" id="card-2">
					<div class="card-header">DETAIL</div>
					<div class="card-body">
						<form method="get" action="UpdateSeller">
							<div class="form-group row">
								<label class="col-3 col-form-label">Name</label>
								<div class="col-9">
									<p><%= session.getAttribute("name") %></p>
									<input name="Name" value="<%= session.getAttribute("name") %>"
										class="form-control here" type="hidden">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-3 col-form-label">ID</label>
								<div class="col-9">
									<p><%= session.getAttribute("cmnd") %></p>
									<input name="Cmnd" value="<%= session.getAttribute("cmnd") %>"
										class="form-control here" type="hidden">
								</div>
							</div>

							<div class="form-group row">
								<label class="col-3 col-form-label">Phone</label>
								<div class="col-9">
									<p><%= session.getAttribute("phone") %></p>
									<input name="Phone"
										value="<%= session.getAttribute("phone") %>"
										class="form-control here" type="hidden">
								</div>
							</div>
							<div class="form-group row">
								<label for="From" class="col-3 col-form-label">From</label>
								<div class="col-9">
									<p><%= session.getAttribute("from") %></p>
									<input id="From" name="From"
										value="<%= session.getAttribute("from") %>"
										class="form-control here" type="hidden">
								</div>
							</div>
							<div class="form-group row">
								<label for="To" class="col-3 col-form-label">To</label>
								<div class="col-9">
									<p><%= session.getAttribute("to") %></p>
									<input id="To" name="To"
										value="<%= session.getAttribute("to") %>"
										class="form-control here" type="hidden">
								</div>
							</div>
							<div class="form-group row">
								<label for="date" class="col-3 col-form-label">Date</label>
								<div class="col-9">
									<p><%= session.getAttribute("date") %></p>
									<input id="date" name="date"
										value="<%= session.getAttribute("date") %>"
										class="form-control here" type="hidden">
								</div>
							</div>
							<div class="form-group row">
								<label for="figue" class="col-3 col-form-label">Seat
									Position</label>
								<div class="col-9">
									<input id="figue" name="figue"
										value="<%= session.getAttribute("spos") %>"
										class="form-control here" type="hidden"> <input
										id="spos" name="spos"
										value="<%= session.getAttribute("spos") %>"
										class="form-control here" type="text">
								</div>
							</div>
							<div class="form-group row">
								<label for="price" class="col-3 col-form-label">Price</label>
								<div class="col-9 mt-2">
									<c:choose>
								<c:when test="${price != null}">
								<fmt:formatNumber value = "${price }"/> VND
								</c:when>
								</c:choose>
									<input id="price" name="price"
										value="<%= session.getAttribute("price") %>"
										class="form-control here" type="hidden">
								</div>
							</div>
							<div class="form-group row">
								<label for="status" class="col-3 col-form-label">Status</label>
								<div class="col-9">
									<input id="status" name="status"
										value="<%= session.getAttribute("status") %>"
										class="form-control here" type="text"> <input
										type="hidden" name="ticketid"
										value="<%= session.getAttribute("ticketid") %>">
								</div>
							</div>


							<div class="form-group row">
								<div class="col-12">
									<button name="submit" type="submit" class="btn btn-primary" )>Update</button>
									<a href="tbooked.jsp" class="btn btn-danger">Back</a>
								</div>
							</div>
						</form>

					</div>
				</div>

			</div>
		</div>
	</div>



</body>
</html>