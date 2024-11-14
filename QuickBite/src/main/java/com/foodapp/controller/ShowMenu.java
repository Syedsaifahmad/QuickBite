package com.foodapp.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodapp.dbUtils.DbConnect;
import com.foodapp.model.daoimpl.MenuDAOImpl;
import com.foodapp.model.pojo.Menu;

@WebServlet("/ShowMenu")
public class ShowMenu extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
        DbConnect db = new DbConnect();
        db.connection();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String sid = req.getParameter("id");
        int restId = Integer.parseInt(sid);
        MenuDAOImpl menuDao = new MenuDAOImpl();
        
        // Call getMenuByRestaurantId to get a list of menus for the specified restaurant ID
        List<Menu> menuList = menuDao.getMenuByRestaurantId(restId);
        
        // Set the menu list as a request attribute, not session
        req.setAttribute("menuList", menuList);
        
        // Forward to menu.jsp instead of redirecting
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }
}
