<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="controller.*"%>
<%@ page import="model.*" %>
<%@ page import="interf.userVO"%>
<%@ page import="java.text.NumberFormat" %>
<!doctype html>

<html lang="en">
  <head>
  <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="ulti.css">
	<link rel="stylesheet" type="text/css" href="login.css">
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">

	
	
				/*  PASSWORD MATCHING CHECK */
  	function check() {
		if (document.getElementById('newpassword').value == document
				.getElementById('confirm_password').value) {
			document.getElementById('message').style.cssText = "color: #44D331; font-weight: bold; font-size: 13px; margin-top: 10; padding-left: 5px"
			document.getElementById('message').innerHTML = "Passwords matched";
		} else {
			document.getElementById('message').style.cssText = "color: red; font-weight: bold; font-size: 13px; padding-left: 5px"
			document.getElementById('message').innerHTML = "Passwords not match";
		}
	}
				
				/* SHOW HIDDEN PASSWORD */
  function showPassUpdate() {
		var x = document.getElementById('newpassword');
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
				/* SIGN UP FORM VALIDATE CHECK */
  function validateForm() {
	    var username = document.forms["RegisterForm"]["taikhoan"].value;
	    var newpassword = document.forms["RegisterForm"]["newpass"].value;
	    var fullname = document.forms["RegisterForm"]["hoten"].value;
	    var phone = document.forms["RegisterForm"]["sdt"].value;
	    var ID = document.forms["RegisterForm"]["cmnd"].value;
	    var address = document.forms["RegisterForm"]["diachi"].value;
	    var confirm_password = document.forms["RegisterForm"]["confirm_password"].value;
	    if (username == null || username == "" || newpassword == null || newpassword == ""|| fullname == null || fullname == ""|| ID == null || ID == "" || address == null || address == "" || confirm_password == null || confirm_password == "" || phone == null || phone == "" || newpassword != confirm_password) {
	    	$('#exampleModalLong').modal('hide')
	    	$('#exampleModalCenter').modal('show')
	      return false;
	    }
	    else {
	    	$('#exampleModalLong').modal('hide')
	    	$('#createuser').modal('show')
	    	
	    }
	  }
				
			/* 	BACKWARD TO PREVIOUS MODAL (CANCEL BUTTON) */
  function back(){
		$('#exampleModalCenter').modal('hide')
		$('#exampleModalCenter').on('hidden.bs.modal', function () {
			  $('#exampleModalLong').modal('show')
	})
	}	
function cancel(){
	$('#createuser').modal('hide')
	$('#createuser').on('hidden.bs.modal', function () {
		$('#exampleModalLong').modal('show')
	})
}
			
			
  </script>
  
 
    <title>Login</title>
    <!-- Required meta tags -->
    
    <meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>

  <body>	
    <div class="limiter">
    
    						<!-- SIGN IN FORM -->
    <%
    if(session.getAttribute("ad") != null){
	response.sendRedirect("admin.jsp");
	}
    else if(session.getAttribute("cus") != null){
    response.sendRedirect("searchingLocation");	
    }
    else if(session.getAttribute("sell") != null){
    	response.sendRedirect("tbooked.jsp");	
    }
%>
		<div class="container-login100" style="background-image: url('img/bg-01.jpg')">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-31 p-b-16">
				<form class="login100-form validate-form flex-sb flex-w" action ="login" method="post"  >
					<span class="login100-form-title p-b-53">
						Sign In
					</span>
					
							
					<div style="margin-top: -20px">
						<span class="txt1" style="font-size: 20px">
							Email

						</span>
					</div>
					
					<!-- SIGNUP EMAIL HAVE EXISTED -->
			
					
		<c:choose>
		<c:when test="${warning1 != null}">
						
        <div style="margin-top: -20px; margin-right: 10px; color:red" ><b>EMAIL EXISTED, PLEASE TRY AGAIN</b></div>
      		</c:when>
      		<c:when test="${warning2 != null}">
      		<div style="margin-top: -20px; margin-right: 10px; color: #44D331" ><b>CREATE ACCOUNT SUCCESSFUL</b></div>
      		</c:when>    		
		</c:choose>	
		
		
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="email" name="id" oninvalid="this.setCustomValidity('Please Enter valid email')"
 oninput="setCustomValidity('')"  required>
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1"style="font-size: 20px">
							Password
						</span>
						<br>
				
					</div>
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="password" name="pass" oninvalid="this.setCustomValidity('Please Enter password')"
 oninput="setCustomValidity('')" required>
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn mt-4">
					
					   				<!-- WARNING IF ACCOUTN DOESNT EXIST -->
					<c:choose>
							<c:when test="${warning != null }">
							<div style="width: 170%; text-align:center" class="alert alert-danger">${warning}</div>
						</c:when>
						</c:choose>
						
						
						<button type="submit" class="login100-form-btn">
							Sign In
						</button>
					</div>
		
		
							<!-- SIGN UP FORM -->
		
		
					<div class="w-full text-center p-t-55">
						<span class="txt2" style="font-size: 18px">
							Not a member ?
						</span>
						<a style="font-size: 18px"  href="#" data-toggle="modal" data-target="#exampleModalLong" class="txt2 bo1">
							Sign up now
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
                			<!-- CREATE NEW USER FORM -->	
                				
						
  <form method="POST" name="RegisterForm" onsubmit= 'return validateForm()'	action="createuser"  >
  <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLongTitle">Create New Account</h5>

              <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
              </button>
          </div>
          <div class="modal-body">

              

                  <input class="form-control" type="hidden" name="matk">
                  
              
              <div class="form-group">
                  <h6>Email</h6>

                  <input class="form-control" type="email" id="username" name="taikhoan"
                      placeholder="Enter New Email"
                      oninvalid="this.setCustomValidity('Please Enter valid email')"
                      oninput="setCustomValidity('')"></input>
              </div>
              <div class="form-group" id="myPass">
                  <h6>Password</h6>

                  <div style="position: relative; padding: 0px; margin: 0px">
                      <input type="password" id="newpassword"  oninvalid="this.setCustomValidity('Please Enter password')"
                      oninput="setCustomValidity('')"
                          style="margin-bottom: 2px" name="newpass" required="required"
                          class="form-control" placeholder="Enter New password"
                          onkeyup="check()" /> <span onclick="showPassUpdate()"
                          style="position: absolute; bottom: 10px; left: 433px; width: 10px; color: #B3B3B2"
                          class="fas fa-eye-slash" id="display" ></span>
                  </div>



                  <input class="form-control" type="password" style="width: 100%"
                      name="confirm_password" placeholder="Confirm password"
                      id="confirm_password" onkeyup='check()' /> <span id='message'></span>
              </div>
              <div class="form-group">
                  <h6>Identify Number (ID)</h6>

                  <input type="text" style="width: 100%" name="cmnd" id="ID"
                      class="form-control" placeholder="Enter ID">
              </div>
              <div class="form-group">
                  <h6>Full Name</h6>

                  <input type="text" style="width: 100%" name="hoten" id="fullname"
                      class="form-control" placeholder="Enter Full Name">
              </div>
              <div class="form-group">
                  <h6>Phone Number</h6>

                  <input type="text" style="width: 100%" name="sdt"
                      class="form-control" placeholder="Enter Phone">
              </div>
              <div class="form-group">
                  <h6>Address</h6>

                  <input type="text" style="width: 100%" name="diachi" id="address"
                      class="form-control" placeholder="Street,..District,..City..">
              </div>
              <div class="form-group">
              <input class="form-control" type="hidden" name="vaitro"
										 value="customer">
				</div>
              <div class="modal-footer" style="margin-bottom: -10px">

                  <button type="button" class="btn btn-secondary"
                  style="margin-right: 1px"	 data-dismiss="modal"><i class="fa fa-close"></i> Cancel</button>

                  <button type="button" class="btn btn-primary" style="margin-right: -15px" onclick="return validateForm()"><i class='fas fa-user-plus' style="padding-right: 3px"></i> Create</button>
                      
              </div>
              

          </div>
      </div>
  </div>
</div>

						
						<!-- WARNING MISSING INFO -->

<div class="modal fade bd-example-modal-sm" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header" >
       <h6 class="modal-title w-100 text-center" id="exampleModalLabel"><i>Oops !! There something missing..</i></h6>
      </div>
      
      <div class="modal-body" >
         <h5 class=" mt-1 w-100 text-center">Please Fill All Required Field
         <sub><i>Make sure passwords are matches</i></sub>
         </h5>
      </div>
    
      <div class="modal-footer" >
        <button  class=" btn btn-secondary w-100 text-center" type="button" onclick="back()"><i class='fa fa-thumbs-o-up'></i> Understood</button>
     
      </div>
    </div>
  </div>
</div>

						<!-- CONFIRM WARNING -->

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

														<button type="button" class="btn btn-danger"onclick="cancel()"><i class="fa fa-close"></i> Cancel</button>
														<button type="submit" class="btn btn-success"><i class='far fa-check-circle'></i> Submit</button>

													</div>
												</div>
											</div>
										</div>

</form>									
            
          
      
    <!-- Optional JavaScript -->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
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