package mySQLConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class MySQLConnection {

	public static Connection Connection() {
		try {
			String username = "root";
			String password = "";
			
			String url = "jdbc:mysql://localhost:3306/busbooking?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			Class.forName("com.mysql.jdbc.Driver"); // loading mysql driver
			Connection conn = DriverManager.getConnection(url, username, password); // attemping to connect to MySQL
																					// database
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; 
	} 
}
