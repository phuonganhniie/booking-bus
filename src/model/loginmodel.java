package model;

	import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mySQLConnection.MySQLConnection;

	public class loginmodel {
		protected static Connection conn = MySQLConnection.Connection();
		public int login(String tk, String mk){ 
		{
			int id = 0;
			try {
				PreparedStatement st = conn.prepareStatement("SELECT * FROM account where TaiKhoan = '"+tk+"' and MatKhau = '"+mk+"'"); 
						ResultSet rs = st.executeQuery();
						if(rs.next()) {
							id= rs.getInt(1);	
						}
						rs.close();
						st.close();
						return id;
			}	
				catch(Exception e) {
					System.err.println(e.toString());
				}
				return id;	
				}
		

		}
		public String getname(String tk, String mk){ 
			{	String name="";
				try {
					PreparedStatement st = conn.prepareStatement("SELECT * FROM account where TaiKhoan = '"+tk+"' and MatKhau = '"+mk+"'"); 
							ResultSet rs = st.executeQuery();
							if(rs.next()) {
								name = rs.getString("HoTen");
								
							}
							rs.close();
							st.close();
							return name;
				}	
					catch(Exception e) {
						System.err.println(e.toString());
					}
					return name;	
					}
			

			}
}
