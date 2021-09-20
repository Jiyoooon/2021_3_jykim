package kr.ac.kopo.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

/*
 * 사용자의 정보를 담고있는 VO 클래스, UserDetails를 구현함
 * Authentication의 구현체인 UsernamePasswordAuthenticationToken을 생성하기 위해 사용됨!
 */
@Component
public class UserDetailsVO implements UserDetails{
	private static final long serialVersionUID = 1L;
	
	private int memberId;
	private String name;
	private String id;
	private String password;
	private List<GrantedAuthority> authorities;
	
	
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String getPassword() {
		return password;
	}
	

	//권한 갱신
	public void setAuthorities(List<String> authList) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

		for (int i = 0; i < authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authList.get(i)));
		}

		this.authorities = authorities;

	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setUsername(String username) {
		this.id = username;
	}
	
	@Override
	public String getUsername() {
		return id;
	}
	
	@Override//계정 만료 여부(true가 사용가능)
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override//계정 잠김 여부(true가 안잠긴 계정)
	public boolean isAccountNonLocked() {
		return true;
	}
	@Override//패스워드 만료 여부(true가 만료 안된 패스워드)
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override//계정 활성화 여부
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String toString() {
		return "UserDetailsVO [memberId=" + memberId + ", name=" + name + ", id=" + id + ", password=" + password
				+ ", authorities=" + authorities + "]";
	}
	
	

}
