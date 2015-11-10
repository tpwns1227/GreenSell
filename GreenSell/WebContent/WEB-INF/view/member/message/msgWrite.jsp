<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
	String email = (String) session.getAttribute("skey");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
<title>Green Sell</title>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 등록 폼 체크
	function MSG() {
		var form = document.MsgWriteForm;
		if (form.title.value == '') {
			alert('제목을 입력하세요.');
			form.title.focus();
			return false;
		} else if (form.MsgWriteForm.value == '') {
			alert('내용을 입력해주세요.');
			form.MsgWriteForm.focus();
			return false;
		}

		else {
			return true;
		}

	}
</script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>

	<form name="MsgWriteForm" action="msgwriteok" method="post">
<div class='container'>
	
		<div class='border'>메세지 쓰기</div>
		<div class='p'>제목</div>
		<input name="title" class='textbox' type='text' placeholder="제목">
		<div class='p'>보낸이</div>
		<input name="sendemail" class='textbox' type='text' value='${skey }' readonly>
		<div class='p'>받는이</div>
		<input name="rvemail" class='textbox' type="text" placeholder="받는이">		
		<div class='p'>내용</div>
		<textarea name="content" placeholder="내용"></textarea>
		
		<!--  목록 보기-->
		<input class='button' type='submit' value='작성' style='margin-top: 5px'
			onclick="return MSG()">
		<input class='button' type='button' value='목록' style='margin-top: 5px'
			onclick="location.href='msglistview'">
</div>
	</form>

</body>
<jsp:include page="../../main/bottom.jsp"></jsp:include>
</html>