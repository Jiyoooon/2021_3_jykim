package kr.ac.kopo.vo.card;

public class MemberCardVO {
	private int memberCardId;
	private int memberId;
	private String accountNumber;
	private String cardNumber;
	private String cardCVC;
	private int cardValidYear;
	private int cardValidMonth;
	private String cardImageUrl;
	private String cardInfo;
	private String cardName;
	private String cardType;//신용 체크..
	private String payDate;
	
	
	public int getMemberCardId() {
		return memberCardId;
	}
	public void setMemberCardId(int memberCardId) {
		this.memberCardId = memberCardId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardCVC() {
		return cardCVC;
	}
	public void setCardCVC(String cardCVC) {
		this.cardCVC = cardCVC;
	}
	public int getCardValidYear() {
		return cardValidYear;
	}
	public void setCardValidYear(int cardValidYear) {
		this.cardValidYear = cardValidYear;
	}
	public int getCardValidMonth() {
		return cardValidMonth;
	}
	public void setCardValidMonth(int cardValidMonth) {
		this.cardValidMonth = cardValidMonth;
	}
	
	public String getCardImageUrl() {
		return cardImageUrl;
	}
	public void setCardImageUrl(String cardImageUrl) {
		this.cardImageUrl = cardImageUrl;
	}
	
	public String getCardInfo() {
		return cardInfo;
	}
	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	@Override
	public String toString() {
		return "MemberCardVO [memberCardId=" + memberCardId + ", memberId=" + memberId + ", accountNumber="
				+ accountNumber + ", cardNumber=" + cardNumber + ", cardCVC=" + cardCVC + ", cardValidYear="
				+ cardValidYear + ", cardValidMonth=" + cardValidMonth + ", cardImageUrl=" + cardImageUrl
				+ ", cardInfo=" + cardInfo + ", cardName=" + cardName + ", cardType=" + cardType + ", payDate="
				+ payDate + "]";
	}
	
	
	
	
	
}
