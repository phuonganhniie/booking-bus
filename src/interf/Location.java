package interf;

public class Location {
	protected int IDLocation;
	protected String NgayXuatPhat;
	protected String DiemXuatPhat;
	protected String DiemDen;
	protected int PriceID;
	
	public int getPriceID() {
		return PriceID;
	}
	public void setPriceID(int priceID) {
		PriceID = priceID;
	}
	public int getIDLocation() {
		return IDLocation;
	}
	public void setIDLocation(int iDLocation) {
		IDLocation = iDLocation;
	}
	public String getNgayXuatPhat() {
		return NgayXuatPhat;
	}
	public void setNgayXuatPhat(String ngayXuatPhat) {
		NgayXuatPhat = ngayXuatPhat;
	}
	public String getDiemXuatPhat() {
		return DiemXuatPhat;
	}
	public void setDiemXuatPhat(String diemXuatPhat) {
		DiemXuatPhat = diemXuatPhat;
	}
	public String getDiemDen() {
		return DiemDen;
	}
	public void setDiemDen(String diemDen) {
		DiemDen = diemDen;
	}
}
