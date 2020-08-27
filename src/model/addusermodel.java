package model;

import java.sql.*;

import mySQLConnection.MySQLConnection;

public class addusermodel {
	protected static Connection conn = MySQLConnection.Connection();
	public int add(String taikhoan, String matkhau , String cmnd, String hoten, String sdt, String diachi, String vaitro) 
	{
		int rs = 0;
		try {
			PreparedStatement st = conn.prepareStatement("INSERT INTO account(TaiKhoan, MatKhau, CMND, HoTen, SDT, DiaChi, VaiTro)"
					+ "values('"+taikhoan+"','"+matkhau+"','"+cmnd+"','"+hoten+"', '"+sdt+"', '"+diachi+"', '"+vaitro+"')");
				
			rs = st.executeUpdate();
					return rs;
		}	
			catch(Exception e) {
				System.err.println(e.toString());
			}
			return 0;	
			}

	}

	

	

