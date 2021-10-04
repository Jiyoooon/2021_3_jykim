package kr.ac.kopo.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.mapper.CardMapper;
import kr.ac.kopo.service.ICardService;
import kr.ac.kopo.util.StringUtils;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.card.CardBenefitVO;
import kr.ac.kopo.vo.card.CardSearchOptionVO;
import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.card.ConsumptionChartVO;
import kr.ac.kopo.vo.card.MemberCardVO;

@Service
public class CardServiceImpl  implements ICardService{

	@Autowired
	private CardMapper cardMapper;

	//카드 등록
	@Override
	@Transactional
	public void registerCard(CardVO card) {
		//card 이미지 저장
		//String path = "C:\\develop\\spring2-ws\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\images\\card\\";//이미지 저장 경로
		//String path = "C:\\develop\\spring-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\images\\card\\";//이미지 저장 경로
		String path = "C:\\develop\\spring-final\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\images\\card\\";//이미지 저장 경로
		MultipartFile file = card.getCardImage();
		
		String photoFileName = file.getOriginalFilename();
		String photoFileType = photoFileName.substring(photoFileName.lastIndexOf(".") + 1);
		String photoSavedFileName = StringUtils.getNewFileName("main_", photoFileType);
		
		card.setCardImageUrl("/images/card/" + photoSavedFileName);//실제 이미지 저장 경로
		
		//메인 이미지 저장
		File mainImage = new File(path + photoSavedFileName);
		try {
			file.transferTo(mainImage);//파일 저장
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		//worksectors 목록
		card.setWorkSectors("");
		List<CardBenefitVO> benefits = card.getBenefits();
		if(benefits != null && benefits.size() > 0) {
			StringBuilder sb = new StringBuilder();
			List<Integer> sector = new ArrayList<Integer>();
			for(CardBenefitVO b : benefits) {
				if(!sector.contains((Integer) b.getWorkSector1Code())){
					sector.add(b.getWorkSector1Code());
				}
			}
			for(Integer n : sector) {
				sb.append(n).append(",");
			}
			String sectors = sb.substring(0, sb.length()-1);
			card.setWorkSectors(sectors);
		}
		

		//card 등록
		cardMapper.insertCard(card);
		
		
		//card benefit 등록
		if(benefits != null && benefits.size() > 0) {
			int cardId = card.getCardId();
			for(CardBenefitVO b : card.getBenefits()) {
				String code = b.getBenefitCode();
				b.setCardId(cardId);
//				if(code.equals("001") || code.equals("002")) {
//					double percent = Integer.parseInt(b.getBenefitInfo()) / 100.0;
//					b.setBenefitInfo(String.valueOf(percent));
//				}
			}
			
			cardMapper.insertCardBenefits(card.getBenefits());
		}
	}

	/*
	 * cardType 	: 카드 종류
	 * sort 		: 정렬 조건(0 : 일반, 1 : 연회비 낮은 순, 2 : 연회비 높은 순, 3 : 인기 - 나이대, 성별, 직업군 정보 기준 -)
	 * keyWork		: 검색어
	 * ages			: 나이대(0 : 모두, 20 ~ 50)
	 * gender		: 성별(0 : 모두 / 1 : 남성 / 2 : 여성)
	 * jobCode		: 직업군 코드(0 : 모두 / job_code)
	 */
	//카드 검색(일반 - 로그인 하지 않고 가능한 검색 -)
	@Override
	public List<CardVO> searchAllCard(CardSearchOptionVO searchOption) {
		List<CardVO> cards = cardMapper.selectAllCard(searchOption);
		
		return cards;
	}

	//추천 카드 검색(나이 및 성별, 직업별)
	@Override
	public List<CardVO> searchAllRecoCard(String condition) {
		List<CardVO> cards = cardMapper.selectAllRecoCard(condition);
		
		return cards;
	}
	
	@Override
	public CardVO searchCardDetail(int cardId) {
		return cardMapper.selectCardDetail(cardId);
	}

	@Override
	public List<CardVO> searchMyRecoCards(int memberId, String benefitType) {
		//python으로 소비내역 분석(할인 + 적립)
		RestTemplate tmp = new RestTemplate();
		String response = tmp.getForObject("http://127.0.0.1:5000/api/mycard/" + memberId + "/" + benefitType, String.class, new HashMap<String, Object>());
		
		JSONParser parser = new JSONParser();
		JSONObject json = null;
		try {
			json = (JSONObject) parser.parse( response);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		List<Integer> cardNumber = new ArrayList<Integer>();
		Set<String> keys = json.keySet();
		for(String key : keys) {
			cardNumber.add(Integer.parseInt(key));
		}
		
		List<CardVO> cards = cardMapper.selectMyRecoCards(cardNumber);
		
		//혜택 금액 set
		for(CardVO card : cards) {
			JSONObject data = (JSONObject) json.get(String.valueOf(card.getCardId()));
			double amount = (double) data.get("amount");
			
			card.setBenefitAmount((int) amount);
		}
		
		Collections.sort(cards);//혜택금액 내림차순 정렬
		return cards;
	}

	//넘겨받은 인자 cardId와 customerList 이름으로 key 조합해서 결과값 캐싱처리
	//이후 같은 인자로 요청이 들어오면 캐싱되어있는 결과값 리턴
	@Cacheable(key = "#cardId", value = "customerList")
	@Override
	public List<MemberVO> searchCustomerList(int cardId) {
		
		return cardMapper.selectMarketingCustomerList(cardId);
	}

	
	
	

	
	
}
