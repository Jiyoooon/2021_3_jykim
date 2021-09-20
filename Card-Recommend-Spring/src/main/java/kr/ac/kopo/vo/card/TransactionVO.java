package kr.ac.kopo.vo.card;

//결제 데이터
public class TransactionVO {
	private int transactionId;			//결제 아이디
	private int memberCardId;			//결제 카드 아이디
	private int transBalance;			//결제 금액
	private String transAt;				//결제 날짜 및 시간
	private int installment;			//일시불/할부 몇 개월
	private String cancelFlag;			//결제 취소 여부
	private String transInfo;			//결제 내용(통장에 찍히는 내용)
	private int workSector1Code;		//1차업종 분류
	private int workSector2Code;		//2치업종 분류
	private String businessNumber;		//결제 사업장 대표 사업자 번호
	private String franchiseeName;		//결제 가맹점 이름
	private String franchiseeNumber;	//결제 가맹점 번호
	private int accBalance;				//누적금액
	private int billBalance;			//청구금액(결제금액 - 할인금액)
	
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public int getMemberCardId() {
		return memberCardId;
	}
	public void setMemberCardId(int memberCardId) {
		this.memberCardId = memberCardId;
	}
	public int getTransBalance() {
		return transBalance;
	}
	public void setTransBalance(int transBalance) {
		this.transBalance = transBalance;
	}
	public String getTransAt() {
		return transAt;
	}
	public void setTransAt(String transAt) {
		this.transAt = transAt;
	}
	public int getInstallment() {
		return installment;
	}
	public void setInstallment(int installment) {
		this.installment = installment;
	}
	public String getCancelFlag() {
		return cancelFlag;
	}
	public void setCancelFlag(String cancelFlag) {
		this.cancelFlag = cancelFlag;
	}
	public String getTransInfo() {
		return transInfo;
	}
	public void setTransInfo(String transInfo) {
		this.transInfo = transInfo;
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
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getFranchiseeName() {
		return franchiseeName;
	}
	public void setFranchiseeName(String franchiseeName) {
		this.franchiseeName = franchiseeName;
	}
	public String getFranchiseeNumber() {
		return franchiseeNumber;
	}
	public void setFranchiseeNumber(String franchiseeNumber) {
		this.franchiseeNumber = franchiseeNumber;
	}
	public int getAccBalance() {
		return accBalance;
	}
	public void setAccBalance(int accBalance) {
		this.accBalance = accBalance;
	}
	public int getBillBalance() {
		return billBalance;
	}
	public void setBillBalance(int billBalance) {
		this.billBalance = billBalance;
	}
	@Override
	public String toString() {
		return "TransactionVO [transactionId=" + transactionId + ", memberCardId=" + memberCardId + ", transBalance="
				+ transBalance + ", transAt=" + transAt + ", installment=" + installment + ", cancelFlag=" + cancelFlag
				+ ", transInfo=" + transInfo + ", workSector1Code=" + workSector1Code + ", workSector2Code="
				+ workSector2Code + ", businessNumber=" + businessNumber + ", franchiseeName=" + franchiseeName
				+ ", franchiseeNumber=" + franchiseeNumber + ", accBalance=" + accBalance + ", billBalance="
				+ billBalance + "]";
	}
	
	
}
