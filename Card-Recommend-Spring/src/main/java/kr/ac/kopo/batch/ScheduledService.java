package kr.ac.kopo.batch;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import kr.ac.kopo.HomeController;
import kr.ac.kopo.mapper.CardMapper;
import kr.ac.kopo.mapper.TransMapper;

@Service//@Scheduled 관련 기능
public class ScheduledService {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CardMapper cardMapper;

	@Autowired
	private TransMapper transMapper;
	
	
	public void updateRecoList() {
		//추천 리스트 갱신
		RestTemplate tmp = new RestTemplate();
		String response = tmp.getForObject("http://127.0.0.1:5000/test", String.class, new HashMap<String, Object>());
		System.out.println(response);
	}
	
	
	//@Scheduled(cron = "0 0 0 ? * FRI")//매주 금요일
	//@Scheduled(cron = "0 * * * * *")//매분
	@Scheduled(cron = "0 0 0 L * ?")//아무요일 매월 마지막 날
	public void updateRecoCardList() {
		cardMapper.insertCardStatistics();
		logger.info("insert card_statistics");
	}

	@Scheduled(cron = "0 0 0 1 * *")//아무요일 매월 첫째날 00시
	public void insertTransStatistics() {
		transMapper.insertTransStatistics();
		logger.info("insert trans_statistics");
	}
}
