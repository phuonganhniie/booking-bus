package model;

	import java.sql.*;

import mySQLConnection.MySQLConnection;

	public class checkrole {
		protected static Connection conn = MySQLConnection.Connection();
		public static String checkrole1(String tk, String mk){ 
		{
			try {
				PreparedStatement st = conn.prepareStatement("SELECT * FROM account where TaiKhoan = '"+tk+"' and MatKhau = '"+mk+"'"); 
						ResultSet rs = st.executeQuery();
						
						if(rs.next()) {
							
							return rs.getString("VaiTro");
							}
							
			}	
				catch(Exception e) {
					System.err.println(e.toString());
				}
				return null;	
				}

		}
}
