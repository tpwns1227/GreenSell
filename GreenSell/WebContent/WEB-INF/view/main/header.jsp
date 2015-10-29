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
			<a href="updateForm">내 정보</a>
			<a href="logout">로그아웃</a>
			<%
				}
			%>

		</div>
	</div>

	<div class='container2'>
		<div class='menu'>
			<a href="#">홈</a> <a href="inputform">판매하기</a> <a href="itemList?howsell=경매">경매 게시판</a> <a
				href="itemList">중고 게시판</a> <a href="#">고객지원</a>
		</div>
		<div class='search'>
			<input id='box' type='text' placeholder='Search...' /> <input
				id='button' value='검색' type='button' />
		</div>
	</div>
	<div>
		<hr>
	</div>
</body>
</html>