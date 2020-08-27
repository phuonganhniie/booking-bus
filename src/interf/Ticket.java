package interf;

public class Ticket {
	protected int TicketID;
	protected String TenKhach;
	protected String CMND;
	protected String SDT;
	protected String DiaChi;
	protected String NgayDat;
	protected String NgayXuatPhat;
	protected String GioXuatPhat;
	protected String DiemXuatPhat;
	protected String DiemDen;
	protected int BusID;
	protected String BienSo;
	protected String SeatPosition;
	protected int Gia;
	protected String Status;
	protected int AccountID;
	
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}	
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		Gia = gia;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String sDT) {
		SDT = sDT;
	}	
	public String getNgayXuatPhat() {
		return NgayXuatPhat;
	}
	public void setNgayXuatPhat(String ngayXuatPhat) {
		NgayXuatPhat = ngayXuatPhat;
	}
	public String getGioXuatPhat() {
		return GioXuatPhat;
	}
	public void setGioXuatPhat(String gioXuatPhat) {
		GioXuatPhat = gioXuatPhat;
	}
	
	public String getDiemXuatPhat() {
		return DiemXuatPhat;
	}
	public void setDiemXuatPhat(String diemXuatPhat) {
		this.DiemXuatPhat = diemXuatPhat;
	}
	public String getDiemDen() {
		return DiemDen;
	}
	public void setDiemDen(String diemDen) {
		DiemDen = diemDen;
	}	
	public String getSeatPosition() {
		return SeatPosition;
	}
	public void setSeatPosition(String seatPosition) {
		SeatPosition = seatPosition;
	}	
	public int getTicketID() {
		return TicketID;
	}
	public void setTicketID(int ticketID) {
		this.TicketID = ticketID;
	}
	public String getTenKhach() {
		return TenKhach;
	}
	public void setTenKhach(String tenKhach) {
		this.TenKhach = tenKhach;
	}
	public String getCMND() {
		return CMND;
	}
	public void setCMND(String cMND) {
		this.CMND = cMND;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String diaChi) {
		this.DiaChi = diaChi;
	}
	public String getNgayDat() {
		return NgayDat;
	}
	public void setNgayDat(String ngayDat) {
		this.NgayDat = ngayDat;
	}
	public int getBusID() {
		return BusID;
	}
	public void setBusID(int busID) {
		this.BusID = busID;
	}
	public int getAccountID() {
		return AccountID;
	}
	public void setAccountID(int accountID) {
		this.AccountID = accountID;
	}
	public String getBienSo() {
		return BienSo;
	}
	public void setBienSo(String bienSo) {
		BienSo = bienSo;
	}
}
