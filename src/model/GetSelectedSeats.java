package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mySQLConnection.MySQLConnection;

public class GetSelectedSeats {
	protected static Connection conn = MySQLConnection.Connection();
	public static String GetSeats(String BusID) {
		try {
			PreparedStatement st = conn.prepareStatement("select seatposition.BookedSeat "
					+ "from bus INNER JOIN seatposition ON bus.SeatID = seatposition.SeatID where bus.BusID='" + BusID + "'");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String[]arrS = rs.getString("BookedSeat").split("\\s+");
				String sb = "";
				int i = 0;
				for(String s : arrS) {
					if(i == 0) {
						sb = sb + s;
						i = 1;
					}
					else {
						sb = sb + " " + s;
					}
				}
				return sb;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}

}
