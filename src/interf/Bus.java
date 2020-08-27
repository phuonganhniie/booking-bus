package interf;


public class Bus {
	protected int BusID;
	protected int IDLocation;
	protected String GioXuatPhat;
	protected String GioDen;
	protected String NgayXuatPhat;
	protected String NgayDen;
	protected String DiemXuatPhat;
	protected String DiemDen;
	protected int SoGhe;
	protected int nGhe;
	protected String BienSo;
	protected String TaiXe;
	protected String TinhTrang;
	protected String BenXe;
	protected int Gia;	

	public String getBenXe() {
		return BenXe;
	}
	public void setBenXe(String benXe) {
		BenXe = benXe;
	}
	public String getNgayDen() {
		return NgayDen;
	}
	public void setNgayDen(String ngayDen) {
		NgayDen = ngayDen;
	}
	public String getTinhTrang() {
		return TinhTrang;
	}
	public void setTinhTrang(String tinhTrang) {
		TinhTrang = tinhTrang;
	}
	public String getGioDen() {
		return GioDen;
	}
	public void setGioDen(String gioDen) {
		GioDen = gioDen;
	}
	public int getnGhe() {
		return nGhe;
	}
	public void setnGhe(int nGhe) {
		this.nGhe = nGhe;
	}
	public int getGia() {
		return Gia;
	}
	public void setGia(int gia) {
		this.Gia = gia;
	}
	public String getNgayXuatPhat() {
		return NgayXuatPhat;
	}
	public void setNgayXuatPhat(String ngayXuatPhat) {
		this.NgayXuatPhat = ngayXuatPhat;
	}
	
	public int getIDLocation() {
		return IDLocation;
	}
	public void setIDLocation(int iDLocation) {
		this.IDLocation = iDLocation;
	}
	
	public String getGioXuatPhat() {
		return GioXuatPhat;
	}
	public void setGioXuatPhat(String gioXuatPhat) {
		this.GioXuatPhat = gioXuatPhat;
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
		this.DiemDen = diemDen;
	}
	public int getBusID() {
		return BusID;
	}
	public void setBusID(int busID) {
		this.BusID = busID;
	}
	public int getSoGhe() {
		return SoGhe;
	}
	public void setSoGhe(int soGhe) {
		this.SoGhe = soGhe;
	}
	public String getBienSo() {
		return BienSo;
	}
	public void setBienSo(String bienSo) {
		this.BienSo = bienSo;
	}
	public String getTaiXe() {
		return TaiXe;
	}
	public void setTaiXe(String taiXe) {
		this.TaiXe = taiXe;
	}	
}

