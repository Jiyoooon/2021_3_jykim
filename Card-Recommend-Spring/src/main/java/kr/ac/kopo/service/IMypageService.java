package kr.ac.kopo.service;

import java.util.List;
import java.util.Map;

import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.card.ConsumptionChartVO;
import kr.ac.kopo.vo.card.DibsVO;
import kr.ac.kopo.vo.card.GraphVO;
import kr.ac.kopo.vo.card.MemberCardVO;
import kr.ac.kopo.vo.trans.BenefitParamsVO;
import kr.ac.kopo.vo.trans.BenefitResultVO;

public interface IMypageService {
	
	//내 보유 카드 목록
	public List<MemberCardVO> searchMyCards(int memberId);

	//내 소비내역 통계 데이터 => 그래프 그림
	public List<ConsumptionChartVO> searchMyConsumption(int memberId, String start, String end);

	//내 보유카드 혜택 
	public List<BenefitResultVO> searchMyConsumptionBenefit(int memberId, String start, String end);

	//마이페이지 => sector1 그래프 클릭 시 카드 top3 추천
	public List<CardVO> searchSector1RecoCards(int sector1);

	//찜카드 목록 가져오기
	public List<DibsVO> searchDibsCard(String dibsList);
	
	//카드 찜하기
	//public void dibsCard(int memberId, int cardId);

	
	
	//내 소비내역 통계 데이터 => 그래프 그림
	public List<GraphVO> searchMyConsumption2(String memberId, String cardId , String start, String end);

	//찜한 신용카드 혜택
	public List<BenefitResultVO> searchDibsConsumptionBenefit(BenefitParamsVO params);

	//찜한 멀티카드 혜택
	public List<BenefitResultVO> searchMultiDibsConsumptionBenefit(BenefitParamsVO params);

	//신용카드 top10
	public Map<String, Object> searchCreditTop10Benefit(BenefitParamsVO params);

	//멀티카드 top3
	public Map<String, Object> searchMultiTop3Benefit(BenefitParamsVO params);

	
}
