package kr.ac.kopo.controller.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.ICardService;
import kr.ac.kopo.service.IMypageService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.card.CardSearchOptionVO;
import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.card.ConsumptionChartVO;
import kr.ac.kopo.vo.card.DibsVO;

@RestController
@RequestMapping("/api")
public class CardRestController {
	
	@Autowired
	@Qualifier("cardServiceImpl")
	private ICardService cardService;
	
	@Autowired
	@Qualifier("mypageServiceImpl")
	private IMypageService mypageService;
	
	//GET 카드 검색 결과
	@GetMapping("/card")
	public List<CardVO> getCardSearchList(CardSearchOptionVO searchOption){
		List<CardVO> cards = cardService.searchAllCard(searchOption);
		
		return cards;
	}
	
	//GET 찜카드 검색 결과 => 카드 이미지, 카드 이름, 카드 아이디 리스트
	@GetMapping("/card/dibs")
	public List<DibsVO> getDibsCardSearchList(@RequestParam("dibsLit") String dibsList){
		List<DibsVO> dibsCardList = mypageService.searchDibsCard(dibsList);
		
		return dibsCardList;
	}

	//GET 카드 추천 검색 결과
	@GetMapping("/card/reco/{recoCondition}")
	public List<CardVO> getRecoCardSearchList(@PathVariable("recoCondition") String condition){
		
		List<CardVO> cards = cardService.searchAllRecoCard(condition);
		
		return cards;
	}

	//GET 소비내역 기반 맞춤 카드 추천 검색 결과
	@GetMapping("/card/myreco/{benefitType}")
	public List<CardVO> getMyrecoCardSearchList(@PathVariable("benefitType") String benefitType, Authentication authentication){
		
		List<CardVO> cards = null;
		if(authentication != null && authentication.getPrincipal() instanceof MemberVO) {//로그인 했고, 일반유저라면
			cards = cardService.searchMyRecoCards(((MemberVO) authentication.getPrincipal()).getMemberId(), benefitType);
		}
		
		return cards;
	}

	//GET 소비내역 데이터 
	@GetMapping("/mypage/card/consumption/{startDate}/{endDate}")
	public List<ConsumptionChartVO> getMyConsumption(@PathVariable("startDate") String start
													, @PathVariable("endDate") String end
													, Authentication authentication){
		
		int memberId = ((MemberVO) authentication.getPrincipal()).getMemberId();
		List<ConsumptionChartVO> statistics = mypageService.searchMyConsumption(memberId, start, end);
		
		return statistics;
	}

	//GET Top3 Card 데이터 
	@GetMapping("/mypage/card/reco/{workSector1Code}")
	public List<CardVO> getTop3CardList(@PathVariable("workSector1Code") int sector1, Authentication authentication){
		List<CardVO> cards = null;
		cards = mypageService.searchSector1RecoCards(sector1);
		
		return cards;
	}
	
	//GET 카드 찜하기
//	@PostMapping("/mypage/card/{cardId}")
//	public void dibsCard(@PathVariable("cardId") int cardId, Authentication authentication){
//		int memberId = ((MemberVO) authentication.getPrincipal()).getMemberId();
//		mypageService.dibsCard(memberId, cardId);
//		
//	}
	
	//GET 카드 상세
	@GetMapping("/card/detail/{cardId}")
	public CardVO getCardDetail(@PathVariable("cardId") int cardId, Authentication authentication){
		
		CardVO card = cardService.searchCardDetail(cardId);
		
		return card;
	}
	
}
