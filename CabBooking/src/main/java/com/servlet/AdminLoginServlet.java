package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.AdminDAO;
import com.dao.UserDAO;
import com.entity.Admin;
import com.entity.User;

@WebServlet("/adminlogin1")
public class AdminLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		AdminDAO dao=new AdminDAO(DBConnect.getConn());
		Admin a=dao.loginAdmin(email, pass);
		
		HttpSession session=req.getSession();
		if (a!=null) {
			session.setAttribute("admin", a);
			resp.sendRedirect("admin_pannel.jsp");
		} else {
			session.setAttribute("errMsg", "Invalid email and pass");
			resp.sendRedirect("adminLogin.jsp");
		}
		
	}
}
