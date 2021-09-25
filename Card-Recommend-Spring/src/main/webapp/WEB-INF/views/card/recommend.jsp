<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style-multi-slider.css">  

<sec:authorize access="isAnonymous()">
	<!-- login X -->
	<section class="text-align" id="about" style="margin-top: 70px;">
		<div class="container card about col-lg-6 col-md-8">
			<div class="row">
			
				<!-- section title -->
				<div class="text-center" >
					<h3>맞춤 카드 추천</h3>
					<p>나의 소비패턴을 기반으로 맞춤 카드 추천받기</p>
					<a class="btn btn-main" id="recommend-login-btn" href="${pageContext.request.contextPath }/login">로그인</a>
				</div>
			</div> 		<!-- End row -->
		</div>   	<!-- End container -->
	</section>   <!-- End section -->
</sec:authorize>


<sec:authorize access="hasRole('ROLE_USER')">
	<!-- 추천 결과 출력 -->
	<div class="text-center rounded card" style="position: relative; padding: 50px; background:#cadfc4;width:90%;margin: 0 auto; margin-top: 60px;">
		<div id="mycard-reco-spinner" class="container text-align">
			<div class="circle">
			  <span class="ouro ouro3">
			    <span class="left"><span class="anim"></span></span>
			    <span class="right"><span class="anim"></span></span>
			  </span>
			</div>
			<h5 style="color:black; font-family: 'Pretendard'; ">
				<span ><sec:authentication property="principal.name"/></span>
				님에게 꼭 맞는 카드를 찾고 있어요!
			</h5>
		</div>
		
		<div style="visibility: hidden; " id="reco-card-section">
			<div id="mycard-reco-card-section" >
				<h2 style="color: black; font-family: Pretendard">
					<span ><sec:authentication property="principal.name"/>&nbsp;</span>님에게 <span style="color: green;">꼭</span> 맞는 카드
				</h2>
				<p style="color:#3d3d3d;">고객님의 <strong>최근 3개월</strong> 치 소비내역에 각 카드 혜택을 적용해 시뮬레이션을 돌린 결과입니다.
					<br>찜하기를 눌러 마이페이지에서 자세히 비교해보세요!</p>
				<div class="border"></div>
				
				<!-- 추천 카드 목록 -->
				<div style="margin: 0 auto; width: 90%; max-width: 1250px; text-align:right;">
					<div class="card-sort-filter" style="width: 100%;">
						<div class=" col-sm-2" style=" display: inline-block;">
		                      <select name="benefit-type-filter" class="form-control" id="benefit-type-filter" style="text-align:center;">
								<option value="0" selected>할인 + 적립</option>
								<option value="1">할인</option>
								<option value="2">적립</option>
							</select>
		                   </div>
					</div>
				</div>
				
				<div style="margin: 0 auto; width: 90%; max-width: 1250px;">
					<div class="card-hero-slider1" style="width: 100%;" id="mycard-reco-cardlist">
					
						<%-- </c:forEach> --%>
					</div>
				</div>
				
				
				
			</div>
			
		</div>

	</div>

	
	<!-- 멀티카드 -->
	<div id="multi-card-reco-section">
		<div>
			<h3 style="font-family: 'Pretendard';">멀티카드는 어떠신가요?</h3>
			<p style="color:#3d3d3d;">멀티카드란, 다양한 멀티 시리즈 모바일카드를 한 장의 플라스틱카드로 이용할 수 있는 카드입니다.
				<br>고객님께 딱 맞는 <strong>멀티 카드 조합</strong>을 확인해보세요!</p>
		</div>
		
		<div class="slider-wr">
		  <div class="slider" style="text-align: center;">
		    
		    <div class="slide" style="position: relative; height: 400px;">
		      <div>
		      	<div style="width: 320px;" class="first-card" >
			      <img style="width:100%" src="/images/card/103.png" alt="" />
			      <div class="first-benefit" style="">
			      	<div style="padding: 10px;" class="" id="mycard-benefits">
						<div style="display: table; width:100%; margin-bottom: 5px;">
							<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">
								<span style="font-size:18px; font-weight: bold; color:black;">SK텔레콤</span>
							</div>
							<div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;color:black;">
								15,000 원 할인
							</div>
						</div>
						<div style="display: table; width:100%; margin-bottom: 5px;">
							<div class="card" style="width: 50%; display:table-cell; vertical-align: middle;">
								<span style="font-size:18px; font-weight: bold; color:black;">SK텔레콤</span>
							</div>
							<div style="width: 50%; display:table-cell;text-align:center; vertical-align: middle;color:black;">
								15,000 원 할인
							</div>
						</div>
					</div>
			      </div>
			    </div>
			    
			      <img class="second-card" src="/images/card/100.png" alt=""  />
		      </div>
		      <div style="text-align: left">
		      	<input type="button" class="btn-transparent" 
		      		style="background: #f8f9fa;color: black;padding: 5px;font-size: 15px; border: solid 2px; font-weight: bold; margin-right: 20px;" 
		      		value="찜하기" onclick="goToMultiDibs(100,105)">
		      	<span style="font-size: 20px; color: black;">피킹률 약 <strong style="font-size:25px;">5.44%</strong></span>
		      </div>
		    </div>
		    <div class="slide" style="position: relative; height: 400px;">
		      <div>
			      <img class="first-card" src="/images/card/104.png" alt=""/>
			      <img class="second-card" src="/images/card/101.png" alt="" />
		      </div>
		    </div>
		    <div class="slide" style="position: relative; height: 400px;">
		      <div>
			      <img class="first-card" src="/images/card/103.png" alt=""/>
			      <img class="second-card" src="/images/card/104.png" alt=""/>
		      </div>
		    </div>
		  </div>
		</div>
		
	</div>

