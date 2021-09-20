package kr.ac.kopo.vo.card;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//찜카드 목록
public class DibsVO{
	private int cardId;
	private String multiFlag;
	private String cardTypeCode;
	private String cardType;
	private String cardName;
	private String cardImageUrl;
	private List<DibsVO> payCards;//멀티카드에 연결된 결제카드
	
	public int getCardId() {
		return cardId;
	}
	public void setCardId(int cardId) {
		this.cardId = cardId;
	}
	
	public String getMultiFlag() {
		return multiFlag;
	}
	public void setMultiFlag(String multiFlag) {
		this.multiFlag = multiFlag;
	}
	public String getCardTypeCode() {
		return cardTypeCode;
	}
	public void setCardTypeCode(String cardTypeCode) {
		this.cardTypeCode = cardTypeCode;
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
	public String getCardImageUrl() {
		return cardImageUrl;
	}
	public void setCardImageUrl(String cardImageUrl) {
		this.cardImageUrl = cardImageUrl;
	}
	public List<DibsVO> getPayCards() {
		return payCards;
	}
	public void setPayCards(List<DibsVO> payCards) {
		this.payCards = payCards;
	}
	@Override
	public String toString() {
		return "DibsVO [cardId=" + cardId + ", multiFlag=" + multiFlag + ", cardTypeCode=" + cardTypeCode + ", cardType="
				+ cardType + ", cardName=" + cardName + ", cardImageUrl=" + cardImageUrl + ", payCards=" + payCards
				+ "]";
	}
	
}
