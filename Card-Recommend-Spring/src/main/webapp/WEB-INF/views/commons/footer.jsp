<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer id="footer" class="bg-one">
  <div class="top-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-3 col-md-3 col-lg-3">
          <h3>about</h3>
          <p>Integer posuere erat a ante venenati dapibus posuere velit aliquet. Fusce dapibus, tellus cursus commodo, tortor mauris sed posuere.</p>
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          <ul>
            <li><h3>Our Services</h3></li>
            <li><a href="#">Graphic Design</a></li>
            <li><a href="#">Web Design</a></li>
            <li><a href="#">Web Development</a></li>
          </ul>
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          <ul>
            <li><h3>Quick Links</h3></li>
            <li><a href="#">Partners</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">FAQ’s</a></li>
            <li><a href="#">Badges</a></li>
          </ul>
        </div>
        <!-- End of .col-sm-3 -->

        <div class="col-sm-3 col-md-3 col-lg-3">
          <ul>
            <li><h3>Connect with us Socially</h3></li>
            <li><a href="#">Facebook</a></li>
            <li><a href="#">Twitter</a></li>
            <li><a href="#">Youtube</a></li>
            <li><a href="#">Pinterest</a></li>
          </ul>
        </div>
        <!-- End of .col-sm-3 -->

      </div>
    </div> <!-- end container -->
  </div>
  <div class="footer-bottom">
    <h5>Copyright 2016. All rights reserved.</h5>
    <h6>Design and Developed by <a href="">Themefisher</a></h6>
  </div>
</footer> <!-- end footer -->


<!-- Modal -->
<button id="modalBtn" type="button" style="display:none;" data-toggle="modal" data-target="#alertModal"></button>
<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: #00907f;">
        <h5 class="modal-title" id="alertModalLabel" style="color:white;">하나카드</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="padding: 2rem;">
        ${modalMsg}
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->

<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 800px;">
    <div class="modal-content">
      <div class="modal-header" style="background: #00907f;">
        <h5 class="modal-title" id="cardName" style="color:white;">카드이름</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="padding: 2rem;">
      
        <div id="dibs-section" style="display:flex;">
      	  <!-- 멀티카드 조합 선택 -->
          <input type="button" class="btn btn-transparent" 
	        	style="background: #f8f9fa;color: black;padding: 10px;font-size: 20px; border: solid 2px; font-weight: bold;" 
	        	value="찜하기" id="dibsBtn" disabled="disabled" onclick="goToDibs(1, '001')">

          <select name="multi-card-filter" class="form-control" id="multi-card-filter" style="width:300px;margin:10px;text-align:center;">
			<option value="0" disabled selected>함께 찜할 MULTI 조합</option>
			<option value="100" title="Any">MULTI Any 모바일카드</option>
			<option value="101" title="On">MULTI On 모바일카드</option>
			<option value="102" title="Living">MULTI Living 모바일카드</option>
			<option value="103" title="Young">MULTI Young 모바일카드</option>
			<option value="104" title="Oil">MULTI Oil 모바일카드</option>
			<option value="105" title="Global">MULTI Global 모바일카드</option>
		  </select>
		  
		  <div id="multi-combi-section">
		  </div>
        </div>
        <div style="clear: both; text-align: center;">
        	<h1 style="font-family: Pretendard; font-weight: 500;" id="cardName"></h1>
			<h5 style="font-family: Pretendard;" id="cardInfo"></h5>
        	<img class="img-fluid" style="width: 50%;margin: 20px;" id="cardImage" src="" alt="">
        	<br>
        	<button class="rounded" type="button" 
        		style="margin-bottom: 20px;background: #00907f;color: white;border: none;padding: 10px 20px;font-size: 20px;" 
        		onclick="">온라인 발급신청</button>
        	<table class="table table-striped" id="benefitList">
			  <thead>
			    <tr>
			      <th scope="col">혜택이름</th>
			      <th scope="col">혜택내용</th>
			      <th scope="col" style="white-space: inherit;word-break: break-all;">해당업종</th>
			      <th scope="col">혜택한도</th>
			      <th scope="col">지난달 실적 기준</th>
			    </tr>
			  </thead>
			  <tbody id="benefitItem"></tbody>
			</table>
        	
        	<h6 style="font-family: Pretendard;">연회비 : <span id="cardAnnualFee"></span>원</h6>
        	
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

    <!-- end Footer Area
    ========================================== -->

    
    <!-- 
    Essential Scripts
    =====================================-->
    <!-- Main jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <%-- <script src="${pageContext.request.contextPath }/resources/assets/plugins/jquery/jquery.min.js"></script> --%>
    <!-- Google Map -->
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu5nZKbeK-WHQ70oqOWo-_4VmwOwKP9YQ"></script> -->
    <%-- <script  src="${pageContext.request.contextPath }/resources/assets/plugins/google-map/gmap.js"></script> --%>

    <!-- Form Validation -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/form-validation/jquery.form.js"></script> 
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/form-validation/jquery.validate.min.js"></script>
    
    <!-- Bootstrap4 -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Parallax -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/parallax/jquery.parallax-1.1.3.js"></script>
    <!-- lightbox -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/lightbox2/dist/js/lightbox.js"></script>
    <!-- Owl Carousel -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/slick/slick.min.js"></script>
    <!-- filter -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/filterizr/jquery.filterizr.min.js"></script>
    <!-- Smooth Scroll js -->
    <script src="${pageContext.request.contextPath }/resources/assets/plugins/smooth-scroll/smooth-scroll.min.js"></script>
    
    <!-- <script src="https://kit.fontawesome.com/2f118cb079.js" crossorigin="anonymous"></script> -->
    <!-- Custom js -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/script.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/script2.js"></script>

	<!-- toast -->
    <script src="${pageContext.request.contextPath }/resources/assets/js/toastr.min.js"></script>
    <script>
    	$('#alertModal').on('hidden.bs.modal', function (e) {
    	  // do something...
    	  location.href = '${pageContext.request.contextPath}/${redirectPage}'
    	})
    	
    	//toast알림 설정
    	toastr.options = {
    		"closeButton":true,
    		"positionClass":"toast-top-right",
    		"newestOnTop":false,
    		"timeOut":4000,
    		"extendedTimeOut": 2000
    	}
    	
    	
    </script>
  </body>
 </html>