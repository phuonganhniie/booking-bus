package model;

import java.sql.*;

import mySQLConnection.MySQLConnection;

public class updateusermodel {
	protected static Connection conn = MySQLConnection.Connection();
	public int update(int matk, String taikhoan, String matkhau , String cmnd, String hoten, String sdt, String diachi, String vaitro) 
	{
		int rs = 0;
		try {
			PreparedStatement st = conn.prepareStatement("UPDATE account SET TaiKhoan='"+taikhoan+"', MatKhau='"+matkhau+"', CMND='"+cmnd+"', HoTen='"+hoten+"', SDT='"+sdt+"', DiaChi='"+diachi+"', VaiTro='"+vaitro+"'WHERE MaTaiKhoan='"+matk+"'");
			
			rs = st.executeUpdate();
			return rs;
		}	
			catch(Exception e) {
				System.err.println(e.toString());
			}
			return 0;	
			}

	}

	

	

