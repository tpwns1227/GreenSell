<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset='UTF-8'>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>로그인</div>
		<div class='p'>이메일</div>
		<input id='textbox' type='text' placeholder="이메일">
		<div class='p'>비밀번호</div>
		<input id='textbox' type='password' placeholder="비밀번호"> <br>
		<div class='forgot' align="left">
			<a href='#'>비밀번호를 잊어버리셨나요?</a>
		</div>
		<input class='button' type='button' value='로그인'>
		<div style="margin: 20px 0px 20px 0px">
			<hr width="170px" style="margin-left: 50px; float: left">
			or
			<hr width="170px" style="margin-right: 50px; float: right">
		</div>
		<input class='button' type='button' value='회원가입'
			onclick="location.href='3.jsp'">
	</div>
</body>
</html>