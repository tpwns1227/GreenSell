<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset='utf-8'>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<body>
<form name='pointForm' action='point'>
	<div class='container'>
		<div class='border'>포인트 충전</div>
		<div class='p'>이메일</div>
		<input type='text' name="email" class='textbox' value='${skey}' readonly>
		<div class='p'>충전금액</div>
		<input type='text' name='price' class='textbox' placeholder='금액'> <input
			type='submit' class='button' value='충전' style="margin-top: 25px">
	</div>
	</form>
</body>
</html>