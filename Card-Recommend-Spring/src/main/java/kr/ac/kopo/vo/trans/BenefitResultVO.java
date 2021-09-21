package kr.ac.kopo.vo.trans;

public class BenefitResultVO  implements Comparable<BenefitResultVO>{
	private int cardId;
	private String benefitName;
	private String benefitInfo;
	private String benefitCode;
	private int workSector1Code;
	private int workSector2Code;
	private String workSector1Name;
	private String workSector2Name;
	private int payTotal;				// 결제 총 합(해당 sector2 기준)
	private int benefitTotal;			// 혜택 총 합(해당 sector2 기준)
	private int benefitCriteria;		// 혜택 기준(ex. 10만원당 5천원 할인 시 10만원 - benefitCriteria, 5천원 - benefitInfo)
	private int perfCriteria;			// 전달 실적 기준
	
	private int limit;//한도제한

	
	@Override
	public int compareTo(BenefitResultVO b) {
		return Integer.compare(this.workSector2Code, b.workSector2Code);//2차업종 코드 오름차순 정
	}
	
	
	public int getCardId() {
		return cardId;
	}

	public void setCardId(int cardId) {
		this.cardId = cardId;
	}

	public String getBenefitName() {
		return benefitName;
	}

	public void setBenefitName(String benefitName) {
		this.benefitName = benefitName;
	}

	public String getBenefitInfo() {
		return benefitInfo;
	}

	public void setBenefitInfo(String benefitInfo) {
		this.benefitInfo = benefitInfo;
	}

	public String getBenefitCode() {
		return benefitCode;
	}

	public void setBenefitCode(String benefitCode) {
		this.benefitCode = benefitCode;
	}

	public int getWorkSector1Code() {
		return workSector1Code;
	}

	public void setWorkSector1Code(int workSector1Code) {
		this.workSector1Code = workSector1Code;
	}

	public int getWorkSector2Code() {
		return workSector2Code;
	}

	public void setWorkSector2Code(int workSector2Code) {
		this.workSector2Code = workSector2Code;
	}

	public String getWorkSector1Name() {
		return workSector1Name;
	}

	public void setWorkSector1Name(String workSector1Name) {
		this.workSector1Name = workSector1Name;
	}

	public String getWorkSector2Name() {
		return workSector2Name;
	}

	public void setWorkSector2Name(String workSector2Name) {
		this.workSector2Name = workSector2Name;
	}

	
	public int getPayTotal() {
		return payTotal;
	}

	public void setPayTotal(int payTotal) {
		this.payTotal = payTotal;
	}

	public int getBenefitTotal() {
		return benefitTotal;
	}

	public void setBenefitTotal(int benefitTotal) {
		this.benefitTotal = benefitTotal;
	}

	public int getBenefitCriteria() {
		return benefitCriteria;
	}

	public void setBenefitCriteria(int benefitCriteria) {
		this.benefitCriteria = benefitCriteria;
	}

	public int getPerfCriteria() {
		return perfCriteria;
	}

	public void setPerfCriteria(int perfCriteria) {
		this.perfCriteria = perfCriteria;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	@Override
	public String toString() {
		return "BenefitResultVO [cardId=" + cardId + ", benefitName=" + benefitName + ", benefitInfo=" + benefitInfo
				+ ", benefitCode=" + benefitCode + ", workSector1Code=" + workSector1Code + ", workSector2Code="
				+ workSector2Code + ", workSector1Name=" + workSector1Name + ", workSector2Name=" + workSector2Name
				+ ", payTotal=" + payTotal + ", benefitTotal=" + benefitTotal + ", benefitCriteria=" + benefitCriteria
				+ ", perfCriteria=" + perfCriteria + ", limit=" + limit + "]";
	}

	

	
	
}
