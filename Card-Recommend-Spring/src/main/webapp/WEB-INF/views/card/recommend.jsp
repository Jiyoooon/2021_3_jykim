<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>

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
	<div class="text-center rounded card" style="padding: 50px; background:#cadfc4;width:90%;margin: 0 auto; margin-top: 60px;">
		<div id="myard-reco-spinner" class="container text-align">
			<div class="circle">
			  <span class="ouro ouro3">
			    <span class="left"><span class="anim"></span></span>
			    <span class="right"><span class="anim"></span></span>
			  </span>
			</div>
			<h5 style="color:black; font-family: 'Pretendard'">
				<span ><sec:authentication property="principal.name"/></span>
				님에게 꼭 맞는 카드를 찾고 있어요!
			</h5>
		</div>
		
		<div id="mycard-reco-card-section" style="display: none; ">
			<h2 style="color: black; font-family: Pretendard">
				<span ><sec:authentication property="principal.name"/>&nbsp;</span>님에게 <span style="color: green;">꼭</span> 맞는 카드
			</h2>
			<div class="border"></div>
			
			<!-- 추천 카드 목록 -->
			<div style="margin: 0 auto; width: 70%; max-width: 1250px; text-align:right;">
				<div class="card-sort-filter" style="width: 100%;">
					<div class=" col-sm-2" style=" display: inline-block;">
	                      <select name="benefit-type-filter" class="form-control" id="benefit-type-filter" style="text-align:center;">
							<option value="3" selected>할인 + 적립</option>
							<option value="1">할인</option>
							<option value="2">적립</option>
						</select>
	                   </div>
				</div>
			</div>
			
			<div style="margin: 0 auto; width: 70%; max-width: 1250px;">
				<div class="card-hero-slider1" style="width: 100%;" id="mycard-reco-cardlist">
				
					<%-- <c:forEach items="${cards }" var="card"> --%>
						<%-- <div class="card-slider-item " style="height:350px;background: transparent;">
							<div class="container">
								<div id="card{cardId}" class="card-item card-work-sector" data-category="{workSectors}">
									<div class="portfolio-block" style="margin-bottom: 5px;">
										<img class="img-fluid card-image" style="width: 100%;" src="{cardImageUrl}" alt="">
										<div class="caption" style="width: 100%; ">
											<a class="search-icon card-image2" href="{cardImageUrl}" data-lightbox="image-1">
												<i class="tf-ion-ios-search-strong"></i>
											</a>
											<h3 class="card-name" style="font-family: Pretendard; color:white;font-weight: 500;">{cardName}</h3>
											<h4 class="card-info" style="font-family: Pretendard; color:white;"><a href="">{cardInfo}</a></h4>
										</div>
									</div>
									<p style="margin:0;">
										한 달에 약 
										<span class="benefitAmount" style="font-size: 150%;color: black;font-weight: 600;">{benefitAmount }</span>
										원 절약 가능!
									</p>
									<div class="card-benefit-btn">{benefits}</div>
										<c:forEach items="${card.benefits }" var="benefit">
											<a class="btn btn-main"
												style="color:gray; background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">${benefit.benefitName }</a>
										</c:forEach>
								</div>
							</div>
						</div> --%>
					<%-- </c:forEach> --%>
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
	</div> <!-- end container -->
</section> <!-- End section -->
	
	<!-- Start Pricing section
		=========================================== -->
<section class="pricing-table " id="pricing">
	<div class="container">
		<div class="row">

			<!-- section title -->
			<div class="col-12">
				<div class="title title-white text-center ">
					<h2>Our Greatest Plans</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium soluta deserunt eaque, est, quia hic
						odit sed incidunt officiis quidem.</p>
					<div class="border"></div>
				</div>
			</div>
			<!-- /section title -->

			<!-- single pricing table -->
			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="pricing-item">

					<!-- plan name & value -->
					<div class="price-title">
						<h3>Basic</h3>
						<strong class="value">$19</strong>
						<p>Perfect for single freelancers who work by themselves</p>
					</div>
					<!-- /plan name & value -->

					<!-- plan description -->
					<ul>
						<li><i class="tf-ion-ios-arrow-forward"></i> 1GB Disk Space</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 10 Email Account</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> Script Installer</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 1 GB Storage</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 2 GB Bandwidth</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 24/7 Tech Support</li>
					</ul>
					<!-- /plan description -->

					<!-- signup button -->
					<a class="btn btn-main" href="#">Signup</a>
					<!-- /signup button -->

				</div>
			</div>
			<!-- end single pricing table -->

			<!-- single pricing table -->
			<div class="col-md-4 col-sm-6 col-xs-12  ">
				<div class="pricing-item">

					<!-- plan name & value -->
					<div class="price-title">
						<h3>Standard</h3>
						<strong class="value">$39</strong>
						<p>Suitable for small businesses with up to 5 employees</p>
					</div>
					<!-- /plan name & value -->

					<!-- plan description -->
					<ul>
						<li><i class="tf-ion-ios-arrow-forward"></i> 1GB Disk Space</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 50 Email Account</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> Script Installer</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 1 GB Storage</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 10 GB Bandwidth</li>
						<li><i class="tf-ion-ios-arrow-forward"></i> 24/7 Tech Support</li>
					</ul>
					<!-- /plan description -->

					<!-- signup button -->
					<a class="btn btn-main" href="#">Signup</a>
					<!-- /signup button -->

				</div>
			</div>
			<!-- end single pricing table -->

		</div> <!-- End row -->
	</div> <!-- End container -->
