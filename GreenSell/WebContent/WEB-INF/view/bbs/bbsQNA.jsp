<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>질문하기</div>
		<div class='p'>이메일</div>
		<input class='textbox' type='text' placeholder="이메일">
		<div class='p'>제목</div>
		<input class='textbox' type='text' placeholder="제목"> <br>
		<div class='p'>내용</div>
		<textarea></textarea>
		<div class='forgot' align="right">답변은 이메일로 전송됩니다.</div>
		<input class='button' type='button' value='질문'>

	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>