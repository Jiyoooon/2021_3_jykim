<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>HANA CARD</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath }/resources/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon.png">
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="${pageContext.request.contextPath }/resources/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath }/resources/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/theme.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath }/resources/vendors/swiper/swiper-bundle.min.css" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
  	
  </head>


  <body data-bs-spy="scroll" data-bs-target="#navbar">

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <nav class="navbar navbar-expand-xl navbar-light fixed-top px-0 pb-0 mb-2" id="navbar" data-navbar-darken-on-scroll="white" style="background-color:white;">
        <div class="container-fluid align-items-center py-2"><a class="navbar-brand flex-center" href="${pageContext.request.contextPath }"><img class="logo" src="${pageContext.request.contextPath }/resources/assets/img/favicons/favicon.png" alt="open enterprise" /><span class="ms-2 d-none d-sm-block fw-bold">하나카드</span></a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto mt-3 mt-xl-0">
              <!-- 신용카드, 체크카드, 제휴카드 목록 보여줌 -->
              <li class="nav-item ps-0 ps-xl-4 ms-2"><a class="nav-link fs-2 fw-medium" href="#hero">카드 안내 </a></li>
              <!-- 나이 및 성별 / 직업별 추천 목록 보여줌 -->
              <li class="nav-item ps-0 ps-xl-4 ms-2"><a class="nav-link fs-2 fw-medium" href="#features">카드 추천 </a></li>
              <li class="nav-item ps-0 ps-xl-4 ms-2"><a class="nav-link fs-2 fw-medium" href="#contribute">고객센터 </a></li>
              <li class="nav-item ps-0 ps-xl-4 ms-2">
              	<button class="btn btn-success" style="padding: 0.5rem 1.2rem; font-size: 1rem;">로그인</button>
              	<button class="btn btn-success" style="padding: 0.5rem 1.2rem; font-size: 1rem;">회원가입</button>
              </li>
            </ul>
          </div>
        </div>
      </nav>