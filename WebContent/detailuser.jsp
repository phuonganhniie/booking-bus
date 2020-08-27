
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="controller.userdetail"%>
<%@ page import="interf.userVO"%>
<%@ page import="java.util.*"%>
<%@ page import="controller.*"%>
<!doctype html>
<html lang="en">

<link rel="stylesheet" href="admin.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

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
	<link rel="stylesheet" href="admin.css">
<script src='https://cdn.rawgit.com/matthieua/WOW/1.0.1/dist/wow.min.js'></script>
<script src="js/wow.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script type="text/javascript">

// CLOSE CURRENT AND OPEN NEW MODAL //
	function back() {
		$('#updateuser').modal('hide')
		$('#updateuser').on('hidden.bs.modal', function() {
			$('#UpdateModal').modal('show')
		})
	}
	function cancel() {
		$('#exampleModalCenter').modal('hide')
		$('#exampleModalCenter').on('hidden.bs.modal', function() {
			$('#UpdateModal').modal('show')
		})
	}
	
// VALIDATEFORM //	
	function validateForm() {


		var fullname = document.forms["UpdateForm"]["hoten"].value;
		var phone = document.forms["UpdateForm"]["sdt"].value;
		var ID = document.forms["UpdateForm"]["cmnd"].value;
		var address = document.forms["UpdateForm"]["diachi"].value;
	
		if (fullname == null || fullname == ""|| ID == null || ID == "" || address == null || address == ""	|| phone == null || phone == "") {

			$('#UpdateModal').modal('hide')
			$('#exampleModalCenter').modal('show')
			return false;
		} else {
			$('#UpdateModal').modal('hide')
			$('#updateuser').modal('show')

		}
	}
	
</script>





<title>User Detail</title>



