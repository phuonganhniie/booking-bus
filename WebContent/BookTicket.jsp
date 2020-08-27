	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.*"%>
<%@ page import="interf.*"%>
<%@ page import="model.*"%>
<!doctype html>
<html lang="en">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="/MockProject/BookTicket.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
<script type="text/javascript">

	function printChecked() {	
		var Seats = document.getElementsByName('seat');
		var SelectedSeats = "";
		var c = 0;
		var Number = new Array("1", "2", "3", "4", "5", "6", "7", "8");
		var Character = new Array("A", "B", "C", "D");
		var Str = "";
		var n = 1;
		for(var i = 0; i < Seats.length; i++){			
			for(var j = 0; j < Number.length; j++){				
				for(var k = 0; k < Character.length; k++){
					Str = Number[j].concat(Character[k]);
					if(c == 0 && Seats[i].type == 'checkbox' && Seats[i].checked == true && Str == Seats[i].value){
						SelectedSeats += Seats[i].value;
						c = 1;
					}
					else if(Seats[i].type == 'checkbox' && Seats[i].checked == true && Str == Seats[i].value){
						SelectedSeats = SelectedSeats + " " + Seats[i].value;
						n = n + 1;
					}
				}
			}			
		}
		
		Seat = SelectedSeats.split(" ");		
		if(n >= 6){
			for(var j = 0; j < Number.length; j++){
				for(var k = 0; k < Character.length; k++){
					Str = Number[j].concat(Character[k]);
					document.getElementById(Str).disabled = true;							
				}
			}
			for(var i = 0; i < Seat.length; i++){
				document.getElementById(Seat[i]).disabled = false;
			}
		}		

		if(n < 6){
			for(var j = 0; j < Number.length; j++){
				for(var k = 0; k < Character.length; k++){
					Str = Number[j].concat(Character[k]);
					document.getElementById(Str).disabled = false;							
				}
			}
		}
		var BSSeats = '<%=session.getAttribute("ghedadat") %>';
		var BookedSeats = BSSeats.split(/\s+/);

		if(BookedSeats != null){
			for(var i = 0; i < BookedSeats.length; i++){
				document.getElementById(BookedSeats[i]).disabled = true;
			}
		}

		document.getElementById('nseat').innerHTML = "Số ghế: " + SelectedSeats;
		document.getElementById('prseat').innerHTML = SelectedSeats;
		var sseat = document.getElementById('sseat'); //Get  ==>
		sseat.value = SelectedSeats;// ==> Seat
		var sprice = 0;
		for(var i = 0; i < Seat.length; i++){
			sprice = sprice + parseInt(<%=session.getAttribute("gia")%>);
		}
		if(c == 0){
			document.getElementById('money').innerHTML = "Tổng tiền: 0 VND";
		}
		else{
			document.getElementById('money').innerHTML = "Tổng tiền: " + sprice.toFixed().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.") + " VND";
			document.getElementById('prtotal').innerHTML = sprice.toFixed().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.") + " VND";
		}
	}
</script>

<title>Ticket Booking</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="aa.css">
<link rel="stylesheet" type="text/css" href="index.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- Required meta tags -->
<link rel="stylesheet" href="admin.css">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>


