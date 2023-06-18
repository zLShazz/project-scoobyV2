<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Mascotas por Categoría</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/style.css">
</head>
<body class="background">
	<nav>
		<jsp:include page="../includes/navbar.jsp"></jsp:include>
	</nav>
    <h1>Lista de Mascotas por Categoría - ${genero}</h1>
    <div class="container">
       <div class="container">
		<div class="row">	
          <c:forEach items="${mascotas}" var="mascota">
           <div class="col-12 col-md-4 col-lg-3 mb-4">
          <div class="card h-20">
                    <c:if test="${not empty mascota.image}">
                        <img class="img-categories" src="/img/${mascota.image}" alt="${mascota.name}">
                    </c:if>
                    <div>
                  </div>
                </div>
                 <div class="perf-card perf-tittle card">
                    <h3>${mascota.name}</h3>
                    <p>Género: ${mascota.genre}</p>
                    <p>Edad: ${mascota.age}</p>
                    <p>Ciudad: ${mascota.city}</p>
                    <a href="/mostrar/${mascota.id}" class="b-mostrar-below">Más info</a>
                    <c:if test="${userInSession.id eq mascota.owner.id}">
                        <a href="/editar/${mascota.id}" class="b-mostrar-below">Editar</a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
		</div>
    </div>
    </div>
</body>
</html>
