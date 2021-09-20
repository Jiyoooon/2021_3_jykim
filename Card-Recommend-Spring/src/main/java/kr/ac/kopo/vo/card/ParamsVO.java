package kr.ac.kopo.vo.card;

import java.util.List;

public class ParamsVO {
	private int cardId;
	private String start;
	private String end;
	private List<BenefitResultVO> benefitList;//프로시저 결과값 리턴 용도
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
		return "ParamsVO [cardId=" + cardId + ", start=" + start + ", end=" + end + ", benefitList=" + benefitList
				+ "]";
	}
	
	
	
	
}
