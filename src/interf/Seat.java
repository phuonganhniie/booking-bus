package interf;



public class Seat {
	private int BusID;
	private String[] pSeat;
	
	public int getBusID() {
		return BusID;
	}
	public void setBusID(int busID) {
		BusID = busID;
	}
	public String[] getpSeat() {
		return pSeat;
	}
	public void setpSeat(String pSeat[]) {
		this.pSeat = pSeat;
	}	
}
