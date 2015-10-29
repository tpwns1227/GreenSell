<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>내 정보</div>
		<div class='p'>이메일</div>
		<input name="email" id='textbox' type='text' value='ys940917@me.com'
			readonly="">
		<div class='p'>이름</div>
		<input name="email" id='textbox' type='text' value='박윤수' readonly="">
		<div class='p'>별명</div>
		<input name="email" id='textbox' type='text' value='yoonpooh'
			readonly="">
		<div class='p'>휴대전화</div>
		<input name="email" id='textbox' type='text' value='01051315341'
			readonly="">
		<div class='p'>주소</div>
		<input id='textbox' value='경기도 고양시 일산동구 정발산동 밤가시마을 2단지 203동 401호'
			type='text' readonly="">
		<div class='p'>계좌번호</div>
		<input id='textbox' type='text' value='농협' style='width: 200px;'
			readonly=""> <input id='textbox' type='text'
			value='3510200997933' style='width: 200px;' readonly="">
		<div class='p'>비밀번호 Q&A</div>
		<input id='textbox' type='text' value='질문1' style='width: 200px;'
			readonly=""> <input id='textbox' type='text' value='치킨'
			style='width: 200px;' readonly="">
		<div class='p'>포인트</div>
		<input name="text" id='textbox' type='text' value='300' readonly=""
			style="width: 300px"> <input id="login" class='button2'
			type="button" value='포인트 내역' onclick="call()"> <input
			id="login" class='button2' type="button" value='정보수정'
			onclick="call()" style="margin-top: 15px;"> <input
			id="login" class='button2' type="button" value='회원탈퇴'
			onclick="call()"> <input id="login" class='button2'
			type="button" value='내가 올린 글' onclick="call()"> <input
			id="login" class='button2' type="button" value='찜 목록'
			onclick="call()">
	</div>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>