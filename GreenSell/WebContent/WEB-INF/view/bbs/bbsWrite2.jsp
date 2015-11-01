<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>공지사항</div>
		<div class='p'>제목</div>
		<input id='textbox' type='text' placeholder="제목"> <br>
		<div class='p'>내용</div>
		<textarea placeholder="내용"></textarea>
		<input class='button' type='button' value='작성'>
	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>