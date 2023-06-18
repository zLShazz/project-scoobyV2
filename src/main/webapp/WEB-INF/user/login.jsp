<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
<title>Inicio de Sesión</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
</head>
<body class="body-login background">
	<div class="login-box">
		<img src="images/LogoPngBorde.png" class="avatar" alt="Logo de la marca">
		<h2>Iniciar Sesión</h2>
		<p class="text-danger">${error_login}</p>
		<form action="/login" method="post">
			<div>
				<label>Email</label> <input type="text" class="form-control"
					name="email" />
			</div>
			<div>
				<label>Contraseña</label> <input type="password" class="form-control"
					name="password" />
			</div>
			<input type="submit" class="btn btn-info mt-3" value="Login" />
			   <p class="link"><a href="/register">¿Aun no tienes cuenta?</a></p>
		</form>
	</div>



</body>
</html>