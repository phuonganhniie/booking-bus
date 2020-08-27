<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Information</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="info.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script>
	
	// CHECK PASSWORD MATCHES //
	function check() {
		if (document.getElementById('newpwd').value == document
				.getElementById('cofpwd').value) {
			document.getElementById('message').style.cssText = "color: #44D331; font-weight: bold; font-size: 13px; margin-top: 10; padding-left: 5px"
			document.getElementById('message').innerHTML = "Passwords matched";
		} else {
			document.getElementById('message').style.cssText = "color: red; font-weight: bold; font-size: 13px; padding-left: 5px"
			document.getElementById('message').innerHTML = "Passwords not match";
		}
	}
	
	// CLICK ICON TO SHOW PASSWORD //
		function showPassUpdate() {
			var x = document.getElementById('oldpwd');
			var c = x.nextElementSibling
			if (x.getAttribute('type') == "password") {
				c.removeAttribute("class");
				c.setAttribute("class", "fas fa-eye");
				x.removeAttribute("type");
				x.setAttribute("type", "text");
			} else {
				x.removeAttribute("type");
				x.setAttribute('type', 'password');
				c.removeAttribute("class");
				c.setAttribute("class", "fas fa-eye-slash");
			}
		}
		
	// ALERT PASSWORDS DONT MATCH //
		$(function() {
			$("#btnsubmit").click(function() {
				if ($("#newpwd").val() != $("#cofpwd").val()) {
					alert("Passwords don't match!");
					return false;
				}
				return true;
			});
		});
	</script>
