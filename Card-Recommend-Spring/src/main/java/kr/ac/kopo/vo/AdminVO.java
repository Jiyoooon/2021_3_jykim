package kr.ac.kopo.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

//관리자
public class AdminVO implements UserDetails{ 
	private static final long serialVersionUID = 1L;
	
	private int adminId;
	private String tel1;
	private String tel2;
	private String tel3;
	private String emailId;
	private String emailDomain;
	private String createdAt;
	private String name;
	private String role;
	
	private String id;
	private String password;
	private List<GrantedAuthority> authorities;
	
	
	
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getEmailDomain() {
		return emailDomain;
	}
	public void setEmailDomain(String emailDomain) {
		this.emailDomain = emailDomain;
	}
	
	public String getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

	
	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", emailId="
				+ emailId + ", emailDomain=" + emailDomain + ", createdAt=" + createdAt + ", name=" + name + ", role="
				+ role + ", id=" + id + ", password=" + password + ", authorities=" + authorities + "]";
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
	
	
}
