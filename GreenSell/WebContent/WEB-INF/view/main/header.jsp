<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = (String) session.getAttribute("email");
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
			<a href='../main/home'> <img src='img/useimg/logo.png'
				height='70'>
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
			<a href="">내 정보</a>
			<a href="">로그아웃</a>
			<%
				}
			%>

		</div>
	</div>

	<div class='container2'>
		<div class='menu'>
			<a href="#">홈</a> <a href="#">판매하기</a> <a href="#">경매 게시판</a> <a
				href="#">중고 게시판</a> <a href="#">고객지원</a>
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