package com.sp.Ebook_App.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Driver;

public class DbConnection {
	private static Connection con;
	public static Connection getDbconnection() {
		try {
			Driver d = new Driver();
			DriverManager.registerDriver(d);
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_app", "root", "Sonu@1234");
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
