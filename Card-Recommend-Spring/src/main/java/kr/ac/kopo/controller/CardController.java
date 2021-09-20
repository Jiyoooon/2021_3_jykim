package kr.ac.kopo.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.client.RestTemplate;

import kr.ac.kopo.service.ICardService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.card.CardVO;

@Controller
public class CardController {
	
	@Autowired
	@Qualifier("cardServiceImpl")
	private ICardService cardService;

	@GetMapping("/card/{card_id}")
	public String cardDetail(@PathVariable("card_id") int cardId, Authentication authentication, Principal p) {
		System.out.println("cardId : " + cardId);
		System.out.println(p);
		//@AuthenticationPrincipal MemberVO memberVO, Principal principal
		MemberVO member = (MemberVO) authentication.getPrincipal();
		System.out.println(member);
		return "card";
	}

	@GetMapping("/card/recommend")
	public String getCardRecommendPage(HttpSession session, Authentication authentication, Principal p, Model model) throws ParseException {
		session.setAttribute("selectedHeaderNav", "reco");
		
		//mycards 추천 리스트
//		if(authentication != null && authentication.getPrincipal() instanceof MemberVO) {//로그인 했고, 일반유저라면
//			List<CardVO> cards = cardService.searchMyRecoCards(((MemberVO) authentication.getPrincipal()).getMemberId(), "3");
//			model.addAttribute("cards", cards);
//			
//		}
		
		return "card/recommend";
	}

	@GetMapping("/card/book")
	public String getCardBookPage(HttpSession session, Authentication authentication, Principal p) {
		session.setAttribute("selectedHeaderNav", "book");
		return "commons/readyPage";
	}

	@GetMapping("/card/center")
	public String getCardCenterPage(HttpSession session, Authentication authentication, Principal p) {
		session.setAttribute("selectedHeaderNav", "center");
		return "commons/readyPage";
	}
	
	
	
	
}
