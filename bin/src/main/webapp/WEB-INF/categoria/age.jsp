<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Mascotas por Categoría</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<nav>
		<jsp:include page="../includes/navbar.jsp"></jsp:include>
	</nav>
    <h1>Lista de Mascotas por Categoría - ${edad}</h1>
    <div class="container">
		<div class="row">	
          <c:forEach items="${mascotas}" var="mascota">
           <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
          <div class="card h-100">
                    <c:if test="${not empty mascota.image}">
                        <img src="/img/${mascota.image}" alt="${mascota.name}">
                    </c:if>
                    <div>
                  </div>
                </div>
                 <div class="">
                    <h3>${mascota.name}</h3>
                    <p>Género: ${mascota.genre}</p>
                    <p>Edad: ${mascota.age}</p>
                    <p>Ciudad: ${mascota.city}</p>
                    <a href="/mostrar/${mascota.id}">Más info</a>
                    <c:if test="${userInSession.id eq mascota.owner.id}">
                        <a href="/editar/${mascota.id}">Editar</a>
                    </c:if>
                </div>
            </div>
        </c:forEach>
		</div>
    </div>
</body>
</html>
