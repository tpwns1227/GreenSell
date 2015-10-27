<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset='UTF-8'>
<head>
<script type="text/javascript" src='script.js'></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
	<form name='register_form'>
		<div class='container'>
			<div class='border'>회원가입</div>
			<div class='p'>이메일</div>
			<input name='email' id='textbox' type='text' placeholder="이메일"
				style='width: 300px'> <input class='button2' type='button'
				value='중복'>
			<div class='p'>별명</div>
			<input id='textbox' type='text' placeholder="별명" style='width: 300px'>
			<input class='button2' type='button' value='중복'>
			<div class='p'>비밀번호</div>
			<input id='textbox' type='password' placeholder="비밀번호"> <input
				id='textbox' type='password' placeholder="비밀번호 확인">
			<div class='p'>연락처</div>
			<input id='textbox' type='text' placeholder="연락처 ( - 제외 )"
				style='width: 300px'> <input class='button2' type='button'
				value='인증'>
			<div class='p'>주소</div>

			<input id='textbox' type='text' placeholder="우편번호"
				style='width: 300px'> <input class='button2' type='button'
				value='검색'><br> <input id='textbox' type='text'
				placeholder="상세주소" style="margin-top: 10px; width: 400px">

			<div class='p'>계좌번호</div>
			<select name='bank'>
				<option value='nh'>농협은행</option>
				<option value='kb'>국민은행</option>
				<option value='sh'>신한은행</option>
			</select> <input id='textbox' type='text' placeholder="계좌번호">
			<div class='p'>비밀번호 Q&A</div>
			<select name='bank'>
				<option value='nh'>니 애미 이름</option>
				<option value='kb'>니 애비 이름</option>
				<option value='sh'>아다땐 사람의 이름</option>
			</select> <input id='textbox' type='text' placeholder="답변"> <input
				class='button' type='button' value='회원가입' style="margin-top: 30px"
				onclick='register()'>
		</div>
	</form>
</body>
</html>