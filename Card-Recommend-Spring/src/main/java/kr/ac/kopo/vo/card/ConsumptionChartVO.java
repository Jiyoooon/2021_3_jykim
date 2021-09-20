package kr.ac.kopo.vo.card;

import java.util.List;

//소비내역 차트 정보
public class ConsumptionChartVO {
	private int workSector1Code;
	private String workSector1Name;
	private long sectorBalance;
	private long totalBalance;
	private int memberId;
	private String startDate;
	private String endDate;
	
	private List<ConsumptionChart2VO> chart2List;
	
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getWorkSector1Code() {
		return workSector1Code;
	}
	public void setWorkSector1Code(int workSector1Code) {
		this.workSector1Code = workSector1Code;
	}
	public String getWorkSector1Name() {
		return workSector1Name;
	}
	public void setWorkSector1Name(String workSector1Name) {
		this.workSector1Name = workSector1Name;
	}
	public long getSectorBalance() {
		return sectorBalance;
	}
	public void setSectorBalance(long sectorBalance) {
		this.sectorBalance = sectorBalance;
	}
	public long getTotalBalance() {
		return totalBalance;
	}
	public void setTotalBalance(long totalBalance) {
		this.totalBalance = totalBalance;
	}
	
	
	
	public List<ConsumptionChart2VO> getChart2List() {
		return chart2List;
	}
	public void setChart2List(List<ConsumptionChart2VO> chart2List) {
		this.chart2List = chart2List;
	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	@Override
	public String toString() {
		return "ConsumptionChartVO [workSector1Code=" + workSector1Code + ", workSector1Name=" + workSector1Name
				+ ", sectorBalance=" + sectorBalance + ", totalBalance=" + totalBalance + ", memberId=" + memberId
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", chart2List=" + chart2List + "]";
	}
	
	
	
}
