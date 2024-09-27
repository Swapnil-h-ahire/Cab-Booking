package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.conn.DBConnect;
import com.dao.DriverDAO;
import com.entity.Cab;
@WebServlet("/driver_cab_detail")
public class DriverCabDetailServlet  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cabNo=req.getParameter("cabno");
		String cabType=req.getParameter("cabtype");
		int noSeats= Integer.parseInt(req.getParameter("noseats"));
		Cab c=new Cab();
		c.setCabNo(cabNo);
		c.setCabType(cabType);
		c.setNoSeats(noSeats);
		DriverDAO dao=new DriverDAO(DBConnect.getConn());
		boolean f=dao.addCab(c);
		if (f) {
			System.out.println(f);
		} else {
			System.out.println(f);
		}
	}
}
