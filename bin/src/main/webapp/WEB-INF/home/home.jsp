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
    <!-- Navbar section -->
    <div class="background">
      <nav>
        <jsp:include page="../includes/navbar.jsp"></jsp:include>
      </nav>

        <section id="center">
          <article class="container-center">
            <div class="container-center">
              <div class="row">
                <div class="col-md-2">
                  <div class="categories">
                    <div class="accordion" id="accordionExample">
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                          <button class="accordion-button" type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="true"
                            aria-controls="collapseOne">
                            Categoría
                          </button>
                        </h2>
                        <div id="collapseOne"
                          class="accordion-collapse collapse show"
                          aria-labelledby="headingOne"
                          data-bs-parent="#accordionExample">
                          <div class="accordion-body">
                            <nav class="nav nav-pills flex-column">
                              <a class="nav-link ms-3 my-1" href="categoria/especies/perros">Perros</a>
                              <a class="nav-link ms-3 my-1" href="categoria/especies/gatos">Gatos</a>
                              <a class="nav-link ms-3 my-1" href="categoria/especies/roedores">Roedores</a>
                              <a class="nav-link ms-3 my-1" href="categoria/especies/otros">Otras especies</a>
                            </nav>
                          </div>
                        </div>
                      </div>
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                          <button class="accordion-button collapsed"
                            type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                            Género
                          </button>
                        </h2>
                        <div id="collapseTwo"
                          class="accordion-collapse collapse"
                          aria-labelledby="headingTwo"
                          data-bs-parent="#accordionExample">
                          <nav class="nav nav-pills flex-column">
                            <a class="nav-link ms-3 my-1" href="categoria/generos/hembras">Hembra</a>
                            <a class="nav-link ms-3 my-1" href="categoria/generos/machos">Macho</a>
                          </nav>
                        </div>
                      </div>
                      <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                          <button class="accordion-button collapsed"
                            type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseThree"
                            aria-expanded="false" aria-controls="collapseThree">
                            Edad
                          </button>
                        </h2>
                        <div id="collapseThree"
                          class="accordion-collapse collapse"
                          aria-labelledby="headingThree"
                          data-bs-parent="#accordionExample">
                          <nav class="nav nav-pills flex-column">
                            <a class="nav-link ms-3 my-1" href="categoria/edades/cachorros">Cachorro</a>
                            <a class="nav-link ms-3 my-1" href="categoria/edades/adultos">Adulto</a>
                            <a class="nav-link ms-3 my-1" href="categoria/edades/seniors">Senior</a>
                          </nav>
                        </div>
                      </div>
                    </div>
                  </nav>
                </div>
              </div>
              <div class="col-md-8">
                <!-- Carousel -->
                <!-- ADD CORRECT PATHS -->
                <div id="carouselExampleControls" class="carousel slide"
                  data-bs-ride="carousel">
                  <div class="carousel-inner">
                    <div class="carousel-item active">
                      <div class="cards-wrapper">
                      <c:forEach items="${pets}" var="pet">
	                        <div class="card" style="width: 18rem;">
	                         	<c:if test="${not empty pet.image}">
                                	<img src="/img/${pet.image}" class="img-fluid"/>
                            	</c:if>
	                          <div class="card-body">
	                          	<h3 class="card-title">${pet.name}</h3>
	                            <p class="card-text">Género: ${pet.genre}</p>
	                            <p class="card-text">Edad: ${pet.age}</p>
	                            <p class="card-text">Ciudad: ${pet.city}</p>
	                            <a href="/mostrar/${pet.id}" class="btn btn-primary">Más info</a>
	                          </div>
	                        </div>
                        </c:forEach>
                      </div>
                    </div>
                    <div class="carousel-item">
                      <div class="cards-wrapper">
                        <div class="card" style="width: 18rem;">
                          <img src="img/cards/img-card-4.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to
                              build on the card title and make up the bulk of
                              the card's content.</p>
                            <a href="#" class="btn btn-primary">Más info</a>
                          </div>
                        </div>
                        <div class="card" style="width: 18rem;">
                          <img src="img/cards/img-card-5.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to
                              build on the card title and make up the bulk of
                              the card's content.</p>
                            <a href="#" class="btn btn-primary">Más info</a>
                          </div>
                        </div>
                        <div class="card" style="width: 18rem;">
                          <img src="img/cards/img-card-6.jpg"
                            class="card-img-top" alt="...">
                          <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to
                              build on the card title and make up the bulk of
                              the card's content.</p>
                            <a href="#" class="btn btn-primary">Más info</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <button class="carousel-control-prev" type="button"
                    data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                  </button>
                  <button class="carousel-control-next" type="button"
                    data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                  </button>
                </div>
              </div>
            </div>
          </article>
          <article>
            <div class="container-down">
              <div class="row">
                <div class="col-md-2">
                  <div class="text-adds">
                    <img src="images/home/add.png" alt="anuncio" id="adds">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="img-volunteers">
                    <img src="images/home/volunteers.jfif" alt="voluntarios"
                      id="volunteers">
                  </div>
                </div>

                <div class="col-md-6">
                  <div class="text-about-us">
                    <h4>¿Quiénes Somos?</h4>

                    <p id="parrafo">
                      Somos una fundación comprometida con el rescate y adopción
                      de caninos en situación de
                      vulnerabilidad. Nuestro equipo de voluntarios trabaja
                      incansablemente para brindarles cuidados y
                      encontrarles hogares amorosos. Además, promovemos la
                      adopción responsable y la conciencia sobre el
                      bienestar animal. Únete a nosotros para darles una segunda
                      oportunidad a estos maravillosos seres.</p>
                  </div>
                </div>
              </div>
            </div>
          </article>
          <article class="sponsors">
            <h6>Nuestros socios </h6>
            <div class="container-deep">

              <img src="images/sponsor/logo_fit_formula.png" alt="logo"
                class="img-sponsor">
              <img src="images/sponsor/logo_masterdog.png" alt="logo"
                class="img-sponsor">
              <img src="images/sponsor/logo_royalcanin.png" alt="logo"
                class="img-sponsor">
              <img src="images/sponsor/Logo-Dog-Chow.png" alt="logo"
                class="img-sponsor">

            </div>

          </article>

        </section>
        <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
      </div>
      <footer>
		 <jsp:include page="../includes/footer.jsp"></jsp:include>
    </footer>
    </body>
  </html>