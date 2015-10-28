<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/detail.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class="container3">
		<div class='img'>
			<img src='img/useimg/logo.png' class='mimg'> <img
				src='img/useimg/logo.png' class='simg'> <img
				src='img/useimg/logo.png' class='simg'> <img
				src='img/useimg/logo.png' class='simg'> <img
				src='img/useimg/logo.png' class='simg'>
		</div>
		<div class='info'>
			<div class='bold2'>제품명</div>
			<div class='font'>${itemone.getItemname()}</div>
			<div class='bold2'>상태</div>
			<div class='font'>${itemone.getItemstate()}</div>
			<div class='bold2'>가격</div>
			<div class='font'>${itemone.getItemprice()}</div>
			<div class='bold2'>판매방법</div>
			<div class='font'>${itemone.getHowsell()}</div>
			<div class='bold2'>카테고리</div>
			<div class='font'>${itemone.getCategory()}</div>
			<div class='bold2'>판매자</div>
			<div class='font'>${itemone.getEmail()}</div>
			<div class='bold2'>설명</div>
			<textarea class='tb' readonly>${itemone.getItemdetail()}</textarea>
			<input class='callbtn' type="button" value="직거래">
			<input class='callbtn' type="button" value="안전거래">
			
		</div>
	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>
