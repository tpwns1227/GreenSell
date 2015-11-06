<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset='UTF-8'>
<html>
<head>
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">
	function review(){
		location.href="review_write?email=${email}";
	}
	$(document).ready(function(){
	    $("tr:even").css("background-color", "#12CC66");
	    $("tr:even").css("color", "#FFFFFF");
	    
	});
	
</script>
<style type="text/css">
table {
	margin-left: 50px;
}

td {
	text-align: center;
}

.bt {
	border-bottom: 1px;
}

.tdbold {
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body style="width: 800px; margin: 0px">
	<div class='container' style="width: 500px; height: auto">
		<div class='border'>${email}의 후기</div>
		<hr width='800px'>
		<table style="width: 700px">
			<tr height="30px">
				<td width="100px">
					<div class='tabold'>작성자</div>
				</td>
				<td width="350">
					<div class='tdbold'>내용</div>
				</td>
				<td width="50px">
					<div class='tdbold'>평점</div>
				</td>
				<td width="150px">
					<div class='tdbold'>날짜</div>
				</td>
			</tr>
			
			<c:forEach var="list" items="${PSlist}">
			<tr>
				<td>${list.wemail}</td>
				<td>${list.content}</td>
				<td>${list.point }</td>
				<td>${list.wdate}</td>
			</tr>
			</c:forEach>
			<tr>
			<td colspan="4" align="right">
			<input type="button" value="후기쓰기" onclick="review()" style="width: 95px; height: 30px">
			</td>
			</tr>
		</table>
		<p/><p/>
		
		</div>
</body>
</html>