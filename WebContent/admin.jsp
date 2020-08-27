<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="controller.userdetail"%>
<%@ page import="interf.userVO"%>
<%@ page import="java.util.*"%>
<%@ page import="controller.adduser"%>

<!doctype html>
<html lang="en">

<head>
<style>
.dropbtn {
	padding: 0px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.show {
	display: block;
}

.modal-confirm {
	color: #434e65;
	width: 525px;
}

.modal-confirm .modal-content {
	padding: 20px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
}

.modal-confirm .modal-header {
	background: #47c9a2;
	border-bottom: none;
	position: relative;
	text-align: center;
	margin: -20px -20px 0;
	border-radius: 5px 5px 0 0;
	padding: 35px;
}

.modal-confirm h4 {
	text-align: center;
	font-size: 36px;
	margin: 10px 0;
}

.modal-confirm .form-control, .modal-confirm .btn {
	min-height: 40px;
	border-radius: 3px;
}

.modal-confirm .close {
	position: absolute;
	top: 15px;
	right: 15px;
	color: #fff;
	text-shadow: none;
	opacity: 0.5;
}

.modal-confirm .close:hover {
	opacity: 0.8;
}

.modal-confirm .icon-box {
	color: #fff;
	width: 95px;
	height: 95px;
	display: inline-block;
	border-radius: 50%;
	z-index: 9;
	border: 5px solid #fff;
	padding: 15px;
	text-align: center;
}

.modal-confirm .icon-box i {
	font-size: 64px;
	margin: -4px 0 0 -4px;
}

.modal-confirm.modal-dialog {
	margin-top: 80px;
}

.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #eeb711 !important;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border-radius: 30px;
	margin-top: 10px;
	padding: 6px 20px;
	border: none;
}

.modal-confirm .btn:hover, .modal-confirm .btn:focus {
	background: #eda645 !important;
	outline: none;
}

.modal-confirm .btn span {
	float: left;
}

