package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.vo.data.Job2VO;
import kr.ac.kopo.vo.data.WorkSector2VO;

public interface IDataService {
	
	//get sector2 리스트
	public List<WorkSector2VO> searchSector2(int sector1);

	//get job2 리스트
	public List<Job2VO> searchJob2(int job1);
}
