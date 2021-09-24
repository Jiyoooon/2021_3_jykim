package kr.ac.kopo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.ac.kopo.vo.card.TransactionVO;
import kr.ac.kopo.vo.trans.BenefitParamsVO;

@Mapper
public interface TransMapper {
	//해당 기간동안 결제 데이터
	public List<TransactionVO> selectAllTrans(String memberId, String start, String end);
	
	
	//test
//	public Map<String, Object> selectTemp();
//	public Map<String, Object> selectTemp2();
//	public ParamsVO2 selectTemp3(ParamsVO2 params);
	
	//찜한 신용카드 혜택 계산 => calculate_benefit
	public BenefitParamsVO dibsCardBenefit(BenefitParamsVO params);
	
	// 신용카드 top10 혜택 계산 => calculate_credit_top10_benefit
	public BenefitParamsVO selectCreditTop10(BenefitParamsVO params);

	// 멀티카드 혜택 계산 => calculate_multi_benefit
	public BenefitParamsVO selectMultiCardBenefit(BenefitParamsVO params);
	
	//내 보유카드 혜택계산 => mycard_benefit
	public BenefitParamsVO mycardBenefit(BenefitParamsVO params);
	
	//신용카드 top10 추천 => 신용카드 전부 calculate_benefit & benefit_total top 10 추려서 return
	
	//찜한 멀티카드 혜택 계산 => 멀티카드 2개 calculate_benefit해서 return
	
	//멀티카드 top3 조합 추천 => 멀티카드 6개 전부 calculate_benefit 해서 return
}
