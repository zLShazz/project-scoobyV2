<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8">
<title>Editar Perfil</title>
<link rel="stylesheet" href="/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body class="background">
	<nav>
			<jsp:include page="../includes/navbar.jsp"></jsp:include>
	</nav>
	
	<div class="register">

		<div class="input-group d-flex justify-content-center">

			<form:form action="/editarPerfil" method="post" modelAttribute="newUser">
				<h2>Editar Perfil</h2>
				<form:errors path="*" class="text-danger"/>
				<input type="hidden" name="_method" value="PUT">
				<input type="hidden" name="email" value="${newUser.email}">
				<input type="hidden" name="password" value="${newUser.password}">
				<input type="hidden" name="id" value="${newUser.id}">
				
					<div>
						<form:label path="name">Nombre</form:label>
						<form:input path="name" class="form-control"/>
						<form:errors path="name" class="text-danger"/>
					</div>
					
					<div>
						<form:label path="birth">Fecha de Nacimiento</form:label>
						<form:input path="birth" class="form-control" type="date"/>
						<form:errors path="birth" class="text-danger"/>
					</div>
					<div>
						<form:label path="city">Ciudad</form:label>
						<form:input path="city" class="form-control"/>
						<form:errors path="city" class="text-danger"/>
					</div>
					<div>
						<form:label path="region">Región</form:label>
						<form:select path="region" class="form-control">
							<c:forEach items="${regiones}" var="region">
								<option value="${region}"> ${region}</option>
							</c:forEach>
						</form:select>
					</div>
					
										
					<form:hidden path="type" value="persona" />
					
					<input type="submit" class="btn btn-success mt-3 mb-3" value="Guardar">
				</form:form>


		</div>


		
	</div>
	<footer>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</footer>
</body>
</html>