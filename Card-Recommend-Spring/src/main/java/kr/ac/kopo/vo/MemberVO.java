package kr.ac.kopo.vo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class MemberVO implements UserDetails{ 
	private static final long serialVersionUID = 1L;
	
	private int memberId;
	private String refreshToken;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email;
	private String emailId;
	private String emailDomain;
	private String jobType1Code;
	private String jobType2Code;
	private String gender;
	private String birth;
	private String post;
	private String baseAddress;
	private String detailAddress;
	private String createdAt;
	private String name;
	private String englishName;
	private String infoAgree;
	private String openbankAgree;
	private String role;
	private double rate;
	
	private String id;
	private String password;
	private List<GrantedAuthority> authorities;
	
	
	
	
	
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
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
	
	
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
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
	
	public String getJobType1Code() {
		return jobType1Code;
	}
	public void setJobType1Code(String jobType1Code) {
		this.jobType1Code = jobType1Code;
	}
	public String getJobType2Code() {
		return jobType2Code;
	}
	public void setJobType2Code(String jobType2Code) {
		this.jobType2Code = jobType2Code;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getBaseAddress() {
		return baseAddress;
	}
	public void setBaseAddress(String baseAddress) {
		this.baseAddress = baseAddress;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
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
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getInfoAgree() {
		return infoAgree;
	}
	public void setInfoAgree(String infoAgree) {
		this.infoAgree = infoAgree;
	}
	public String getOpenbankAgree() {
		return openbankAgree;
	}
	public void setOpenbankAgree(String openbankAgree) {
		this.openbankAgree = openbankAgree;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", id=" + id + ", password=" + password + ", refreshToken="
				+ refreshToken + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", emailId=" + emailId
				+ ", emailDomain=" + emailDomain + ", jobType1Code=" + jobType1Code + ", jobType2Code=" + jobType2Code + ", gender=" + gender + ", birth="
				+ birth + ", post=" + post + ", baseAddress=" + baseAddress + ", detailAddress=" + detailAddress
				+ ", createdAt=" + createdAt + ", name=" + name + ", englishName=" + englishName + ", infoAgree="
				+ infoAgree + ", openbankAgree=" + openbankAgree + ", role=" + role + "]";
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
