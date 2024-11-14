<%@ page language="java" contentType="text/html; charset-ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.foodapp.model.pojo.Restaurant"%>
<%@ page import="java.util.List"%>


<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMyPZ+XzMfdw3iFF1s5mDPCsP5xyiufuhNEWHKZ"
	crossorigin="anonymous">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<title>QuickBite - Food Delivery</title>
<style>
body {
	background-image:
		url("https://plus.unsplash.com/premium_photo-1674729243673-0b5e871a8a24?q=80&w=1870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
	margin: 0;
	padding: 0;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	z-index: -1;
}

.navbar {
    position: sticky;
    top: 0;
    z-index: 1000; /* Ensures it stays on top of other content */
}	

#logo {
	color: aqua;
}

ul li {
	font-size: 20px;
}

.hero-section {
	color: #ffffff;
	text-align: center;
	padding: 100px 20px;
	background-color: black;
}

.hero-section h2 {
	font-size: 50px;
	margin: 0;
}

.hero-section p {
	font-size: 18px;
	margin: 20px 0;
}

.nav-link {
	display: block;
	padding: var(--bs-nav-link-padding-y) var(--bs-nav-link-padding-x);
	font-size: var(--bs-nav-link-font-size);
	font-weight: var(--bs-nav-link-font-weight);
	color: #f8f9fa;
	font-weight: 400;
	text-decoration: none;
	background: 0 0;
	border: 0;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out;
}

.custom-title {
	font-size: 40px;
	color: #c2133c;
	font-weight: bold;
	font-family: cursive;
	text-decoration: underline; /* Adds an underline */
}

.card-title {
	font-weight: bold;
	color: #484845;
	font-family: cursive;
}

