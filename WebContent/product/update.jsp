<%@page import="com.alexander.beans.ProductDTO"%>
<%@page import="com.alexander.services.ProductService"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Product - Update</title>
		<%@ include file="../includes/meta.jsp" %>
		<%@ include file="../includes/bootstrap-styles.jsp" %>
	</head>
	<body>
		<div class="container">
			<%
				String id = request.getParameter("id");
			
				if(id == null || id.trim() == ""){
					response.sendRedirect(String.format("%s/product/list.jsp", request.getContextPath()));
				}else {
				
					ProductService service = new ProductService();
					ProductDTO prod = service.getProductById(Integer.parseInt(id));
		
					if (prod == null) {
				%>
				<h1 class="text-center mt-4 mb-4">
					<%
						String msg = request.getParameter("msg");
					
						if(msg != null){
					%>
						<%=msg %>
					<%
						}else {
					%>
							La empresa con id <%=id%> no existe
					<%
						}
					%>
				</h1>
				<div>
					<a href="<%=request.getContextPath() %>/product/list.jsp" class="btn btn-primary"> 
						<i class="fa fa-list" aria-hidden="true"></i> Show products
					</a>
				</div>
				<%
					} else {
				%>
					<form method="POST" action="<%=request.getContextPath()%>/products">
						<fieldset>
							<legend class="h1">Update product</legend>
							<input type="hidden" name="id" value="<%=prod.getId()%>">
							<input type="hidden" name="action" value="productUpdate">
							<div class="form-group">
								<label for="txtDescription">Description</label> 
								<input type="text" name="description" id="txtDescription" class="form-control" value="<%=prod.getDescription()%>">
							</div>
							<div class="form-group">
								<label for="txtPrice">Price</label> 
								<input type="text" name="price" id="txtPrice" class="form-control" value="<%=prod.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="txtStock">Stock</label> 
								<input type="text" name="stock" id="txtStock" class="form-control" value="<%=prod.getStock()%>">
							</div>
							<div class="form-group">
								<label for="txtImage">Image</label> 
								<input type="text" name="image" id="txtImage" class="form-control" value="<%=prod.getImage()%>">
							</div>
							<div class="form-group text-center">
								<a href="list.jsp" class="btn btn-secondary pull-right ml-2"> 
									<i class="fa fa-ban" aria-hidden="true"></i> Cancel
								</a>
								<button type="submit" class="btn btn-success pull-right">
									<i class="fa fa-floppy-o" aria-hidden="true"></i> Save
								</button>
							</div>
						</fieldset>
					</form>
				<%
					}
				}
				%>
		</div>
		<%@ include file="../includes/bootstrap-scripts.jsp" %>
	</body>
</html>