</head>
<body>
	<%
		if (session.getAttribute("updated") != null) {
	%>
	<script type="text/javascript">
		alert("Update Successful!");
	</script>
	<%
		session.setAttribute("updated", null);
	}
	if (session.getAttribute("errorInfo") != null) {
	%>
	<script type="text/javascript">
		alert("Update Failed!");
	</script>
	<%
		}
	session.setAttribute("errorInfo", null);
	if (session.getAttribute("changed") != null) {
	%>
	<script type="text/javascript">
		alert("Password Change Successful!");
	</script>
	<%
		}
	session.setAttribute("changed", null);
	if (session.getAttribute("echange") != null) {
	%>
	<script type="text/javascript">
		alert("Password Change Failed! Current Password is not correct.");
	</script>
	<%
		}
	session.setAttribute("echange", null);
	%>


	
	<div class=".container-fluid">
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
						if (session.getAttribute("ad") != null) {
					%>
					<li class="nav-item mr-5">
						<div class="dropdown show">
							<a href="#" class=" text-light mt-2 dropdown-toggle"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								style="font-size: 25px"><i class="fas fa-user-circle"></i></a>
							<div class="dropdown-menu dropdown-menu-right"
								style="margin-top: 14px;" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item" href="adminview.jsp">Admin</a>
								<a class="dropdown-item" href="logout">Log Out</a>
							</div>
						</div>
					</li>
					<%
						} else {
					%>
					<li class="nav-item mr-5">
						<div class="dropdown show">
							<a href="#" class=" text-light mt-2 dropdown-toggle"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								style="font-size: 25px"><i class="fas fa-user-circle"></i></a>

							<div class="dropdown-menu dropdown-menu-right"
								style="margin-top: 14px;" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item" href="logout">Log Out</a>
							</div>
						</div>
					</li>
					<%
						}
					%>

				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-3 text-center">
				<i class="fa fa-user mt-5" aria-hidden="true"
					style="font-size: 250px; color: #f2f2f2"></i>
			</div>
			<div class="col-sm-8">
				<%
					response.setContentType("text/html;charset=UTF-8");
				request.setCharacterEncoding("utf-8");
				%>
				<form action="updateinfo" method="Post">
					<fieldset id="fieldset-personal-info">
						<legend>Personal information</legend>

						<div class="form-group row">
							<label for="fname" class="col-4 col-form-label">Full Name</label>
							<div class="col-8">
								<input id="fname" name="fname" required oninvalid="this.setCustomValidity('Please Enter FullName')"
                      oninput="setCustomValidity('')"
									value="<%=request.getAttribute("name")%>"
									class="form-control here" type="text">
							</div>
						</div>
						<div class="form-group row">
							<label for="Username" class="col-4 col-form-label" >Email</label>
							<div class="col-8">
								<input id="Username" name="Username"
									value="<%=request.getAttribute("tk")%>"
									class="form-control here" type="text" required oninvalid="this.setCustomValidity('Please Enter Email')"
                      oninput="setCustomValidity('')">
							</div>
						</div>
						<div class="form-group row">
							<label for="Phone" class="col-4 col-form-label">Phone
								Number</label>
							<div class="col-8">
								<input id="Phone" name="Phone" required oninvalid="this.setCustomValidity('Please Enter Phone')"
                      oninput="setCustomValidity('')"
									value="<%=request.getAttribute("sdt")%>"
									class="form-control here" type="text">
							</div>
						</div>
						<div class="form-group row">
							<label for="CMND" class="col-4 col-form-label">CMND</label>
							<div class="col-8">
								<input id="CMND" name="CMND" required oninvalid="this.setCustomValidity('Please Enter ID')"
                      oninput="setCustomValidity('')"
									value="<%=request.getAttribute("cmnd")%>"
									class="form-control here" type="text">
							</div>
						</div>
						<div class="form-group row">
							<label for="Address" class="col-4 col-form-label">Address</label>
							<div class="col-8">
								<input id="Address" name="Address" required oninvalid="this.setCustomValidity('Please Enter Address')"
                      oninput="setCustomValidity('')"
									value="<%=request.getAttribute("dc")%>"
									class="form-control here" type="text">
							</div>
						</div>
						
						<button name="submit" type="submit"
							class="btn btn-primary float-right"><i class='fas fa-upload' style="font-size:15px; padding-right: 2px"></i> Save</button>
						<a href="adminview.jsp" class="btn btn-secondary float-right mr-2"><i
									class='fas fa-chevron-circle-left'style="font-size:14px"></i> Back</a>
					</fieldset>
				</form>
				<form action="changePwd" method="Post"
					style="padding-top: 0px; padding-bottom: 80px;">
					<fieldset id="fieldset-personal-info">
						<legend style="width: 230px;">Change Password</legend>
						<div class="form-group row">
							<label for="oldpwd" class="col-4 col-form-label">Current
								Password</label>
							<div class="col-8">
								<input id="oldpwd" name="oldpwd" placeholder="Current Password" oninvalid="this.setCustomValidity('Please Enter Password')"
                      oninput="setCustomValidity('')" required
									class="form-control here" type="password"> <span
									onclick="showPassUpdate()" class="fas fa-eye-slash"
									id="display"
									style="float: right; margin-right: 15px; margin-top: -25px; position: relative; z-index: 2; width: 10px; color: #B3B3B2"></span>
							</div>
						</div>
						<div class="form-group row">
							<label for="newpwd" class="col-4 col-form-label">New
								Password</label>
							<div class="col-8">
								<input id="newpwd" name="newpwd" required onkeyup='check()' placeholder="New Password" oninvalid="this.setCustomValidity('Please Enter New Password')"
                      oninput="setCustomValidity('')"
									class="form-control here" type="password">
							</div>
						</div>
						<div class="form-group row">
							<label for="cofpwd" class="col-4 col-form-label">Confirm
								Password</label>
							<div class="col-8">
								<input id="cofpwd" name="cofpwd" required  onkeyup='check()' placeholder="Confirm Password"
									class="form-control here" type="password"><span id='message'></span>
							</div>
						</div>


						<button id="btnsubmit" name="submit" type="submit"
							class="btn btn-primary float-right"><i class='fas fa-upload' style="font-size:15px; padding-right: 2px"></i> Save</button>
						<a href="adminview.jsp" class="btn btn-secondary float-right mr-2"><i
									class='fas fa-chevron-circle-left'style="font-size:14px"></i> Back</a>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	
	<div class=".container-fluid">
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
							<li><a href="#contact">Contect Us</a></li>
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
	</div>
</body>
</html>