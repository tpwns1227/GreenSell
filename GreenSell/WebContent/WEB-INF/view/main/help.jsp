<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>고객 지원</div>

		<input class='button' type="button" value='공지사항'
			style="margin-top: 15px; width: 400px" onclick="inputCheck()"> 
			<input
			class='button' type="button" value='질문하기' style="margin-top: 15px; width: 400px"
			onclick="inputCheck()"> 
			<input class='button' type="button"
			value='자주 묻는 질문' style="margin-top: 15px; width: 400px" onclick="inputCheck()">
	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>