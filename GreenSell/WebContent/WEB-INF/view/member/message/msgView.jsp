<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	function CM() {
		if (document.cmreply.cmcontent.value == "") {
			alert("내용을 넣어주세요.");
			document.cmreply.cmcontent.focus();
			return false;
		} else {
			return true;
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="../../main/header.jsp"></jsp:include>


	<div class='container'>
	
		<div class='border'>메세지 보기</div>
		<div class='p'>제목</div>
		<input class='textbox' value='${view.title}' readonly type='text'>
		<div class='p'>보낸이</div>
		<input class='textbox' type='text' value='${view.getSendemail()}' readonly>
		<div class='p'>받는이</div>
		<input class='textbox' type="text" value='${view.getRvemail() }'>
		<table style="width: 400px">
			<tr>
				<td width='300px'><div class='p'>작성일</div></td>
			</tr>
		</table>
		<input class='textbox' type='text' value='${view.mdate}' readonly
			style='width: 300px'>
		<div class='p'>내용</div>
		<textarea>${view.content}</textarea>
		
<!--  댓글 내용 보기-->
		<input class='button' type='button' value='목록' style='margin-top: 5px'
			onclick="location.href='msglistview'">
		<%-- <input class='button' type='button' value='답장' style='margin-top: 5px'
			onclick="location.href='msgreview?email=${view.sendemail}'"> --%>
			
			<c:if test="${view.rvemail==skey || grade==1}">	<%--운영자도 삭제가능함 --%>
			<form action="msgdelete?no=${no }">
				<input type="submit" class='button' id="de" value="삭제"
					style='margin-top: 5px; width: 400px'>
					 <input type="hidden"value="${view.no}" name="no">
			</form>
		</c:if>
</div>

</body>
<jsp:include page="../../main/bottom.jsp"></jsp:include>
</html>