</section> <!-- End section -->
	
	
<section class="contact-us" id="contact">
	<div class="container">
		<div class="row">
			
			<!-- section title -->
			<div class="col-12">
			<div class="title text-center" >
				<h2>Get In Touch</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptate facilis eveniet maiores ab maxime nam ut numquam molestiae quaerat incidunt?</p>
				<div class="border"></div>
			</div>
			</div>
			<!-- /section title -->
			
			<!-- Contact Details -->
			<div class="contact-details col-md-6 " >
				<h3>Contact Details</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam, vero, provident, eum eligendi blanditiis ex explicabo vitae nostrum facilis asperiores dolorem illo officiis ratione vel fugiat dicta laboriosam labore adipisci.</p>
				<ul class="contact-short-info" >
					<li>
						<i class="tf-ion-ios-home"></i>
						<span>Khaja Road, Bayzid, Chittagong, Bangladesh</span>
					</li>
					<li>
						<i class="tf-ion-android-phone-portrait"></i>
						<span>Phone: +880-31-000-000</span>
					</li>
					<li>
						<i class="tf-ion-android-globe"></i>
						<span>Fax: +880-31-000-000</span>
					</li>
					<li>
						<i class="tf-ion-android-mail"></i>
						<span>Email: hello@meghna.com</span>
					</li>
				</ul>
				<!-- Footer Social Links -->
				<div class="social-icon">
					<ul>
						<li><a href="#"><i class="tf-ion-social-facebook"></i></a></li>
						<li><a href="#"><i class="tf-ion-social-twitter"></i></a></li>
						<li><a href="#"><i class="tf-ion-social-dribbble-outline"></i></a></li>
						<li><a href="#"><i class="tf-ion-social-linkedin-outline"></i></a></li>
					</ul>
				</div>
				<!--/. End Footer Social Links -->
			</div>
			<!-- / End Contact Details -->
				
			<!-- Contact Form -->
			<div class="contact-form col-md-6 " >
				<form id="contact-form" method="post" role="form">
					<div class="form-group">
						<input type="text" placeholder="Your Name" class="form-control" name="name" id="name">
					</div>
					
					<div class="form-group">
						<input type="email" placeholder="Your Email" class="form-control" name="email" id="email">
					</div>
					
					<div class="form-group">
						<input type="text" placeholder="Subject" class="form-control" name="subject" id="subject">
					</div>
					
					<div class="form-group">
						<textarea rows="6" placeholder="Message" class="form-control" name="message" id="message"></textarea>	
					</div>
					
					<div id="success" class="success">
						Thank you. The Mailman is on His Way :)
					</div>
					
					<div id="error" class="error">
						Sorry, don't know what happened. Try later :(
					</div>
					<div id="cf-submit">
						<input type="submit" id="contact-submit" class="btn btn-transparent" value="Submit">
					</div>						
					
				</form>
			</div>
			<!-- ./End Contact Form -->
		
		</div> <!-- end row -->
	</div> <!-- end container -->
</section> <!-- end section -->

<!--================================
=            Google Map            =
=================================-->

<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		<sec:authorize access="hasRole('ROLE_USER')">
		//mycard 추천 ajax
		$.ajax({
	    	type: "GET",
	    	url: contextPath + "/api/card/myreco/3",
	    	success: function(result){
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
				
				$('#myard-reco-spinner').hide();
				$('#mycard-reco-card-section').show();
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
<script type="text/template" id="reco-card-template">
<div class="card-slider-item " style="height:300px;background: transparent;">
	<div class="container">
		<div id="card{cardId}" class="card-item card-work-sector" data-category="{workSectors}">
			<div class="portfolio-block" style="margin-bottom: 5px;">
				<img class="img-fluid card-image1" style="width: 100%;" src="{cardImageUrl}" alt="">
				<div class="caption" style="width: 100%; ">
					<a class="search-icon search-icon2 card-image2" style="font-size: 65px; background:transparent;"  data-toggle="modal" data-target="#detailModal">
						<i class="tf-ion-ios-search-strong"></i>
					</a>
					<h3 class="card-name" style="font-family: Pretendard; color:white;font-weight: 500;">{cardName}</h3>
					<h4 class="card-info" style="font-family: Pretendard; color:white;"><a href="">{cardInfo}</a></h4>
				</div>
			</div>
			<div class="card-benefit-btn">{benefits}</div>
			
</script>
<script type="text/template" id="reco-mycard-template">
<div class="card-slider-item " style="height:350px;background: transparent;">
	<div class="container">
		<div id="card{cardId}" class="card-item card-work-sector" data-category="{workSectors}">
			<div class="portfolio-block" style="margin-bottom: 5px;">
				<img class="img-fluid card-image" style="width: 100%;" src="{cardImageUrl}" alt="">
				<div class="caption" style="width: 100%; ">
					<a class="search-icon search-icon2 card-image2" style="font-size: 65px; background:transparent;"  data-toggle="modal" data-target="#detailModal">
						<i class="tf-ion-ios-search-strong"></i>
					</a>
					<h3 class="card-name" style="font-family: Pretendard; color:white;font-weight: 500;">{cardName}</h3>
					<h4 class="card-info" style="font-family: Pretendard; color:white;"><a href="">{cardInfo}</a></h4>
				</div>
			</div>
			<p style="margin:0;">
				한 달에 약 
				<span class="benefitAmount" style="font-size: 150%;color: black;font-weight: 600;">{benefitAmount}</span>
				원 절약 가능!
			</p>
			<div class="card-benefit-btn">{benefits}</div>
			
</script>






