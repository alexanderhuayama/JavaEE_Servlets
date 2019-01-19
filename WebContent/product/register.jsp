<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Product - Register</title>
		<%@ include file="../includes/meta.jsp" %>
		<%@ include file="../includes/bootstrap-styles.jsp" %>
	</head>
	<body>
		<div class="container">
			<form method="POST" action="<%=request.getContextPath() %>/products">
				<fieldset>
					<legend class="h1">Create product</legend>
					<input type="hidden" name="action" value="productRegister">
					<div class="form-group">
						<label for="txtDescription">Description</label> 
						<input type="text" name="description" id="txtDescription" class="form-control" placeholder="Description" autofocus>
					</div>
					<div class="form-group">
						<label for="txtPrice">Price</label> 
						<input type="text" name="price" id="txtPrice" class="form-control" placeholder="Price">
					</div>
					<div class="form-group">
						<label for="txtStock">Stock</label> 
						<input type="text" name="stock" id="txtStock" class="form-control" placeholder="Stock">
					</div>
					<div class="form-group">
						<label for="txtImage">Image</label> 
						<input type="text" name="image" id="txtImage" class="form-control" placeholder="Image">
					</div>
					<div class="form-group">
						<a href="list.jsp" class="btn btn-secondary pull-right ml-2"> 
							<i class="fa fa-ban" aria-hidden="true"></i> Cancel
						</a>
						<button type="submit" class="btn btn-success pull-right">
							<i class="fa fa-floppy-o" aria-hidden="true"></i> Register
						</button>
					</div>
				</fieldset>
			</form>
		</div>
		<%@ include file="../includes/bootstrap-scripts.jsp" %>
	</body>
</html>