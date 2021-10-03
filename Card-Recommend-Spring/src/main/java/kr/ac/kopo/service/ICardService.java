package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.card.CardSearchOptionVO;
import kr.ac.kopo.vo.card.CardVO;

public interface ICardService {
	
	//카드 등록
	public void registerCard(CardVO card);
	//카드 전체 목록(검색)
	public List<CardVO> searchAllCard(CardSearchOptionVO searchOption);//카드 종류(신용/체크) & 정렬방법 & 검색어
	//카드 추천 목록(추천 조건)
	public List<CardVO> searchAllRecoCard(String condition);//나이대, 성별 및 직업군 코드
	//카드 상세 정보
	public CardVO searchCardDetail(int cardId);
	
	//맞춤 카드 정보
	public List<CardVO> searchMyRecoCards(int memberId, String benefitType);
	
	//마케팅 대상 고객 리스트
	public List<MemberVO> searchCustomerList(int cardId);
	
//	//내 보유 카드 목록
//	public List<MemberCardVO> searchMyCards(int memberId);
//
//	//내 소비내역 통계 데이터
//	public List<ConsumptionChartVO> searchMyConsumption(int memberId);
}
