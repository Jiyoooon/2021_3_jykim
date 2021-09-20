<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/commons/header.jsp"></jsp:include>
<body id="body">

 <!--
  Start Preloader
  ==================================== -->
  <div id="preloader">
    <div class='preloader'>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      <span></span>
    </div>
  </div> 
  <!--
  End Preloader
  ==================================== -->


  

	<section class="page-404 section text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 style="font-size:80px;">${msg }</h1>
					<h2></h2>
  					<p>빠른 시일내에 더 편리한 서비스로 찾아뵙겠습니다.</p>
					<a href="${pageContext.request.contextPath }" class="btn btn-main mt-20">Go Home</a>
				</div>
			</div>
		</div>
	</section>


<jsp:include page="/WEB-INF/views/commons/footer.jsp"></jsp:include>