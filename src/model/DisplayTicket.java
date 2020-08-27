package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import interf.Ticket;
import mySQLConnection.MySQLConnection;

public class DisplayTicket {
	protected static Connection conn = MySQLConnection.Connection();
	public List<Ticket> TicketList() {
		List<Ticket> al = new ArrayList<Ticket>();
		try {
			PreparedStatement st = conn.prepareStatement("select ticket.TicketID, ticket.TenKhach, ticket.CMND, ticket.DiaChi, ticket.NgayDat, "
					+ "ticket.SDT, location.NgayXuatPhat, location.GioXuatPhat, local_from.name, local.name, ticket.IDBus, ticket.seatposition, "
					+ "price.Gia, ticket.Status, ticket.IDaccount "
					+ "FROM ticket INNER JOIN location ON ticket.IDLocation=location.LocationID " 
					+ "INNER JOIN bus ON ticket.IDBus= bus.BusID "  
					+ "INNER JOIN local ON location.DiemDen = local.id "  
					+ "INNER JOIN local_from ON location.DiemXuatPhat = local_from.id "
					+ "INNER JOIN price ON ticket.PriceID = price.PriceID "
					+ "ORDER BY ticket.NgayDat DESC");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				Ticket Ticket = new Ticket();
				Ticket.setTicketID(rs.getInt(1));
				Ticket.setTenKhach(rs.getString(2));
				Ticket.setCMND(rs.getString(3));
				Ticket.setDiaChi(rs.getString(4));
				Ticket.setNgayDat(rs.getString(5));
				Ticket.setSDT(rs.getString(6));
				Ticket.setNgayXuatPhat(rs.getString(7));
				Ticket.setGioXuatPhat(rs.getString(8));
				Ticket.setDiemXuatPhat(rs.getString(9));
				Ticket.setDiemDen(rs.getString(10));
				Ticket.setBusID(rs.getInt(11));	
				Ticket.setSeatPosition(rs.getString(12));
				Ticket.setGia(GetSum(rs.getString(12),rs.getInt(13)));
				Ticket.setStatus(rs.getString(14));
				Ticket.setAccountID(rs.getInt(15));
				al.add(Ticket);
			}
			rs.close();
			return al;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	private int GetSum(String SeatPosition, int Price) {
		String[] str = SeatPosition.split(" ");
		int sum = 0;
		for(String s : str) {
			sum += Price;
		}
		return sum;
	}
}
