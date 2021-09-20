<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
    
<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>
<style>
	#card-insert-form{
		font-family: "Pretendard";
	}
</style>
<section class="contact-us dashboard-child" id="card-insert-form">
	<div class="container-fluid">
		<div>
			<!-- section title -->
			<div class="col-12">
			<div class="title text-center" >
				<h2>카드 등록</h2>
				<!-- <p></p> -->
				<div class="border"></div>
			</div>
			</div>
			<!-- /section title -->
			<!-- Contact Form -->
			<!-- <div class="auth-filter text-center col-lg-6 col-md-8 " style="margin:0 auto; padding:0;">
				<button type="button" style="border:none; padding: 10px 20px; margin-right: -4px; width: 50%;" id="clicked">휴대폰 인증</button>
				<button type="button" style="border:none; padding: 10px 20px; margin-left: -2px; width: 50%;" >카드 인증</button>
			</div> -->
			<div class="card rounded contact-form col-lg-7 col-md-8" style="padding: 60px; margin: 0 auto; text-align: center;">
				<form id="card-insert-form2" method="post" role="form" action="${pageContext.request.contextPath }/admin/card" enctype="multipart/form-data">
					<div class="row">
						<label for="id" class="col-3 hana-md" data-toggle="dropdown" style="font-size: 18px; line-height: 48px; width:30%; float:left;">카드 종류</label>
						<div class="form-group col-sm-3">
	                       <select name="cardTypeId" class="form-control" id="cardTypeId" style="text-align:center;">
								<option value="001" selected>신용카드</option>
								<option value="002">체크카드</option>
								<option value="003">제휴카드</option>
							</select>
	                    </div>
                    </div>
					
					<div class="row">
						<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">카드 이름</label>
						<div class="form-group col-8">
							<input type="text" placeholder="이름" class="form-control" name="cardName" id="cardName">
						</div>
					</div>

					<div class="row">
						<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">카드 정보</label>
						<div class="form-group col-8">
							<input type="text" placeholder="카드 한 줄 설명" class="form-control" name="cardInfo" id="cardInfo">
						</div>
					</div>

					<div class="row">
						<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">연회비</label>
						<div class="form-group col-8">
							<input type="text" placeholder="ex) 10000" class="form-control" name="cardAnnualfee" id="cardAnnualfee">
						</div>
					</div>

					<div class="row">
						<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">연회비 설명</label>
						<div class="form-group col-8">
							<input type="text" placeholder="ex) 국내전용 면제 / VISA 10000원" class="form-control" name="cardAnnualfeeInfo" id="cardAnnualfeeInfo">
						</div>
					</div>

					<div class="row">
						<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">카드 이미지</label>
						<div class="form-group col-8">
							<input type="file" class="form-control" name="cardImage" id="cardImage">
						</div>
					</div>
					<div class="row">
						<label for="id" class="col-3 hana-md" style="width:30%; float:left;"></label>
						<img class="col-6" id="cardImageThumbnail" style="display:none;"/>
					</div>

					<hr>
					
					
					
					
					<div class="row">
						<label for="id" class="col-2 hana-md" style="font-size: 18px; line-height: 48px; width:20%;margin: 0;">카드 혜택</label>

						
						<div class="form-group  col-3">
							<input type="text"  placeholder="혜택이름" class="form-control" id="benefit-name">
						</div>
						<div class="form-group col-sm-2">
	                       <select class="form-control" id="benefit-code">
								<option value="001" selected>할인</option>
								<option value="002">적립</option>
								<option value="003">마일리지</option>
								<option value="004">캐쉬백</option>
								<option value="005">기타</option>
							</select>
	                    </div>
						<div class="form-group col-3" style="padding-right: 0;" >
							<input type="text"  placeholder="ex) 10" class="form-control" id="benefit-info">
						</div>
						<div class="col-1" style="padding-left: 0;">
							<span id="percentage" style="line-height: 40px;">(%)</span>
						</div>
						
						<div class="col-2" style="width: 20%;"></div>
						<div class="col-3" ></div>
						<div class="col-2" ></div>
						<div class=" col-4" style="text-align: left;">
							<span id="benefit-info-warn" style="color: red; display:none;">할인/적립은 숫자만 입력 가능</span>
						</div>
						
						
						
						<div class="form-group col-2" style="width: 20%;">
						</div>
						<div class="form-group col-sm-3">
	                       <select class="form-control" id="work-sector1">
								<option value="0" disabled selected>1차 업종</option>
								<option value="1">도매/유통/무역</option>
								<option value="2">소매</option>
								<option value="3">전기/가스/수도</option>
								<option value="4">생할서비스</option>
								<option value="14">음식</option>
								<option value="12">숙박</option>
								<option value="5">교통/운송</option>
								<option value="6">전자/정보통신</option>
								<option value="13">스포츠</option>
								<option value="15">학문/교육</option>
								<option value="16">의료</option>
								<option value="11">관광/여가/오락</option>
								<option value="8">금융</option>
								<option value="9">부동산</option>
								<option value="10">문화/예술/종교</option>
								<option value="7">기술/건축/환경</option>
								<option value="17">미디어</option>
								<option value="18">국가기관/단체</option>
							</select>
	                    </div>
						
						<div class="form-group col-sm-3">
	                       <select class="form-control" id="work-sector2">
								<option value="0" disabled selected>2차 업종</option>
							</select>
	                    </div>
						<div class="form-group col-3 work-sector2-btn-list" style="font-size: 14px;">
							<!-- 추가한 2차업종 리스트 -->
							<span>혜택에 포함되는 업종을 <br>모두 선택해주세요.</span>
							
	                    </div>
	                    
						

						<div class="form-group col-2" style="width: 20%;">
						</div>
						<div class="form-group col-6">
							<input type="text"  placeholder="사업자 번호( , 로 구분)" class="form-control" id="business-number">
						</div>
						<div class="form-group col-2" style="padding-right: 0;" >
							<input type="text" placeholder="혜택 한도" id="limit" name="limit" class="form-control">
						</div>
						<div class="col-1" style="padding-left: 0;">
							<span id="percentage" style="line-height: 50px;">원</span>
						</div>
						
						<div class="form-group" style="text-align:center;">
							<input type="button" id="card-insert-submit" class="btn btn-main" 
								style="color: white; padding: 8px 15px; margin-top: 5px;" value="혜택 추가" onclick="addBenefit();">
						</div>
					</div>
					
					<!-- visible -->
					<div id="benefit-btn-list">
						<!-- <input type="button" id="card-insert-submit" class="rounded btn btn-main" style="color: #00907f; background: white; border: 2px solid #00907f; padding: 8px 15px; margin-top: 5px;" 
								value="음식/카페 - 10%" onclick="deleteBenefit();"> -->
					</div>
					
					<!-- invisible -->
					<div id="benefit-list"></div>
					
					
					<div id="cf-submit">
						<input type="submit" id="card-insert-submit" class="rounded btn btn-transparent" style="background: #00907f; color:white; margin-top: 20px;" value="등록">
					</div>	
					<s:csrfInput/>					
				</form>
			</div>
			<!-- ./End Contact Form -->
		
		</div> <!-- end row -->
	</div> <!-- end container -->
	<div style="height: 90px;"></div>
</section> <!-- end section -->


<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
<script type="text/template" id="benefit-item-template">
	<div class="benefit-item">
		<input type="hidden" value="{ws1}" name="benefits[{idx}].workSector1Code" id="workSector1Code">
		<input type="hidden" value="{ws2}" name="benefits[{idx}].workSector2Code" id="workSector2Code">
		<input type="hidden" value="{bc}" name="benefits[{idx}].benefitCode" id="benefitCode" >
		
		<input type="hidden" value="{bn}" name="benefits[{idx}].benefitName" id="benefitName" >
		<input type="hidden" value="{bi}" name="benefits[{idx}].benefitInfo" id="benefitInfo" >
		<input type="hidden" value="{bns}" name="benefits[{idx}].businessNumber" id="businessNumber" >
		<input type="hidden" value="{l}" name="benefits[{idx}].limit" id="limit" >
	</div>
</script>
