package kr.ac.kopo.controller;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.service.ICardService;
import kr.ac.kopo.vo.card.CardVO;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	@Autowired
	@Qualifier("cardServiceImpl")
	private ICardService cardService;
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String profile(Locale locale, Model model, HttpSession session) {
		session.removeAttribute("selectedHeaderNav");
		return "admin/dashboard";
	}

	//카드 등록 폼
	@GetMapping("/card/insertform")
	public String getCardInsertPage(HttpSession session, Authentication authentication, Principal p) {
		return "admin/cardInsertForm";
	}

	//카드 등록
	@PostMapping("/card")
	public String registerCard(CardVO card, HttpServletRequest request, Authentication authentication, Principal p) {
		System.out.println(card);
		
		cardService.registerCard(card);
		request.setAttribute("modalMsg", "카드가 등록되었습니다.");
		request.setAttribute("redirectPage", "");
		return "index";
	}
		
}
