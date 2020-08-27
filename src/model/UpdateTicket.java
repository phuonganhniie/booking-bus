package model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mySQLConnection.MySQLConnection;
import controller.UpdateSeller;

public class UpdateTicket {
	protected static Connection conn = MySQLConnection.Connection();
	public static void Update(String name, String cmnd, String phone, String from, String to, String date, String figue, String spos, 
			String price, String status, String ticketid, HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		StringBuilder sb = check(figue, ticketid);
		if(ExistSeat(sb, spos)) {
			try {
				sb.append(spos);
				PreparedStatement st = conn.prepareStatement("UPDATE ticket INNER JOIN bus ON ticket.IDBus = bus.BusID "
						+ "INNER JOIN seatposition ON bus.SeatID = seatposition.SeatID SET seatposition.BookedSeat='" + sb 
						+ "' where ticket.TicketID='" + ticketid + "'");
				st.execute();
				
				st = conn.prepareStatement("UPDATE ticket SET NgayDat='" + date 
						+ "', SeatPosition='" + spos + "', Status='" + status + "' "
						+ "where TicketID='" + ticketid + "'");
				st.execute();
				
				st.close();
				UpdateSeller.MessageSuccess(name, cmnd, phone, from, to, date, spos, price, status, ticketid, request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else {
			UpdateSeller.MessageFailed(name, cmnd, phone, from, to, date, figue, price, status, ticketid, request, response);
		}
		
	}
	
	private static boolean ExistSeat(StringBuilder sb, String spos) {
		boolean b = true;
		String[] str = sb.toString().split("\\s+");
		String[] str2 = spos.split("\\s+");
		for(String sg : str) {
			for(String sg2 : str2) {
				if(sg.equals(sg2)) {
					b = false;
				}
			}
		}
		return b;
	}

	private static StringBuilder check(String figue, String ticketid) {
		StringBuilder sb = new StringBuilder();
		PreparedStatement st;
		try {
			st = conn.prepareStatement("select seatposition.BookedSeat from ticket INNER JOIN bus ON ticket.IDBus = bus.BusID "
					+ "INNER JOIN seatposition on bus.SeatID = seatposition.SeatID where ticket.TicketID='" + ticketid + "'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String[] arrDbSeat = rs.getString(1).split("\\s+");
				sb = CheckSeat(figue.split("\\s+"), arrDbSeat);
			}
			rs.close();
			st.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return sb;
	}
	
	private static StringBuilder CheckSeat(String[] arrSeat, String[] arrDbSeat) {
		StringBuilder sb = new StringBuilder();
		int flag = 0;
		for(String sdb : arrDbSeat) {
			flag = 0;
			for(String str : arrSeat) {
				if(sdb.equals(str)) {
					flag = 1;
					break;
				}
			}
			if(flag == 0) {
				sb.append(sdb + " ");
			}
		}
		return sb;
	}
}
