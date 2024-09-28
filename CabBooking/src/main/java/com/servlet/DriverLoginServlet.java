package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.DriverDAO;
import com.entity.Driver;

@WebServlet("/driver_login")
public class DriverLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		DriverDAO dao=new DriverDAO(DBConnect.getConn());
		Driver d=dao.driverLogin(email, pass);
		HttpSession session=req.getSession();
		if (d!=null) {
			session.setAttribute("Driver", d);
			resp.sendRedirect("driver_pannel.jsp");
			
		} else {
			session.setAttribute("invalidMsg", "Invalid Email or Password...");
			resp.sendRedirect("driver_login.jsp");
		}
	}
}
