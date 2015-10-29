<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>정보 수정</div>
		<div class='p'>비밀번호</div>
		<input name="password" id='textbox' type='password' placeholder="비밀번호"
			style='width: 200px;'> <input name="password2" id='textbox'
			type='password' placeholder="비밀번호 확인" style='width: 200px;'>
		<div class='p'>주소</div>
		<input name="zipcode" id='textbox' type='text' placeholder="우편번호"
			style='width: 200px' value='410-759' readonly=""> <input
			class='button' type='button' value='검색' style='width: 200px'>
		<input name="address" id='textbox' type='text' placeholder="상세주소"
			style="margin-top: 10px; width: 400px"
			value='경기도 고양시 일산동구 정발산동 밤가시마을 2단지 203동 401호' readonly="">

		<div class='p'>계좌번호</div>
		<select name='bank' class='rf'>
			<option value='nh'>농협은행</option>
			<option value='kb'>국민은행</option>
			<option value='sh'>신한은행</option>
		</select> <input name="account" id='textbox' type='text' placeholder="계좌번호"
			value='3510200997933' style='width: 200px;'>
		<div class='p'>비밀번호 Q&A</div>
		<select name='question' class='rf'>
			<option value='a1'>질문1</option>
			<option value='a2'>질문2</option>
			<option value='a3'>질문3</option>
		</select> <input name="answer" id='textbox' type='text' placeholder="답변"
			value='치킨' style='width: 200px;'> <input class='button'
			type="button" value='수정완료' style="margin-top: 15px"
			onclick="inputCheck()">
	</div>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>