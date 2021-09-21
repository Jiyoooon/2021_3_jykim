package kr.ac.kopo.vo;

import java.util.List;

public class ParamsVO2 {
	private int cardId;
	private String start;
	private String end;
	private List<TestVO> testList;//프로시저 결과값 리턴 용도
	//private String testList;
	
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
//	public String getTestList() {
//		return testList;
//	}
//	public void setTestList(String testList) {
//		this.testList = testList;
//	}
//	@Override
//	public String toString() {
//		return "ParamsVO2 [cardId=" + cardId + ", start=" + start + ", end=" + end + ", testList=" + testList + "]";
//	}
	
	
	public List<TestVO> getTestList() {
		return testList;
	}
	public void setTestList(List<TestVO> testList) {
		this.testList = testList;
	}
	@Override
	public String toString() {
		return "ParamsVO2 [cardId=" + cardId + ", start=" + start + ", end=" + end + ", testList=" + testList + "]";
	}
	
	
	
}
