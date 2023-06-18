<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/navbar.css">
</head>
<body>
    <header class="header">
        <div class="logo">
        	<a href="/home"><img src="/images/LogoPngBorde.png" alt="Logo de la marca"></a>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="/home">Inicio</a></li>
                <li><a href="/perfil/${userInSession.id}">Perfil</a></li>
                <li><a href="/adopcion">Dar en adopcion</a></li>
                <li><a href="/adoptar">Adoptar</a></li>
            </ul>            
        </nav>
        <a class="btn" href="/donaciones"><button>Donaciones</button></a>
        <a class="btn" href="/logout"><button>Cerrar Sesión</button></a>
    </header>
</body>
</html>