</sec:authorize>




<section class="portfolio section-sm" id="portfolio">
	<div class="container-fluid">
		<div class="row ">
			<div class="col-lg-12">

				<!-- section title -->
				<div class="title text-center">
					<h2>추천 카드</h2>
					<p>하나카드 고객들이 많이 사용하는 카드를 확인해보세요!</p>
					<div class="border"></div>
					<!-- <div class="portfolio-kind-filter">
						<a style="cursor:pointer;" class="clicked">신용카드</a>&nbsp|&nbsp
						<a style="cursor:pointer;">체크카드</a>&nbsp|&nbsp
						<a style="cursor:pointer;">제휴카드</a><br>
					</div> -->
					
				</div>
					
				</div>
				<!-- /section title -->
				
				
				<!-- 추천 카드 목록 -->
				<div style="margin: 0 auto; width: 70%; max-width: 1250px; text-align:right;">
					<h3 class="text-center" style="font-family: Pretendard;">연령대별 추천</h3>
					<div class="card-sort-filter" style="width: 100%;">
						<div class=" col-sm-2" style=" display: inline-block;">
		                      <select name="birth-gender-filter" class="form-control" id="birth-gender-filter" style="text-align:center;">
								<option value="2M" selected>20/남</option>
								<option value="2F">20/여</option>
								<option value="3M">30/남</option>
								<option value="3F">30/여</option>
								<option value="4M">40/남</option>
								<option value="4F">40/여</option>
								<option value="5M">50/남</option>
								<option value="5F">50/여</option>
							</select>
		                   </div>
					</div>
				</div>
				
				<div style="margin: 0 auto; width: 70%; max-width: 1250px; margin-bottom:50px;">
					<div class="card-hero-slider2" style="width: 100%;" id="birth-gender-reco-cardlist">
						
					</div>
				</div>
				
				
				<!-- 추천 카드 목록 -->
				<div class="" style="margin: 0 auto; width: 70%; max-width: 1250px; text-align:right;">
					<h3 style="font-family: Pretendard; text-align: center;">직업별 추천</h3>
					
					<div class="card-sort-filter" style="display:inline-block;">
						<div class=" col-sm-2">
	                       <select name="job1-filter" class="form-control" id="job1-filter" style="text-align:center; width: 200px;">
								<option value="-1" disabled>직업 분류</option>
								<option value="1" selected>관리자</option>
								<option value="2">전문가 및 관련 종사자</option>
								<option value="3">사무 종사자</option>
								<option value="4">서비스 종사자</option>
								<option value="5">판매 종사자</option>
								<option value="6">농림/어업 숙련 종사자</option>
								<option value="7">장치/기계 조작 및 조립 종사자</option>
								<option value="8">단순노무 종사자</option>
								<option value="0">군인</option>
							</select>
	                    </div>
					</div>
					<div class="card-sort-filter" style="display:inline-block;">
						<div class=" col-sm-2">
	                       <select name="job2-filter" class="form-control" id="job2-filter" style="text-align:center; width: 200px;">
								<option value="00" disabled>세부 직업군</option>
								<option value="11" selected>공공 기관 및 기업 고위직</option>
								<option value="12">행정/경영 지원 및 마케팅 관리직</option>
								<option value="13">전문 서비스 관리직</option>
								<option value="14">건설/전기 및 생산 관련 관리직</option>
								<option value="15">판매 및 고객 서비스 관리직</option>
							</select>
	                    </div>
					</div>
				</div>
				<div style="margin: 0 auto; width: 70%; max-width: 1250px;">
					<div class="card-hero-slider3" style="width: 100%;" id="job-reco-cardlist">
						
					</div>
				</div>
				
				
			</div> <!-- /end col-lg-12 -->
		</div> <!-- end row -->
</section> <!-- End section -->
	
	


<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>


<script src="${pageContext.request.contextPath}/resources/assets/js/script-multi-slider.js"></script>

