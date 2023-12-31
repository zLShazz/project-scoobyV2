<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mensajes</title>
<link rel="stylesheet" href="/css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="shortcut icon" href="img/icons/LogoPng.png" type="img_logo">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body class="background">
	<nav>
	  <jsp:include page="../includes/navbar.jsp"></jsp:include>
	</nav>
	<div class="container-messages">
		<c:forEach items="${chat}" var="mensaje">
			<c:if test="${userInSession.id == mensaje.remitter.id}">
				<div class="my-chat">${mensaje.text}</div>
			</c:if>
			<c:if test="${userInSession.id != mensaje.remitter.id}">
				<div class="new-chat">${mensaje.text}</div>
			</c:if>
		</c:forEach>
	
		<form:form action="/conversar" method="POST" modelAttribute="message">
			<form:hidden path="remitter" value="${userInSession.id}" />
			<form:hidden path="receptor" value="${recibe}" />
			
			<form:input type="text" id="chat-input" path="text" placeholder="Escribe tu mensaje"/>
			<input type="submit" value="Enviar" id="button-chat" />
			
		</form:form>
	</div>
	<footer class="footer-msg">
	  <jsp:include page="../includes/footer.jsp"></jsp:include>
	</footer>
</body>
</html>