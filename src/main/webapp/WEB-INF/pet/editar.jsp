<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Mascota</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/style.css">
</head>
<body class="background">
	<nav>
			<jsp:include page="../includes/navbar.jsp"></jsp:include>
	</nav>
    <div class="container">
        <div class="d-flex justify-content-center">
            	<div class="register ">
	            	<form action="/editar/${pet.id}" method="POST" enctype="multipart/form-data" modelAttribute="pet">
						<h1>Editar Mascota</h1>
							<input type="hidden" name="_method" value="PUT">
	
	                    <div class="form-group">
	                        <label for="name">Nombre de la mascota</label>
	                        <input type="text" name="name" class="form-control" id="name">
	                    </div>
	
	                      <div class="form-group">
	                        <label for="age">Edad</label>
	                        <select name="age" class="form-control">
	                            <c:forEach items="${edades}" var="a">
	                                <option value="${a}">${a}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	
	                    <div class="form-group">
	                        <label for="city">Ciudad</label>
	                        <input type="text" name="city" class="form-control" id="city">
	                    </div>
	
	                    <div class="form-group">
	                        <label for="genre">Género</label>
	                        <select name="genre" class="form-control">
	                            <c:forEach items="${generos}" var="g">
	                                <option value="${g}">${g}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	
	                    <div class="form-group">
	                        <label for="species">Especie</label>
	                        <select name="species" class="form-control">
	                            <c:forEach items="${especies}" var="es">
	                                <option value="${es}">${es}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label for="vaccine">Vacunas</label>
	                        <select name="vaccine" class="form-control">
	                            <c:forEach items="${vacunas}" var="vac">
	                                <option value="${vac}" <c:if test="${vac eq mascota.vaccine}">selected</c:if>>${vac}</option>
	                            </c:forEach>
	                        </select>
	                    </div>
	                    
	                    <div class="form-group">
	                        <label for="imagen">Imagen</label>
	                        <input type="file" name="imagen" class="form-control" id="imagen" placeholder="imagen de 50x50 px">
	                    </div>
	
	                    <div class="form-group">
	                        <label for="description">Descripción</label>
	                        <textarea name="description" class="form-control" id="description"></textarea>
	                    </div>
	
	                    <input type="hidden" name="owner" value="${userInSession.id}">
	
	                    <input type="submit" value="Editar" class="btn btn-success mt-3">
	                </form>
            	</div>
        </div>
    </div>
    <footer>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</footer>
</body>
</html>