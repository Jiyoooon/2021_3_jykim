<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>

<div style="height: 60px; "></div>

<body class="g-sidenav-show  bg-gray-100">
 <div class="title text-center">
	<h2>마이페이지</h2>
	<div class="border"></div>
 </div>
  
  <main class="main-content position-relative max-height-vh-100 h-100 mt-1 border-radius-lg ">
   
    <!-- End Navbar -->
    <div class="container py-4">
      <div class="row">
        <div class="col-lg-4">
          	<!-- 보유 카드 목록 -->
			<div style="margin: 0 auto; max-width: 450px;">
				<div class="mycard-hero-slider" style="width: 100%;" id="mycard-reco-cardlist">
					<c:forEach items="${mycards }" var="card">
						<div class="card-slider-item " style="height:350px;background: transparent;">
							<div class="container">
								<div id="card${card.memberCardId}" class="card-item">
									<div class="portfolio-block" style="margin-bottom: 5px;">
										<img class="img-fluid card-image" style="width: 100%;" src="${card.cardImageUrl}" alt="">
									<div class="caption" style="width: 80%;">
										<h3 class="text-white mt-4 mb-5 pb-2 card-number" >${card.cardNumber }</h3>
					                    <div class="d-flex">
					                      <div class="d-flex">
					                        <div class="me-4">
					                          <p class="text-white opacity-8 mb-0">Card Holder</p>
					                          <h6 class="text-white mb-0">
					                          	<sec:authentication property="principal.englishName"/>
					                          </h6>
					                        </div>
					                        <div>
					                          <p class="text-white opacity-8 mb-0">Expires</p>
					                          <h6 class="text-white mb-0">${card.cardValidMonth }/${card.cardValidYear }</h6>
					                        </div>
					                      </div>
					                    </div>
										
									</div>
									</div>
									<h4 style="color:black; margin:0; font-family: 'Pretendard';">
										<a class="btn btn-main"
												style="color:black;background:white; margin-bottom: 0;padding: 8px 10px;">${card.cardType }카드</a>
										<span>&nbsp;&nbsp;${card.cardName }</span>
									</h4>
									
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
        
        </div>
        
        <!-- 연결 계좌 정보, 결제일 -->
        <div class="col-lg-4" style="padding-top: 40px;">
          <div class="card">
            <div class="card-header pb-0 p-3">
              <div class="row">
                <div class="col-6 d-flex align-items-center">
                  <h4 class="mb-0">카드 정보</h4>
                </div>
                <div class="col-6 text-end">
                  <!-- <button class="btn btn-outline-primary btn-sm mb-0">수정하기</button> -->
                </div>
              </div>
            </div>
            <div class="card-body pb-0" style="font-family: 'Pretendard';">
              <ul class="list-group" >
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center" style="font-weight:bold;color:black;">
                    연결계좌
                  </div>
                  <div class="d-flex align-items-center" id="account-number">
                    ${mycards[0].accountNumber }
                  </div>
                </li>

                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center" style="font-weight:bold;color:black;">
                    결제일
                  </div>
                  <div class="d-flex align-items-center" id="pay-date">
                    ${mycards[0].payDate } <span> &nbsp;일</span>
                  </div>
                </li>

                <%-- <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center" style="font-weight:bold;color:black;">
                    결제예정금액
                  </div>
                  <div class="d-flex align-items-center" id="pay-date">
                    ${mycards[0].payDate } <span> &nbsp;일</span>
                  </div>
                </li> --%>
                
              </ul>
            </div>
          </div>
        </div>
        
        <!-- 내정보, 개인정보 변경 버튼 -->
        <div class="col-lg-4" style="padding-top: 40px;">
          <div class="card"><!-- h-100 -->
            <div class="card-header pb-0 p-3">
              <div class="row">
                <div class="col-6 d-flex align-items-center">
                  <h4 class="mb-0">내 정보</h4>
                </div>
                <div class="col-6 text-end">
                  <button class="btn btn-outline-primary btn-sm mb-0">수정하기</button>
                </div>
              </div>
            </div>
            <div class="card-body pb-0" style="font-family: 'Pretendard';">
              <ul class="list-group" >
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center" style="font-weight:bold;color:black;">
                    연락처
                  </div>
                  <div class="d-flex align-items-center">
                    <sec:authentication property="principal.tel1"/>-
					<sec:authentication property="principal.tel2"/>-
					<sec:authentication property="principal.tel3"/>
                  </div>
                </li>

                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center" style="font-weight:bold;color:black;">
                    이메일
                  </div>
                  <div class="d-flex align-items-center">
                   	<sec:authentication property="principal.emailId"/>@
                   	<sec:authentication property="principal.emailDomain"/>
                  </div>
                </li>
                
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 소비 그래프 -->
      <div class="row">
        <div class="col-md-12 mt-4">
          <div class="card">
            <div class="card-header pb-0 px-3">
              <div>
	              <h4 class="mb-0" style="float:left;">나의 소비 그래프</h4>
	              <div  style="float: right;display: flex;">
		              <div><input class="form-control" placeholder="시작 날짜" type="text" id="monthpicker-start"></div>
		              <div><span style="line-height: 2">&nbsp;~ &nbsp;</span></div>
		              <div><input class="form-control" placeholder="종료 날짜" type="text" id="monthpicker-end"></div>
	              </div>
              </div>
              <div>
              	  <div style="clear: both; padding: 5px;">
		              <div style="text-align: right;">
		              	<button style="padding: 2px 4px; margin-top: 0.5rem;" class="btn btn-outline-primary btn-lg mb-0" onclick="setMonthpicker(1);">작년</button>
		              	<button style="padding: 2px 4px; margin-top: 0.5rem;" class="btn btn-outline-primary btn-lg mb-0" onclick="setMonthpicker(2);">올해</button>
		              	<button style="padding: 2px 4px; margin-top: 0.5rem;" class="btn btn-outline-primary btn-lg mb-0" onclick="setMonthpicker(3);">저번달</button>
		              	<button style="padding: 2px 4px; margin-top: 0.5rem; " class="btn btn-outline-primary btn-lg mb-0" onclick="setMonthpicker(4);">이번달</button>
		              </div>
		              <div>
	              	  	<img style="width:20px;" src="${pageContext.request.contextPath }/resources/assets/images/benefit_square.png">
	              	  	<span style="margin:5px;"><strong>보유카드</strong>의 혜택이 적용된 업종을 표시합니다.</span>
	              	  </div>
		              <div>
	              	  	<img style="width:20px;" src="${pageContext.request.contextPath }/resources/assets/images/benefit_square3.png">
	              	  	<span style="margin:5px;"><strong>비교(찜한) 카드</strong>의 혜택이 적용된 업종을 표시합니다.</span>
	              	  </div>
		              <div>
	              	  	<img style="width:20px;" src="${pageContext.request.contextPath }/resources/assets/images/benefit_square2.png">
	              	  	<span style="margin:5px;"><strong>보유카드</strong>와 <strong>비교(찜한) 카드</strong>의 혜택이 모두 적용된 업종을 표시합니다.</span>
	              	  </div>
              	  </div>
              </div>
            </div>
            <div style="text-align: center;width: 100%;"><span style="color:red;" id="bar-chart-warn"></span></div>
            <div class="card-body pt-4 p-3" id="bar-chart-section">
            	<!-- 소비 차트! -->
              <div>
              	<canvas id="bar-chart" style="padding: 20px;"></canvas>
			  </div>
			  <div id="payTotal">
			  </div>
            </div>
          </div>
        </div>
      </div>
      
      <!-- 세부 파이차트 -->
      <div class="row">
        <div class="col-md-6 mt-4">
          <div class="card">
            <div class="card-header pb-0 px-3">
              <h4 class="mb-0"><span id="donut-sector1-name" style="color:green"></span> 업종 상세정보</h4>
            </div>
            <div class="card-body pt-4 p-3" id="donut-chart-section">
            	<!-- 소비 차트! -->
              <canvas id="donut-chart" style="padding: 20px;"></canvas>

            </div>
          </div>
        </div>

		<!-- 혜택 내역 -->
        <div class="col-md-6 mt-4">
          <div class="card">
            <div class="card-header pb-0 px-3">
              <h4 class="mb-0"><span id="donut-sector1-name">혜택 내역</span></h4>
            </div>
            <div class="card-body pt-4 p-5" id="benefit-history" style="font-family: 'Pretendard';">
            	<!-- 혜택 카드! -->
            	<div id="mycard-benefit-history">
            		<h4 style="font-family: 'Pretendard'; color: black;"><span style="color:#C90000;">보유카드</span> 혜택내역</h4>
            		<div id="card-benefit-section">
            		
	            	</div>
            	</div>
            	
            	<hr>
            	<div id="dibscard-benefit-history">
            		<h4  style="font-family: 'Pretendard'; color: black;"><span style="color:blue;">찜카드</span> 혜택내역</h4>
            		<div id="card-benefit-section">
            		
	            	</div>
            		
            	</div>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    <jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>
  </main>
  
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="far fa-credit-card py-2"> </i>
    </a>
    <div class="card shadow-lg " style="overflow: scroll;">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h3 class="mt-3 mb-0"></h3>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h3 class="mb-0">찜 카드</h3>
          <p>카드를 클릭해서 보유카드와 혜택을 비교해보세요.</p>
        </div>
        <hr>
        <!-- 찜 한 카드 목록  -->
        <div id="dibs-list" style="margin-top: 1rem; white-space: inherit; word-break: break-all;">
        		
        </div>
      </div>
    </div>
  </div>
  
  <script type="text/templage" id="benefit-card-header-template">
	<div id="card-benefit-item" style="padding:10px;">
	    <div style="display:flex;">
			<img src="{cardImageUrl}" width="150px;"><br>
			<div style="padding: 10px 20px;">
				<h4 style=" font-family: 'Pretendard'" id="benefitTotal">총 {totalBenefit}원 혜택</h4> 
				<h5 class="picking" style=" font-family: 'Pretendard'" title="피킹률 : 혜택 금액 / 총 소비액">피킹률 : <span>{pickingPercentage}</span>%</h5>   
				
			</div>         			
		</div>
		{benefitsBody}
	</div>
  </script>
  
  <script type="text/templage" id="benefit-card-body-template">
   	<div style="display: table; padding:10px; width:100%" >
   		<div style="width: 30%; text-align: center; display:table-cell; vertical-align: middle;">
     		<span style="font-size:18px; font-weight: bold; color:black;">{benefitName}</span>
   		</div>
   		<div style="width: 40%; text-align: center; display:table-cell; vertical-align: middle;">
			{benefitBtns}     		
    	</div>
    	<div style="width: 30%; display:table-cell;text-align:center; vertical-align: middle;">
    		{benefitSubTotal}
    	</div>
   	</div>
  </script>
  
  <script type="text/template" id="multi-item-template">
	<div class="dibs-multi-item" id="{cardId}" style="padding:10px;">
		<div id="dibs-multi-plastic" style="display:flex;">
			<img id="card-image" src="{cardImageUrl}" style="cursor:pointer;height: fit-content;" width="50%" onclick="{clickEvent}">
			<div style="padding:10px;margin-left:20px;" >
				<h6 style="font-family: 'Pretendard'; color:black;margin: 0;">{cardType}카드</h6>
				<p>{cardName}</p>		
			</div>
		</div>
		<p style="margin:0; font-size:12px; cursor:pointer; color:black;" onclick="$(this).next().slideToggle();">▶ 멀티카드 조합 보기</p>
		<div id="multi-pay-card-list" style="margin-left:2rem; display:none;">
			
		<!--
			<img id="card-image" src="/images/card/100.png" title="" width="40%">
			<img id="card-image" src="/images/card/102.png" title="" width="40%">
		</div>
	</div>-->
  </script>
  <script type="text/template" id="normal-item-template">
	<div class="dibs-normal-item"  id="{cardId}" style="display:flex; padding:10px;">
   		<img id="card-image" src="{cardImageUrl}" style="cursor:pointer;height: fit-content;" width="50%" onclick="goSearchDibsBenefitHistory({cardId});">
   		<div style="padding:10px;margin-left:20px;">
   			<h6 style="font-family: 'Pretendard'; color:black;margin: 0;">{cardType}카드</h6>
   			<p>{cardName}</p>		
   		</div>
   	</div>
  </script>
  
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
  <!-- <script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script> -->
  <script src="https://rawgit.com/beaver71/Chart.PieceLabel.js/master/build/Chart.PieceLabel.min.js"></script>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath }/resources/assets2/js/core/popper.min.js"></script>
  <!-- Bootstrap4 -->
  <%-- <script src="${pageContext.request.contextPath }/resources/assets2/js/core/bootstrap.min.js"></script> --%>
  <script src="${pageContext.request.contextPath }/resources/assets2/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/jquery.ui.monthpicker.js"></script>
  
  <script>
  
  var chartData;
  var dibsData = null;
  //[231,231,231], : 회색
  var chartRgb = [	[255,203,203],
	  				[178,204,255],
	  				[255,196,235],
	  				[209,178,255],
	  				[181,178,255],
	  				[134,229,127],
	  				[250,237,125],
	  				[181,178,255],
	  				[255,193,158],
	  				[255,167,167],
	  				[110,227,247],
	  				[183,120,255],
	  				[134,229,127],
	  				[255,168,115],
	  				[243,97,166],
	  				[168,101,253],
	  				[107,102,255]
	  			]
  
  </script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/mypage.js"></script>
  
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<%--   <script src="${pageContext.request.contextPath }/resources/assets2/js/soft-ui-dashboard.min.js?v=1.0.3"></script> --%>
  <%-- <script src="${pageContext.request.contextPath }/resources/assets2/js/soft-ui-dashboard.js"></script> --%>
</body>

</html>