<!-- Bootstrap CSS -->
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
				<li class="nav-item mr-5 wow bounceInUp" data-wow-delay="1.3s"><a
					href="login.jsp" class="btn btn-outline-secondary" id="login"
					role="button">Login</a></li>
				<%
					} else {
				%>
				<li class="nav-item mr-5 wow bounceInUp" data-wow-delay="1.3s">
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
		<form id="regForm" action="AddTicket" method="GET">
		
		
		<!-------------------------SELECT SEAT PANEL---------------------------->		
		
		
			<div class="tab">
			
								<!--- STEP ARROW --->			

				<div class="row">
					<div class="arrow-steps clearfix" style="margin-top: 10px">
						<div class="steps  current	">
							<span style="margin-left: -30px"><b>Select Seat</b> </span>
						</div>
						<div class="steps  ">
							<span style="margin-left: -30px"><b>Fill Information</b></span>
						</div>
						<div class="steps">
							<span style="margin-left: -30px"><b>Check Out</b></span>
						</div>
					</div>
					</div>

								<!--- PANEL FORM --->

					
					
						<div class="card" style="margin-left: -17px">
							<div class="row">

								<div class="col-lg-5">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title" style="color: #000077;"><%= session.getAttribute("diemxp")%> - <%= session.getAttribute("diemd")%> / <%= session.getAttribute("ngayxp")%></h5>
											<hr>
											<h6 class="card-text" style="color: #990033;">Tên tuyến xe:</h6>
											<p><%= session.getAttribute("diemxp")%> - <%= session.getAttribute("diemd")%></p>
											<h6 class="card-text" style="color: #990033;">Giờ khởi hành</h6>
											<p><%= session.getAttribute("gioxp")%></p>
											<h6 class="card-text" style="color: #990033;">Địa điểm lên xe</h6>
											<p><%= session.getAttribute("benxe")%></p>
											
												
								<a href="buspage.jsp"
									class="btn btn-danger" style="width: 120px">Previous</a>
						
								<button type="button" id="nextBtn" onclick="checkSeats()"
									class="btn btn-success ml-2" style="width: 120px">Next</button>
									
								</div>
									</div>

									<div class="card">
										<div class="card-body">
											<h5 class="card-title" style="color: #000077;">THÔNG TIN CHUYẾN XE</h5>
											<hr>
											<h6 class="card-text" style="color: #990033;">Biển số xe</h6>
											<p><%= session.getAttribute("bienso")%></p>
											<h6 class="card-text" style="color: #990033;">Xuất phát</h6>
											<p><%= session.getAttribute("diemxp")%> - <%= session.getAttribute("gioxp")%></p>
											<h6 class="card-text" style="color: #990033;">Đến lúc</h6>
											<p><%= session.getAttribute("diemd")%> - <%= session.getAttribute("giod")%></p>
											<h6 style="color: #990033; display: inline;">
												Free 
											</h6><i class="fas fa-wifi" style="margin-left: 5px"></i> <i class="fas fa-wine-bottle" style="margin-left: 5px"></i> <i class="fas fa-box-tissue" style="margin-left: 5px"></i>
										</div>
									</div>
								</div>


								<div class="col-lg-7">
									<div class="card" style="height: 733px">
										<div class="card-body" style="margin-top: 5px">
											<div class="row">
												<div class="col-lg-6" id="nseat">Số ghế: </div>
												<input type="hidden" id="sseat" name="sseat">
												<div class="col-lg-6 text-right" id="money">Tổng tiền: 0 VND</div>
											</div>
											<hr>
											<div class="theatre" style="margin-top: 50px">
												<div class="exit exit--front"></div>

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
												<li class="seat"><c:forEach var="it"
														items="${sessionScope.seat }">
														<c:set var="s" value='<%= String.valueOf(i)+"A"%>'></c:set>
														<c:choose>
															<c:when test="${it == s }">
																<%a = 1;%>
																<input type="checkbox" disabled id="<%= i%>A" value="<%= i%>A" name="seat" onclick="printChecked()"/>
																<label for="<%= i%>A"><%= i%>A</label>
															</c:when>
														</c:choose>
													</c:forEach> <% if(a == 0){%> <input type="checkbox" id="<%= i%>A" value="<%= i%>A" name="seat" onclick="printChecked()"/>
													<label for="<%= i%>A"><%= i%>A</label> <%}%></li>
												<li class="seat"><c:forEach var="it"
														items="${sessionScope.seat }">
														<c:set var="s" value='<%= String.valueOf(i)+"B"%>'></c:set>
														<c:choose>
															<c:when test="${it == s }">
																<%b = 1;%>
																<input type="checkbox" disabled id="<%= i%>B"  value="<%= i%>B" name="seat" onclick="printChecked()"/>
																<label for="<%= i%>B"><%= i%>B</label>
															</c:when>
														</c:choose>
													</c:forEach> <%if(b == 0){%> <input type="checkbox" id="<%= i%>B"  value="<%= i%>B" name="seat" onclick="printChecked()"/> <label
													for="<%= i%>B"><%= i%>B</label> <%}%></li>
												<li class="seat"><c:forEach var="it"
														items="${sessionScope.seat }">
														<c:set var="s" value='<%= String.valueOf(i)+"C"%>'></c:set>
														<c:choose>
															<c:when test="${it == s }">
																<%c = 1;%>
																<input type="checkbox" disabled id="<%= i%>C"  value="<%= i%>C" name="seat" onclick="printChecked()"/>
																<label for="<%= i%>C"><%= i%>C</label>
															</c:when>
														</c:choose>
													</c:forEach> <% if(c == 0){%> <input type="checkbox" id="<%= i%>C"  value="<%= i%>C" name="seat" onclick="printChecked()"/>
													<label for="<%= i%>C"><%= i%>C</label> <%}%></li>
												<li class="seat"><c:forEach var="it"
														items="${sessionScope.seat }">
														<c:set var="s" value='<%= String.valueOf(i)+"D"%>'></c:set>
														<c:choose>
															<c:when test="${it == s }">
																<%d = 1;%>
																<input type="checkbox" disabled id="<%= i%>D"  value="<%= i%>D" name="seat" onclick="printChecked()"/>
																<label for="<%= i%>D"><%= i%>D</label>
															</c:when>
														</c:choose>
													</c:forEach> <% if(d == 0){%> <input type="checkbox" id="<%= i%>D"  value="<%= i%>D" name="seat" onclick="printChecked()"/>
													<label for="<%= i%>D"><%= i%>D</label> <%}%></li>
											</ol>
										</li>
										<%} %>
									</ol>
									<div class="row text-center">
										<div class="col-lg-4">
											<i class="fas fa-square" style="color: red;"></i> Đang
											chọn
										</div>
										<div class="col-lg-4">
											<i class="fas fa-square" style="color: gray;"></i> Đã đặt
										</div>
										<div class="col-lg-4">
											<i class="far fa-square" style="color: #26a69a;"></i> Còn
											trống
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	

