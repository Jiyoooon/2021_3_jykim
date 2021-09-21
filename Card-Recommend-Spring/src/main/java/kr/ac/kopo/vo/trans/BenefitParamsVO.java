package kr.ac.kopo.vo.trans;

import java.util.List;

public class BenefitParamsVO {
	private int memberId;
	private int cardId;
	private String start;
	private String end;
	private List<BenefitResultVO> benefitList;
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
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
	public List<BenefitResultVO> getBenefitList() {
		return benefitList;
	}
	public void setBenefitList(List<BenefitResultVO> benefitList) {
		this.benefitList = benefitList;
	}
	@Override
	public String toString() {
		return "BenefitParamsVO [memberId=" + memberId + ", cardId=" + cardId + ", start=" + start + ", end=" + end
				+ ", benefitList=" + benefitList + "]";
	}
	
	
	

}
