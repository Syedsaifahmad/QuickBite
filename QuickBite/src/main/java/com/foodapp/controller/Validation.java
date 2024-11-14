package com.foodapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Validation")
public class Validation extends HttpServlet {
	
	private PrintWriter pw;
	private RequestDispatcher d;


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String passWord = req.getParameter("password");
		String confirmpassWord = req.getParameter("confirmpassword");
		String mobileNo = req.getParameter("mobileno");
		String address = req.getParameter("address");


		if(passWord.equals(confirmpassWord) == true) {
			d = req.getRequestDispatcher("register");
			d.include(req, resp);
			resp.sendRedirect("login.html");
		}
		else {
			resp.sendRedirect("register.html");
		}

	}

}
