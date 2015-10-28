<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<meta charset='UTF-8'>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<c:set value="${result}" var="resu"></c:set>
<script type="text/javascript">

$(document).ready(function(){
	var result = '${result}';
		if(result == '로그인에 실패되었습니다.'){
			alert(result);
			return;
		}
		return;
});

function call(){
var email = document.login_form.email.value
var password = document.login_form.password.value

if(email == "" || email == null){
	alert('email을 입력하세요');
	return;
	}

var str = email;
var atPos = str.indexOf('@');
var atLastPos = str.lastIndexOf('@');
var dotPos = str.indexOf('.');
var spacePos = str.indexOf(' ');
var commaPos = str.indexOf(',');
var eMailSize = str.length;
if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1
		&& commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
else {
	alert("이메일 형식이 올바르지 않습니다. 확인해주세요");
	document.login_form.email.focus();
	return;
	}
	
if(password == "" || password == null){
	alert('비밀번호를 입력하세요');
	return;
	}
	
	document.login_form.submit();

}
</script>
</head>
<body>
<form name="login_form" action="login_check" method="post">
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>로그인</div>
		<div class='p'>이메일</div>
		<input name="email" id='textbox' type='text' placeholder="이메일">
		<div class='p'>비밀번호</div>
		<input name="password" id='textbox' type='password' placeholder="비밀번호"> <br>
		<div class='forgot' align="left">
			<a href='#'>비밀번호를 잊어버리셨나요?</a>
		</div>
		<input id="login" class='button' type="button" value='로그인' onclick="call()">
		<div style="margin: 20px 0px 20px 0px">
			<hr width="170px" style="margin-left: 50px; float: left">
			or
			<hr width="170px" style="margin-right: 50px; float: right">
		</div>
		<input class='button' type='button' value='회원가입'
			onclick="location.href='register_form'">
	</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>