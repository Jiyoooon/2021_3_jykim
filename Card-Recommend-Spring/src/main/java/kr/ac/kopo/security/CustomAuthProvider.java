package kr.ac.kopo.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.ac.kopo.vo.AdminVO;
import kr.ac.kopo.vo.MemberVO;

/*
 * 로그인 요청 시 AuthenticationProvicer로 요청이 전달되며, authenticate() 메서드가 호출되며 인증받기 전의 사용자 정보가 authentication 객체에 담김
 * supports() 메서드는 인자로 Class<?> authentication을 받지만, 실제로는 Class<? extends Authentication>이다
 * => 즉, supports() 메서드가 authenticate() 메서드로 전달되는지에 대한 여부만 확인한다.
 * => UsernamePasswordAuthenticationToken 클래스는 Authentication 인터페이스의 구현체이다.
 */
//@Component
public class CustomAuthProvider implements AuthenticationProvider{
	
	@Autowired
	private UserDetailsService UserDetailsService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String id = authentication.getName();
		String password = (String) authentication.getCredentials();
		
		System.out.println("manager : "+id+", "+password);
		UserDetails userDetails = (UserDetails) UserDetailsService.loadUserByUsername(id);
		
		//db에 정보 없을 경우 || 아이디나 패스워드 안맞을경우
		if(userDetails == null || !id.equals(userDetails.getUsername())
					|| !passwordEncoder.matches(password, userDetails.getPassword())) {
			throw new BadCredentialsException(id);
		
		// 계정 정보 맞으면 나머지 부가 메소드 체크 (이부분도 필요한 부분만 커스터마이징 하면 됨)
		// 잠긴 계정일 경우
		} else if (!userDetails.isAccountNonLocked()) {
			throw new LockedException(id);

		// 비활성화된 계정일 경우
		} else if (!userDetails.isEnabled()) {
			throw new DisabledException(id);

		// 만료된 계정일 경우
		} else if (!userDetails.isAccountNonExpired()) {
			throw new AccountExpiredException(id);

		// 비밀번호가 만료된 경우
		} else if (!userDetails.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(id);
		}
		
		//다 썼으면 패스워드 정보 지워줌(객체 뒤에서 계속 사용하므로)
		//userDetails.setPassword(null);
		if(userDetails instanceof MemberVO) {
			((MemberVO)userDetails).setPassword(null);
		}else if(userDetails instanceof AdminVO) {
			((AdminVO)userDetails).setPassword(null);
		}
		
		//최종 리턴시킬 새로 만든 Authentication 객체
		return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
	}
	
	
	   // 위의 authenticate 메소드에서 반환한 객체가 유효한 타입이 맞는지 검사 // null 값이거나 잘못된
	 @Override	//타입을 반환했을 경우 인증 실패로 간주 
	 public boolean supports(Class<?> authentication) {
		 //사용자의 정보로 UsernamePasswordAuthenticationToken을 생성한 뒤 인증이 완료된 Authentication을리턴함 
		 return authentication.equals(UsernamePasswordAuthenticationToken.class);
	 }
	 
	
	/*
	public static void main(String[] args) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String pwd = encoder.encode("test");
		String pwd2 = encoder.encode("test");
		System.out.println(pwd);
		System.out.println(pwd2);
		System.out.println("matches : "+encoder.matches(pwd, pwd));//false
		System.out.println("matches : "+encoder.matches("test", pwd));//true
		System.out.println("matches : "+encoder.matches("1234", pwd2));//false
	}
	*/
}
