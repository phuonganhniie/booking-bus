package model;

	import java.sql.*;

import mySQLConnection.MySQLConnection;

	public class userdetail {
		protected static Connection conn = MySQLConnection.Connection();
		public ResultSet user(String tk, String mk){ 
		{
			try {
				PreparedStatement st = conn.prepareStatement("SELECT * FROM account where TaiKhoan = '"+tk+"' and MatKhau = '"+mk+"'"); 
				ResultSet rs = st.executeQuery();
				return rs;
			}	
				catch(Exception e) {
					System.err.println(e.toString());
				}
				return null;	
				}

		}
}
