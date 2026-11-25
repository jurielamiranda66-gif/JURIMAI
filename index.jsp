<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html lang="es">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>JURIMAI | Librería</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/estilos.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body id="inicio">

	<!-- 1. ENCABEZADO -->

	<header class="catalogo-encabezado">

		<div class="catalogo-marca">
			<i class="fa-solid fa-book-open"></i>
			<h1>JURIMAI</h1>
		</div>

		<p>Un sueño que florece, un recuerdo que vive para siempre.</p>

		<form action="${pageContext.request.contextPath}/buscar" method="get"
			class="buscador">

			<input type="text" name="texto"
				placeholder="Buscar por título, autor, editorial o género...">

			<button type="submit">
				<i class="fa-solid fa-magnifying-glass"></i> Buscar
			</button>

		</form>

		<div class="catalogo-acciones">

			<a href="${pageContext.request.contextPath}/inicio"> <i
				class="fa-regular fa-heart"></i>
			</a> <a href="${pageContext.request.contextPath}/inicio"> <i
				class="fa-solid fa-cart-shopping"></i>
			</a>

		</div>

	</header>


	<!-- 2. BARRA DE NAVEGACIÓN -->

	<nav class="barra-navegacion">

		<div class="nav-links">

			<a href="#inicio"> <i class="fa-solid fa-house"></i> Inicio
			</a> <a href="#novedades"> Novedades </a> <a href="#destacados">
				Destacados </a> <a href="#populares"> Populares </a> <a
				href="#top-jurimai"> Top JURIMAI </a> <a href="#categorias">
				Categorías </a>

		</div>

	</nav>

	<!-- BANNER DE BIENVENIDA -->

	<section class="banner-bienvenida">

		<a href="#novedades" title="Explorar colección"> <img
			src="${pageContext.request.contextPath}/img/banner_jurimai.png"
			alt="JURIMAI - Cada libro es el comienzo de una nueva historia">
		</a>

	</section>

	<!-- 3. CONTENIDO PRINCIPAL -->

	<main class="catalogo-contenedor">


		<!-- CATEGORÍAS -->

		<section class="seccion-categorias" id="categorias">

			<div class="catalogo-titulo">
				<span>EXPLORA NUESTRA COLECCIÓN</span>
				<h2>Categorías</h2>
			</div>

			<div class="categorias-lista">

				<%
				List categorias = (List) request.getAttribute("categorias");

				if (categorias != null) {
					for (Object obj : categorias) {
						Map categoria = (Map) obj;
				%>

				<a
					href="${pageContext.request.contextPath}/categoria?id=<%= categoria.get("id_categoria") %>"
					class="categoria-enlace"> <%=categoria.get("nombre_categoria")%>

				</a>

				<%
				}
				}
				%>

			</div>

		</section>


		<!-- 4. NOVEDADES -->

		<section class="seccion-libros" id="novedades">

			<div class="catalogo-titulo">
				<span>RECIÉN LLEGADOS</span>
				<h2>
					<i class="fa-solid fa-sparkles"></i> Novedades
				</h2>
			</div>

			<div class="carrusel-contenedor">

				<button type="button" class="carrusel-flecha izquierda"
					onclick="moverCarrusel(this, -1)">
					<i class="fa-solid fa-chevron-left"></i>
				</button>

				<div class="libros-grid">

					<%
					List novedades = (List) request.getAttribute("novedades");

					if (novedades != null && !novedades.isEmpty()) {
						for (Object obj : novedades) {
							Map libro = (Map) obj;
					%>

					<article class="libro-tarjeta">

						<div class="libro-portada">

							<img
								src="${pageContext.request.contextPath}/<%= libro.get("imagen") %>"
								alt="<%=libro.get("titulo")%>"
								onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

							<div class="portada-error">
								<i class="fa-solid fa-book"></i> <span>Portada no
									disponible</span>
							</div>

						</div>

						<div class="libro-informacion">

							<h3><%=libro.get("titulo")%></h3>

							<p>
								<i class="fa-regular fa-user"></i>
								<%=libro.get("autor")%>
							</p>

							<div class="libro-precio">
								₡<%=libro.get("precio")%>
							</div>

							<a
								href="${pageContext.request.contextPath}/libro?id=<%= libro.get("id_libro") %>"
								class="btn-libro"> Ver libro <i
								class="fa-solid fa-arrow-right"></i>

							</a>

						</div>

					</article>

					<%
					}
					} else {
					%>

					<p>No hay novedades disponibles.</p>

					<%
					}
					%>

				</div>

				<button type="button" class="carrusel-flecha derecha"
					onclick="moverCarrusel(this, 1)">
					<i class="fa-solid fa-chevron-right"></i>
				</button>

			</div>

		</section>


		<!-- 5. DESTACADOS -->

		<section class="seccion-libros" id="destacados">

			<div class="catalogo-titulo">
				<span>SELECCIÓN ESPECIAL</span>
				<h2>
					<i class="fa-solid fa-star"></i> Destacados
				</h2>
			</div>

			<div class="carrusel-contenedor">

				<button type="button" class="carrusel-flecha izquierda"
					onclick="moverCarrusel(this, -1)">
					<i class="fa-solid fa-chevron-left"></i>
				</button>

				<div class="libros-grid">

					<%
					List destacados = (List) request.getAttribute("destacados");

					if (destacados != null && !destacados.isEmpty()) {
						for (Object obj : destacados) {
							Map libro = (Map) obj;
					%>

					<article class="libro-tarjeta">

						<div class="libro-portada">

							<img
								src="${pageContext.request.contextPath}/<%= libro.get("imagen") %>"
								alt="<%=libro.get("titulo")%>"
								onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

							<div class="portada-error">
								<i class="fa-solid fa-book"></i> <span>Portada no
									disponible</span>
							</div>

						</div>

						<div class="libro-informacion">

							<h3><%=libro.get("titulo")%></h3>

							<p>
								<i class="fa-regular fa-user"></i>
								<%=libro.get("autor")%>
							</p>

							<div class="libro-precio">
								₡<%=libro.get("precio")%>
							</div>

							<a
								href="${pageContext.request.contextPath}/libro?id=<%= libro.get("id_libro") %>"
								class="btn-libro"> Ver libro <i
								class="fa-solid fa-arrow-right"></i>

							</a>

						</div>

					</article>

					<%
					}
					} else {
					%>

					<p>No hay libros destacados disponibles.</p>

					<%
					}
					%>

				</div>

				<button type="button" class="carrusel-flecha derecha"
					onclick="moverCarrusel(this, 1)">
					<i class="fa-solid fa-chevron-right"></i>
				</button>

			</div>

		</section>


		<!-- 6. POPULARES -->

		<section class="seccion-libros" id="populares">

			<div class="catalogo-titulo">
				<span>DESCUBRE NUEVAS LECTURAS</span>
				<h2>
					<i class="fa-solid fa-fire"></i> Populares
				</h2>
			</div>

			<div class="carrusel-contenedor">

				<button type="button" class="carrusel-flecha izquierda"
					onclick="moverCarrusel(this, -1)">
					<i class="fa-solid fa-chevron-left"></i>
				</button>

				<div class="libros-grid">

					<%
					List populares = (List) request.getAttribute("populares");

					if (novedades != null && !populares.isEmpty()) {
						for (Object obj : populares) {
							Map libro = (Map) obj;
					%>

					<article class="libro-tarjeta">

						<div class="libro-portada">

							<img
								src="${pageContext.request.contextPath}/<%= libro.get("imagen") %>"
								alt="<%=libro.get("titulo")%>"
								onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

							<div class="portada-error">
								<i class="fa-solid fa-book"></i> <span>Portada no
									disponible</span>
							</div>

						</div>

						<div class="libro-informacion">

							<h3><%=libro.get("titulo")%></h3>

							<p>
								<i class="fa-regular fa-user"></i>
								<%=libro.get("autor")%>
							</p>

							<div class="libro-precio">
								₡<%=libro.get("precio")%>
							</div>

							<a
								href="${pageContext.request.contextPath}/libro?id=<%= libro.get("id_libro") %>"
								class="btn-libro"> Ver libro <i
								class="fa-solid fa-arrow-right"></i>

							</a>

						</div>

					</article>

					<%
					}
					} else {
					%>

					<p>No hay libros populares disponibles.</p>

					<%
					}
					%>

				</div>

				<button type="button" class="carrusel-flecha derecha"
					onclick="moverCarrusel(this, 1)">
					<i class="fa-solid fa-chevron-right"></i>
				</button>

			</div>

		</section>


		<!-- 7. TOP JURIMAI -->

		<section class="seccion-libros" id="top-jurimai">

			<div class="catalogo-titulo">
				<span>UNA SELECCIÓN PARA TI</span>
				<h2>
					<i class="fa-solid fa-trophy"></i> Top JURIMAI
				</h2>
			</div>

			<div class="carrusel-contenedor">

				<button type="button" class="carrusel-flecha izquierda"
					onclick="moverCarrusel(this, -1)">
					<i class="fa-solid fa-chevron-left"></i>
				</button>

				<div class="libros-grid">

					<%
					List topLibros = (List) request.getAttribute("topLibros");

					if (topLibros != null && !topLibros.isEmpty()) {
						for (Object obj : topLibros) {
							Map libro = (Map) obj;
					%>

					<article class="libro-tarjeta">

						<div class="libro-portada">

							<img
								src="${pageContext.request.contextPath}/<%= libro.get("imagen") %>"
								alt="<%=libro.get("titulo")%>"
								onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

							<div class="portada-error">
								<i class="fa-solid fa-book"></i> <span>Portada no
									disponible</span>
							</div>

						</div>

						<div class="libro-informacion">

							<h3><%=libro.get("titulo")%></h3>

							<p>
								<i class="fa-regular fa-user"></i>
								<%=libro.get("autor")%>
							</p>

							<div class="libro-precio">
								₡<%=libro.get("precio")%>
							</div>

							<a
								href="${pageContext.request.contextPath}/libro?id=<%= libro.get("id_libro") %>"
								class="btn-libro"> Ver libro <i
								class="fa-solid fa-arrow-right"></i>

							</a>

						</div>

					</article>

					<%
					}
					} else {
					%>

					<p>No hay libros disponibles en Top JURIMAI.</p>

					<%
					}
					%>

				</div>

				<button type="button" class="carrusel-flecha derecha"
					onclick="moverCarrusel(this, 1)">
					<i class="fa-solid fa-chevron-right"></i>
				</button>

			</div>

		</section>

	</main>


	<!-- 8. PIE DE PÁGINA -->

	<footer class="catalogo-pie">

		<h2>JURIMAI</h2>

		<p>Un sueño que florece, un recuerdo que vive para siempre.</p>

		<span>&copy; <span id="anio-actual">2026</span> JURIMAI. Todos
			los derechos reservados.
		</span>

	</footer>


	<!-- 9. FUNCIONES JAVASCRIPT -->

	<script src="${pageContext.request.contextPath}/js/funciones.js"></script>

</body>
</html>