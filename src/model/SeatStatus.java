package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mySQLConnection.MySQLConnection;

public class SeatStatus {
	protected static Connection conn = MySQLConnection.Connection();
	public List<String> GetSeat(int i) {
		List<String> ls = new ArrayList<String>();
		int id = 0;
		try {
			PreparedStatement st = conn.prepareStatement("select SeatID from Bus where BusID='" + i + "'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				id = rs.getInt("SeatID");
			}
			
			st = conn.prepareStatement("select * from SeatPosition where SeatID='" + id + "'");
			rs = st.executeQuery();
			
			while(rs.next()) {
				String[]arrS = rs.getString("BookedSeat").split("\\s+");
				for(int j = 0; j < arrS.length; j++) {
					ls.add(arrS[j]);
				}

			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return ls;
	}
}
