<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<a href="${pageContext.request.contextPath  }/login">로그인</a>
<a href="${pageContext.request.contextPath  }/logout">로그아웃</a>
<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
