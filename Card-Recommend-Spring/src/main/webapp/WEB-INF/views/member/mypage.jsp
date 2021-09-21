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

                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center" style="font-weight:bold;color:black;">
                    결제예정금액
                  </div>
                  <div class="d-flex align-items-center" id="pay-date">
                    ${mycards[0].payDate } <span> &nbsp;일</span>
                  </div>
                </li>
                
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
              	  	<span style="margin:5px;"><strong>보유 카드</strong>의 혜택이 적용된 업종을 표시합니다.</span>
              	  </div>
	              <div>
              	  	<img style="width:20px;" src="${pageContext.request.contextPath }/resources/assets/images/benefit_square2.png">
              	  	<span style="margin:5px;"><strong>비교(찜한) 카드</strong>의 혜택이 적용된 업종을 표시합니다.</span>
              	  </div>
              	  </div>
              </div>
            </div>
            <div style="text-align: center;width: 100%;"><span style="color:red;" id="bar-chart-warn"></span></div>
            <div class="card-body pt-4 p-3" id="bar-chart-section">
            	<!-- 소비 차트! -->
              <canvas id="bar-chart" style="padding: 20px;"></canvas>

            </div>
          </div>
        </div>
      </div>
      
      <!-- 세부 파이차트 -->
      <div class="row">
        <div class="col-md-7 mt-4">
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

        <div class="col-md-5 mt-4">
          <div class="card">
            <div class="card-header pb-0 px-3">
              <h4 class="mb-0"><span id="donut-sector1-name" style="color:#C90000;">혜택</span> 내역</h4>
            </div>
            <div class="card-body pt-4 p-3" id="top3-card-list">
            	<!-- 혜택 카드! -->
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
  
  <script type="text/template" id="multi-item-template">
	<div class="dibs-multi-item" id="{cardId}" style="padding:10px;">
		<div id="dibs-multi-plastic" style="display:flex;">
			<img id="card-image" src="{cardImageUrl}" style="cursor:pointer;height: fit-content;" width="50%">
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
   		<img id="card-image" src="{cardImageUrl}" style="cursor:pointer;height: fit-content;" width="50%">
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
  
  
  $(document).ready(function(){
	  
	  //datepicker 활성화
	  //$('#datepicker-start').datepicker({ dateFormat: 'yy-mm-dd' });
	  //$('#datepicker-end').datepicker({ dateFormat: 'yy-mm-dd' });
	  //monthpicker 활성화
	  $('#monthpicker-start').monthpicker({ 
		  dateFormat: 'yy-mm' 
	  });
	  $('#monthpicker-end').monthpicker({ 
		  dateFormat: 'yy-mm' 
	  });
	  
	  
	  $('.mycard-hero-slider').slick({
		  	infinite: true,
		  	slidesToShow: 1,
		    arrows: true,
		    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
		    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
		    //dots: false
	  });
	  
	  $('.card-number').each(function(idx, e){
		  let cardNumber = $(e).text().trim();
		  cardNumber = cardNumber.substr(0,4) + '-' + cardNumber.substr(4,4) + '-' + cardNumber.substr(8,4) + '-' + cardNumber.substr(12,4)
		  $(e).text(cardNumber)
		  
	  })
	  
	  $('#monthpicker-end').change(function(e){
		  goSearchConsumption();
	  })
	  
	  //소비 그래프 데이터 가져옴 
	  goSearchConsumption();
	  
	  //찜카드 목록 가져오기
	  getDibsCards();
	  
	  
  })
  
  function getDibsCards(){
	  let dibsList = localStorage.getItem('dibs')
	  if(dibsList == null){
		  return;
	  }
	  
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/dibs",
	    	data: {
	    		dibsLit : dibsList
	    	},
	    	success: function(result){
	    		//카드찜 사이드 채우기
	    		setDibsPage(result)
			}
	  });
  }
  
  //카드찜 사이드 채우기
  function setDibsPage(data){
	  let normal = $('#normal-item-template').html();
	  let multi = $('#multi-item-template').html();
	  let html = ''
	  
	  data.forEach(function(d){
		  if(d.multiFlag == 'F'){//일반 카드
			  html += normal.replace(/\{cardId\}/gi, d.cardId)
							.replace(/\{cardImageUrl\}/gi, d.cardImageUrl)
							.replace(/\{cardName\}/gi, d.cardName)
							.replace(/\{cardType\}/gi, d.cardType)
		  }else{//멀티카드
			  html +=  multi.replace(/\{cardId\}/gi, d.cardId)
							.replace(/\{cardImageUrl\}/gi, d.cardImageUrl)
							.replace(/\{cardName\}/gi, d.cardName)
							.replace(/\{cardType\}/gi, d.cardType);
		  	  d.payCards.forEach(function(m){
				  html += '<img id="card-image" data-toggle="tooltip" src="' + m.cardImageUrl + '" title="' + m.cardName + '" style="margin: 2.5px 5px;" width="35%">'
		  	  });
		  
		  	  html += '</div></div>'
		  }
	  })
	  
	  $('#dibs-list').html(html)
	  //tooltip 활성화
	  $('#dibs-list img[data-toggle="tooltip"]').tooltip({
		  placement:'bottom',
		  html: true
	  });
  }
  
  //소비 그래프 데이터
  function goSearchConsumption(){
	  if($('#monthpicker-start').val() == ''){
		  setMonthpicker(3)//저번달 기준
	  	  return;
	  }

	  let start = $('#monthpicker-start').val();
	  let end = $('#monthpicker-end').val();
	  
	  
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/consumption/" + start + '/' + end,
	    	success: function(result){
	    		console.log(result);
	    		chartData = result;
	    		
	    		if(result.length == 0){
	    			$('#bar-chart-warn').text('해당 기간에 결제 내역이 없습니다.')
	    			return;
	    		}
			    
			    let barLabels = []
			    let barData = []
			    
			    result.forEach(function(e){
			    	barLabels.push(e.workSector1Name)
			    	barData.push(e.sectorBalance)
			    })
			    
			    //바 차트 => 1차
			    setBarChart(barLabels, barData)
			    //도넛 차트 => 2차
			    setDonutChart(0, chartData[0])
			}
	  });
  }
  
  //monthpicker setting
  function setMonthpicker(num){
	  let today = new Date(); 
	  let month = String(today.getMonth() + 1).padStart(2, '0');
	  let year = today.getFullYear();
	  
	  if(num == 1){//작년
		$('#monthpicker-start').val((year-1) + '-01')  
		$('#monthpicker-end').val((year-1) + '-12')  
	  
	  }else if(num == 2){//올해
		$('#monthpicker-start').val(year + '-01')  
		$('#monthpicker-end').val(year + '-' + month)  
		  
	  }else if(num == 3){//저번달
		let lastMonth = String(month-1).padStart(2,'0')
		$('#monthpicker-start').val(year + '-' + lastMonth) 
		$('#monthpicker-end').val(year + '-' + lastMonth) 
		  
	  }else{//num == 4, 이번달
		$('#monthpicker-start').val(year + '-' + month )  
		$('#monthpicker-end').val(year + '-' + month)  
	  
	  } 
	  //기간동안 소비 데이터 검색
	  goSearchConsumption();
  }
  
  
  function assignColor(idx, len){
	  let color = []
	  let step = 40;
	  
	  if(len > 20) step = 6;
	  else if(len > 15) step = 10; 
	  else if(len > 10) step = 20;
	  else if(len > 5) step = 30;
	  
	  let r = chartRgb[idx][0];
	  let g = chartRgb[idx][1];
	  let b = chartRgb[idx][2];
	  
	  while(len > 0){
	      color.push("rgba(" + r + "," + g + "," + b + ", 1)"); 
		  r = (r - step > 0) ? r - step : r;
		  g = (g - step > 0) ? g - step : g;
		  b = (b - step > 0) ? b - step : b;
		  len--
	  }
	  return color 
  }
  
  function setDonutChart(idx, data){
	  $('#donut-chart-section').html('<canvas id="donut-chart" class="chart chart-pie" style="padding: 20px;"></canvas>')
	  $('#donut-sector1-name').text(data.workSector1Name)
	  
	  let donutLabels = [];
	  let donutData = [];
	  
	  data.chart2List.forEach(function(e){
		  donutLabels.push(e.workSector2Name)
	  	  donutData.push(e.sector2Balance)
	  })
	  
	  let ctx_donut = document.getElementById('donut-chart').getContext('2d'); 
	  new Chart(ctx_donut, {
		    type: 'doughnut',
		    data: {
		      labels: donutLabels,
		      datasets: [{
		        data: donutData,      // 섭취량, 총급여량 - 섭취량
		        backgroundColor: assignColor(idx, data.chart2List.length),
		        borderColor: getBenefitBorderColor(chartData[idx].chart2List),
		        borderWidth: 2,
		        //scaleBeginAtZero: true,
		        hoverOffset: 20
		      }]
		    },
		    options: {
				//responsive: false,
				pieceLabel: { 
					//mode: "label",
					 render: function(d) { 
						 return d.label + "(" + d.percentage + "%)" 
					 },
					 fontColor: '#000',
					 //fontSize:'bold',
					 position: 'outside',
					 segment: true
				},
				legend: false,
				maintainAspectRatio : false, 
				cutoutPercentage: 60,
				scaleShowLabelBackdrop : true,
			}
		  
		});
	  
	  //$('#donut-chart').css('height','450px')
  }
  
  //업종1 혜택 높은 순서로 카드 조회
  function setTop3Card(idx){
	  console.log("top3! : ")
	  console.log(chartData[idx])
	  
	  $.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/reco/" + chartData[idx].workSector1Code,
	    	success: function(result){
	    		console.log(result)

	    		//top3-card-list 채움
	    		//setTop3CardList(result)
			}
	  });
  }
  
  function setBarChart(labels, data){
	  $('#bar-chart-warn').text('')
	  $('#bar-chart-section').html('<canvas id="bar-chart" style="padding: 20px;"></canvas>')
	 //소비 그래프
	
	  let ctx_bar = document.getElementById('bar-chart').getContext('2d'); 
	  new Chart(ctx_bar, {
	    type: 'bar',
	    data: {
	        labels: labels, 
	        datasets: [
	         {
	            label: '업종별 소비량',
	            data: data,
	            //borderColor: "rgba(255, 201, 14, 1)",
	            backgroundColor:  
	            	"rgba(255, 201, 14, 1)",
//	            	"rgba(213,213,213)",
//	            	"rgba(181,214,146)",
//	            	"rgba(171,242,0)",
//	            	"rgba(250,237,125)",
				borderColor: getBenefitBorderColor(chartData),
				borderWidth: 2,
	            fill: false,
	        }
	       /*  ,{
	            label: '찜카드 소비량',
	            data: data2,
	            backgroundColor: getCompareColor(data, data2),
	            borderColor: getCompareBorderColor(data, data2),
	            borderWidth: 1,
	            fill: false,
	        }  */
	        ]
	    },
	    options: {
	    	legend: {
	    		labels:{
	    			fontSize: 15
	    		}
	    	},
	    	label: {
	            font: {
					fontColor: "black",
	                family: "Pretendard",
	                fontSize: 15,
	            }
	        },
			data: {
	            font: {
	            	fontSize: 20,
	                family: "Pretendard"
	            }
	        },
	        responsive: true,
	        title: {
	            display: true,
	            text: '소비 그래프',
	            fontSize: 25,
				fontFamily: 'Pretendard'
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true,
	            backgroundColor: "rgba(255, 201, 14, 1)",
	            
	        },
	        onClick: function(point, event) {
	            if(event.length <= 0) return;
				let idx = event[0]['_index']
				
				//도넛 차트 새로그림
				setDonutChart(idx, chartData[idx])
				setTop3Card(idx)
	        },
	        scales: {
	            xAxes: [{
	                display: true,
	                scaleLabel: {
	                    display: true,
	                    //labelString: '업종'
	                },
	                ticks: {
	                    autoSkip: false,
	                    fontFamily:'Pretendard',
	                    fontSize: 15
	                }
	            }],
	            yAxes: [{
	                display: true,
	                ticks: {
	                    suggestedMin: 0,
	                    callback: function(value, index) {
	                    	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원';
	                    },
	                    fontSize: 15
	                },
	                scaleLabel: {
	                    display: true,
	                    //labelString: '소비 금액'
	                }
	            }]
	        }
	    } 
	    
	});
	
	

  }
  
  //비교 그래프 색깔
  function getCompareColor(data, data2){
	  let color = []
	  data.forEach(function(d, idx){
		  if(d < data2[idx]){
			  color.push('rgb(255,0,0,0.3)')
		  }else{
			  color.push('rgb(0,0,255,0.3)')
		  }
	  })
	  return color
  }
  function getCompareBorderColor(data, data2){
	  let color = []
	  data.forEach(function(d, idx){
		  if(d < data2[idx]){
			  color.push('rgb(255,0,0,1)')
		  }else{
			  color.push('rgb(0,0,255,1)')
		  }
	  })
	  return color
  }
  //혜택이 적용된 업종의 경우 border 처리
  function getBenefitBorderColor(data){
	  let color = []
	  data.forEach(function(d, idx){
		  if(d.hasBenefit == 1){
			  console.log(d+", "+d.hasBenefit)
			  color.push('rgb(255,0,0,1)')
		  }else{
			  color.push('transparent')
		  }
	  })
	  return color
  }
  
  
  //Fixed Plugin
  if (document.querySelector('.fixed-plugin')) {
    var fixedPlugin = document.querySelector('.fixed-plugin');
    var fixedPluginButton = document.querySelector('.fixed-plugin-button');
    var fixedPluginButtonNav = document.querySelector('.fixed-plugin-button-nav');
    var fixedPluginCard = document.querySelector('.fixed-plugin .card');
    var fixedPluginCloseButton = document.querySelectorAll('.fixed-plugin-close-button');
    var navbar = document.getElementById('navbarBlur');
    var buttonNavbarFixed = document.getElementById('navbarFixed');

    if (fixedPluginButton) {
      fixedPluginButton.onclick = function() {
        if (!fixedPlugin.classList.contains('show')) {
          fixedPlugin.classList.add('show');
        } else {
          fixedPlugin.classList.remove('show');
        }
      }
    }

    if (fixedPluginButtonNav) {
      fixedPluginButtonNav.onclick = function() {
        if (!fixedPlugin.classList.contains('show')) {
          fixedPlugin.classList.add('show');
        } else {
          fixedPlugin.classList.remove('show');
        }
      }
    }

    fixedPluginCloseButton.forEach(function(el) {
      el.onclick = function() {
        fixedPlugin.classList.remove('show');
      }
    })

    document.querySelector('body').onclick = function(e) {
      if (e.target != fixedPluginButton && e.target != fixedPluginButtonNav && e.target.closest('.fixed-plugin .card') != fixedPluginCard) {
        fixedPlugin.classList.remove('show');
      }
    }

    if (navbar) {
      if (navbar.getAttribute('navbar-scroll') == 'true') {
        buttonNavbarFixed.setAttribute("checked", "true");
      }
    }

  }
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
    
    
    let an = $('#account-number').text().trim()
    an = an.substr(0,6) + '-' + an.substr(6,2) + '-' + an.substr(8,14)
    $('#account-number').text(an)
    
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
<%--   <script src="${pageContext.request.contextPath }/resources/assets2/js/soft-ui-dashboard.min.js?v=1.0.3"></script> --%>
  <%-- <script src="${pageContext.request.contextPath }/resources/assets2/js/soft-ui-dashboard.js"></script> --%>
</body>

</html>
