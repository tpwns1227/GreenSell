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
<div class='container3' style="width: 500px; height: auto">
<div class='border'>윤푸</div>
<div class='font2'>연락처</div>
<input type='text' class='textbox' value='01051315341' readonly>
<div class='font2'>평점 : 4.3</div>

${email}
${email}

안녕하세요
<a href="mywrite?email=${email }">
<input class='callbtn' type="button" value="글쓴이가 올린 글" style="width: 133px; margin-top: 10px" >
</a>

<form>
<a href="postscript?email=${email }">
<input class='callbtn' type="button" value="후기 게시판" style="width: 133px; margin-top: 10px">
</a>
</form>
<input class='callbtn' type="button" value="확인" style="width: 133px; margin-top: 10px" onclick="window.close()" >
</div>
</body>
</html>