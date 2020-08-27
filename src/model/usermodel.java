package model;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import interf.userVO;


public class usermodel {
	public Connection getConnection() throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking?serverTimezone=UTC","root","");
		
	}
	public List<userVO> listuser()
	{
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<userVO> list_user = new ArrayList<userVO>();
		
		try {
			con = getConnection();
			st = con.prepareStatement("Select * from account");
			rs = st.executeQuery();
			while (rs.next()) {
				userVO newuser = new userVO();
				newuser.setMataikhoan(rs.getInt("MaTaiKhoan"));
				newuser.setTaikhoan(rs.getString("TaiKhoan"));
				newuser.setMatkhau(rs.getString("MatKhau"));
				newuser.setCmnd(rs.getString("CMND"));
				newuser.setHoten(rs.getString("HoTen"));
				newuser.setSdt(rs.getString("SDT"));
				newuser.setDiachi(rs.getString("DiaChi"));
				newuser.setVaitro(rs.getString("VaiTro"));
			
				list_user.add(newuser);
			}
			}catch(Exception e)
		{
			e.printStackTrace();
		}
		return list_user;
	
}
	public List<userVO> userdetail(int id)
{
	Connection con = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	List<userVO> list_user = new ArrayList<>();
	
	try {
		con = getConnection();
		st = con.prepareStatement("Select * from account where MaTaiKhoan = ?");
		st.setInt(1, id);
		rs = st.executeQuery();
		while (rs.next()) {
			userVO newuser = new userVO();
			newuser.setMataikhoan(rs.getInt("MaTaiKhoan"));
			newuser.setTaikhoan(rs.getString("TaiKhoan"));
			newuser.setMatkhau(rs.getString("MatKhau"));
			newuser.setCmnd(rs.getString("CMND"));
			newuser.setHoten(rs.getString("HoTen"));
			newuser.setSdt(rs.getString("SDT"));
			newuser.setDiachi(rs.getString("DiaChi"));
			newuser.setVaitro(rs.getString("VaiTro"));
			list_user.add(newuser);
		}
		}catch(Exception e)
	{
		e.printStackTrace();
	}
	return list_user;
}
	
			//EDITED//
	
	public ResultSet checkemail(String tk)
	{
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		List<userVO> list_user = new ArrayList<userVO>();
		
		try {
			con = getConnection();
			st = con.prepareStatement("Select * from account where TaiKhoan=?");
			st.setString(1, tk);
			rs = st.executeQuery();
			return rs;
			}catch(Exception e)
		{
			e.printStackTrace();
		}
		return rs;
	
}
}
