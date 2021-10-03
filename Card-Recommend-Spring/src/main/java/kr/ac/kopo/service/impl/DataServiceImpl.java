package kr.ac.kopo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.mapper.DataMapper;
import kr.ac.kopo.service.IDataService;
import kr.ac.kopo.vo.card.CardVO;
import kr.ac.kopo.vo.data.Job2VO;
import kr.ac.kopo.vo.data.WorkSector2VO;

@Service
public class DataServiceImpl  implements IDataService{

	@Autowired
	private DataMapper dataMapper;
	
	@Override
	public List<WorkSector2VO> searchSector2(int sector1) {
		return dataMapper.selectSector2List(sector1);
	}
	
	@Override
	public List<Job2VO> searchJob2(int job1) {
		return dataMapper.selectJob2List(job1);
	}

	@Override
	public List<CardVO> searchCard(int cardType) {
		String type = "";
		switch(cardType){
			case 0: type = "001"; break;
			case 1: type = "002"; break;
			case 2: type = "005"; break;
		}
		
		return dataMapper.selectCardList(type);
	}

}
