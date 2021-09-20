package kr.ac.kopo.vo.card;

public class CardBenefitVO {
	private int cardBenefitId;
	private int cardId;
	private String benefitName;
	private String benefitInfo;
	private String benefitCode;
	private int workSector1Code;
	private int workSector2Code;
	private String workSector2Name;
	private String businessNames;
	private String businessNumber;
	private int benefitCriteria;		// 혜택 기준(ex. 10만원당 5천원 할인 시 10만원 - benefitCriteria, 5천원 - benefitInfo)
	private int perfCriteria;			// 전달 실적 기준
	
	private int limit;//한도제한
	public int getCardBenefitId() {
		return cardBenefitId;
	}
	public void setCardBenefitId(int cardBenefitId) {
		this.cardBenefitId = cardBenefitId;
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
	
	public String getWorkSector2Name() {
		return workSector2Name;
	}
	public void setWorkSector2Name(String workSector2Name) {
		this.workSector2Name = workSector2Name;
	}
	
	public String getBusinessNames() {
		return businessNames;
	}
	public void setBusinessNames(String businessNames) {
		this.businessNames = businessNames;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
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
	@Override
	public String toString() {
		return "CardBenefitVO [cardBenefitId=" + cardBenefitId + ", cardId=" + cardId + ", benefitName=" + benefitName
				+ ", benefitInfo=" + benefitInfo + ", benefitCode=" + benefitCode + ", workSector1Code="
				+ workSector1Code + ", workSector2Code=" + workSector2Code + ", workSector2Name=" + workSector2Name
				+ ", businessNames=" + businessNames + ", businessNumber=" + businessNumber + ", benefitCriteria="
				+ benefitCriteria + ", perfCriteria=" + perfCriteria + ", limit=" + limit + "]";
	}
	
	
	
	
	
}
