package kr.ac.kopo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.card.CardBenefitVO;
import kr.ac.kopo.vo.card.CardSearchOptionVO;
import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.card.ConsumptionChartVO;
import kr.ac.kopo.vo.card.DibsVO;
import kr.ac.kopo.vo.card.MemberCardVO;

@Mapper
public interface CardMapper {

	//card 등록
	public void insertCard(CardVO card);
	//card benefit 등록
	public void insertCardBenefits(List<CardBenefitVO> benefits);
	
	//일반 카드 검색(로그인 하지 않고 검색어, 정렬 방식에 따른 검색)
	public List<CardVO> selectAllCard(CardSearchOptionVO searchOption);
	//추천 카드 검색(로그인 하지 않고 나이 및 성별, 직업군 코드에 따른 검색)
	public List<CardVO> selectAllRecoCard(String condition);
	
	//직업 및 나이/성별 추천 카드 저장 => 스케줄링
	public void insertCardStatistics();
	//cardNumber에 해당하는 카드 정보 return
	public List<CardVO> selectMyRecoCards(List<Integer> cardNumber);
	
	//보유카드 목록
	public List<MemberCardVO> selectMyCards(int memberId);
	
	//소비내역 통계 데이터
	public List<ConsumptionChartVO> selectMyConsumption(Map<String, Object> params);

	//소비내역 통계 데이터
	public List<CardVO> selectSector1Top3(int sector1);
	
	//카드 상세 데이터
	public CardVO selectCardDetail(int cardId);
	
	//찜카드 목록 가져오기
	public DibsVO selectMyDibsCard(String cardId);
	
	//멀티 찜카드 - 결제카드목록 가져오기
	public List<DibsVO> selectMultiPayCard(List<String> cardIdList);
	
	//마케팅 대상 고객 리스트
	public List<MemberVO> selectMarketingCustomerList(int cardId);
}
