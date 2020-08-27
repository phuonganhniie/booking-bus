	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ page import="controller.userdetail"%>
	<%@ page import="interf.userVO"%>
	<%@ page import="java.text.NumberFormat"%>
	<%@ page import="java.util.List"%>
	
	<!doctype html>
	<html lang="en">
	
	<head>
	
	<title>Admin</title>
	<!-- Required meta tags -->
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
		integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
		crossorigin="anonymous">
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
		<link rel="stylesheet" href="admin.css">
	<script src='https://cdn.rawgit.com/matthieua/WOW/1.0.1/dist/wow.min.js'></script>
	<script src="js/wow.min.js"></script>
	
	<script>
	
		//PRESS ENTER TO SEARCH//
		$(document).ready(function() {
			$("#myInput").keydown(function(e) {
				if (e.which === 13) {
					$("#searchBtn").click();
				}
			});
		});
	
		/* Search Function */
		function search() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase(); //TẠO CÁC BIẾN VÀ GET DỮ LIỆU CỦA TAG THÔNG QUA ID
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
	
			//LOOP QUA TẤT CẢ CÀNG HÀNG, HÀNG NÀO KO CÓ DỮ LIỆU TƯƠNG ỨNG THÌ SẼ ẨN ĐI
			for (i = 0; i < tr.length; i++) {
	
				td = tr[i].getElementsByTagName("td")[0]; //KIỂM TRA CỘT ĐẦU TIÊN (BẮT ĐẦU BẰNG THỨ TỰ 0) == ID
				var td2 = tr[i].getElementsByTagName("td")[1]; // KIỂM TRA CỘT 2 == Email
				var td3 = tr[i].getElementsByTagName("td")[2]; // KIỂM TRA CỘT 3 == Họ Tên
				var td4 = tr[i].getElementsByTagName("td")[3]; // KIỂM TRA CỘT 4 == SĐT
				var td5 = tr[i].getElementsByTagName("td")[4]; // KIỂM TRA CỘT 5 == Địa Chỉ
				
				if (td || td2 || td3 || td4 || td5) {
					txtValue = td.textContent || td.innerText;
					var txtValue2 = td2.textContent || td2.innerText; //GÁN NỘI DỤNG TRONG TAG "td" VÀO CHUỖI VAR
					var txtValue3 = td3.textContent || td3.innerText;
					var txtValue4 = td4.textContent || td4.innerText;
					var txtValue5 = td5.textContent || td5.innerText;
					
					//KIỂM TRA ĐIỀU KIỆN NẾU TRUE THÌ HIÊ RA CÒN FALSE THÌ ẨN ĐI
					if (txtValue.toUpperCase().indexOf(filter) > -1
							|| txtValue2.toUpperCase().indexOf(filter) > -1
							|| txtValue3.toUpperCase().indexOf(filter) > -1
							|| txtValue4.toUpperCase().indexOf(filter) > -1
							|| txtValue5.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
	
	</head>
	
	<body>
		<%
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("ad") == null) {
			response.sendRedirect("login.jsp");
		}
		%>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
			style="height: 60px">
			<a class="navbar-brand" href="adminview.jsp">Admin</a>
			<div class="nav-item mr-5 wow bounceInUp ml-auto"
				data-wow-delay="1.3s">
				<div class="dropdown show">
					<a href="" class=" text-light mt-2 dropdown-toggle" role="button"
						id="dropdownMenuLink" data-toggle="dropdown" 
						style="font-size: 18px; text-decoration: none; "><i class="fas fa-user-circle" style="font-size:22px; padding-right: 2px"></i> ${sayhi} </a>
						
	
					<div class="dropdown-menu dropdown-menu-right" style="margin-top: 10px; width: 200px;" aria-labelledby="dropdownMenuLink">
						<a class="dropdown-item" href="info">Change Information</a> <a
							class="dropdown-item" href="logout">Log Out</a>
					</div>
				</div>
			</div>
	
		</nav>
	
	
	
	
		<!-- Menu Select -->
	
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
	
			<!-- View user  -->
	
			<div class="col-md-10">
				<div class="card">
					<div class="row" id="row-1">
						<div class="col-md-4" style="padding-top: 10px">
							<h4>Admin</h4>
	
						</div>
						<div class="col-8" style="padding-top: 10px">
	
	
							<div class="d-inline-block">
	
								<input class="form-control mr-1" type="text"
									style="width: 350px; height: 40px" id="myInput"
									placeholder="Search ID, Email, Name, Phone ..."
									aria-label="Search">
							</div>
							<div class="d-inline-block"
								style="margin-left: -30px; padding-top: -20px">
	
								<a href=""
									onclick="document.getElementById('myInput').value = ''"
									style="margin-left: 0px; color: grey; font-size: 18px">x</a>
							</div>
							<div class="d-inline-block" style="margin-left: -5px">
								<button type="button" id="searchBtn"
									style="height: 39px; width: 50px; margin-top: -5px; font-size: 16px; margin-left: 20px"
									class="btn btn-secondary" onclick="search()">
									<i class="fas fa-search" aria-hidden="true"></i>
								</button>
	
							</div>
	
	
	
						</div>
						
									<!-- TABLE LIST OF USERS -->
									
						<table class="table mt-3" style="text-align: center" id="myTable1">
							<thead class="thead-dark ">
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Email</th>
									<th scope="col">Name</th>
									<th scope="col">Phone</th>
									<th scope="col">Address</th>
									<th scope="col">Role</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
	
							<tbody id="myTable">
								<%
									userdetail list = new userdetail();
								List<userVO> user = (List<userVO>) list.listuser();
								for (userVO item : user) {
								%>
	
								<tr style="font-size: 18px">
	
									<td><fmt:formatNumber type="number" minIntegerDigits="3"
											value="<%=item.getMataikhoan()%>" /></td>
									<td class="searchname"><%=item.getTaikhoan()%></td>
									<td><%=item.getHoten()%></td>
	
									<td><%=item.getSdt()%></td>
									<td><%=item.getDiachi()%></td>
									<td><c:set var="role" value="<%=item.getVaitro()%>" /> <c:choose>
											<c:when test="${role == 'admin'}">
								            Admin
								         </c:when>
											<c:when test="${role == 'seller'}">
								            Ticket Seller
								         </c:when>
											<c:when test="${role == 'customer'}">
								            Customer
								         </c:when>
										</c:choose></td>
	
	
									<td style="justify-content: center"><a
										href="userdetail?id=<%=item.getMataikhoan()%>" type="button"
										class="btn btn-success" style="margin-bottom: 5px">Detail <i
											class='fas fa-user-check'
											style="font-size: 11px; padding-left: 3px"> </i>
									</a><br> 
									  			<!-- CHECK IF ROLE EQUALS ADMIN, IF ADMIN THEN CANNOT DELETE -->
											<c:choose>
											<c:when test="${role == 'admin' }">
												<a href="#" class="btn btn-danger" data-toggle="modal"
													data-target="#deladmin">Delete <i
													class='far fa-trash-alt' style="font-size: 12px"></i>
												</a>
												<div class="modal fade bd-example-modal-sm" id="deladmin"
													tabindex="-1" role="dialog"
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
																<h5 class=" mt-1 w-100 text-center" style="color: red">
																	<i><b>Cannot Delete Admin</b></i>
																</h5>
															</div>
	
															<div class="modal-footer">
																<button class=" btn btn-secondary w-100 text-center"
																	data-dismiss="modal">
																	<i class='fa fa-thumbs-o-up'></i> Understood
																</button>
	
															</div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<a
													href="deleteuser?id=<%=item.getMataikhoan()%>&action=<%=item.getMataikhoan()%>"
													class="btn btn-danger"
													onclick="return confirm('Are you sure ?')">Delete <i
													class='far fa-trash-alt' style="font-size: 12px"></i>
												</a>
											</c:otherwise>
										</c:choose> <br></td>
	
								</tr>
	
								<%
									}
								%>
	
							</tbody>
						</table>
	
	
					</div>
				</div>
			</div>
		</div>
	
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