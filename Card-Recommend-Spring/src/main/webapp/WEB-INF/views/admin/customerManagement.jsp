<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="contact-us dashboard-child" id="customer-management">
	<div class="container-fluid">
		<div>
			
			<!-- section title -->
			<div class="col-12">
			<div class="title text-center" >
				<h2>마케팅 문자 발송</h2>
				<div class="border"></div>
			</div>
			</div>
			<!-- /section title -->
			<!-- Contact Form -->
			<div class="contact-form col-lg-9 col-md-10" style="padding: 60px; margin: 0 auto; text-align: center;">
				<form id="card-insert-form2" method="post" role="form" action="${pageContext.request.contextPath }/admin/card" enctype="multipart/form-data">
					<div class="row">
						<label for="id" class="col-2 hana-md" style="font-size: 18px; line-height: 48px; width:20%;margin: 0;">카드 선택</label>

						<div class="form-group col-sm-3">
	                       <select name="cardTypeId" class="form-control" id="cardTypeId" style="text-align:center;background:white;">
								<option value="-1" disabled selected>카드종류</option>
								<option value="0">신용카드</option>
								<option value="1">체크카드</option>
								<option value="2">멀티카드</option>
							</select>
	                    </div>
						<div class="form-group col-sm-5">
	                       <select class="form-control" id="cardId" name="cardId" style="text-align:center;background:white;">
								<option value="0" selected disabled >카드이름</option>
							</select>
	                    </div>
						
						<div class="form-group " style="text-align:center;">
							<input type="button" id="search-customer-list" class="btn btn-main" 
								style="color: white; padding: 8px 15px; margin-top: 5px;" value="고객 리스트 검색" onclick="getCustomerList();">
						</div>
					</div>
					
					<div id="marketing-btn" style="float:right;">
						<input type="button" id="excel-download-btn" class="rounded btn btn-transparent" style="background: #00907f; color:white; padding: 12px;" value="엑셀 내려받기"
							onclick="tableToExcel()">
						<input type="button" id="send-message-btn" class="rounded btn btn-transparent" style="background: #00907f; color:white; padding: 12px;" value="문자 전송"
							onclick="sendMessage()">
					</div>	
				</form>
			</div>
			<div class="contact-form col-lg-12 col-md-12" style="padding: 30px; margin: 0 auto; text-align: center;">
				<div id="customer-list-section">
					<table class="table table-striped customerList" id="TableToExcel">
					  <thead>
					    <tr>
					      <th scope="col">번호</th>
					      <th scope="col">이름</th>
					      <th scope="col">성별</th>
					      <th scope="col">생일</th>
					      <th scope="col">이메일</th>
					      <th scope="col">휴대번호</th>
					      <th scope="col">혜택업종 소비 / 총소비</th>
					    </tr>
					  </thead>
					  <tbody id="customerItem"></tbody>
					</table>
					<iframe id="txtArea1" style="display:none"></iframe> 
					<!-- IE 호환을 위해서 iframe을 추가 -->
				</div>
			</div>
			<!-- ./End Contact Form -->
		
		</div> <!-- end row -->
	</div> <!-- end container -->
</section> <!-- end section -->

