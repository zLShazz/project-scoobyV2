<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mascota</title>
<link rel="shortcut icon" href="img/icons/LogoPng.png" type="img_logo">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
</head>
<body class="background">
	<nav>
    	<jsp:include page="../includes/navbar.jsp"></jsp:include>
    </nav>
	<div class="container">
	<div class="row">
			<h1 class="text-center .title-mst">${mostrarPet. name}</h1>
		<div class="col-6">
			<c:if test="${not empty mostrarPet.image}">
            	<img src="/img/${mostrarPet.image}" class="img-fluid img-mostrar"/>
            </c:if>
		</div>
		<div class="col-6 mostrar-names">
			<p class="p-mostrar">${mostrarPet.description}</p>
			<p class="p-mostrar">Edad : ${mostrarPet.age}</p>
			<p class="p-mostrar">Ciudad : ${mostrarPet.city}</p>
			<p class="p-mostrar">Propietario : <a class="b-mostrar" href="/perfil/${mostrarPet.owner.id}">${mostrarPet.owner.name}</a></p>
			<p class="p-mostrar">Vacunas : ${mostrarPet.vaccine}</p>
			<p class="p-mostrar">Género : ${mostrarPet.genre}</p>
			<p class="p-mostrar">Especie : ${mostrarPet.species}</p>
		</div>
	</div>
	<div class="btn-below"> 
		<c:if test="${userInSession.id eq mostrarPet.owner.id}">
	        <a href="/editar/${mostrarPet.id}" class="b-mostrar-below">Editar</a>
			<form action="/borrar/${mostrarPet.id}" method="post">
	           	<input type="hidden" name="_method" value="DELETE">
	           	<input type="submit" value="Borrar" class="b-mostrar-below">
	    	</form>
		</c:if>
	</div>	
	</div>
	<footer class="mst-footer">
    	<jsp:include page="../includes/footer.jsp"></jsp:include>
    </footer>
</body>
</html>