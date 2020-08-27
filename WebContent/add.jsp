<!doctype html>
<html lang="en">
<head>
<title>Product Add</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<%
  if(session.getAttribute("uname") == null){
	  response.sendRedirect("login");
  }
  %>
	<div class="container"
		style="padding-bottom: 50px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;">
		<div class="row" id="menu"
			style="background-color: #C3C3CD; padding: 50px 20px;">

			<div class="col-sm-6" id="menutrai">
				<h1 id="products">Products</h1>
				<p>Add products</p>
			</div>
			<div class="col-sm-6 text-right " id="menuphai">
				<a href="logout" class="btn btn-danger" id="logout"
					style="margin-top: -50px; margin-right: 10px; font-size: 15px;">logout</a><br>
					<a href="admin.jsp" type="button" class="btn btn-success">Back</a>
			</div>
		</div>

		<div class="col-sm-12" style="margin-top: 25px;">
			<div class="title">
				<h5 style="border-bottom: 1px solid black">Add new product</h5>
			</div>


			<div class="row" style="margin-top: 30px; margin-left: -180px;">
				<div class="col-sm-4 text-right">
					<label for="productname">taikhoan</label><br>
					<br> <label for="unitprice">matkhau</label><br>
					<br> <label for="unitsinstock">cmnd</label><br>
					<br> <label for="description" style="vertical-align: top">hoten</label><br>
					<br>
					<br> <label for="manufacturer">sdt</label><br>
					<br> <label for="category">diachi</label><br>
					<br> <label for="condition">vaitro</label><br>
					
				</div>
				<div class="col-sm-8 text-left">
					<form action="adduser" method="Post" enctype="multipart/form-data">
						<input type="text" name="taikhoan" id="productname"><br>
						<br> <input type="number" name="matkhau" id="unitprice"><br>
						<br> <input type="number" name="cmnd"
							id="unitsinstock" placeholder="0" min="0"><br>
						<br>

						<textarea id="description" cols="30" rows="2" name="hoten"></textarea>
						<br>
						<br> <input type="text" name="sdt" id="manufacturer"><br>
						<br> <input type="text" name="diachi" id="category"><br>
						<br> <input type="text" name="vaitro" id="conditions"><br>
						
					
						<br>
						<button type="submit" class="btn btn-primary" id="addproduct">Add Product</button>
						
						
					</form>
				</div>
				
			</div>

		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

</body>
</html>