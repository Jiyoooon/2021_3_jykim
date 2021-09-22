<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>


<div id="aalert"  class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
  <div class=" toast-container position-absolute p-3 d-flex top-0 end-0">
    <div class="toast-body">
      Hello, world! This is a toast message.
    </div>
    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
  </div>
</div>

<!-- 배너 -->
<div class="hero-slider" style="height:500px;">
	<div class="slider-item th-fullpage hero-area" style="height:500px; background-image: url(${pageContext.request.contextPath }/resources/assets/images/slider/slider3.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<img src="https://www.hanacard.co.kr/ATTACH/NEW_HOMEPAGE/images/cardinfo/card_img/12857.png" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">
					<!-- <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">Crafting Digital <br>
						Experience</h1> -->
					<h4 style="margin-top:1rem; color:white; font-family: 'Pretendard'" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">모두의 쇼핑</h4>
					<p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">쇼핑 할인 혜택을 받아보세요! 
					<br> Only For You</p>
					<a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn btn-main banner-btn" href="service.html" 
					style="background:white; color: #00907f; border: 2px solid #00907f;">자세히 보기</a>
					<!-- style="background-color: transparent;" -->
				</div>
			</div>
		</div>
	</div> 
	<div class="slider-item th-fullpage hero-area" style="height:500px; background-image: url(${pageContext.request.contextPath }/resources/assets/images/slider/slider2.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<img src="/images/card/0.png" width="300px;" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".1">
					<h4 style="margin-top:1rem; color:white; font-family: 'Pretendard'" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".5">카드, 한 장이면 된다</h4>
					<p data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".5">원하는 조합대로 골라 사용하세요!</p>
					<a data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".8"  class="btn btn-main banner-btn" href="service.html"
					style="background:white; color: #00907f; border: 2px solid #00907f;">자세히 보기</a>
				</div>
			</div>
		</div>
	</div>
</div>

<section class="portfolio section-sm" id="portfolio">
	<div class="container-fluid">
		<div class="row ">
			<div class="col-lg-12">

				<!-- section title -->
				<div class="text-center">
					<h2>
						모든 카드
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a class="btn btn-main" href="${pageContext.request.contextPath }/admin/card/insertform" style="color:white; margin-bottom: 0; margin-left: 1rem;">카드 등록</a>
						</sec:authorize>
					</h2>
					<p> </p>
					<div class="border"></div>
					<div class="portfolio-kind-filter" style="margin-bottom: 1rem;">
						<a style="cursor:pointer; font-size: 20px; color: #00907f;" class="clicked" id="cardType001" title="신용카드로 검색" onclick="changeCardType(this)">신용카드</a>&nbsp|&nbsp
						<a style="cursor:pointer; font-size: 20px;" id="cardType002" title="체크카드로 검색" onclick="changeCardType(this)">체크카드</a>&nbsp|&nbsp
						<a style="cursor:pointer; font-size: 20px;" id="cardType005" title="멀티카드로 검색" onclick="changeCardType(this)">멀티카드</a>
						<!-- <a style="cursor:pointer;">제휴카드</a><br> -->
					</div>
					<!-- 검색어 -->

					<div class="portfolio-filter contact-form ">
						<div class="row">
							<div class="col-lg-3 col-md-2 col-sm-2"></div>
							<input type="text" class="col-lg-6 col-md-6 col-sm-8 form-control" id="searchKeyWord" style="background:white;" onkeypress="if (event.keyCode==13){searchCard();}" placeholder="검색어를 입력하세요.(이름, 설명, 혜택)" title="카드 검색어 입력">
							
							<img src="${pageContext.request.contextPath }/resources/assets/images/btn_search_b.png" onclick="searchCard();" 
								style="cursor:pointer; width: 30px; padding: 0.5rem 0; margin: 0 1rem;" class="col-1 btn_search"/>
						</div>
					</div>
				</div>
				<!-- /section title -->


				<!-- data-filter로 필터링하고 버튼 클릭된거로 다시 필터링  -->
				<div class="portfolio-filter">
					<button type="button" class="clicked" onclick="changeCardFilter(this)" title="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18">모두</button>
					<button type="button" onclick="changeCardFilter(this)" title="1,2">쇼핑</button>
					<button type="button" onclick="changeCardFilter(this)" title="3,4,14,15,16">생활/교육</button>
					<button type="button" onclick="changeCardFilter(this)" title="5,6">교통/통신</button>
					<button type="button" onclick="changeCardFilter(this)" title="10,11,12,13">문화생활/여행/취미</button>
					<button type="button" onclick="changeCardFilter(this)" title="7,8,9,17,18">기타</button>
				</div>
				<hr>
				
				<div class="row">
					<div class="col-lg-2 col-md-1 col-sm-0"></div>
					<div class="col-lg-8 col-md-10 col-sm-12 row" >
						<div class="card-sort-filter" >
							<div class="form-group col-sm-2" style="float:right;">
		                       <select name="sortType" class="form-control" id="sortType" style="text-align:center;">
									<option value="0" selected>일반</option>
								<option value="1">연회비 낮은 순</option>
									<option value="2">연회비 높은 순</option>
								</select>
		                    </div>
						</div>
					</div>
					<div class="col-lg-2 col-md-1 col-sm-0"></div>
					<div class="col-lg-2 col-md-1 col-sm-0"></div>
					<div class="col-lg-8 col-md-10 col-sm-12 row filter-container" id="card-list-section">
						<c:forEach items="${cards }" var="card" >
							<div id="card${card.cardId }" style="padding:1rem 2rem;" class="col-md-4 col-sm-6 col-xs-6 filtr-item card-item" data-category="${card.workSectors }">
								<div class="portfolio-block" style="margin-bottom: 5px;">
									<img class="img-fluid" style="width: 100%;" src="${card.cardImageUrl }" alt="">
									<div class="caption" style="width: 100%; ">
										<a class="search-icon search-icon2" style="font-size: 65px; background: transparent;" href="" data-toggle="modal" data-target="#detailModal">
											<i class="tf-ion-ios-search-strong"></i>
										</a>
										<h3 style="font-family: Pretendard; color:white;font-weight: 500;">${card.cardName }</h3>
										<h4 style="font-family: Pretendard;"><a href="">${card.cardInfo }</a></h4>
									</div>
								</div>
								<c:forEach items="${card.benefits }" var="benefit">
									<a class="btn btn-main" href="javascript:goSearch('${benefit.benefitName }')" 
										style="color:gray; background:white; margin-bottom: 0;font-size: 13px; padding: 8px 10px;">${benefit.benefitName }</a>
								</c:forEach>
							</div>
						</c:forEach>
					
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

	 <!--Start Contact Us
	=========================================== -->		
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

<script type="text/template" id="card-template">
<div id="card{cardId}" style="padding:1rem 2rem;" class="col-md-4 col-sm-6 col-xs-6 filtr-item card-item" data-category="{workSectors}">
	<div class="portfolio-block" style="margin-bottom: 5px;">
		<img class="img-fluid" style="width: 100%;" src="{cardImageUrl}" alt="">
		<div class="caption" style="width: 100%; ">
			<a class="search-icon search-icon2" style="font-size: 65px; background:transparent;" href="" data-toggle="modal" data-target="#detailModal">
				<i class="tf-ion-ios-search-strong"></i>
			</a>
			<h3 style="font-family: Pretendard; color:white;font-weight: 500;">{cardName}</h3>
			<h4 style="font-family: Pretendard;"><a href="">{cardInfo}</a></h4>
		</div>
	</div>
</script>




