<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
/* $(document).ready(function (){
	$("#btn1").click(function(){
		location.href="list?no=2"
	});
	$("#btn2").click(function(){
		location.href="list?no=3"
	});
	$("#btn3").click(function(){
		location.href="list?no=4"
	});
}); */
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>고객 지원</div>  
	<form action="list">
		<input type="hidden" value="2" name="no">
		<input id='btn1' class='button' type="submit" value='공지사항' style="margin-top: 15px; width: 400px"> 
	</form>
	<form action="list"> 
		<input type="hidden" value="3" name="no">
		<input	id='btn2' class='button' type="submit" 
				value='질문하기' style="margin-top: 15px; width: 400px"> 
	</form>
	<form action="list">
		<input type="hidden" value="4" name="no">
		<input id='btn3' class='button' type="submit"	
				value='자주 묻는 질문' style="margin-top: 15px; width: 400px">
	</form>
		 
		
	
	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>