package kr.ac.kopo.security;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

/*
 * 로그인이 정상적으로 동작하게 되면 인증받은 사용자의 정보가 Authentication 객체에 담기게 된다.ㅣ
 */
//@Component
public class CustomSuccessHandler implements AuthenticationSuccessHandler{
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		//로그인 성공 후 로직 수행
		
		// IP, 세션 ID
//		WebAuthenticationDetails web = (WebAuthenticationDetails) authentication.getDetails();
//		System.out.println("IP : " + web.getRemoteAddress());
//		System.out.println("Session ID : " + web.getSessionId());
//		
//		// 인증 ID
//		System.out.println("name : " + authentication.getName());
//		
//		// 권한 리스트
//		List<GrantedAuthority> authList = (List<GrantedAuthority>) authentication.getAuthorities();
//		System.out.print("권한 : ");
//		for(int i = 0; i< authList.size(); i++) {
//			System.out.print(authList.get(i).getAuthority() + " ");
//		}
//		System.out.println();
//		
//		
//		// 디폴트 URI
//		System.out.println("contextPath : " + request.getContextPath());
		String uri = request.getContextPath();

		/* 강제 인터셉트 당했을 경우의 데이터 get
		 * => 접근 권한이 없는 페이지 요청 시, 시큐리티에서 서블릿으로 바로 요청을 보내지 않고 가로챈 후 로그인 페이지 요청으로 바꿔 서블릿에 전달
		 * => 이때 기존 클라이언트가 요청했던 정보를 '세션'에 저장하게 됨
		 * => 이 페이지 정보를 가져와 포워딩/리다이렉트 시킬 uri로 사용하면 됨!
		 *  */
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		// 있을 경우 URI 등 정보를 가져와서 사용
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();
			
			// 세션에 저장된 객체를 다 사용한 뒤에는 지워줘서 메모리 누수 방지
			requestCache.removeRequest(request, response);
			request.getSession().removeAttribute("prevPage");

			//System.out.println("권한 필요한 접근 : " +uri);
		}

		// 세션 Attribute 확인
//		Enumeration<String> list = request.getSession().getAttributeNames();
//		while (list.hasMoreElements()) {
//			System.out.println(list.nextElement());
//		}
		
		
		
		/* 로그인 버튼 눌러 접속했을 경우의 데이터 get 
		 * => 이전에 넘어온 페이지를 기억해뒀다가 그 페이지로 리다이렉티 해 줌*/
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
		}

		// null이 아니라면 강제 인터셉트 당했다는 것
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();

		// ""가 아니라면 직접 로그인 페이지로 접속한 것
		} else if (prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
		}

		// 세 가지 케이스에 따른 URI 주소로 리다이렉트
		response.sendRedirect(uri);
	}
}
