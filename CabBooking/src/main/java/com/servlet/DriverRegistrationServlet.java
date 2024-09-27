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
@WebServlet("/driver_register")
public class DriverRegistrationServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("fname");
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		String adhar=req.getParameter("adhar");
		String add=req.getParameter("address");
		int uId= Integer.parseInt(req.getParameter("userid"));
		String lno=req.getParameter("license");
		Driver d=new Driver();
		d.setName(name);
		d.setAddress(add);
		d.setEmail(email);
		d.setLicense(lno);
		d.setPassword(pass);
		d.setUserId(uId);
		d.setAdhar(adhar);
		DriverDAO dao=new DriverDAO(DBConnect.getConn());
		boolean f=dao.driverRegistration(d);
		HttpSession session=req.getSession();
		if (f) {
			session.setAttribute("sucMsg", "Driver Register Successfully...");
			resp.sendRedirect("driver_registration.jsp");
//			System.out.println("Driver register"+ f);
		} else {
			session.setAttribute("errMsg", "Driver Register Successfully...");
			resp.sendRedirect("driver_registration.jsp");
//			System.out.println("Driver not register"+ f);
		}
	}
}
