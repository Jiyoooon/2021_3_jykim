<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>

<section class="contact-us" id="contact">
	<div class="container-fluid">
		<div>
			
			<!-- section title -->
			<div class="col-12">
			<div class="title text-center" >
				<h2>로그인</h2>
				<div class="border"></div>
			</div>
			</div>
			
			<div class="auth-filter text-center col-lg-6 col-md-8 " style="margin:0 auto; padding:0;">
				<button type="button" name="USER" style="border:none; padding: 10px 20px; margin-right: -4px; width: 50%;" class="clicked" onclick="javascript:changeAuth(this);">회원</button>
				<button type="button" name="ADMIN" style="border:none; padding: 10px 20px; margin-left: -2px; width: 50%;" onclick="javascript:changeAuth(this);">관리자</button>
			</div>
			
			<!-- /section title -->
			<!-- Contact Form -->
			<div class="card rounded contact-form col-lg-6 col-md-8 " style="padding: 60px; margin: 0 auto; text-align: center;">
				<form name="loginForm" id="login-form" method="post" role="form" action="<%=request.getContextPath() %>/loginProcess" onsubmit="return checkId()">
					<input type="hidden" id="auth" name="auth" value="USER">
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
					<span style="color:red;">${loginFailMsg }</span>
					<div id="cf-submit">
						<input type="submit" id="contact-submit" class="rounded btn btn-transparent" style="margin-top: 20px;" value="로그인">
					</div>						
					<s:csrfInput/><!-- 아래와 동일 -->
					<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
				</form>
			</div>
			<!-- ./End Contact Form -->
		
		</div> <!-- end row -->
	</div> <!-- end container -->
</section> <!-- end section -->

<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>