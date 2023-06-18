<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fundacion-Scooby</title>
    <link rel="shortcut icon" href="img/icons/LogoPng.png" type="img_logo">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
  </head>
<body>
	<nav>
    	<jsp:include page="../includes/navbar.jsp"></jsp:include>
    </nav>
    <div class="row">
      <c:forEach items="${pets}" var="pet">
        <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-4">
          <div class="card h-100">
            <c:if test="${not empty pet.image}">
              <div class="card-img-top">
                <img src="/img/${pet.image}" class="img-fluid" alt="${pet.name}">
              </div>
            </c:if>
            <div class="card-body">
              <h3 class="card-title">${pet.name}</h3>
              <p class="card-text">Género: ${pet.genre}</p>
              <p class="card-text">Edad: ${pet.age}</p>
              <p class="card-text">Ciudad: ${pet.city}</p>
              <a href="/mostrar/${pet.id}" class="btn btn-primary">Más info</a>
              <c:if test="${userInSession.id eq mostrarPet.owner.id}">
                <a href="/editar/${mostrarPet.id}" class="btn btn-primary">Editar</a>
              </c:if>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

     <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
      <footer>
		 <jsp:include page="../includes/footer.jsp"></jsp:include>
    </footer>
</body>
</html>