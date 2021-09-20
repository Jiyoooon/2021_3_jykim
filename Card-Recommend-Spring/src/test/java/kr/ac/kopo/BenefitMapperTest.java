package kr.ac.kopo;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ac.kopo.mapper.TransMapper;
import kr.ac.kopo.vo.card.BenefitResultVO;
import kr.ac.kopo.vo.card.ParamsVO;
import kr.ac.kopo.vo.card.ParamsVO2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "/root-context.xml")
public class BenefitMapperTest {
	@Autowired
	private TransMapper transMapper;
	
	@Test
	public void test() {
//		ParamsVO2 params = new ParamsVO2();
//		transMapper.selectTemp3(params);
//		
//		System.out.println(params.getTestList());

		ParamsVO params2 = new ParamsVO();
		transMapper.selectTemp4(params2);
		
		//System.out.println(params2.getBenefitList());
		
		for(BenefitResultVO b : params2.getBenefitList()) {
			if(b.getBenefitName() != null) {
				System.out.println(b);
			}
		}
		
//		List<TestVO> p = transMapper.selectTemp();
		Map<String, Object> map = transMapper.selectTemp();
		//System.out.println(p.getTestList());
		Assert.assertNotNull(map);
		Set<String> keys = map.keySet();
		System.out.println("map : " + map.get(0));
		for(String k : keys) {
			System.out.println(k + ", " + map.get(k));
			List<Object> list = (List<Object>) map.get(k);
			
			
		}
		
		Map<String, Object> map2 = transMapper.selectTemp2();
		Set<String> keys2 = map2.keySet();
		
		System.out.println("map2 : " + map2.get(0));
		for(String k: keys2) {
			System.out.println(k+", " +map2.get(k));
		}
//		for(String k : keys) {
//			System.out.println(map.get(k));
//			Collection<Object> values = map.values();
//			String format = "";
//			format = String.valueOf(values);
//			format = format.replaceAll("[=]", ":");
//			format = format.substring(1, format.length()-1);
//			
//			System.out.println(String.valueOf(format));
//			System.out.println(format);
//			
//		}
		
		//System.out.println(p.size());
		
		
	}
}
