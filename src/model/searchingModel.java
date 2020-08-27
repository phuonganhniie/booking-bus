package model;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

//import com.mysql.fabric.xmlrpc.base.Array;

import interf.*;
import mySQLConnection.MySQLConnection;

public class searchingModel {
	protected static Connection conn = MySQLConnection.Connection();
	public List<Local> listlocal() {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Local> listlocal = new ArrayList<>();
		
		try {
			st = conn.prepareStatement("select * from local");
			rs = st.executeQuery();
			while(rs.next()) {
				Local local = new Local();
				local.setId(rs.getInt("id"));
				local.setName(rs.getString("name"));
				listlocal.add(local);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listlocal;
	}
	
	public List<Local> listlocalfrom() {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Local> listlocalfrom = new ArrayList<>();
		try {
			st = conn.prepareStatement("select * from local_from");
			rs = st.executeQuery();
			
			while(rs.next()) {
				Local localfrom = new Local();
				localfrom.setId(rs.getInt("id"));
				localfrom.setName(rs.getString("name"));
				localfrom.setRouteimg(rs.getString("route_img"));
				listlocalfrom.add(localfrom);
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listlocalfrom;
	}
	
	public List<Location> listlocation() {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Location> listlocation = new ArrayList<>();
		
		try {
			st = conn.prepareStatement("select * from location");
			rs = st.executeQuery();
			
			while(rs.next()) {		
				Location location = new Location();
				location.setIDLocation(rs.getInt("LocationID"));
				location.setNgayXuatPhat(rs.getString("NgayXuatPhat")); 				
				location.setDiemXuatPhat(rs.getString("DiemXuatPhat"));
				location.setDiemDen(rs.getString("DiemDen"));
				location.setPriceID(rs.getInt("PriceID"));
				
				listlocation.add(location);
			}			
			rs.close();
			st.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return listlocation;
	}
	
	public List<Location> listlocation_from() {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Location> listlocation_from = new ArrayList<>();
		
		try {
			st = conn.prepareStatement("select * from location where DiemXuatPhat=?");
			rs = st.executeQuery();
			
			while(rs.next()) {		
				Location location = new Location();			
				location.setDiemXuatPhat(rs.getString("DiemXuatPhat"));
				
				listlocation_from.add(location);
			}	
			rs.close();
			st.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return listlocation_from;
	}
	
	public List<Bus> searchbus(String DiemXP, String DiemDen, String NgayXP) {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Bus> searchbus = new ArrayList<>();
		try {
			st = conn.prepareStatement("SELECT location.NgayXuatPhat, location.NgayDen, location.GioXuatPhat,location.GioDen, "
					+ "bus.BienSo, local_from.name, local.name, price.Gia, location.LocationID,busstation.name, bus.BusID "
					+ "FROM location INNER JOIN bus ON bus.IDLocation = location.LocationID "
					+ "INNER JOIN local ON local.id = location.DiemDen "
					+ "INNER JOIN local_from ON local_from.id = location.DiemXuatPhat "
					+ "INNER JOIN price ON price.PriceID = location.PriceID "
					+ "INNER JOIN busstation ON bus.StationID = busstation.BusStationID "
					+ "WHERE local_from.name = '"+DiemXP+"' AND local.name = '"+DiemDen+"' AND location.NgayXuatPhat = '"+NgayXP+"'");
			rs = st.executeQuery();
			while(rs.next()) {
				Bus searchingbus = new Bus();
				searchingbus.setBienSo(rs.getString(5));
				searchingbus.setGioXuatPhat(rs.getString(3));
				searchingbus.setGioDen(rs.getString(4));
				searchingbus.setNgayXuatPhat(rs.getString(1));
				searchingbus.setNgayDen(rs.getString(2));
				searchingbus.setDiemXuatPhat(rs.getString(6));
				searchingbus.setDiemDen(rs.getString(7));
				searchingbus.setGia(rs.getInt(8));
				searchingbus.setIDLocation(rs.getInt(9));
				searchingbus.setBenXe(rs.getString(10));
				searchingbus.setBusID(Integer.valueOf(rs.getString(11)));
				searchbus.add(searchingbus);
			}
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return searchbus;
	}
	
	public List<Bus> seeroute(String DiemXPP) {
		PreparedStatement st = null;
		ResultSet rs = null;
		List<Bus> seeroute = new ArrayList<>();
		 //Get current date
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis);
		//
		try {
			st = conn.prepareStatement("SELECT location.NgayXuatPhat,location.NgayDen,location.GioXuatPhat,location.GioDen, "
					+ "bus.BienSo, local_from.name,local.name,price.Gia,location.LocationID,busstation.name, bus.BusID "
					+ "FROM location INNER JOIN bus ON bus.IDLocation = location.LocationID "
					+ "INNER JOIN local ON local.id = location.DiemDen "
					+ "INNER JOIN local_from ON local_from.id = location.DiemXuatPhat "
					+ "INNER JOIN price ON price.PriceID = location.PriceID "
					+ "INNER JOIN busstation ON bus.StationID = busstation.BusStationID "
					+ "WHERE local_from.name = '"+DiemXPP+"' and location.NgayXuatPhat >= '" + date +"'");
			rs = st.executeQuery();
			while(rs.next()) {
				Bus seeingroute = new Bus();
				seeingroute.setBienSo(rs.getString(5));
				seeingroute.setGioXuatPhat(rs.getString(3));
				seeingroute.setGioDen(rs.getString(4));
				seeingroute.setNgayXuatPhat(rs.getString(1));
				seeingroute.setNgayDen(rs.getString(2));
				seeingroute.setDiemXuatPhat(rs.getString(6));
				seeingroute.setDiemDen(rs.getString(7));
				seeingroute.setGia(rs.getInt(8));
				seeingroute.setIDLocation(rs.getInt(9));
				seeingroute.setBenXe(rs.getString(10));
				seeingroute.setBusID(Integer.valueOf(rs.getString(11)));
				seeroute.add(seeingroute);
			}
			
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return seeroute;
	}
}
