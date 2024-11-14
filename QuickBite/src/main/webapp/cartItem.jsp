<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>  
<%@ page import="com.foodapp.model.pojo.CartItem"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart Items</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" 
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" 
        integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMyPZ+XzMfdw3iFF1s5mDPCsP5xyiufuhNEWHKZ" 
        crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" 
        crossorigin="anonymous">
    <style>
        /* Your existing styles here */
        .cart-table th, .cart-table td {
            text-align: center;
            vertical-align: middle;
        }
        .cart-table th {
            background-color: #f8f9fa;
        }
        .cart-table td {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <!-- Navbar Code -->
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgb(14, 14, 14);">
        <div class="container-fluid">
            <!-- Logo on the left -->
            <a class="navbar-brand" href="home.jsp">
                <h1 id="logo" style="color: aqua;">QUICKBITE</h1>
            </a>

            <!-- Toggler for mobile view -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <!-- Centered navigation items -->
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item mx-3">
                        <a class="nav-link" aria-current="page" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link" href="#">About Us</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link" href="#">Clients</a>
                    </li>
                    <li class="nav-item mx-3">
                        <a class="nav-link" href="#">Contact Us</a>
                    </li>
                </ul>

                <!-- Cart and Profile buttons on the right -->
                <div class="d-flex">
                    <a href="cart.jsp" class="btn btn-outline-danger me-2 active">Cart</a>
                    <a href="profile.jsp" class="btn btn-outline-success me-2">Profile</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Cart Content -->
    <div class="container my-4">
        <%  
            Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");
            double totalPrice = 0.0; // Initialize total price
            if (cartMap != null && !cartMap.isEmpty()) {
        %>
        <table class="table table-bordered cart-table">
            <thead>
                <tr>
                    <th>Restaurant Name</th>
                    <th>Item Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
            <% 
                for (CartItem c : cartMap.values()) {
                    double itemTotal = c.getPrice() * c.getQuantity();
                    totalPrice += itemTotal;
            %>
                <tr>
                    <td><%= c.getResturantId() %></td> <!-- Restaurant Name -->
                    <td><%= c.getName() %></td>
                    <td>Rs <%= c.getPrice() %></td>
                    <td>
                        <input type="number" class="form-control quantity-input" 
                               min="1" value="<%= c.getQuantity() %>" style="width: 60px;">
                    </td>
                    <td>Rs <%= itemTotal %></td>
                    <td>
                        <a href="" 
                           class="btn btn-danger btn-sm">Remove</a> <!-- Remove Button -->
                    </td>
                </tr>
            <% 
                }
            %>
            </tbody>
        </table>
        <% 
            } else { 
        %>
        <p class="text-center">No items in cart</p>
        <% } %>

        <!-- Total Price Section -->
        <div class="cart-total text-center my-4">
            <h4>Total: Rs <span id="total-price"><%= totalPrice %></span></h4>
            <button class="btn btn-success mt-3">Place Order</button>
        </div>
    </div>

    <!-- Bootstrap JS (optional for interactive components) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-cu1lQ+kQf7+Y9I9aOecD1mAzYnJZbfq0iyWQm52VmFkh8Uk8I9W0VVqghE2Hj5Jf" crossorigin="anonymous"></script>
</body>
</html>
