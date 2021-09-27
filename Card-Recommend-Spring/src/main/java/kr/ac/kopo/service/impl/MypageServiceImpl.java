package kr.ac.kopo.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mapper.CardMapper;
import kr.ac.kopo.mapper.TransMapper;
import kr.ac.kopo.service.IMypageService;
import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.card.ConsumptionChart2VO;
import kr.ac.kopo.vo.card.ConsumptionChartVO;
import kr.ac.kopo.vo.card.DibsVO;
import kr.ac.kopo.vo.card.GraphVO;
import kr.ac.kopo.vo.card.MemberCardVO;
import kr.ac.kopo.vo.card.TransactionVO;
import kr.ac.kopo.vo.trans.BenefitParamsVO;
import kr.ac.kopo.vo.trans.BenefitResultVO;

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

	//소비내역 그래프 데이터(1차, 2차 그래프)
	@Override
	public List<ConsumptionChartVO> searchMyConsumption(int memberId, String start, String end) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberId", memberId);
		params.put("start", start);
		params.put("end", end);
		
		List<ConsumptionChartVO> cardList = cardMapper.selectMyConsumption(params);
		
		return cardList;
		
//		BenefitParamsVO params = new BenefitParamsVO();
//		params.setMemberId(memberId);
//		params.setStart(start);
//		params.setEnd(end);
//		
//		transMapper.mycardBenefit(params);
//		
//		List<BenefitResultVO> benefits = params.getBenefitList();
//		for(BenefitResultVO b : benefits) {
//			if(b.getPayTotal() > 0) {
//				System.out.println(b);
//			}
//		}
//		
//		if(benefits != null) {
//			List<ConsumptionChartVO> chartList = makeGraph(benefits);
//			return chartList;
//		}
//		return null;//benefits == null인 경우
	}
	
	//혜택 내역 데이터
	@Override
	public List<BenefitResultVO> searchMyConsumptionBenefit(int memberId, String start, String end) {
		BenefitParamsVO params = new BenefitParamsVO();
		params.setMemberId(memberId);
		params.setStart(start);
		params.setEnd(end);
		
		transMapper.mycardBenefit(params);
		List<BenefitResultVO> benefits = params.getBenefitList();
//		for(BenefitResultVO b : benefits) {
//			System.out.println(b);
//		}
		return benefits;
	}
	
	//찜한 신용카드 혜택 내역 데이터
	@Override
	public List<BenefitResultVO> searchDibsConsumptionBenefit(BenefitParamsVO params) {
		transMapper.dibsCardBenefit(params);
		
		return params.getBenefitList();
	}


	//그래프 데이터
	private List<ConsumptionChartVO> makeGraph(List<BenefitResultVO> benefits) {
		List<ConsumptionChartVO> chartList = new ArrayList<ConsumptionChartVO>();
		
		int sector1 = -1;
		ConsumptionChartVO chart1 = null;
		List<ConsumptionChart2VO> chart2List = null;
		int payTotal = 0;
		for(BenefitResultVO b : benefits) {
			if(b.getPayTotal() == 0) continue; //소비 내역이 없는 업종의 경우 continue;
			
			if(b.getWorkSector1Code() != sector1) {
				if(sector1 > 0) {//이전 데이터 저장
					chart1.setSectorBalance(payTotal);
					chart1.setChart2List(chart2List);
					chartList.add(chart1);
				}
				
				sector1 = b.getWorkSector1Code();
				//ConsumptionChartVO 생성
				chart1 = new ConsumptionChartVO();
				//ConsumptionChart2VO 리스트 생성
				chart2List = new ArrayList<ConsumptionChart2VO>();

				chart1.setWorkSector1Name(b.getWorkSector1Name());
				chart1.setWorkSector1Code(sector1);
				payTotal = 0;
			}
			payTotal += b.getPayTotal();
			
			ConsumptionChart2VO chart2 = new ConsumptionChart2VO();
			//sector2code, sector2name, sector2balance, benefitname, benefitinfo, benefitcode
			chart2.setWorkSector2Code(b.getWorkSector2Code());
			chart2.setWorkSector2Name(b.getWorkSector2Name());
			chart2.setSector2Balance(b.getPayTotal());
			chart2.setBenefitName(b.getBenefitName());
			chart2.setBenefitInfo(b.getBenefitInfo());
			chart2.setBenefitCode(b.getBenefitCode());
			chart2List.add(chart2);
		}
		chart1.setSectorBalance(payTotal);
		chart1.setChart2List(chart2List);
		chartList.add(chart1);
		
		for(ConsumptionChartVO cur : chartList) {//소비량 많은 업종 내림차순
			Collections.sort(cur.getChart2List());
		}
		return chartList;
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

	//찜한 멀티카드 소비내역 대조
	@Override
	public List<BenefitResultVO> searchMultiDibsConsumptionBenefit(BenefitParamsVO params) {
		transMapper.selectMultiCardBenefit(params);
		
		List<BenefitResultVO> benefitList = params.getBenefitList();		
		if(benefitList == null) return null;

		
		//cardId별로 그룹지어서 각각 List<BenefitResultVO>로 쪼갬
		List<List<BenefitResultVO>> multiList = splitBenefitResult(benefitList);
		
		//카드가 한장이면 바로 리턴
		if(multiList.size() < 2) return benefitList;

		//겹치는 혜택들 하나만 선택하고 return		
		List<BenefitResultVO> resultBenefit = getBenefitResultList(multiList, (1 << 31) - 1);
		
		return resultBenefit;
	}


	@Override
	public Map<String, Object> searchCreditTop10Benefit(BenefitParamsVO params) {
		transMapper.selectCreditTop10(params);
		
		Map<String, Object> top10 = new HashMap<String, Object>();
		top10.put("payTotal", params.getPayTotal());//기간 동안 전체 소비 => 피킹률 계산
		List<BenefitResultVO> benefits = params.getBenefitList();
		List<List<BenefitResultVO>> benefitList = new ArrayList<List<BenefitResultVO>>();
		
		int cardId = 0;
		List<BenefitResultVO> tmp = null;
		for(BenefitResultVO b : benefits) {
			if(b.getCardId() != cardId) {
				if(cardId > 0) {//이전 리스트 저장
					benefitList.add(tmp);
				}
				tmp = new ArrayList<BenefitResultVO>();
				cardId = b.getCardId();
			}
			
			tmp.add(b);
		}
		
		top10.put("benefitList", benefitList);
		
		return top10;
	}


	//멀티카드 top3 추천
	@Override
	public Map<String, Object> searchMultiTop3Benefit(BenefitParamsVO params) {
		params.setCardId("0");//멀티카드 top3 표시
		transMapper.selectMultiCardBenefit(params);
		
		
		Map<String, Object> top3 = new HashMap<String, Object>();
		top3.put("payTotal", params.getPayTotal());
		
		List<BenefitResultVO> benefits = params.getBenefitList();
		
		List<List<BenefitResultVO>> multiList = splitBenefitResult(benefits);
//		for(List<BenefitResultVO> m : multiList) {
//			for(BenefitResultVO b : m) {
//				System.out.println(b);
//			}
//			System.out.println();
//		}
		int count = multiList.size();
		
		List<int[]> rank = new ArrayList<int[]>();
		
		for(int i = 1; i < (1 << count); i++) {
			int cardCnt = 0;
			for(int j = 0; j < count; j++) {
				if((i & (1 << j)) > 0) {//j번째 카드가 선택됐다면
					cardCnt++;
				}
			}
			if(cardCnt == 2) {//카드 2개 조합만 고려
				calculateBenefit(multiList, rank, i);
			}
			
		}
		
		//benefitTotal 기준 내림차순 정렬
		Collections.sort(rank, new Comparator<int[]>() {
			@Override
			public int compare(int[] b1, int[] b2) {
				return Integer.compare(b2[1], b1[1]);
			}
		});
		
//		for(int[] cur : rank) {
//			System.out.println(Arrays.toString(cur));
//		}
		
		//top3 결과 저장할 객체
		List<List<BenefitResultVO>> benefitList = new ArrayList<List<BenefitResultVO>>();
		
		for(int i = 0; i < 3; i++) {
			int combi = rank.get(i)[0];
			benefitList.add(getBenefitResultList(multiList, combi));
		}
		
		top3.put("benefitList", benefitList);
		
		return top3;
	}

	//선택된 멀티카드 조합의 혜택 리스트 만들어 리턴
	private List<BenefitResultVO> getBenefitResultList(List<List<BenefitResultVO>> multiList, int combi) {
		List<BenefitResultVO> resultBenefit = new ArrayList<BenefitResultVO>();
		int[] cardIdx = new int[210];//몇번째 카드의 혜택을 선택할지 카드 idx
		int[] maxBenefit = new int[210];
		
		//각각 benefit 돌면서 혜택 높은 쪽 선택
		for(int i = 0, size = multiList.size(); i < size; i++) {
			if((combi & (1 << i)) == 0) continue;
			for(BenefitResultVO b : multiList.get(i)) {
				int ws = b.getWorkSector2Code();
				int bt = b.getBenefitTotal();
				
				if(maxBenefit[ws] == 0 || maxBenefit[ws] < bt) {//아직 해당 workSector에 지정된 혜택 없거나 || 이전 혜택보다 해당 카드의 혜택이 더 크다면
					cardIdx[ws] = i;
					maxBenefit[ws] = bt;
				}
			}
		}
		//선택한 혜택 조합해서 return
		for(int i = 0, size = multiList.size(); i < size; i++) {
			if((combi & (1 << i)) == 0) continue;
			for(BenefitResultVO b : multiList.get(i)) {
				int ws = b.getWorkSector2Code();
				if(cardIdx[ws] == i) {
					resultBenefit.add(b);
				}
			}
		}
		
		
		return resultBenefit;
	}

	//multi card top3 rank를 위해 조합별 혜택 합계 구함
	private void calculateBenefit(List<List<BenefitResultVO>> multiList, List<int[]> rank, int combi) {
		int[] maxBenefit = new int[210];//겹치는 업종 혜택 중 큰 혜택을 선택
		
		//각각 benefit 돌면서 혜택 높은 쪽 선택
		for(int i = 0, size = multiList.size(); i < size; i++) {
			
			for(BenefitResultVO b : multiList.get(i)) {
				if((combi & (1 << i)) == 0) continue; // 조합에 선택되지 않은 카드면 continue;
				
				int ws = b.getWorkSector2Code();
				int bt = b.getBenefitTotal();
				
				if(maxBenefit[ws] < bt) {//아직 해당 workSector에 지정된 혜택 없거나 || 이전 혜택보다 해당 카드의 혜택이 더 크다면
					maxBenefit[ws] = bt;
				}
			}
		}
		
		//maxBenefit에 쌓인 혜택 합계 구함
		int benefitTotal = 0;
		for(int b : maxBenefit) {
			benefitTotal += b;
		}
		
		rank.add(new int[] {combi, benefitTotal});//해당 조합과 조합의 혜택 합계 rank에 저장
	}

	//cardId별로 그룹지어서 각각 List<BenefitResultVO>로 쪼갬
	private List<List<BenefitResultVO>> splitBenefitResult(List<BenefitResultVO> benefits) {
		Set<Integer> cardId = new HashSet<Integer>();
		List<List<BenefitResultVO>> multiList = new ArrayList<List<BenefitResultVO>>();
		List<BenefitResultVO> tmpList = null;
		
		for(BenefitResultVO b : benefits) {//cardId 순서대로 되어있음
			int multiCardId = b.getCardId();
			if(!cardId.contains((Integer) multiCardId)) {//새로운 multiCard
				if(tmpList != null) {
					multiList.add(tmpList);
				}
				tmpList = new ArrayList<BenefitResultVO>();
				cardId.add(multiCardId);
			}
			tmpList.add(b);
		}
		multiList.add(tmpList);
		return multiList;
	}

	

	public static void main(String[] args) {
		System.out.println(Integer.toBinaryString((1 << 31) - 1));
	}
	
}