</head>
<body>
	<%
		if (session.getAttribute("ad") == null) {
		response.sendRedirect("login.jsp");
	}
	%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="height: 60px;">
		<a class="navbar-brand" href="#">Admin</a>

		<div class="nav-item mr-5 wow bounceInUp ml-auto"
			data-wow-delay="1.3s">
			<div class="dropdown show">
				<a href="" class=" text-light mt-2 dropdown-toggle" role="button"
					id="dropdownMenuLink" data-toggle="dropdown" 
					style="font-size: 18px; text-decoration: none; "><i class="fas fa-user-circle" style="font-size:22px; padding-right: 2px"></i> ${sayhi} </a>
					

				<div class="dropdown-menu dropdown-menu-right"
					style="margin-top: 14px; width: 200px;"
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
					class="list-group-item list-group-item-action active borderless">View
					All of user</a> <a href="admin.jsp"
					class="list-group-item list-group-item-action borderless">Create
					New Account</a>
			</div>
		</div>
		<%
			List<userVO> detailuser = (List) request.getAttribute("detailuser");

		for (userVO itemuser : detailuser) {
		%>

		<div class="col-md-10">
			<div class="card">
				<div class="row" id="row-1">
					<div class="col-md-6">
						<h4>Admin</h4>
					</div>
				</div>
				<div class="card" id="card-2" style="font-size: 18px">
					<div class="card-header">DETAIL</div>
					<div class="card-body">
						<form>
							<div class="form-group row">
								<label for="Mataikhoan" class="col-3">User ID</label>
								<div class="col-9">
									<b><label><fmt:formatNumber type="number"
												minIntegerDigits="3" value="<%=itemuser.getMataikhoan()%>" /></label></b>
								</div>
							</div>

							<div class="form-group row">
								<label for="Taikhoan" class="col-3">Email</label>
								<div class="col-9">
									<b> <label><%=itemuser.getTaikhoan()%></label></b>
								</div>
							</div>

							<div class="form-group row">
								<label for="Cmnd" class="col-3">Identify Number</label>
								<div class="col-9">
									<b><label><%=itemuser.getCmnd()%></label></b>
								</div>
							</div>
							<div class="form-group row">
								<label for="Phone" class="col-3">Phone Number</label>
								<div class="col-9">
									<b> <label><%=itemuser.getSdt()%></label></b>
								</div>
							</div>
							<div class="form-group row">
								<label for="Address" class="col-3 ">Address</label>
								<div class="col-9">
									<b> <label><%=itemuser.getDiachi()%></label></b>
								</div>
							</div>
							<div class="form-group row">
								<label for="Role" class="col-3">Role</label>
								<div class="col-9">
									<c:set var="role" value="<%=itemuser.getVaitro()%>" />
									<c:choose>
										<c:when test="${role == 'admin'}">
											<b> Admin</b>
										</c:when>
										<c:when test="${role == 'seller'}">
											<b> Ticket Seller</b>
										</c:when>
										<c:when test="${role == 'customer'}">
											<b> Customer</b>
										</c:when>
									</c:choose>

								</div>
							</div>
							<%
								}
							%>
						</form>
						<div class="form-group row">
							<label for="Role" class="col-3"><button name="submit"
									type="submit" class="btn btn-primary" data-toggle="modal"
									data-target="#UpdateModal">
									<i class='fas fa-cloud-upload-alt'></i> Update
								</button> <a href="adminview.jsp" class="btn btn-danger"><i
									class='fas fa-chevron-circle-left'></i> Back</a></label>
						</div>

					</div>


					<%
						List<userVO> detailuser1 = (List) request.getAttribute("detailuser");

					for (userVO itemuser : detailuser1) {
					%>
					
					
							<!-- 	UPDATE INFORMATION MODAL  -->
					
					<form action="updateuser" method="Post" name="UpdateForm">
						<div class="modal fade" id="UpdateModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">

									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Edit
											Information</h5>


										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>

									<div class="modal-body">
										<div class="form-group">
											<sub style="color: red;"><em>*Non edited
													information will retain the same value.</em></sub>
										</div>

										<input class="form-control" type="hidden" name="matk"
											value="<%=itemuser.getMataikhoan()%>">

										<div class="form-group">
											<h6>Email</h6>

											<input class="form-control" type="email" name="taikhoan"
												value="<%=itemuser.getTaikhoan()%>"
												readonly ="readonly"></input>
										</div>
										<div class="form-group" id="myPass">
											<h6>Password</h6>

											<div style="position: relative; padding: 0px; margin: 0px">
												<input type="password" id="newpass"
													value="<%=itemuser.getMatkhau()%>"
													style="margin-bottom: 2px" name="newpass"
													 class="form-control" readonly ="readonly"
													 />
											</div>										
										</div>
										<div class="form-group">
											<h6>Identify Number (ID)</h6>

											<input type="text" style="width: 100%" name="cmnd"
												value="<%=itemuser.getCmnd()%>" class="form-control">
										</div>
										<div class="form-group">
											<h6>Full Name</h6>

											<input type="text" style="width: 100%" name="hoten"
												value="<%=itemuser.getHoten()%>" class="form-control">
										</div>
										<div class="form-group">
											<h6>Phone Number</h6>

											<input type="text" style="width: 100%" name="sdt"
												value="<%=itemuser.getHoten()%>" class="form-control">
										</div>
										<div class="form-group">
											<h6>Address</h6>

											<input type="text" style="width: 100%" name="diachi"
												value="<%=itemuser.getDiachi()%>" class="form-control">

										</div>
										<div class="form-group">
											<h6>Set Role</h6>
											<select class="form-control" name="vaitro">
												<option hidden value="<%=itemuser.getVaitro()%>">
													<c:set var="role1" value="<%=itemuser.getVaitro()%>" />
													<c:choose>
														<c:when test="${role1 == 'admin'}">
																Admin
																</c:when>
														<c:when test="${role1 == 'seller'}">
																Ticket Seller
																</c:when>
														<c:when test="${role1 == 'customer'}">
																Customer
																</c:when>
													</c:choose>
												</option>
												<c:choose>
													<c:when test="${role1 == 'admin'}">
														<option style="display: none"></option>
													</c:when>

													<c:when test="${role1 == 'seller'}">
														
														<option value="customer">Customer</option>
														<option value="seller">Ticket Seller</option>
													</c:when>
													<c:when test="${role1 == 'customer'}">
														
														<option value="seller">Ticket Seller</option>
														<option value="customer">Customer</option>

													</c:when>

												</c:choose>

											</select>
										</div>

										<div class="modal-footer">

											<button type="button" class="btn btn-secondary"
												style="margin-right: 1px" data-dismiss="modal"
												data-target="#UpdateModal">
												<i class="fa fa-close"></i> Cancel
											</button>

											<button type="button" class="btn btn-primary"
												onclick="validateForm()" style="margin-right: -15px">
												<i class='fas fa-upload'></i> Save changes
											</button>


										</div>
									</div>

								</div>
							</div>

						</div>
						<%
							}
						%>

								<!-- CONFIRMATION MODAL -->

						<div class="modal fade bd-example-modal-sm" id="updateuser"
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

										<button type="button" class="btn btn-danger" onclick="back()">
											<i class="fa fa-close"></i> Cancel
										</button>
										<button type="submit" class="btn btn-success">
											<i class='far fa-check-circle'></i> Submit
										</button>

									</div>
								</div>
							</div>
						</div>
						
									<!-- 	ERROR MODAL -->
						
						
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
										<h5 class=" mt-1 w-100 text-center">
											Please Fill All Required Field 
										</h5>
									</div>

									<div class="modal-footer">
										<button class=" btn btn-secondary w-100 text-center"
											type="button" onclick="cancel()">
											<i class='fa fa-thumbs-o-up'></i> Understood
										</button>

									</div>
								</div>
							</div>
						</div>
					</form>
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