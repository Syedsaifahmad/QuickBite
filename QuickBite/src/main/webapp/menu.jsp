<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.foodapp.model.pojo.Menu"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu List</title>
<link rel="stylesheet" href="styles.css">
<!-- Link to your CSS file for styling -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMyPZ+XzMfdw3iFF1s5mDPCsP5xyiufuhNEWHKZ"
	crossorigin="anonymous">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
body{
	background-image: url("https://plus.unsplash.com/premium_photo-1674729243673-0b5e871a8a24?q=80&w=1870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");
	
}

/* Styling for menu container and cards */
.menu-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	padding: 20px;
	justify-content: center;
}

.menu-card {
	width: 300px;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 15px;
	text-align: center;
	transition: transform 0.2s ease;
}

.menu-card:hover {
	transform: scale(1.05);
}

.menu-card h2 {
	font-size: 1.5em;
	color: #333;
	margin-bottom: 10px;
}

.menu-card p {
	color: #666;
	margin: 5px 0;
	font-size: 1em;
}

.menu-card p.price {
	font-weight: bold;
	color: #ff6347; /* Tomato color for price emphasis */
	font-size: 1.2em;
}

.fixed-image {
	width: 100%; /* Makes the image fill the card's width */
	height: 200px; /* Set a fixed height for consistency */
	object-fit: cover;
	/* Ensures the image is cropped to fit within the set dimensions */
	border-top-left-radius: 0.25rem;
	border-top-right-radius: 0.25rem;
}

/* Apply color to active menu items (available) */
.active-image {
	filter: none; /* No filter, keeping the image in color */
}

/* Apply black-and-white filter for inactive menu items (not available) */
.inactive-image {
	filter: grayscale(100%) contrast(100%) brightness(80%);
	/* Black and white with slight brightness */
}

.menu-card {
	border: 1px solid #ccc;
	border-radius: 0.25rem;
	overflow: hidden;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.menu-card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-body {
	padding: 1rem;
	text-align: center;
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
						aria-current="page" href="home.jsp">Home</a></li>
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


	<div class="container mt-4">
    <div class="row">
        <%
        List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");
        if (menuList != null && !menuList.isEmpty()) {
            for (Menu menu : menuList) {
                // Assign a class for available and unavailable items
                String imageClass = menu.isAvailable() ? "active-image" : "inactive-image";
        %>
        <div class="col-md-4 mb-4">
            <div class="card menu-card">
                <!-- Menu Image with Conditional Class -->
                <img src="<%=menu.getImage()%>"
                    class="card-img-top fixed-image <%= imageClass %>"
                    alt="<%=menu.getName()%>">

                <div class="card-body">
                    <h5 class="card-title"><%= menu.getName() %></h5>
                    <p class="card-text">
                        <strong>Description:</strong>
                        <%= menu.getDescription() %><br> <strong>Price:</strong> $<%= menu.getPrice() %><br>
                        <strong>Rating:</strong>
                        <%= menu.getRating() %> / 5<br> <strong>Status:</strong>
                        <%= menu.isAvailable() ? "Available" : "Not Available" %>
                    </p>

                    <!-- Form to add item to the cart -->
                    <form action="AddToCartController" method="POST">
                        <input type="hidden" name="menuId" value="<%= menu.getMenuId() %>" />
                        <input type="number" name="quantity" value="1" min="1" class="form-control mb-2" />
                        <button type="submit" class="btn btn-danger">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="col-12 text-center">
            <p>No menu items available for this restaurant.</p>
        </div>
        <%
        }
        %>
    </div>
</div>


</body>
</html>
