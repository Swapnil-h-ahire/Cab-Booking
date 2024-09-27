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
import com.entity.Cab;
@WebServlet("/addcab")
public class AddCabServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cabNo=req.getParameter("cabno");
		String cabType=req.getParameter("cabtype");
		int noOfSeats=Integer.parseInt(req.getParameter("noofseats"));
		
		Cab c=new Cab();
		c.setCabNo(cabNo);
		c.setCabType(cabType);
		c.setNoSeats(noOfSeats);
		
		DriverDAO dao=new DriverDAO(DBConnect.getConn());
		boolean f=dao.addCab(c);
		HttpSession session=req.getSession();
		if (f) {
			session.setAttribute("sucMsg", "Cab Successfully Added!");
			resp.sendRedirect("add_cab.jsp");
		} else {
			session.setAttribute("errMsg", "Something went wrong!");
			resp.sendRedirect("add_cab.jsp");
		}
		
	}
}
