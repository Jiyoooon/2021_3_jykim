package kr.ac.kopo.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.ac.kopo.mapper.AdminMapper;
import kr.ac.kopo.mapper.MemberMapper;
import kr.ac.kopo.vo.AdminVO;
import kr.ac.kopo.vo.MemberVO;

/*
 * 사용자의 정보를 DB에서 조회하는 단 하나의 메소드 loadUserByUsername()을 오버라이딩
 * => 해당 메서드의 리턴타입은 UserDetails 타입임
 * : 데이터 클래스의 데이터는 어떻게 채워넣든 개발자 마음, 중요한 부분은 클래스가 최종적으로 완성된 데이터 클래스의 객체를 리턴하기만 하면 됨
 */
@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private AdminMapper adminMapper;
	
	//일반 유저
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		//건내받은 username(id)값으로 유저 정보 db에서 찾아서 return해준다.
		UserDetails userDetails = null;
		String role = "";
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		if( attr!=null && attr.getRequest() != null ) {
			role = attr.getRequest().getParameter("auth");
		}
		

		switch(role) {
		case "USER":
			MemberVO member = (MemberVO) memberMapper.selectMemberById(id);
			
			if(member == null) {
				return null;
			}
			
			List<String> auth = memberMapper.selectRoleById(id);
			//사용자 권한 select해서 받아온 List<String> 객체 주입
			member.setAuthorities(auth);
			userDetails = member;
			break;
		case "ADMIN":
			AdminVO admin = (AdminVO) adminMapper.selectMemberById(id);
			
			if(admin == null) {
				return null;
			}
			auth = adminMapper.selectRoleById(id);
			//사용자 권한 select해서 받아온 List<String> 객체 주입
			admin.setAuthorities(auth);
			userDetails = admin;
			break;
		}
		
		return userDetails;
		
	}
	
	

}
