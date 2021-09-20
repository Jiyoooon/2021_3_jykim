package kr.ac.kopo.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.kopo.service.ICardService;
import kr.ac.kopo.service.IMypageService;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.card.MemberCardVO;

@Controller
@RequestMapping(value = "/mypage")
public class MemberController {
	@Autowired
	@Qualifier("cardServiceImpl")
	private ICardService cardService;

	@Autowired
	@Qualifier("mypageServiceImpl")
	private IMypageService mypageService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String profile(Locale locale, Model model, Authentication auth, HttpSession session) {
		
		int memberId = ((MemberVO) auth.getPrincipal()).getMemberId();
		List<MemberCardVO> mycards = mypageService.searchMyCards(memberId);
		model.addAttribute("mycards", mycards);
		session.removeAttribute("selectedHeaderNav");
		
		return "member/mypage";
	}
}
