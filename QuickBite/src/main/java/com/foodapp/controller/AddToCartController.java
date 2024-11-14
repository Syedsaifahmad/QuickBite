package com.foodapp.controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.foodapp.model.daoimpl.CartDAOImpl;
import com.foodapp.model.daoimpl.MenuDAOImpl;
import com.foodapp.model.pojo.CartItem;
import com.foodapp.model.pojo.Menu;

@WebServlet("/AddToCartController")
public class AddToCartController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve cart from session and check if it's null
        @SuppressWarnings("unchecked")
		HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        

        int menuId = Integer.parseInt(req.getParameter("menuId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        System.out.println("MenuID "+menuId+"  quantity "+quantity);
        // Ensure quantity is valid
        if (quantity <= 0) {
            req.setAttribute("error", "Quantity must be greater than 0");
            req.getRequestDispatcher("cartItem.jsp").forward(req, resp);  // Redirect to the cart page for error message
            return;
        }

        // Fetch menu item details using MenuDAOImpl
        MenuDAOImpl menuDAO = new MenuDAOImpl();
        Menu menu = menuDAO.getMenuById(menuId);

        if (menu != null) {
            CartItem cartItem = new CartItem(menuId, menu.getRestaurantId(), menu.getName(), quantity, menu.getPrice());
            System.out.println("cartitem 46 "+cartItem);
            // Check if item is already in cart, if so update quantity
            if (cart.containsKey(menuId)) {
                CartItem existingItem = cart.get(menuId);
                existingItem.setQuantity(existingItem.getQuantity() + quantity);
            } else {
                cart.put(menuId, cartItem); // Add new item
            }

            // Update the cart in session
            req.getSession().setAttribute("cart", cart);

            // Send success message and redirect to cart page
            resp.sendRedirect("cartItem.jsp");  // Redirect to cart page to reflect changes
        } else { 
            req.setAttribute("error", "Menu item not found.");
            req.getRequestDispatcher("menu.jsp").forward(req, resp);
        }
    }
}

