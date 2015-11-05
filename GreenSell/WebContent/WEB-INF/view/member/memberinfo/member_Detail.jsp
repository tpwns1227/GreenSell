<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script>
	function deleteMember() {

		document.detail.action = 'delete_form';
		document.detail.submit();
	}
	function updateMember() {
		document.detail.action = 'updateForm';
		document.detail.submit();
	}
	function like() {
		document.detail.action = 'cart_form';
		document.detail.submit();
	}
	$(document).ready(function(){
		$("#mywrite").click(function(){
			var win = window.open('mywriteForm', "post",
			         "toolbar=no ,width=1000 ,height=500 ,directories=no,"
			               + "status=yes,scrollbars=yes,menubar=no");
		});
		
		$("#pointlist").click(function(){
			window.open('pointlist_form', "post",
			         "toolbar=no ,width=500 ,height=300 ,directories=no,"
		               + "status=yes,scrollbars=yes,menubar=no");
		});
		
		
		
	});
	
	
	
	
</script>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<form name="detail" action="update_form" method="post">
		<div class='container'>
			<div class='border'>내 정보</div>
			<div class='p'>이메일</div>
			<input name="email" id='textbox' type='text' value='${member.email}'
				readonly>
			<div class='p'>이름</div>
			<input name="name" id='textbox' type='text' value='${member.name }'
				readonly>
			<div class='p'>별명</div>
			<input name="nickname" id='textbox' type='text'
				value='${member.nickname }' readonly>
			<div class='p'>휴대전화</div>
			<input name="phone" id='textbox' type='text' value='${member.phone }'
				readonly>
			<div class='p'>주소</div>
			<input id='textbox' value='${member.zipcode }' type='text' readonly
				name="zipcode">
			<div class='p'>주소</div>
			<input id='textbox' value='${member.address }' type='text' readonly
				name="address">
			<div class='p'>계좌번호</div>
			<input id='textbox' type='text' value='${member.bank }'
				style='width: 200px;' readonly name="bank"> <input
				id='textbox' type='text' value='${member.account }' name="account"
				style='width: 200px;' readonly>
			<div class='p'>비밀번호 Q&A</div>
			<input id='textbox' type='text' value='${member.question }'
				style='width: 200px;' readonly name="question"> <input
				id='textbox' type='text' value='${member.answer }'
				style='width: 200px;' readonly name="answer">
			<div class='p'>포인트</div>
			<input name="point" id='textbox' type='text' value='${member.point}'
				readonly style="width: 300px"> <input id="pointlist"
				class='button2' type="button" value='내역'>
				
			<input id="update" class='button2' type="button" value='정보수정'
				onclick='updateMember()' style="margin-top: 15px;"> <input
				id="login" class='button2' type="button" onclick='deleteMember()'
				value='회원탈퇴'>
				<input class='button2' type="button" id="mywrite" value='내가 올린 글'> 
				<input class='button2' type="button" value='찜 목록'
				onclick="like()">
		</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>