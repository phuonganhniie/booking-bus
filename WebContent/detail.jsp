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
          <a href="tbooked.jsp" class="list-group-item list-group-item-action active borderless">View Tickets booked</a>
          <a href="listseat.jsp" class="list-group-item list-group-item-action borderless">View all of available seat</a>
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
						<form>
                              <div class="form-group row">
                                <label class="col-3 col-form-label">Name</label> 
                                <div class="col-9">
                                  <p>ab asd dasd asdasd asdaw asdasd wasdas </p>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label class="col-3 col-form-label">Email</label> 
                                <div class="col-9">
                                  <p>ab asd dasd asdasd asdaw asdasd wasdas </p>
                                </div>
                              </div>

                              <div class="form-group row">
                                <label class="col-3 col-form-label">Phone</label> 
                                <div class="col-9">
                                  <p>ab asd dasd asdasd asdaw asdasd wasdas </p>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="From" class="col-3 col-form-label">From</label> 
                                <div class="col-9">
                                  <input id="From" name="From" value="From" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="To" class="col-3 col-form-label">To</label> 
                                <div class="col-9">
                                  <input id="To" name="To" value="To" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="date" class="col-3 col-form-label">Date</label> 
                                <div class="col-9">
                                  <input id="date" name="date" value="Date" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="figue" class="col-3 col-form-label">Figue</label> 
                                <div class="col-9">
                                  <input id="figue" name="figue" value="Figue" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="price" class="col-3 col-form-label">Price</label> 
                                <div class="col-9">
                                  <input id="price" name="price" value="Price" class="form-control here" type="text">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="status" class="col-3 col-form-label">Status</label> 
                                <div class="col-9">
                                  <input id="status" name="status" value="Status" class="form-control here" type="text">
                                </div>
                              </div>

                              
                              <div class="form-group row">
                                <div class="col-12">
                                  <button name="submit" type="submit" class="btn btn-primary">Update</button>
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