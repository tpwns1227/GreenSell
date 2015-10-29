<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/member.css">
</head>

<body>
<div class='container'>
		<div class='border'>비밀번호 찾기</div>
		<div class='p'>이메일</div>
		<input name="email" id='textbox' type='text' placeholder="이메일">
		<div class='p'>질문</div>
		<select name='question' class='pf'>
				<option value='a1'>질문1</option>
				<option value='a2'>질문2</option>
				<option value='a3'>질문3</option>
			</select> 
		<div class='p'>대답</div>
		<input name="text" id='textbox' type='text' placeholder="대답"> <br>
		<input id="login" class='button' type="button" value='비밀번호 찾기' onclick="call()" style="margin-top: 15px" >
	</div>
</body>
</html>