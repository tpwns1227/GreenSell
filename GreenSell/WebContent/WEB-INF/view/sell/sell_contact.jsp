<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/detail.css">
<style type="text/css">
input[type='button'] {
	border: 0 none;
	color: white;
	background-color: #12CC66;
	/*input type='button' 은 배경색이 #12CC66*/
}

input[type='button']:hover {
	transition: 0.3s ease;
	background-color: #0e9d4f;
	/*input type='button' hover 시 #0e9d4f*/
}
</style>
</head>
<body>
	<div class='container3' style="width: 500px; height: 125px">
		<div class='border'>연락처</div>
		<input type='text' class='textbox' value='01051315341' readonly>
		<input class='callbtn' type="button" value="확인"
			style="width: 400px; margin-top: 10px">
	</div>
</body>
</html>