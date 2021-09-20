package kr.ac.kopo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mapper.CardMapper;
import kr.ac.kopo.mapper.TransMapper;
import kr.ac.kopo.service.IMypageService;
import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.card.ConsumptionChartVO;
import kr.ac.kopo.vo.card.DibsVO;
import kr.ac.kopo.vo.card.GraphVO;
import kr.ac.kopo.vo.card.MemberCardVO;
import kr.ac.kopo.vo.card.TransactionVO;

@Service
public class MypageServiceImpl  implements IMypageService{

	@Autowired
	private CardMapper cardMapper;

	@Autowired
	private TransMapper transMapper;

	//보유카드 목록
	@Override
	public List<MemberCardVO> searchMyCards(int memberId) {
		return cardMapper.selectMyCards(memberId);
	}

	//소비내역 데이터
	@Override
	public List<ConsumptionChartVO> searchMyConsumption(int memberId, String start, String end) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("start", start);
		params.put("end", end);
		
		return cardMapper.selectMyConsumption(params);
	}

	//sector1 카드 top3 조회
	@Override
	public List<CardVO> searchSector1RecoCards(int sector1) {
		return cardMapper.selectSector1Top3(sector1);
	}

	//찜카드 목록 조회
	@Override
	public List<DibsVO> searchDibsCard(String dibsList) {
		String[] dibs = dibsList.split("/");
		List<DibsVO> dibsResult = new ArrayList<DibsVO>();
		
		for(int i = 1; i < dibs.length; i++) {
			DibsVO curDibs = null;
			String curDib = dibs[i];
			List<String> payCards = new ArrayList<String>();//멀티카드일 경우 결제카드 리스트
			
			if(curDib.startsWith("0")) {//멀티카드
				curDibs = cardMapper.selectMyDibsCard("0");//멀티카드 가져옴
				String[] tmp = curDib.split(",");
				for(int j = 1; j < tmp.length; j++) {
					payCards.add(tmp[j]);
				}
				curDibs.setPayCards(cardMapper.selectMultiPayCard(payCards));//결제카드 저장
			}else {//일반카드
				curDibs = cardMapper.selectMyDibsCard(curDib);//일반카드 가져옴
			}
			dibsResult.add(curDibs);
		}
		
		return dibsResult;
	}

	//소비 그래프 데이터
	@Override
	public List<GraphVO> searchMyConsumption2(String memberId, String cardId , String start, String end){
		
		//transaction 데이터
		List<TransactionVO> transList = transMapper.selectAllTrans(memberId, start, end);
		
		//선택한 카드 cardBenefit 데이터
		//cardId == "0" : 현재 보유카드로 그래프 그림(마이페이지 들어오자마자)
		if(cardId.equals("0")) {
			
		}
		//cardId = "0,100,102" : 2개 이상이면 멀티카드 => 멀티카드 조합으로(찜한 멀티카드 대조) 
		else if(cardId.startsWith("0")) {
			
		}
		//cardId == "1" ~ "35" : 해당 신용카드로 그래프 그림(찜한 신용카드 대조)
		else {
			
		}
		
		//혜택 금액 계산 
		
		return null;
	}

	
}
