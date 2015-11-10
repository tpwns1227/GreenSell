<%@page import="com.greensell.member.beans.MemberVO"%>
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
	<%
	String password = request.getParameter("pass");

	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<script type="text/javascript">
function goodbye(pwd){
	
	
		document.delete_form.submit();
		
	
	
}
</script>
<body>
<jsp:include page="../../main/header.jsp"></jsp:include>
	<form name="delete_form" action="delete_result">
	<div class='container'>
		<div class='border'>회원 탈퇴</div>
		<div class='p'>비밀번호를 입력해주세요.</div>
		<input id='pass' name="password" class='textbox' type='password'
			placeholder="비밀번호"> <input type="button" class="button"
			value="회원 탈퇴" style='width: 400px; margin-top: 25px;' onclick='goodbye()'>
	</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>