<!-------------------------ENTER INFOMATION PANEL---------------------------->		


			<div class="tab">
			
							 <!---  STEP ARROW --->
						 
				 <div class="row">
					<div class="arrow-steps clearfix" style="margin-top: 10px">
				
						<div class="steps 	">
							<span style="margin-left: -30px"><b>Select Seat</b></span>    
						</div>
						<div class="steps  current ">
							<span><b>Fill Information</b></span>
						</div>
						<div class="steps" >
							<span ><b> Check Out</b></span>
						</div>
						
					</div>
				</div>
				
							<!--- PANEL FORM --->
						
				<div class="card" style="margin-left: -20px">
					<div class="row" id="row-1">

						<div class="col-md-12">
							<h4>Ticket Booking</h4>
						</div>
					</div>
					<div class="card" id="card-2" style="font-size: 18px">
						<div class="card-header">Fill Information</div>
						<div class="card-body">
							<div class="form-group row">
								<label class="col-2"></label> <label for="Cmnd" class="col-3">Full
									Name</label>
								<div class="col-4">
									<input type="text" class="form-control" name="fname" id="fname">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-2"></label> <label for="Phone" class="col-3">Phone
									Number</label>
								<div class="col-4">
									<input type="text" class="form-control" name="pnumber" id="pnumber">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-2"></label> <label for="Phone" class="col-3">Identify
									Number</label>
								<div class="col-4">
									<input type="text" maxlength="11" class="form-control" name="inumber" id="inumber">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-2"></label> <label for="Address"
									class="col-3 ">Address</label>
								<div class="col-4">
									<input type="text" class="form-control" name="address" id="address">
								</div>
							</div>
							<div class="form-group row">
							
								<label class="col-11 text-right mt-3">
								
								<button type="button" id="prevBtn" onclick="nextPrev(-1)"
									class="btn btn-danger" style="width: 120px">Previous</button>
								<button type="button" id="nextBtn" onclick="nextPrev(1)"
									class="btn btn-success" style="width: 120px">Next</button>
									</label>
							</div>

						</div>
					</div>
				</div>
			</div>
			

