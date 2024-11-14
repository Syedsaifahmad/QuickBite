<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.foodapp.model.pojo.Restaurant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- editRestaurant.jsp -->
	<form action="UpdateRestaurant" method="post">
		<input type="hidden" name="restaurantId" value="${restaurant.restaurantId}" /> 
		<label for="restaurantName">RestaurantName:</label> 
		<input type="text" name="restaurantName"value="${restaurant.restaurantName}" required /> 
		<labelfor="cuisineType">Cuisine Type:</label> 
		<input type="text"
			name="cuisineType" value="${restaurant.cuisineType}" required /> <label
			for="address">Address:</label> <input type="text" name="address"
			value="${restaurant.address}" required /> <label for="rating">Rating:</label>
		<input type="number" name="rating" value="${restaurant.rating}"
			min="1" max="5" required /> <label for="isActive">Active
			Status:</label> <select name="isActive">
			<option value="true" ${restaurant.isActive ? 'selected' : ''}>Active</option>
			<option value="false"
				${restaurant.isActive == false ? 'selected' : ''}>Inactive</option>

		</select> <label for="image">Image URL:</label> <input type="text" name="image"
			value="${restaurant.image}" />

		<button type="submit">Update Restaurant</button>
	</form>

	</form>
</body>
</html>