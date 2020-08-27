package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mySQLConnection.MySQLConnection;

public class AddTicketDb {
	protected static Connection conn = MySQLConnection.Connection();
	public static void AddTicket(String busid, String fname, String pnumber, String inumber, String address,
			String sseat, String accountid) {
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis); 
		StringBuilder sb = new StringBuilder();
		try {
			PreparedStatement st = conn.prepareStatement("INSERT INTO ticket (TenKhach, CMND, SDT, DiaChi, NgayDat, IDLocation, IDBus, SeatPosition, PriceID, Status, IDaccount) "
					+ "SELECT '" + fname + "', '" + inumber + "', '" + pnumber + "', '" + address + "', '" + date + "', bus.IDLocation, bus.BusID, '"
							+ sseat + "', price.PriceID, " + "'Booked'" + ", '" + accountid + "'" 
					+ "from bus INNER JOIN seatposition ON bus.SeatID = seatposition.SeatID "
					+ "INNER JOIN location ON bus.IDLocation = location.LocationID "
					+ "INNER JOIN price ON location.PriceID = price.PriceID "
					+ "where bus.BusID='" + busid + "'");
			st.execute();
			
			st = conn.prepareStatement("select seatposition.BookedSeat from bus INNER JOIN seatposition ON bus.SeatID = seatposition.SeatID where bus.BusID='" + busid + "'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				sb.append(rs.getString(1));
			}
			sb.append(" " + sseat);
			System.out.println(sb);
			
			st = conn.prepareStatement("update seatposition INNER JOIN bus ON seatposition.SeatID = bus.BusID SET seatposition.BookedSeat='" + sb + "' where bus.BusID='" + busid + "'");
			st.execute();
			
			rs.close();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
