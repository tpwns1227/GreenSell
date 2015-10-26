<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
<div class='header'>
	<div class='top' id='logo'>
	<img src='img/logo.png' height='70'>
	</div>
	<div class='top' id='site'>
		<a href="#">로그인</a> 
		<a href="#">내 정보</a> 
	</div>
	</div>
	
<div class='test'>
	<div class='menubar'>
		<a href="#">홈</a> 
		<a href="#">판매하기</a> 
		<a href="#">경매 게시판</a> 
		<a href="#">중고 게시판</a> 
		<a href="#">고객지원</a> 
	</div>
	<div class='search'>
		<form id="searchthis" action="/search" style="" method="get">
			<input id="namanyay-search-box" name="q" type="text" placeholder="GREEN SELL" />
			<input id='search-btn' value="검색" type="submit" />
		</form>	
	</div>
</div>
<div>
<hr style="border: solid 1px #12CC66;">
</div>
</body>
</html>