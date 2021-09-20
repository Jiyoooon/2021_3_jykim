package kr.ac.kopo.vo.card;

//소비내역 2차업종 차트 정보
public class ConsumptionChart2VO {
	private int workSector2Code;
	private String workSector2Name;
	private long sector2Balance;	//2차업종 소비 합계
	private long sector1Balance;	//1차 업종 소비 합계
	private double percentage;		//sector2Balance / sector1Balance
	public int getWorkSector2Code() {
		return workSector2Code;
	}
	public void setWorkSector2Code(int workSector2Code) {
		this.workSector2Code = workSector2Code;
	}
	public String getWorkSector2Name() {
		return workSector2Name;
	}
	public void setWorkSector2Name(String workSector2Name) {
		this.workSector2Name = workSector2Name;
	}
	public long getSector2Balance() {
		return sector2Balance;
	}
	public void setSector2Balance(long sector2Balance) {
		this.sector2Balance = sector2Balance;
	}
	public long getSector1Balance() {
		return sector1Balance;
	}
	public void setSector1Balance(long sector1Balance) {
		this.sector1Balance = sector1Balance;
	}
	public double getPercentage() {
		return percentage;
	}
	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}
	@Override
	public String toString() {
		return "ConsumptionChart2VO [workSector2Code=" + workSector2Code + ", workSector2Name=" + workSector2Name
				+ ", sector2Balance=" + sector2Balance + ", sector1Balance=" + sector1Balance + ", percentage="
				+ percentage + "]";
	}
	
	
	
}
