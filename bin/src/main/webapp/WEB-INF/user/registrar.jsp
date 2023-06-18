<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8">
<title>Registro</title>
<link rel="stylesheet" href="css/style.css"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body class="body-register">

	<div class="register">
		<h2>
			¿ya te registraste?<a href="/login">Inicia sesión</a>
		</h2>


		<div class="input-group">

			<form:form action="/register" method="post" modelAttribute="newUser">
				<h2>Persona</h2>
					<div>
						<form:label path="name">Nombre</form:label>
						<form:input path="name" class="form-control"/>
						<form:errors path="name" class="text-danger"/>
					</div>
					<div>
						<form:label path="email">Correo electrónico</form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
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
					<div>
						<form:label path="password">Contraseña</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					<div>
						<form:label path="confirm">Confirmar contraseña</form:label>
						<form:password path="confirm" class="form-control"/>
						<form:errors path="confirm" class="text-danger"/>
					</div>
										
					<form:hidden path="type" value="persona" />
					
					<input type="submit" class="btn btn-success mt-3" value="Registrar">
				</form:form>


		</div>


		<div class="input-group">
		
			<form:form action="/register" method="post" modelAttribute="newUser">
			<h2>Empresa</h2>
					<div>
						<form:label path="name">Nombre</form:label>
						<form:input path="name" class="form-control"/>
						<form:errors path="name" class="text-danger"/>
					</div>
					<div>
						<form:label path="email">Correo electrónico</form:label>
						<form:input path="email" class="form-control"/>
						<form:errors path="email" class="text-danger"/>
					</div>
					<div>
						<form:label path="address">Dirección</form:label>
						<form:input path="address" class="form-control"/>
						<form:errors path="address" class="text-danger"/>
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
					<div>
						<form:label path="password">Contraseña</form:label>
						<form:password path="password" class="form-control"/>
						<form:errors path="password" class="text-danger"/>
					</div>
					<div>
						<form:label path="confirm">Confirmar contraseña</form:label>
						<form:password path="confirm" class="form-control"/>
						<form:errors path="confirm" class="text-danger"/>
					</div>
					
					<form:hidden path="type" value="empresa" />
					
					<input type="submit" class="btn btn-success mt-3" value="Registrar">
				</form:form>
		</div>
	</div>





</body>
</html>