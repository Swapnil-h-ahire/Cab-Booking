package com.conn;
import java.sql.*;
public class DBConnect {
	private static Connection conn;
	public static Connection getConn() {
		try {
			Class.forName("org.postgresql.Driver");
			conn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/phonebook","postgres","root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
