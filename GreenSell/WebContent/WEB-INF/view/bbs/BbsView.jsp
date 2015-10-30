<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String email = (String)session.getAttribute("skey");
String[] id=email.split("@");
String id2=id[0];
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
var em="${view.email}";
var em2=em.split("@");
var em3=em2[0];
var session="<%=id2%>";
$(document).ready(function(){
	/* alert("em="+em+" em2="+em2+" em3="+em3) */
	if(em3==session){
		$("#up").show();
		$("#de").sohw();
	}
	else {
		$("#up").hide();
		$("#de").hide();
	}
});


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
		<!--session값 확인해서 수정,삭제 활성화  -->
		<!-- 수정 클릭시 게시글 번호를 넘겨 BbsUpdate.jsp로 이동 -->
			<td align="right">
			<input type="button"  id="up" value="수정" onclick="location.href='update?no=${view.no}'">
			<input type="button" id="de" value="삭제" >
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