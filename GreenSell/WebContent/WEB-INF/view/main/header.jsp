<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = (String) session.getAttribute("skey");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
$(document).ready(function(){
	
	setInterval(function () {	
		$.ajax({
			url: 'pointre',
			success : function(data){ 
			   var p = Number(data).toLocaleString().split('.')[0];
				$("#point").html('<font color="red">'+p+'</font>&nbsp;&nbsp;&nbsp;&nbsp;포인트');
				
			}
		});
	},10);
	
	
});
 
	function inputform(){
		
		if('${skey}' != '')
		location.href='inputform';
		else
		alert('로그인 후에 이용해 주세요.');
		return;
	}
	
	function pointform(){
		
		if('${skey}' != '')
			location.href='point_form';
		else
		alert('로그인 후에 이용해 주세요.');
		return;
	}
	
function pointcollect(){
	
	if('${skey}' != '')
		location.href='collect_form';
	else
	alert('로그인 후에 이용해 주세요.');
	return;
		
	}
	
	function msglist(){
		if('${skey}' != '')
			location.href='msglistview';
		else
		alert('로그인 후에 이용해 주세요.');
		return;
		
	}
	
</script>
</head>
<body>

	<div class='container1'>
		<div class='top' id='logo'>
			<a href='home'> <img src='img/useimg/logo.png'
				height='80'>
			</a>
		</div>
		<div class='top' id='site'>
			
			
			
			<%
				if (email == null) {
			%>
			
			<a href="login_form">로그인</a>
			<%
				} else {
			%>
			<a id="point"></a>
			<a href="member_Detail">내 정보</a>
			<a href="logout">로그아웃</a>
			<p>
			<p>
			<a>${skey}님 환영합니다...</a>
			<a href="msglistview">메시지 보기</a>
			<%
				}
			%>

		</div>
	</div>

	<div class='container2'>
		<div class='menu'>
			<a href="home">홈</a> <a href="javascript:inputform()">판매하기</a> <a href="itemList?howsell=경매">경매 게시판</a> <a
				href="itemList">중고 게시판</a> <a href="help">고객지원</a><a href="javascript:pointform()">포인트 충전</a>
				<a href="javascript:pointcollect()">포인트 환전</a>
		</div>
		<!-- <div class='search'>
			<input id='box' type='text' placeholder='Search...' /> <input
				id='button' value='검색' type='button' />
		</div> -->
	</div>
	<div>
		<hr>
	</div>
</body>
</html>