<!-------------------------RECEIPT PANEL---------------------------->		

			
			<div class="tab">
			
						<!--- STEP ARROW --->
						
				<div class="row">
					<div class="arrow-steps clearfix" style="margin-top: 10px">
						<div class="steps">
							<span style="margin-left:-30px"> <b>Select Seat</b></span>
						</div>
						<div class="steps  ">
							<span style="margin-left:-30px"><b>Fill Information</b></span>
						</div>
						<div class="steps  current	">
							<span style="margin-left:-30px"><b>Check Out</b></span>
						</div>
					</div>
				</div>
					
			
					<div class="card" style="margin-left: -20px">
					<div class="row" id="row-1">

						<div class="col-md-12">
							<h4>Ticket Information</h4>
						</div>
					</div>
					<div class="card" id="card-2" style="font-size: 18px">
						<div class="card-header">Fill Information</div>
						<div class="card-body">
							<div class="form-group row">
								<label for="Cmnd" class="col-2">Full
									Name</label>
								<div class="col-3" id="prfname"></div>
								<div class="col-2 text-right" >
								Trip
								</div>
								<div class="col-4">
							
								<p><%= session.getAttribute("diemxp") + " ----->        " + session.getAttribute("diemd")%></p>
								</div>
							</div>
							<div class="form-group row">
								<label for="Phone" class="col-2">Phone
									Number</label>
								<div class="col-3" id="prpnumber"></div>
								<div class="col-2 text-right" >
								Seat
								</div>
								<div class="col-4" id="prseat"></div>
							</div>
							<div class="form-group row">
								 <label for="Phone" class="col-2">Identify
									Number</label>
								<div class="col-3" id="prinumber"></div>
								<div class="col-2 text-right" >
								Departure Day
								</div>
								<div class="col-4">
							
								<p><%= session.getAttribute("ngayxp")%></p>
								</div>
							</div>
							<div class="form-group row">
								<label for="Address"
									class="col-2 ">Address</label>
								<div class="col-3" id="praddress">
									
								</div>			
							<div class="col-2 text-right" >
								Departure Point
								</div>
								<div class="col-4">
							
								<p><%= session.getAttribute("benxe")%></p>
								<input type="hidden" name="accid" value="<%= session.getAttribute("accid") %>">
								</div>
								</div>
							<div class="form-group row">
							<div class="col-2">
							Total
							</div>
							<div class="col-3 text-left" id="prtotal">
							
							</div>
								
								<label class="col-6 text-right mt-2">
								<input type="hidden" name="busid" value="<%= session.getAttribute("busid")%>">
								<button type="button" id="prevBtn" onclick="nextPrev(-1)"
									class="btn btn-danger" style="width: 120px">Previous</button>
								<button type="submit" id="nextBtn"
									class="btn btn-success" style="width: 120px">Send</button>
									</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
				
				</div>
				</div>
					<!--- PANEL FORM --->
			
		

			<!-- Circles which indicates the steps of the form: -->
			<div style="text-align: center; margin-top: 40px;" type="hidden">

				<span class="step"></span> <span class="step"></span> <span
					class="step"></span> <span class="step"></span>
			</div>
		</form>
	</div>
	

	<script>
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the crurrent tab
		
		function checkSeats(){
			var x, y, i, valid = true;
			x = document.getElementsByClassName("tab");
			y = x[currentTab].getElementsByTagName("input");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
					alert("Please choose at least one seat!");
				}
			}
			// If the valid status is true, mark the step as finished and valid:
			if (valid) {
				document.getElementsByClassName("step")[currentTab].className += " finish";
			}
			return nextPrev(1); // Change to next tab
		}

		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("tab");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").innerHTML = "Submit";
			} else {
				document.getElementById("nextBtn").innerHTML = "Next";
			}
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}

		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("tab");
			var fname = document.getElementById("fname").value;
			var pnumber = document.getElementById("pnumber").value;
			var inumber = document.getElementById("inumber").value;
			var address = document.getElementById("address").value;
			
			document.getElementById("prfname").innerHTML = fname;
			document.getElementById("prpnumber").innerHTML = pnumber;
			document.getElementById("prinumber").innerHTML = inumber;
			document.getElementById("praddress").innerHTML = address;
			// Exit the function if any field in the current tab is invalid:
			if (n == 1 && !validateForm())
				return false;
			// Hide the current tab:
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				document.getElementById("regForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
			var x, y, i, valid = true;
			x = document.getElementsByClassName("tab");
			y = x[currentTab].getElementsByTagName("input");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
				}
			}
			// If the valid status is true, mark the step as finished and valid:
			if (valid) {
				document.getElementsByClassName("step")[currentTab].className += " finish";
			}
			return valid; // return the valid status
		}

		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("step");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>