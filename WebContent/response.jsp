<!DOCTYPE html>
<html lang="es">
	<head>
		<title>Response</title>
		<%@ include file="includes/meta.jsp"%>
		<%@ include file="includes/bootstrap-styles.jsp"%>
	</head>
	<body>
	<div class="container pt-4">
		<%
			String msg = request.getAttribute("msg") == null ? request.getParameter("msg") : request.getAttribute("msg").toString();
			
			if(msg != null && msg.trim() != ""){
			%>
				<p class="h1 text-center"><%= msg %></p>	
		<%	
			}
		%>
		<div class="text-center">
			<a href="<%= request.getContextPath()%>/product/list.jsp" class="btn btn-primary">
				<i class="fa fa-list" aria-hidden="true"></i>
				Show products
			</a>
		</div>
	</div>
	<%@ include file="includes/bootstrap-scripts.jsp"%>
	</body>
</html>