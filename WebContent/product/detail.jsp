<%@page import="com.alexander.services.ProductService"%>
<%@page import="com.alexander.beans.ProductDTO"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Product - Detail</title>
		<%@ include file="../includes/meta.jsp" %>
		<%@ include file="../includes/bootstrap-styles.jsp" %>
	</head>
	<body>
		<div class="container">
			<%
				ProductService service = new ProductService();
				String id = request.getParameter("id");
				ProductDTO prod = service.getProductById(Integer.parseInt(id));
	
				if (prod == null) {
			%>
			<h1 class="text-center mt-4 mb-4">
				La empresa con id <%=id%> no existe
			</h1>
			<%
				} else {
			%>
			<form>
				<fieldset>
					<legend class="h1">Detail product</legend>
					<div class="form-group">
						<label for="txtId">Id</label> 
						<input type="text" id="txtId" class="form-control" value="<%=prod.getId()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtDescription">Description</label> 
						<input type="text" id="txtDescription" class="form-control" value="<%=prod.getDescription()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtPrice">Price</label> 
						<input type="text" id="txtPrice" class="form-control" value="<%=prod.getPrice()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtStock">Stock</label> 
						<input type="text" id="txtStock" class="form-control" value="<%=prod.getStock()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtRegisterDate">Register Date</label> 
						<input type="text" id="txtRegisterDate" class="form-control" value="<%=prod.getRegisterDate()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtUpdateDate">Update Date</label> 
						<input type="text" id="txtUpdateDate" class="form-control" value="<%=prod.getUpdateDate()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtImage">Image</label> 
						<input type="text" id="txtImage" class="form-control" value="<%=prod.getImage()%>" readonly>
					</div>
					<div class="form-group">
						<label for="txtIsEnable">Status</label> 
						<input type="text" id="txtIsEnable" class="form-control" value="<%=prod.getIsEnable() == 1 ? "Enable" : "Disable"%>" readonly>
					</div>
				</fieldset>
			</form>
			<%
				}
			%>
			<div class="text-center mt-4 mb-4">
				<a href="list.jsp" class="btn btn-primary"> 
					<i class="fa fa-list" aria-hidden="true"></i> List products
				</a>
			</div>
		</div>
		<%@ include file="../includes/bootstrap-scripts.jsp" %>
	</body>
</html>