<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="<%=request.getContextPath() %>/loginProcess" method="POST">
		ID : <input type="text" name="id"><br>
		PW : <input type="password" name="password"><br>
		
		<s:csrfInput/><!-- 아래와 동일 -->
		<!-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
		<input type="submit" value="로그인">
	</form><br>
	<span style="color:red;">${loginFailMsg }</span>
</body>
</html>