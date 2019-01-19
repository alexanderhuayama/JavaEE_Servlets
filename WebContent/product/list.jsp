<%@page import="com.alexander.services.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alexander.beans.ProductDTO"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Products</title>
		<%@ include file="../includes/meta.jsp" %>
		<%@ include file="../includes/bootstrap-styles.jsp" %>
	</head>
	<body>
		<div class="container">
			<div class="mt-4 mb-4">
				<a href="register.jsp" class="btn btn-primary"> 
					<i class="fa fa-floppy-o" aria-hidden="true"></i> Register
				</a>
				<a href="list-disabled.jsp" class="btn btn-secondary"> 
					<i class="fa fa-list" aria-hidden="true"></i> Products disabled
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
							<th colspan="3">Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
							ProductService service = new ProductService();
	
							for (ProductDTO prod : service.getProductsByStatus(1)) {
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
								<a href="<%=String.format("detail.jsp?id=%s", prod.getId())%>" class="btn btn-info btn-sm"> 
									<i class="fa fa-info" aria-hidden="true"></i> Detail
								</a>
							</td>
							<td>
								<a href="<%= String.format("update.jsp?id=%s", prod.getId()) %>" class="btn btn-secondary btn-sm">
									<i class="fa fa-pencil" aria-hidden="true"></i> Edit
								</a>
							</td>
							<td>
								<form action="<%=request.getContextPath() %>/products" method="POST">
									<input type="hidden" name="action" value="productDisable">
									<input type="hidden" name="id" value="<%= prod.getId() %>">
									<button type="submit" class="btn btn-danger btn-sm">
										<i class="fa fa-trash" aria-hidden="true"></i> Delete
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