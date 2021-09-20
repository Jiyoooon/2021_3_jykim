package kr.ac.kopo.vo.card;

//카드 검색 조건
public class CardSearchOptionVO {
	// 카드 종류
	// 정렬 조건(0 : 일반, 1 : 연회비 낮은 순, 2 : 연회비 높은 순, 3 : 인기 - 나이대, 성별, 직업군 정보 기준 -)
	// 검색어(카드 이름, 설명, 혜택 중 검색어 포함되는 카드)
	// 나이대(0 : 모두, 20 ~ 50)
	// 성별(0 : 모두 / 1 : 남성 / 2 : 여성)
	// 직업군 코드(0 : 모두 / job_code)
	private String cardType;
	private int sort;
	private String keyWord;
	private String recoCondition;
//	private int ages;
//	private int gender;
//	private int jobCode;
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	
	
public String getRecoCondition() {
		return recoCondition;
	}
	public void setRecoCondition(String recoCondition) {
		this.recoCondition = recoCondition;
	}
	//	public int getAges() {
//		return ages;
//	}
//	public void setAges(int ages) {
//		this.ages = ages;
//	}
//	public int getGender() {
//		return gender;
//	}
//	public void setGender(int gender) {
//		this.gender = gender;
//	}
//	public int getJobCode() {
//		return jobCode;
//	}
//	public void setJobCode(int jobCode) {
//		this.jobCode = jobCode;
//	}
	@Override
	public String toString() {
		return "CardSearchOptionVO [cardType=" + cardType + ", sort=" + sort + ", keyWord=" + keyWord
				+ ", recoCondition=" + recoCondition + "]";
	}

	

	
	
	
	
	
}
