<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

function CM() {
	if(document.cmreply.cmcontent.value==""){
		alert("댓글을 넣어주세요.");
		document.cmreply.cmcontent.focus();
		return false;
	}
	else{
		return true;
	}
}

function list(){
	location.href='list';
}
</script>
<title>Insert title here</title>
</head>
<body>
<%
	String email = (String)session.getAttribute("skey");
%>

<jsp:include page="../main/header.jsp"></jsp:include>

	<table align="center" width="500">
		<tr>
			<td colspan="1">
				제목 : ${view.title}
				<p>
				작성자 : ${view.email}
				날짜 : ${view.bbsdate}
				조회수 : ${view.hits}
				<hr>
				<p>
				내용<br>
				${view.bbscontent}<br>
				<hr>
			</td>
		</tr>
		
			<c:forEach var="cm" items="${comment}">
				<div class='container'>
				<tr>
				<td align="center"><div class='email'>${cm.email}</div></td>
				<td align="center"><div class='cmdate'>${cm.cmdate}</div></td>
				<td align="center"><div class='cmcontent'>${cm.cmcontent}</div></td>
				</tr>
				</div>
			</c:forEach>
		
		<tr>
			<td align="right"><input type="button" value="수정"><input type="button" value="삭제">
			<input type="button" value="목록" onclick="list()">
			</td>
		</tr>
		<tr>
		</tr>
		
		 
		<tr>
			<td>
			댓글 입력
                 <p>
                 <form name="cmreply" action="cmok" method="post">
                     <input type="hidden" value="<%= email %>" name="email">
                     <input type="hidden" value="${view.no}" name="no">
                     <textarea name="cmcontent" rows="2" cols="80"></textarea>  
                      <input type="submit" value="확인" onclick="return CM()">
                      
                   </form> 
                 </p>
			
			</td>
		</tr>
	</table>
            
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>