<script>
	/* $('.card-hero-slider1').on("init", function(){
		console.log('?!')
		$('#myard-reco-spinner').hide();
		$('#mycard-reco-card-section').show();
	}) */
	$(document).ready(function(){
		<sec:authorize access="hasRole('ROLE_USER')">
		//mycard - creditCard 추천 ajax
		$.ajax({
	    	type: "GET",
//	    	url: contextPath + "/api/card/myreco/0",
	    	url: contextPath + "/api/mypage/card/credit/top10/0",
	    	success: function(result){
	    		//console.log(result)
	    		setMyrecoCardList(result)
			    //mycard 리스트 slider 걸기
			    $('.card-hero-slider1').slick({
				  	infinite: false,
				  	slidesToShow: 3,
				    arrows: true,
				    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
				    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
				    //dots: false
				}); 
				//hidden 풀기
				$('#mycard-reco-spinner').hide();
				$('#reco-card-section').css('visibility', 'visible');
				
			}
		});

		//multi 조합 추천 ajax
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/mypage/card/multi/top3",
	    	success: function(result){
	    		console.log(result)
	    		//setMultirecoCardList(result)
			    //mycard 리스트 slider 걸기
			    /* $('.multi-card-slider').slick({
				  	infinite: false,
				  	slidesToShow: 3,
				    arrows: true,
				    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
				    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
				    //dots: false
				}); */
				//hidden 풀기
				/* $('#mycard-reco-spinner').hide();
				$('#mycard-reco-card-section').show(); */
				
			}
		});
		</sec:authorize>
		//20대남
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/reco/" + $("#birth-gender-filter option:selected").val(),
	    	success: function(result){
	    		console.log(result)
	    		setRecoCardList('#birth-gender-reco-cardlist', result);
	    		//changeBirthGenderRecoCardList(result);
	    		$('.card-hero-slider2').slick({
	    		  	infinite: false,
	    		  	slidesToShow: 3,
	    		    arrows: true,
	    		    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
	    		    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
	    		    //dots: false
	    		});

	    	}
	    });
		
		//job 111
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/reco/" + $("#job1-filter option:selected").val() + $("#job2-filter option:selected").val(),
	    	success: function(result){
	    		console.log(result)
	    		
	    		setRecoCardList('#job-reco-cardlist', result);
	    		//changeJobRecoCardList(result);
	    		$('.card-hero-slider3').slick({
	    		  	infinite: false,
	    		  	slidesToShow: 3,
	    		    arrows: true,
	    		    prevArrow: '<button type=\'button\' class=\'prevArrow\'></button>',
	    		    nextArrow: '<button type=\'button\' class=\'nextArrow\'></button>',
	    		    //dots: false
	    		});
	    	}
	    });
	})
</script>

<script type="text/templage" id="benefit-card-template">
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
<script type="text/template" id="reco-card-template">
<div class="card-slider-item " style="height:300px;background: transparent;">
	<div class="container">
		<div id="card{cardId}" class="card-item card-work-sector" data-category="{workSectors}">
			<div class="portfolio-block" style="margin-bottom: 5px;">
				<img class="img-fluid card-image1" style="width: 100%;" src="{cardImageUrl}" alt="">
				<div class="caption" style="width: 100%; ">
					<a class="search-icon search-icon2 card-image2" style="font-size: 50px; background:transparent;"  data-toggle="modal" data-target="#detailModal">
						<i class="tf-ion-ios-search-strong"></i>
					</a>
					<h3 class="card-name" style="font-family: Pretendard; color:white;font-weight: 500;">{cardName}</h3>
					<h4 class="card-info" style="font-family: Pretendard; color:white;"><a href="">{cardInfo}</a></h4>
				</div>
			</div>
			<div class="card-benefit-btn">{benefits}</div>
			
</script>
<script type="text/template" id="reco-mycard-template">
<div class="card-slider-item " style="height:500px;background: transparent;">
	<div class="container" style="position:relative;">
		<h5 style="float: right; font-family:'Pretendard';color:black;">피킹률 약 <span style="font-weight:bold;" class="picking">{picking}</span> %</h5>
		<img style="width:60px; position:absolute; left:0; z-index:1; top:15px" class="medal" src="{medalImageUrl}">
		<div id="card{cardId}" class="card-item card-work-sector">
			<div class="portfolio-block" style="margin-bottom: 5px;">
				<img class="img-fluid card-image" style="width: 100%;" src="{cardImageUrl}" alt="">
				<div class="caption" style="width: 100%; ">
					<a class="search-icon search-icon2 card-image2" style="font-size: 50px; background:transparent;"  data-toggle="modal" data-target="#detailModal">
						<i class="tf-ion-ios-search-strong"></i>
					</a>
					<h3 class="card-name" style="font-family: Pretendard; color:white;font-weight: 500;">{cardName}</h3>
					<h4 class="card-info" style="font-family: Pretendard; color:white;"><a href="">{cardInfo}</a></h4>
				</div>
			</div>
			<p style="margin:0; cursor:pointer;" onclick="$(this).siblings('#mycard-benefits').slideToggle();">
				<span style="color:black;">▼</span> 한 달에 약 
				<span class="benefitAmount" style="font-size: 150%;color: black;font-weight: 600;">{benefitAmount}</span>
				원 절약 가능!
			</p>
			<div style="padding:10px; display:none;" class="" id="mycard-benefits">
				{benefits}
			</div>
			
</script>






