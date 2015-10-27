<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset='UTF-8'>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<form name='register_form' action="result">
		<div class='container'>
			<div class='border'>회원가입</div>
			<div class='p'>이메일</div>
			<input name='email' id='textbox' type='text' placeholder="이메일"
				style='width: 300px'> <input class='button2' type='button'
				value='중복'>
			<div class='p'>이름</div>
			<input name='name' id='textbox' type='text' placeholder="이름"
				>
			<div class='p'>별명</div>
			<input name='nickname' id='textbox' type='text' placeholder="별명"
				style='width: 300px'> <input class='button2' type='button'
				value='중복'>
			<div class='p'>비밀번호</div>
			<input name="pass1" id='textbox' type='password' placeholder="비밀번호" style='width: 200px;'>
			<input name="pass2" id='textbox' type='password' placeholder="비밀번호 확인" style='width: 200px;'>
			<div class='p'>연락처</div>
			<input name="phone" id='textbox' type='text' placeholder="연락처 ( - 제외 )"
				style='width: 300px'> <input class='button2' type='button'
				value='인증'>
			<div class='p'>주소</div>
			<input name="address" id='textbox' type='text' placeholder="우편번호"
				style='width: 300px'> 
			<input class='button2' type='button' value='검색'>
			<br>
			<input id='textbox' type='text' placeholder="상세주소" style="margin-top: 10px; width: 400px">

			<div class='p'>계좌번호</div>
			<select name='bank'>
				<option value='nh'>농협은행</option>
				<option value='kb'>국민은행</option>
				<option value='sh'>신한은행</option>
			</select> 
			<input name="banknum" id='textbox' type='text' placeholder="계좌번호" style='width: 200px;'>
			<div class='p'>비밀번호 Q&A</div>
			<select name='question'>
				<option value='a1'>질문1</option>
				<option value='a2'>질문2</option>
				<option value='a3'>질문3</option>
			</select> 
			<input name="answer" id='textbox' type='text' placeholder="답변" style='width: 200px;'> 
			<input class='button' type="submit" value='회원가입' style="margin-top: 30px">
		</div>
	</form>
</body>
</html>