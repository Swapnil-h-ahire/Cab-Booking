package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/driver_logout")
public class DriverLogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.getAttribute("Driver");
		session.removeAttribute("Driver");
		HttpSession session2=req.getSession();
		session2.setAttribute("logMsg", "Logout successfully..");
		resp.sendRedirect("driver_login.jsp");
	}
}
