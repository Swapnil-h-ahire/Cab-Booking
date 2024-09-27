package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Admin;
import com.entity.Driver;
import com.entity.User;

public class AdminDAO {
	private static Connection conn;
	
	
	public AdminDAO(Connection conn) {
		super();
		this.conn = conn;
	}


	public Admin loginAdmin(String e, String p) {
	    Admin a = null;
	    try {
	        String sql = "select * from admin1 where email=? and password=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, e);
	        ps.setString(2, p);
	        ResultSet rs = ps.executeQuery();
	        
	        // Check if a record exists
	        if (rs.next()) {
	            a = new Admin();
	            a.setId(rs.getInt(1));
	            a.setName(rs.getString(2));
	            a.setEmail(rs.getString(3));
	            a.setPassword(rs.getString(4));
	        } else {
	            System.out.println("No matching admin found.");
	        }
	    } catch (SQLException ex) {
	        ex.printStackTrace(); // Log the exception properly
	    }
	    return a;
	}

	public static List<User> allUsers(){
		List<User> list=new ArrayList<User>();
		try {
			String sql="select * from user1";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				User a=new User();
				a.setId(rs.getInt(1));
				a.setName(rs.getString(2));
				a.setEmail(rs.getString(3));
				a.setPassword(rs.getString(4));
				list.add(a);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<Driver> allDrivers(){
		List<Driver> list=new ArrayList<Driver>();
		try {
			String sql="select * from driver_registration";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Driver d=new Driver();
				d.setAddress(rs.getString(3));
				d.setAdhar(rs.getString(6));
				d.setEmail(rs.getString(4));
				d.setId(1);
				d.setLicense(rs.getString(5));
				d.setName(rs.getString(2));
				d.setPassword(rs.getString(8));
				d.setUserId(rs.getInt(7));
				list.add(d);
						
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
