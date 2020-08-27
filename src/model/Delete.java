package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mySQLConnection.MySQLConnection;

public class Delete {
	protected static Connection conn = MySQLConnection.Connection();
	public static void DeleteTicket(String spos, String ticketid) {
		StringBuilder sb = new StringBuilder();
		try {
			//Lấy ghế sau khi xóa ticket
			PreparedStatement st = conn.prepareStatement("select seatposition.BookedSeat from ticket INNER JOIN bus ON ticket.IDBus = bus.BusID "
					+ "INNER JOIN seatposition on bus.SeatID = seatposition.SeatID where ticket.TicketID='" + ticketid + "'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String[] arrDbSeat = rs.getString(1).split("\\s+");
				sb = CheckSeat(spos.split("\\s+"), arrDbSeat);
			}
			
			//update lại ghế sau khi xóa ticket
			st = conn.prepareStatement("UPDATE ticket INNER JOIN bus ON ticket.IDBus = bus.BusID "
					+ "INNER JOIN seatposition ON bus.SeatID = seatposition.SeatID SET seatposition.BookedSeat='" 
					+ sb + "' where ticket.TicketID='" + ticketid + "'");
			st.execute();
			
			st = conn.prepareStatement("delete from ticket where TicketID='" + ticketid + "'");
			st.execute();
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	private static StringBuilder CheckSeat(String[] arrSeat, String[] arrDbSeat) {
		StringBuilder sb = new StringBuilder();
		int flag = 0;
		int c = 0;
		for(String sdb : arrDbSeat) {
			flag = 0;
			for(String str : arrSeat) {
				if(sdb.equals(str)) {
					flag = 1;
					break;
				}
			}
			
			if(flag == 0 && c == 0) {
				sb.append(sdb);
				c = 1;
			}
			else if(flag == 0) {
				sb.append(" " + sdb);
			}
		}		
		return sb;
	}
}
