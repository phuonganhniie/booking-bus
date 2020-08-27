package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import interf.Bus;

import mySQLConnection.MySQLConnection;

public class DisplayBus {
	protected static Connection conn = MySQLConnection.Connection();
	public List<Bus> BusList() {
		List<Bus> al = new ArrayList<Bus>();
		try {
			PreparedStatement st = conn.prepareStatement("select bus.BusID, bus.IDLocation, location.NgayXuatPhat, location.GioXuatPhat, "
					+ "location.NgayDen, location.GioDen, local_from.name, local.name, bus.SoGhe, bus.SeatID, bus.BienSo, bus.TaiXe, "
					+ "bus.TinhTrang, BusStation.name, price.Gia from bus INNER JOIN location ON bus.IDLocation = location.LocationID "
					+ "INNER JOIN local_from ON location.DiemXuatPhat = local_from.id "
					+ "INNER JOIN local ON location.DiemDen = local.id "
					+ "INNER JOIN price ON location.PriceID = price.PriceID "
					+ "INNER JOIN BusStation ON bus.StationID = BusStation.BusStationID where bus.TinhTrang='P' "
					+ "ORDER BY bus.BusID");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Bus Buses = new Bus();
				Buses.setBusID(rs.getInt(1));
				Buses.setIDLocation(rs.getInt(2));
				Buses.setNgayXuatPhat(rs.getString(3));
				Buses.setGioXuatPhat(rs.getString(4));
				Buses.setNgayDen(rs.getString(5));
				Buses.setGioDen(rs.getString(6));
				Buses.setDiemXuatPhat(rs.getString(7));
				Buses.setDiemDen(rs.getString(8));
				Buses.setSoGhe(rs.getInt(9));
				Buses.setnGhe(GetnGhe(rs.getInt(10)));			
				Buses.setBienSo(rs.getString(11));
				Buses.setTaiXe(rs.getString(12));
				Buses.setTinhTrang(rs.getString(13));
				Buses.setBenXe(rs.getString(14));
				Buses.setGia(rs.getInt(15));				
				al.add(Buses);
			}
			rs.close();
			return al;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private int GetnGhe(int SeatID) {
		try {
			PreparedStatement st = conn.prepareStatement("select * from seatposition where SeatID='" + SeatID + "'");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String[]arrS = rs.getString("BookedSeat").split("\\s+");
				if(arrS[0].length() == 0){
					return 0;
				}
				return arrS.length;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return 0;
	}

	public List<Bus> ChosenBus(String BusID) {
		List<Bus> al = new ArrayList<Bus>();
		
		try {
			PreparedStatement st = conn.prepareStatement("select bus.BusID, bus.IDLocation, location.NgayXuatPhat, location.GioXuatPhat, "
					+ "location.NgayDen, location.GioDen, location.DiemXuatPhat, location.DiemDen, bus.SoGhe, bus.BienSo, bus.TaiXe, price.Gia "
					+ "from bus INNER JOIN location ON bus.BusID = location.LocationID "
					+ "INNER JOIN price ON location.PriceID = price.PriceID where BusID='" + BusID + "'");
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				Bus Buses = new Bus();
				Buses.setBusID(rs.getInt(1));
				Buses.setIDLocation(rs.getInt(2));
				Buses.setNgayXuatPhat(rs.getString(3));
				Buses.setGioXuatPhat(rs.getString(4));
				Buses.setNgayDen(rs.getString(5));
				Buses.setGioDen(rs.getString(6));
				Buses.setDiemXuatPhat(rs.getString(7));
				Buses.setDiemDen(rs.getString(8));
				Buses.setSoGhe(rs.getInt(9));
				Buses.setBienSo(rs.getString(10));
				Buses.setTaiXe(rs.getString(11));
				Buses.setGia(rs.getInt(12));
				al.add(Buses);
			}
			rs.close();
			return al;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
