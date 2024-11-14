package com.foodapp.controller;
import com.foodapp.model.pojo.CartItem;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;


public class UpdateCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
		Map<Integer, CartItem> cartMap = (Map<Integer, CartItem>) session.getAttribute("cart");

        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        if (cartMap != null && cartMap.containsKey(itemId)) {
            CartItem item = cartMap.get(itemId);
            item.setQuantity(quantity);
            session.setAttribute("cart", cartMap);  // Update session with new cart
        }

        response.sendRedirect("cart.jsp");  // Redirect back to cart page
    }
}
