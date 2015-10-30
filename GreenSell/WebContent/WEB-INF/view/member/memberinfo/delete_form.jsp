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
<jsp:include page="../../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>회원 탈퇴</div>
		<div class='p'>비밀번호를 입력해주세요.</div>
		<input name="password" class='textbox' type='password'
			placeholder="비밀번호"> <input type="submit" class="button"
			value="회원 탈퇴" style='width: 400px; margin-top: 25px;'>
	</div>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>