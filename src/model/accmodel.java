package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import interf.Account;
import mySQLConnection.MySQLConnection;

public class accmodel {
	Account ac = new Account();
	List<Account> la = new ArrayList<Account>();
	protected static Connection con = MySQLConnection.Connection();
	public List<Account> show(int id) {
		try {
			PreparedStatement st = con.prepareStatement("SELECT * FROM account where MaTaiKhoan ='"+id+"'"); 
					ResultSet rs = st.executeQuery();
					while(rs.next()) {
						ac.setMaTaiKhoan(rs.getInt(1));						
						ac.setTaiKhoan(rs.getString(2));
						ac.setMatKhau(rs.getString(3));
						ac.setCMND(rs.getString(4));
						ac.setHoTen(rs.getString(5));
						ac.setSDT(rs.getString(6));
						ac.setDiaChi(rs.getString(7));
						ac.setVaiTro(rs.getString(8));
						la.add(ac);
					}
					rs.close();
					st.close();
					return la;
		}	
			catch(Exception e) {
				System.err.println(e.toString());
			}
			return null;	
	}
	public boolean update(int id, String tk, String name, String sdt, String cmnd, String address) {
		try {
			PreparedStatement st = con.prepareStatement("UPDATE account SET TaiKhoan ='"+tk+"',CMND ='"+cmnd+"',HoTen ='"+name+"',SDT ='"+sdt+"',DiaChi ='"+address+"' WHERE MaTaiKhoan ='"+id+"'"); 
			if(st.executeUpdate() !=0) {
				st.close();
				return true;
			}
					
		}	
			catch(Exception e) {
				System.err.println(e.toString());
			}
		return false;
	}
	public boolean changePwd(int id , String pwd,String newpwd) {
		try {
			PreparedStatement st = con.prepareStatement("UPDATE account SET MatKhau ='"+newpwd+"' WHERE MaTaiKhoan ='"+id+"' AND MatKhau ='"+pwd+"'"); 
			if(st.executeUpdate() !=0) {
				st.close();
				return true;
			}
					
		}	
			catch(Exception e) {
				System.err.println(e.toString());
			}
		return false;
	}
}
