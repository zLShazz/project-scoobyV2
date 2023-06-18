<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mascota</title>
<link rel="shortcut icon" href="img/icons/LogoPng.png" type="img_logo">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<nav>
    	<jsp:include page="../includes/navbar.jsp"></jsp:include>
    </nav>
	<div class="container">
		<div class="">
			<h1>${mostrarPet. name}</h1>
			<c:if test="${not empty mostrarPet.image}">
            	<img src="/img/${mostrarPet.image}" class="img-fluid"/>
            </c:if>
		</div>
		<div>
			<p>${mostrarPet.description}</p>
			<p>Edad : ${mostrarPet.age}</p>
			<p>Ciudad : ${mostrarPet.city}</p>
			<p>Propietario : <a href="/perfil/${mostrarPet.owner.id}">${mostrarPet.owner.name}</a></p>
			<p>Vacunas : ${mostrarPet.vaccine}</p>
			<p>Género : ${mostrarPet.genre}</p>
			<p>Especie : ${mostrarPet.species}</p>
		</div>
		
		
		<c:if test="${userInSession.id eq mostrarPet.owner.id}">
            <a href="/editar/${mostrarPet.id}" class="btn btn-primary">Editar</a>
            <a href="/borrar/${mostrarPet.id}" class="btn btn-danger">Borrar</a>
            <a href="/borrar/${mostrarPet.id}" class="btn btn-secondary">Adoptado</a>
        </c:if>
        <c:if test="${userInSession.id != mostrarPet.owner.id}">
            <a href="/adoptar/${mostrarPet.id}" class="btn btn-primary">Adoptar</a>
        </c:if>
	</div>
	<footer class="mt-5">
    	<jsp:include page="../includes/footer.jsp"></jsp:include>
    </footer>
</body>
</html>