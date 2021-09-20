package kr.ac.kopo.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.card.ParamsVO;
import kr.ac.kopo.vo.card.ParamsVO2;
import kr.ac.kopo.vo.card.TransactionVO;

@Mapper
public interface TransMapper {
	//해당 기간동안 결제 데이터
	public List<TransactionVO> selectAllTrans(String memberId, String start, String end);
	
	
	//test!!!!!!!!!
	public Map<String, Object> selectTemp();
	public Map<String, Object> selectTemp2();
	public ParamsVO2 selectTemp3(ParamsVO2 params);
	public ParamsVO selectTemp4(ParamsVO params);
//	public List<TestVO> selectTemp();
}
