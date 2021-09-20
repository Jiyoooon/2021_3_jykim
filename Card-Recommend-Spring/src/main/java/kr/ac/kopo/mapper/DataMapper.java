package kr.ac.kopo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.data.Job2VO;
import kr.ac.kopo.vo.data.WorkSector2VO;

@Mapper
public interface DataMapper {

	public List<WorkSector2VO> selectSector2List(int sector1);

	public List<Job2VO> selectJob2List(int job1);
}
