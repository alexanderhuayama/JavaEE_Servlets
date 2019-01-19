<%@page import="com.alexander.beans.ProductDTO"%>
<%@page import="com.alexander.services.ProductService"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Products - Disabled</title>
		<%@ include file="../includes/meta.jsp" %>
		<%@ include file="../includes/bootstrap-styles.jsp" %>
	</head>
	<body>
		<div class="container">
			<p class="mt-4 mb-4 h1">
				Products disabled
			</p>
			<div class="mb-4">
				<a href="list.jsp" class="btn btn-primary"> 
					<i class="fa fa-list" aria-hidden="true"></i> Products enabled
				</a>
			</div>
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-sm">
					<thead class="thead-light">
						<tr>
							<th>Id</th>
							<th>Descripction</th>
							<th>Price</th>
							<th>Stock</th>
							<th>Register Date</th>
							<th>Update Date</th>
							<th>Enable</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
							ProductService service = new ProductService();
	
							for (ProductDTO prod : service.getProductsByStatus(0)) {
						%>
						<tr>
							<td><%=prod.getId()%></td>
							<td><%=prod.getDescription()%></td>
							<td><%=prod.getPrice()%></td>
							<td><%=prod.getStock()%></td>
							<td><%=prod.getRegisterDate()%></td>
							<td><%=prod.getUpdateDate()%></td>
							<td><%=prod.getIsEnable() == 1 ? "Enable" : "Disable"%></td>
							<td>
								<form action="<%=request.getContextPath() %>/products" method="POST">
									<input type="hidden" name="action" value="productEnable">
									<input type="hidden" name="id" value="<%= prod.getId() %>">
									<button type="submit" class="btn btn-success btn-sm">
										<i class="fa fa-check-square" aria-hidden="true"></i> Enable
									</button>
								</form>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="../includes/bootstrap-scripts.jsp" %>
	</body>
</html>