package kr.ac.kopo.vo.card;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CardVO implements Comparable<CardVO>{
	private int cardId;
	private String cardTypeId;
	private String cardType;
	private String cardName;
	private String cardInfo;
	private int cardAnnualfee;
	private String cardAnnualfeeInfo;
	private String cardImageUrl;
	private String workSectors;
	private String workSectorsName;
	private String plccBusinessNumber;
	
	private int benefitAmount;
	
	private MultipartFile cardImage;
	
	List<CardBenefitVO> benefits;
	
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	public String getCardTypeId() {
		return cardTypeId;
	}
	public void setCardTypeId(String cardTypeId) {
		this.cardTypeId = cardTypeId;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardInfo() {
		return cardInfo;
	}
	public void setCardInfo(String cardInfo) {
		this.cardInfo = cardInfo;
	}
	public int getCardAnnualfee() {
		return cardAnnualfee;
	}
	public void setCardAnnualfee(int cardAnnualfee) {
		this.cardAnnualfee = cardAnnualfee;
	}
	public String getCardAnnualfeeInfo() {
		return cardAnnualfeeInfo;
	}
	public void setCardAnnualfeeInfo(String cardAnnualfeeInfo) {
		this.cardAnnualfeeInfo = cardAnnualfeeInfo;
	}
	public String getCardImageUrl() {
		return cardImageUrl;
	}
	public void setCardImageUrl(String cardImageUrl) {
		this.cardImageUrl = cardImageUrl;
	}
	public String getWorkSectors() {
		return workSectors;
	}
	public void setWorkSectors(String workSectors) {
		this.workSectors = workSectors;
	}
	
	public String getWorkSectorsName() {
		return workSectorsName;
	}
	public void setWorkSectorsName(String workSectorsName) {
		this.workSectorsName = workSectorsName;
	}
	public String getPlccBusinessNumber() {
		return plccBusinessNumber;
	}
	public void setPlccBusinessNumber(String plccBusinessNumber) {
		this.plccBusinessNumber = plccBusinessNumber;
	}
	
	
	
	public MultipartFile getCardImage() {
		return cardImage;
	}
	public void setCardImage(MultipartFile cardImage) {
		this.cardImage = cardImage;
	}
	public List<CardBenefitVO> getBenefits() {
		return benefits;
	}
	public void setBenefits(List<CardBenefitVO> benefits) {
		this.benefits = benefits;
	}
	
	public int getBenefitAmount() {
		return benefitAmount;
	}
	public void setBenefitAmount(int benefitAmount) {
		this.benefitAmount = benefitAmount;
	}
	@Override
	public String toString() {
		return "CardVO [cardId=" + cardId + ", cardTypeId=" + cardTypeId + ", cardType=" + cardType + ", cardName="
				+ cardName + ", cardInfo=" + cardInfo + ", cardAnnualfee=" + cardAnnualfee + ", cardAnnualfeeInfo="
				+ cardAnnualfeeInfo + ", cardImageUrl=" + cardImageUrl + ", workSectors=" + workSectors
				+ ", workSectorsName=" + workSectorsName + ", plccBusinessNumber=" + plccBusinessNumber
				+ ", benefitAmount=" + benefitAmount + ", cardImage=" + cardImage + ", benefits=" + benefits + "]";
	}
	@Override
	public int compareTo(CardVO o) {//혜택 금액 내림차순 정렬
		return Integer.compare(o.benefitAmount, this.benefitAmount);
	}
	
	
	
	
}
