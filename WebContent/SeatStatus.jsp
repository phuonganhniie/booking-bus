<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.*" %>
<%@ page import="interf.*" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Avaiable Seat</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bi.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="/BusBooking/TicketPage.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid" ></div>
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
					class="list-group-item list-group-item-action borderless">View
					Tickets booked</a> <a href="BusList.jsp"
					class="list-group-item list-group-item-action active borderless">View
					all of available seat</a>
			</div>
			

		</div>
		<div class="col-md-10">
			<div class="card overflow-auto">
				<div class="row" id="row-1">
                    <div class="col-md-12">
                        <h4>All of vailable seat</h4>
                    </div>
            	</div>
            	
				<div class="card">
					<div class="card-body" style="background-color:#f2f2f2">
						<div class="row text-center">
		                    <div class="col-md-12">
                        		<h4>Bus<%=" " + session.getAttribute("BusID") %></h4>
		                        <hr>
		                    </div>
	                	</div>
						<div id="seatmodel">					
							<div class="theatre">
							  
							  <div class="exit exit--front">
							  </div>
							  <ol class="cabin">
							  	<% 	int a, b, c, d;
							  		for(int i = 1; i <= 8; i++){ 
							  			a = 0;
							  			b = 0;
							  			c = 0;
							  			d = 0;
							  		
							  	%>
							    <li class="row row--<%= i%>">
							      <ol class="seats" type="A">
								        <li class="seat">
								        	<c:forEach var="it" items="${sessionScope.seat }">
               									<c:set var="s" value='<%= String.valueOf(i)+"A"%>'></c:set>
               										<c:choose>
               											<c:when test = "${it == s }">
               												<%a = 1;%>
												          <input type="checkbox" disabled id="<%= i%>A"/>
												          <label for="<%= i%>A"><%= i%>A</label>
											          </c:when>
										          	</c:choose>									          	
								          	</c:forEach>
								          	<% if(a == 0){%>
								          		<input type="checkbox" id="<%= i%>A"/>
										        <label for="<%= i%>A"><%= i%>A</label>
								          	<%}%>	
								        </li>
								        <li class="seat">
								          <c:forEach var="it" items="${sessionScope.seat }">
               									<c:set var="s" value='<%= String.valueOf(i)+"B"%>'></c:set>
               										<c:choose>
               											<c:when test = "${it == s }">
               												<%b = 1;%>
												          <input type="checkbox" disabled id="<%= i%>B"/>
												          <label for="<%= i%>B"><%= i%>B</label>
											          </c:when>
										          	</c:choose>									          	
								          	</c:forEach>
								          	<% if(b == 0){%>
								          		<input type="checkbox" id="<%= i%>B"/>
										        <label for="<%= i%>B"><%= i%>B</label>
								          	<%}%>	
								        </li>
								        <li class="seat">
								          <c:forEach var="it" items="${sessionScope.seat }">
               									<c:set var="s" value='<%= String.valueOf(i)+"C"%>'></c:set>
               										<c:choose>
               											<c:when test = "${it == s }">
               												<%c = 1;%>
												          <input type="checkbox" disabled id="<%= i%>C"/>
												          <label for="<%= i%>C"><%= i%>C</label>
											          </c:when>
										          	</c:choose>									          	
								          	</c:forEach>
								          	<% if(c == 0){%>
								          		<input type="checkbox" id="<%= i%>C"/>
										        <label for="<%= i%>C"><%= i%>C</label>
								          	<%}%>	
								        </li>
								        <li class="seat">
								          <c:forEach var="it" items="${sessionScope.seat }">
               									<c:set var="s" value='<%= String.valueOf(i)+"D"%>'></c:set>
               										<c:choose>
               											<c:when test = "${it == s }">
               												<%d = 1;%>
												          <input type="checkbox" disabled id="<%= i%>D"/>
												          <label for="<%= i%>D"><%= i%>D</label>
											          </c:when>
										          	</c:choose>									          	
								          	</c:forEach>
								          	<% if(d == 0){%>
								          		<input type="checkbox" id="<%= i%>D"/>
										        <label for="<%= i%>D"><%= i%>D</label>
								          	<%}%>	
								        </li>	
							      </ol>
							    </li>
							    <%} %>							    
							  </ol>							  
							</div>
						</div>	
						<div class="row" id="note ">
							<div class="col-md-4 mx-auto ">
								<span class="float-right" >: available</span>
								<div class="float-right" id="square"></div>
								
							</div>
							<div class="col-md-4 mx-auto">
								<div class="float-left" id="square-1"></div>
								<span>: booked</span>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	


</body>
</html>