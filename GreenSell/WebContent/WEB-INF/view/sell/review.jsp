<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
response.setHeader("Cache-Control", "no-cache");

if(session.getAttribute("skey")==null){
%>
<script>history.go(-1)</script>
<%
}
%> 
<meta charset='UTF-8'>
<html>
<head>
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">


/* $(document).ready(function(){
	$("#btn").click(function(){
		if($("#ta").text()==''){
			alert("내용을 입력해 주세요...");
			return;
		}else{
			document.review.submit();
		}
	});
}); */
</script>
</head>
<body> <!-- 후기작성폼 -->
	<%-- <jsp:include page="../main/header.jsp"></jsp:include> --%>
	<form name="review" action="reviewok">
	<div class='container'>
		<div class='border'>${email} 후기 작성</div>
		<div class='p'>평점</div>
		<select style="width: 400px" name="point">
			<option  selected>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
		<div class='p'>내용</div>
		<input type="hidden" name="email" value="${email}">
		<input type="hidden" name="wemail" value="${skey}">	
			<textarea placeholder="내용"  name="content"></textarea>
		<input class='button' id="btn" type="submit" value='작성' >
	</div>
	</form>
	<%-- <jsp:include page="../main/bottom.jsp"></jsp:include> --%>
</body>
</html>