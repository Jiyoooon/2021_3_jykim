<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html> <!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Hana Card recommend service ">
  <meta name="author" content="Themefisher.com">

  <title>하나카드</title>

<!-- Mobile Specific Meta
  ================================================== -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico" />
  <!-- CSS
  ================================================== -->
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Lightbox.min css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/lightbox2/dist/css/lightbox.min.css">
  <!-- animation css -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/plugins/slick/slick.css">
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/style.css">  

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- assets2 -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <%-- <script src="${pageContext.request.contextPath }/resources/assets/js/header.js"></script> --%>
  <link href="${pageContext.request.contextPath }/resources/assets2/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="${pageContext.request.contextPath }/resources/assets2/css/soft-ui-dashboard.css?v=1.0.3" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
  
  <!-- toast -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/assets/css/toastr.css">  
  
  <style>
  	body{
  		font-family: 'Pretendard';
  	}
  	
  	html{
	    scroll-behavior: smooth;
	}
  </style>
  <script>
  	let contextPath = '${pageContext.request.contextPath }';
	let modalMsg = '${modalMsg}'
	let loginUserFlag = false
	<sec:authorize access="hasRole('ROLE_USER')">
		loginUserFlag = true
	</sec:authorize>
  </script>  
</head>

<body id="body" class="bg-gray-100">
  

<!--
Fixed Navigation
==================================== -->
<header class="navigation fixed-top" style="background-color: white;">
  <div class="container">
    <!-- main nav -->
    <nav class="navbar navbar-expand-lg navbar-light">
      <!-- logo -->
      <a class="navbar-brand logo" href="${pageContext.request.contextPath }/">
        <img class="logo-default" src="${pageContext.request.contextPath }/resources/assets/images/logo.png" alt="logo"/>
      </a>
      <!-- /logo -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation"
        aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navigation">
        <ul class="navbar-nav ml-auto text-center header-nav">
          <!-- <li class="nav-item dropdown active">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
              aria-haspopup="true" aria-expanded="false">
              카드안내
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="index.html">Homepage</a>
              <a class="dropdown-item" href="onepage-slider.html">Onepage</a>
              <a class="dropdown-item" href="onepage-text.html">Onepage 2</a>
            </div>
          </li> -->
          <c:choose>
          	<c:when test="${headerNavElement eq 'main'}">
          	
          	</c:when>
          </c:choose>
          <li class="nav-item
          	<c:if test='${selectedHeaderNav eq "main"}'>
          		active
          	</c:if>
          ">
            <a class="nav-link" href="${pageContext.request.contextPath }/">카드안내</a>
          </li>
          <li class="nav-item 
          	<c:if test='${selectedHeaderNav eq "reco"}'>
          		active
          	</c:if>
          ">
            <a class="nav-link" href="${pageContext.request.contextPath }/card/recommend">카드추천</a>
          </li>
          <li class="nav-item 
            <c:if test='${selectedHeaderNav eq "book"}'>
          		active
          	</c:if>
          ">
            <a class="nav-link" onclick="headerNavActive(this)" href="${pageContext.request.contextPath }/card/book">바로발급</a>
          </li>
          <li class="nav-item
	        <c:if test='${selectedHeaderNav eq "center"}'>
          		active
          	</c:if>
          ">
            <a class="nav-link" onclick="headerNavActive(this)" href="${pageContext.request.contextPath }/card/center">고객센터</a>
          </li>
         
         <sec:authorize access="isAnonymous()">
         	<!-- 로그인 X -->
          	<li style="padding-top: 5px;">
            	<button class="rounded" type="button" data-filter="design" onclick="location.href='${pageContext.request.contextPath }/login'">로그인</button>
            	<button class="rounded" type="button" data-filter="design" onclick="location.href='${pageContext.request.contextPath }/signup'">회원가입</button>
          	</li>
          </sec:authorize>
         
         <sec:authorize access="isAuthenticated()">
         	<!-- 로그인 O -->
          	<li style="padding-top: 5px;">
            	<button class="rounded" type="button" data-filter="design" onclick="location.href='${pageContext.request.contextPath }/logout'">로그아웃</button>
	        <sec:authorize access="hasRole('ROLE_USER')">
	        	<!-- ROLE_USER -->
	            	<button class="rounded" type="button" data-filter="design" onclick="location.href='${pageContext.request.contextPath }/mypage'">마이페이지</button>
	        </sec:authorize>
	         <sec:authorize access="hasRole('ROLE_ADMIN')">
	            	<button class="rounded" type="button" data-filter="design" onclick="location.href='${pageContext.request.contextPath }/admin/dashboard'">대시보드</button>
	         </sec:authorize>
          	</li>
         </sec:authorize>
         
          
        
        </ul>
      </div>
    </nav>
    <!-- /main nav -->
  </div>
</header>
<!--
End Fixed Navigation
==================================== -->
<div style="height: 90px;"></div>