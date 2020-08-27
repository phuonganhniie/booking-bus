<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bi.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="height: 45px;">
	  <a class="navbar-brand ml-4" href="tbooked.jsp">Ticket Seller</a>
	  <a href="searchingLocation" class="btn btn-dark ml-auto mr-5"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
	</nav>
	<div class="row">
		<div class="col-md-2">
			
			<div class="list-group pl-2 pr-0" >
              <a href="tbooked.jsp" class="list-group-item list-group-item-action  borderless">View Tickets booked</a>
              <a href="listseat.jsp" class="list-group-item list-group-item-action active borderless">View all of available seat</a>
	        </div>
			

		</div>
		<div class="col-md-10">
			<div class="card overflow-auto">
				<div class="row" id="row-1">
                    <div class="col-md-8">
                        <h4>All of vailable seat</h4>
                        
                    </div>
                    <div class="col-md-4">
                    	<form class="form-inline d-flex justify-content-center md-form form-sm mt-0">
							<i class="fas fa-search" aria-hidden="true"></i>
							<input class="form-control form-control-sm ml-3 w-75" type="text" placeholder="Search"
							aria-label="Search">
						</form>

                    </div>

            	</div>
				<div class="card">
					
					<div class="card-body">
						<h3 class="card-title"><a href="#" id="title">BUS 1</a></h3>
						<p id="seat"><i class="fa fa-ticket" aria-hidden="true"></i> 1/16</p>
						<p class="card-text">With supporting text below as a natural lead-in to additional content. With supporting text below as a natural lead-in to additional content. With supporting text below as a natural lead-in to additional content. With supporting text below as a natural lead-in to additional content. With supporting text below as a natural lead-in to additional content</p>
						<a href="seat.jsp" class="btn btn-warning float-right">View seat</a>

					</div>
				</div>

			</div>
		</div>
	</div>
	


</body>
</html>