.btn {
	font-family: cursive;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not(.active) {
	background-color: #111;
}

.active {
	background-color: #04AA6D;
}

.restaurant-card {
	width: 18rem;
	margin: 20px;
	/*background-image: url("https://images.pexels.com/photos/28957623/pexels-photo-28957623/free-photo-of-aerial-night-view-of-paris-featuring-les-invalides.jpeg"); /* Set your background image URL here */
	background-size: cover;
	background-color: black;
	background-position: center;
	color: #ffffff;
}

.card-title {
	font-size: 1.5rem; /* Larger font for restaurant name */
	font-weight: bold;
	color: #f1f1f1;
}

.card-text {
	font-size: 0.9rem;
	color: #f1f1f1;
}

.btn {
	font-family: cursive;
}

.carousel-item img {
	object-fit: cover;
	width: 100%;
	height: 350px; /* Set new height here */
}

.carousel-inner {
	height: 350px; /* Match the height here */
	overflow: hidden;
	background-color: #333;
}

.fixed-image {
	width: 100%; /* Makes the image fill the card's width */
	height: 200px; /* Set a fixed height for consistency */
	object-fit: cover;
	/* Ensures the image is cropped to fit within the set dimensions */
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
}

/* Apply color to active images */
.active-image {
	filter: none; /* No filter, keeping the image in color */
}

/* Apply black-and-white filter for inactive images */
.inactive-image {
	filter: grayscale(100%) contrast(100%) brightness(80%);
	/* Black and white with slight brightness */
}
</style>
</head>
<body>


	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: rgb(14, 14, 14);">
		<div class="container-fluid">
			<!-- Logo on the left -->
			<a class="navbar-brand" href="#">
				<h1 id="logo">QUICKBITE</h1>
			</a>

			<!-- Toggler for mobile view -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Centered navigation items -->
				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
					<li class="nav-item mx-3"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item mx-3"><a class="nav-link" href="#">About
							Us</a></li>
					<li class="nav-item mx-3"><a class="nav-link" href="#">Clients</a>
					</li>
					<li class="nav-item mx-3"><a class="nav-link" href="#">Contact
							Us</a></li>
				</ul>

				<!-- Cart button on the right -->
				<div class="d-flex">
					<a href="cartItem.jsp" class="btn btn-outline-danger me-2">Cart</a>
					<a href="profile.jsp" class="btn btn-outline-success me-2">Profile</a>
				</div>
			</div>
		</div>
	</nav>




	<!-- Hero Section -->
	<!-- -Slider- -->

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<!-- Indicators -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<!-- Carousel Items -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://img.freepik.com/free-psd/food-menu-restaurant-facebook-cover-template_120329-1688.jpg?t=st=1730818288~exp=1730821888~hmac=a64c8b8c020ed1ae346aeff32962ecac180f6c1787b3a9e7987bfd759f8d913c&w=900"
					class="d-block w-100" alt="Slide 1" style="height: 500px;">
			</div>
			<div class="carousel-item">
				<img
					src="https://img.freepik.com/free-psd/food-menu-restaurant-facebook-cover-template_120329-1628.jpg?t=st=1730818542~exp=1730822142~hmac=d39c4eea05822a207dbb2a78ffd462079e222aeeb784d1fcadecf3a7424175b7&w=900"
					class="d-block w-100" alt="Slide 2" style="height: 500px;">
			</div>
			<div class="carousel-item">
				<img
					src="https://img.freepik.com/free-psd/merry-christmas-delicious-burger-food-menu-facebook-cover-template_120329-1101.jpg?t=st=1730818625~exp=1730822225~hmac=faa20a5211e05dfec4fe7ebef0584e89428b9ab8bb4afed0672ae1363e49a683&w=900"
					class="d-block w-100" alt="Slide 3" style="height: 500px;">
			</div>
		</div>

		<!-- Navigation Controls -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<!-- Restaurants -->

	<div class="container-fluid">
		<!--Tagline-->
		<div class="row">
			<div class="col-12">
				<h3 class="custom-title display-6 text-center mt-5 mb-4">Restaurants</h3>
			</div>
		</div>
	</div>


	<!-- Restaurant Details Table -->

	<div class="container mt-4">
		<div class="row">
			<%
		List<Restaurant> restaurantList = (List<Restaurant>) session.getAttribute("restaurant");
        if (restaurantList != null && !restaurantList.isEmpty()) {
            for (Restaurant restaurant : restaurantList) {
                String imageClass = restaurant.isActive() ? "active-image" : "inactive-image";
        %>
			<div class="col-md-4 mb-4">
				<div class="card restaurant-card">
					<!-- Restaurant Image with Conditional Class -->
					<img src="<%=restaurant.getImage()%>"
						class="card-img-top fixed-image <%= restaurant.isActive() ? "active-image" : "inactive-image" %>"
						alt="<%=restaurant.getRestaurantName()%>">

					<div class="card-body">
						<h5 class="card-title"><%=restaurant.getRestaurantName()%></h5>
						<p class="card-text">
							<strong>Cuisine Type:</strong>
							<%=restaurant.getCuisineType()%><br> <strong>Address:</strong>
							<%=restaurant.getAddress()%><br>

							<!-- Rating as Stars -->
							<strong>Rating:</strong>
							<%
                int rating = restaurant.getRating();
                for (int i = 0; i < 5; i++) {
                    if (i < rating) {
                %>
							<span>&#9733;</span>
							<!-- Solid star -->
							<%
                    } else {
                %>
							<span>&#9734;</span>
							<!-- Empty star -->
							<%
                    }
                }
                %>
							/ 5<br>

							<!-- Status: Active or Inactive -->
							<strong>Status:</strong>
							<%
                if (restaurant.isActive()) {
                %>
							<span style="color: green;">Active</span>
							<%
                } else {
                %>
							<span style="color: red;">Inactive</span>
							<%
                }
                %>
						</p>
						<a href="ShowMenu?id=<%=restaurant.getRestaurantId()%>"
							class="btn btn-danger" name="restId">View Menu</a>
					</div>
				</div>
			</div>

			<%
            }
        } else {
        %>
			<div class="col-12 text-center">
				<p>No restaurants found</p>
			</div>
			<%
        }
        %>
		</div>
	</div>










	<!-- Bootstrap script -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
