<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="contact-us dashboard-child" id="banner-management" style="display:block;">
	<div class="container-fluid">
		<div>
			
			<!-- section title -->
			<div class="col-12">
			<div class="title text-center" >
				<h2>배너 관리</h2>
				<p>?</p>
				<div class="border"></div>
			</div>
			</div>
			<!-- /section title -->
			<!-- Contact Form -->
			<div class="auth-filter text-center col-lg-6 col-md-8 " style="margin:0 auto; padding:0;">
				<button type="button" style="border:none; padding: 10px 20px; margin-right: -4px; width: 50%;" id="clicked">휴대폰 인증</button>
				<button type="button" style="border:none; padding: 10px 20px; margin-left: -2px; width: 50%;" >카드 인증</button>
			</div>
			<div class="card rounded contact-form col-lg-6 col-md-8 " style="padding: 60px; margin: 0 auto; text-align: center;">
				<form id="contact-form" method="post" role="form" action="<%=request.getContextPath() %>/loginProcess">
					<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">아이디</label>
					<div class="form-group">
						<input type="text" placeholder="ID" class="form-control" name="id" id="id" style="width:70%;">
					</div>
					
					<label for="id" class="col-3 hana-md" style="font-size: 18px; line-height: 48px; width:30%; float:left;">비밀번호</label>
					<div class="form-group">
						<input type="password" placeholder="PASSWORD" class="form-control" name="password" id="password" style="width:70%;">
					</div>
					
					<!-- <div id="success" class="success">
						Thank you. The Mailman is on His Way :)
					</div>
					
					<div id="error" class="error">
						Sorry, don't know what happened. Try later :(
					</div> -->
					
					<div id="cf-submit">
						<input type="submit" id="contact-submit" class="rounded btn btn-transparent" style="margin-top: 20px;" value="로그인">
					</div>						
				</form>
			</div>
			<!-- ./End Contact Form -->
		
		</div> <!-- end row -->
	</div> <!-- end container -->
</section> <!-- end section -->

