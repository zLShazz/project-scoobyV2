<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body class="background">
	<nav>
		<jsp:include page="../includes/navbar.jsp"></jsp:include>
	</nav>
	<div class="container" id="donarimg">
		<div class="row">
            <img src="images/donar/image.png" alt="donar">
		</div>
	</div>
	<footer>
    	<jsp:include page="../includes/footer.jsp"></jsp:include>
    </footer>
</body>
</html>