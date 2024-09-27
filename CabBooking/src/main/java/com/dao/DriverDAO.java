package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Cab;
import com.entity.Driver;

public class DriverDAO {
	private static Connection conn;
	public DriverDAO(Connection conn) {
		this.conn=conn;
	}
	public static boolean driverRegistration(Driver d) {
		boolean f=false;
		try {
			String sql="insert into driver_registration(full_name,address,email,license_no,adhar_no,user_id,password) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, d.getName());
			ps.setString(2, d.getAddress());
			ps.setString(3, d.getEmail());
			ps.setString(4, d.getLicense());
			ps.setString(5, d.getAdhar());
			ps.setInt(6, d.getUserId());
			ps.setString(7, d.getPassword());
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public static Driver driverLogin(String e,String p) {
		Driver d=null;
		try {
			String sql="select * from driver_registration where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, e);
			ps.setString(2, p);
			ResultSet rs=ps.executeQuery();
			if (rs.next()) {
				d=new Driver();
				d.setAddress(rs.getString(3));
				d.setAdhar(rs.getString(6));
				d.setEmail(rs.getString(4));
				d.setId(1);
				d.setLicense(rs.getString(5));
				d.setName(rs.getString(2));
				d.setPassword(rs.getString(8));
				d.setUserId(rs.getInt(7));
			}
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return d;
	}
	public static boolean addCab(Cab c) {
		boolean f=false;
		try {
			String sql="insert into driver_cab_details(cab_no,cab_type,no_of_seats) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, c.getCabNo());
			ps.setString(2, c.getCabType());
			ps.setInt(3, c.getNoSeats());
			
			int i=ps.executeUpdate();
			if (i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
