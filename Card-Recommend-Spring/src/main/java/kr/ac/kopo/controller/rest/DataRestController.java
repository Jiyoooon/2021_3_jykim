package kr.ac.kopo.controller.rest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.service.IDataService;
import kr.ac.kopo.vo.data.Job2VO;
import kr.ac.kopo.vo.data.WorkSector2VO;

@RestController
@RequestMapping("/api/data")
public class DataRestController {
	
	@Autowired
	@Qualifier("dataServiceImpl")
	private IDataService dataService;
	
	//GET 업종 2차 코드
	@GetMapping("/sector2/{sector1_id}")
	public List<WorkSector2VO> getSector2List(@PathVariable("sector1_id") int sector1){
		List<WorkSector2VO> sector2 = dataService.searchSector2(sector1);
		
		return sector2;
	}
	
	//GET 직업 세부분류 코드
	@GetMapping("/job2/{job1_code}")
	public List<Job2VO> getJob2List(@PathVariable("job1_code") int job1){
		List<Job2VO> job2 = dataService.searchJob2(job1);
		
		return job2;
	}
}
