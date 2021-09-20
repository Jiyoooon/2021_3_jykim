package kr.ac.kopo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.AdminVO;

@Mapper
public interface AdminMapper {

	public AdminVO selectMemberById(String id);
	public List<String> selectRoleById(String id);
}
