package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Adminlogout")
public class AdminLogoutServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.getAttribute("admin");
		session.removeAttribute("admin");
		HttpSession session2=req.getSession();
		session2.setAttribute("logMsg", "Logout successfully..");
		resp.sendRedirect("adminLogin.jsp");
	}
}
