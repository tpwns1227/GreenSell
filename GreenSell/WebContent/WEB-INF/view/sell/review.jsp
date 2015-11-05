<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset='UTF-8'>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
</head>
<body> <!-- 후기작성폼 -->
	<%-- <jsp:include page="../main/header.jsp"></jsp:include> --%>
	<form action="reviewok">
	<div class='container'>
		<div class='border'>후기작성</div>
		<div class='p'>평점</div>
		<select style="width: 400px" name="point">
			<option selected>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
		<div class='p'>내용</div>
		<textarea placeholder="내용" name="content"></textarea>
		<input class='button' type='submit' value='작성'>
	</div>
	</form>
	<%-- <jsp:include page="../main/bottom.jsp"></jsp:include> --%>
</body>
</html>