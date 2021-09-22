package kr.ac.kopo.vo.trans;

import java.util.List;

public class BenefitParamsVO {
	private int memberId;
	private int payTotal;
	private String cardId; // 여러개 올 수 있음
	private String start;
	private String end;
	private int benefitType; // 0 : 할인+적립 / 1 : 할인 / 2 : 적립
	private List<BenefitResultVO> benefitList;
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public int getPayTotal() {
		return payTotal;
	}
	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}
	public String getCardId() {
		return cardId;
	}
	public void setCardId(String cardId) {
		this.cardId = cardId;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
	public int getBenefitType() {
		return benefitType;
	}
	public void setBenefitType(int benefitType) {
		this.benefitType = benefitType;
	}
	public List<BenefitResultVO> getBenefitList() {
		return benefitList;
	}
	public void setBenefitList(List<BenefitResultVO> benefitList) {
		this.benefitList = benefitList;
	}
	@Override
	public String toString() {
		return "BenefitParamsVO [memberId=" + memberId + ", cardId=" + cardId + ", start=" + start + ", end=" + end
				+ ", benefitType=" + benefitType + ", benefitList=" + benefitList + "]";
	}
	
	
	
	

}
