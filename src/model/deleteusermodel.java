package model;

import java.sql.*;

import mySQLConnection.MySQLConnection;

public class deleteusermodel {
	protected static Connection conn = MySQLConnection.Connection();
	public void del(String matk) 
	{
		int rs = 0;
		try {
			PreparedStatement st = conn.prepareStatement("DELETE FROM account WHERE MaTaiKhoan = '"+matk+"'");
					rs = st.executeUpdate();
				
		}	
			catch(Exception e) {
				System.err.println(e.toString());
			}
			

	}
}

	

	