.modal-confirm .btn i {
	margin-left: 1px;
	font-size: 20px;
	float: left;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
<title>Admin</title>
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="admin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script type="text/javascript">

	/* VALIDATE FORM - CREATE NEW USER */
	function validateForm() {
		var a = document.forms["AdduserForm"]["taikhoan"].value;
		var b = document.forms["AdduserForm"]["matkhau"].value;
		var c = document.forms["AdduserForm"]["hoten"].value;
		var d = document.forms["AdduserForm"]["cmnd"].value;
		var e = document.forms["AdduserForm"]["diachi"].value;
		var f = document.forms["AdduserForm"]["sdt"].value;
		var g = document.forms["AdduserForm"]["vaitro"].value;
		if (a == null || a == "" || b == null || b == "" || c == null
				|| c == "" || d == null || d == "" || e == null || e == ""
				|| f == null || f == "" || g == null || g == "") {
			$('#exampleModalCenter').modal('show')
			return false;
		} else {
			$('#createuser').modal('show');
		}

	}
</script>

</head>


<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("ad") == null) {
		response.sendRedirect("login");
	}
	%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="height: 60px">
		<a class="navbar-brand" href="#">Admin</a>



		<div class="nav-item mr-5 wow bounceInUp ml-auto"
			data-wow-delay="1.3s">
			<div class="dropdown show">
			
				<a href="" class=" text-light mt-2 dropdown-toggle" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" 
					style="font-size: 18px; text-decoration: none; "><i class="fas fa-user-circle" style="font-size:22px; padding-right: 2px"></i> ${sayhi} </a>

				<div class="dropdown-menu dropdown-menu-right"
					style="margin-top: 10px; width: 200px;"
					aria-labelledby="dropdownMenuLink">
					<a class="dropdown-item" href="info">Change Information</a> <a
						class="dropdown-item" href="logout">Log Out</a>
				</div>
			</div>
		</div>



	</nav>






	<div class="row mx-0">
		<div class="col-md-2">

			<div class="list-group pl-2 pr-0">
				<a href="adminview.jsp"
					class="list-group-item list-group-item-action borderless ">View
					All of user</a> <a href="admin.jsp"
					class="list-group-item list-group-item-action active borderless ">Create
					New Account</a>
			</div>


		</div>
		<div class="col-md-10">
			<div class="card ">
				<div class="row" id="row-1">
					<div class="col-md-8"
						style="padding-top: 10px; padding-bottom: 10px">
						<h4>Admin</h4>

					</div>
				</div>



				<!-- 	FORM CREATE NEW USER -->

				<div class="card" id="card-2">
					<div class="card-header">Create Account</div>
					<div class="card-body">
						<form method="POST" name="AdduserForm" action="adduser">

							<div class="tab-pane fade show active" id="list-home"
								role="tabpanel" aria-labelledby="list-home-list">
								<div class="form-row mt-3">
									<div class="form-group col-md-6">
										<input class="form-control" type="email" id="a"
											name="taikhoan" placeholder="Email@example.com"
											oninvalid="this.setCustomValidity('Please Enter valid email')"
											oninput="setCustomValidity('')">


									</div>
									<div class="form-group col-md-6">
										<input type="password" class="form-control" name="matkhau"
											oninvalid="this.setCustomValidity('Please Enter password')"
											oninput="setCustomValidity('')" placeholder="Password"
											required id="b">

									</div>

								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="text" class="form-control" name="hoten" id="c"
											placeholder="Full Name">
									</div>
									<div class="form-group col-md-6">
										<input type="text" class="form-control" name="cmnd" id="d"
											placeholder="ID Code">
									</div>

								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="text" class="form-control" name="diachi" id="e"
											placeholder="Address">
									</div>
									<div class="form-group col-md-6">
										<input type="number" class="form-control" name="sdt" id="f"
											placeholder="Phone Number">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<select id="g" name="vaitro" class="form-control" s>
											<option disabled selected hidden>Set Role...</option>
											<option value="admin">Admin</option>
											<option value="customer">Customer</option>
											<option value="seller">Ticket Seller</option>
										</select>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<c:choose>
											<c:when test="${warning1 != null}">

												<div class="alert alert-danger" style="text-align: center">
													<i> EMAIL EXISTED, PLEASE TRY AGAIN</i>
												</div>
											</c:when>
											<c:when test="${warning2 != null}">
												<div class="alert alert-success" style="text-align: center">
													<i>CREATE ACCOUNT SUCCESSFUL</i>
												</div>
											</c:when>

										</c:choose>
									</div>
								</div>
								<div class="form-row">
									<div class="col-12">
										<button type="button" id="submitBtn"
											onclick="return validateForm() " class="btn btn-success">
											<i class='fas fa-user-plus' style="padding-right: 3px"></i>
											Create User
										</button>

									</div>


									<!-- 	ADD USER CONFIRM -->


									<div class="modal fade bd-example-modal-sm" id="createuser"
										tabindex="-1" role="dialog"
										aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-sm" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h6 class="modal-title w-100 text-center"
														id="exampleModalLabel">
														<i>Confirmation !!</i>
													</h6>
												</div>

												<div class="modal-body">
													<h5 class=" mt-1 w-100 text-center">Are you sure ?</h5>
												</div>

												<div class="modal-footer ">

													<button type="button" class="btn btn-danger"
														data-dismiss="modal">
														<i class="fa fa-close"></i> Cancel
													</button>
													<button type="submit" class="btn btn-success">
														<i class='far fa-check-circle'></i> Submit
													</button>





												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

						</form>

						<!-- ADD USER MISSING WARNING -->

						<div class="modal fade bd-example-modal-sm"
							id="exampleModalCenter" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
							<div class="modal-dialog modal-sm" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h6 class="modal-title w-100 text-center"
											id="exampleModalLabel">
											<i>Oops !! There something missing..</i>
										</h6>
									</div>

									<div class="modal-body">
										<h5 class=" mt-1 w-100 text-center">Please Fill All
											Required Field</h5>
									</div>

									<div class="modal-footer">
										<button class=" btn btn-secondary w-100 text-center"
											type="button" data-dismiss="modal">
											<i class='fa fa-thumbs-o-up'></i> Understood
										</button>

									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>







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
