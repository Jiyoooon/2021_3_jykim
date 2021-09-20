package kr.ac.kopo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.MemberVO;

@Mapper
public interface MemberMapper {

	public MemberVO selectMemberById(String id);
	public List<String> selectRoleById(String id);
}
