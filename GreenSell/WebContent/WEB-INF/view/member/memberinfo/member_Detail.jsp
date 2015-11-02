<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function uf() {
	location.href='updateForm';
}
function like(){
	location.href='cart_form'
}
</script>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>내 정보</div>
		<div class='p'>이메일</div>
		<input name="email" id='textbox' type='text' value='${member.email}'
			readonly="">
		<div class='p'>이름</div>
		<input name="email" id='textbox' type='text' value='${member.name }'
			readonly="">
		<div class='p'>별명</div>
		<input name="email" id='textbox' type='text'
			value='${member.nickname }' readonly="">
		<div class='p'>휴대전화</div>
		<input name="email" id='textbox' type='text' value='${member.phone }'
			readonly="">
		<div class='p'>주소</div>
		<input id='textbox' value='${member.address }' type='text' readonly="">
		<div class='p'>계좌번호</div>
		<input id='textbox' type='text' value='${member.bank }'
			style='width: 200px;' readonly=""> <input id='textbox'
			type='text' value='${member.account }' style='width: 200px;'
			readonly="">
		<div class='p'>비밀번호 Q&A</div>
		<input id='textbox' type='text' value='${member.question }'
			style='width: 200px;' readonly=""> <input id='textbox'
			type='text' value='${member.answer }' style='width: 200px;'
			readonly="">
		<div class='p'>포인트</div>
		<input name="text" id='textbox' type='text' value='${member.point }'
			readonly="" style="width: 300px"> <input id="login"
			class='button2' type="button" value='내역' onclick="call()"> <input
			id="login" class='button2' type="button" value='정보수정'
			onclick="uf()" style="margin-top: 15px;">
		<input id="login" class='button2' type="button" value='회원탈퇴'
			onclick="call()"> <input id="login" class='button2'
			type="button" value='내가 올린 글' onclick="call()"> <input
			id="login" class='button2' type="button" value='찜 목록'
			onclick="like()">
	</div>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>