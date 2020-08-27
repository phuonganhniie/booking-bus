package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import interf.Ticket;
import mySQLConnection.MySQLConnection;

public class viewBookedTicket {
	protected static Connection conn = MySQLConnection.Connection();
	public static List<Ticket> View(String AccountID) {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Ticket> viewbookedticket = new ArrayList();

		try {
			st = conn.prepareStatement(
					"SELECT ticket.TicKetID, ticket.TenKhach, local_from.name, local.name, location.NgayXuatPhat, "
					+ "bus.BienSo, price.Gia, local_from.name, local.name, location.GioXuatPhat, ticket.SeatPosition, ticket.Status "
					+ "FROM ticket JOIN location ON ticket.IDLocation = location.LocationID "
					+ "JOIN local ON local.id = location.DiemDen "
					+ "JOIN local_from ON local_from.id = location.DiemXuatPhat "
					+ "JOIN price ON price.PriceID = ticket.PriceID "
					+ "JOIN bus ON bus.BusID = ticket.IDBus "
					+ "WHERE ticket.IDaccount = '"+AccountID+"'");
			rs = st.executeQuery();

			while (rs.next()) {
				Ticket ticket = new Ticket();
				ticket.setTicketID(Integer.valueOf(rs.getString(1)));
				ticket.setTenKhach(rs.getString(2));
				ticket.setBienSo(rs.getString(6));
				ticket.setNgayXuatPhat(rs.getString(5));
				ticket.setGioXuatPhat(rs.getString(10));
				ticket.setDiemXuatPhat(rs.getString(3));
				ticket.setDiemDen(rs.getString(4));
				ticket.setSeatPosition(rs.getString(11));
				ticket.setStatus(rs.getString(12));
				ticket.setGia(GetSum(rs.getString(11), rs.getInt(7)));
				viewbookedticket.add(ticket);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewbookedticket;
	}
	
	private static int GetSum(String SeatPosition, int Price) {
		String[] str = SeatPosition.split(" ");
		int sum = 0;
		for(String s : str) {
			sum += Price;
		}
		return sum;
	}
}
