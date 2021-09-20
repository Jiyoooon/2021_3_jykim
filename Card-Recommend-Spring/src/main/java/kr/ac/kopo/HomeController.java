package kr.ac.kopo;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import kr.ac.kopo.service.ICardService;
import kr.ac.kopo.vo.card.CardSearchOptionVO;
import kr.ac.kopo.vo.card.CardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	@Qualifier("cardServiceImpl")
	private ICardService cardService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		session.setAttribute("selectedHeaderNav", "main");
		
		CardSearchOptionVO option = new CardSearchOptionVO();
		option.setCardType("001");
		option.setKeyWord("");
		List<CardVO> cards = cardService.searchAllCard(option);
		//System.out.println("검색 결과!");
		//System.out.println(cards);
		model.addAttribute("cards", cards);
		
		return "index";
	}
	
	@RequestMapping(value="/common/error{error_code}/")
	public String error(HttpServletRequest request, @PathVariable String error_code) {
		int code = Integer.parseInt(error_code);
		String msg = "";
		
		switch(code) {
		case 403: msg = "잘못된 접근입니다."; break;
		case 404: msg = "페이지를 찾을 수 없습니다."; break;
		}
		
		request.setAttribute("msg", msg);
		return "commons/error";
	}
	
}
