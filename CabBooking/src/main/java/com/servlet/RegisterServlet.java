package com.servlet;
import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		
		User u=new User(name,email,pass);
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean f=dao.userRegister(u);
		HttpSession session=req.getSession();
		
		if (f) {
			session.setAttribute("sucMsg", "User Register Successfully..");
			resp.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("errMsg", "Something Wrong..");
			resp.sendRedirect("register.jsp");
		}
	}
}
