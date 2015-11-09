<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	String skey = (String) session.getAttribute("skey");
%> --%>
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
			alert("댓글을 넣어주세요.");
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
	
		<div class='border'>글보기</div>
		<div class='p'>제목</div>
		<input class='textbox' value='${view.title}' readonly type='text'>
		<div class='p'>작성자</div>
		<input class='textbox' type='text' value='${view.email}' readonly>
		<table style="width: 400px">
			<tr>
				<td width='200px'><div class='p'>작성일</div></td>
				<td width='200px'><div class='p'>조회수</div></td>
			</tr>
		</table>
		<input class='textbox' type='text' value='${view.bbsdate}' readonly
			style='width: 200px'> <input class='textbox' type='text'
			value='${view.hits}' readonly style='width: 200px'>
		<div class='p'>내용</div>
		<textarea readonly>${view.bbscontent}</textarea>
		<c:if test="${view.email==skey}">

			<input type="button" class='button' id="up" value="수정"
				onclick="location.href='update?no=${view.no}'"
				style='margin-top: 5px; width: 400px'>
				</c:if>
				<c:if test="${view.email==skey || grade==1}">	<%--운영자도 삭제가능함 --%>
			<form action="delete">
				<input type="submit" class='button' id="de" value="삭제"
					onclick="location.href='delete'"
					style='margin-top: 5px; width: 400px'>
					 <input type="hidden"value="${view.no}" name="no"> 
					 <input type="hidden"value="${view.bbsno}" name="bbsno">
					 <input type="hidden" value="${view.email}" name="email">
			</form>
<!--  댓글 내용 보기-->
		</c:if>
		<input class='button' type='button' value='목록' style='margin-top: 5px'
			onclick="location.href='list?no=${view.bbsno}'">
			<c:forEach var="cm" items="${comment}">
			<div class='border'>답글</div>
			<table style='margin-left: 50px; width: 400px'>
			<tr>
				<td width='150px'>작성자</td>
				<td width='150px'>작성일</td>
			</tr>
					<tr>
						
						<td>${cm.email}</td>
						<td>${cm.cmdate}</td>
					</tr>
					<tr>
					<td colspan="2">
						<textarea readonly name="cmcontent" rows="2" cols="80" maxlength="800">${cm.cmcontent}</textarea> 
					</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<form action="cmdelete">
								<input type="hidden" value="${cm.cmno}" name="cmno"> <input
									type="hidden" value="${skey}" name="skey"> <input
									type="hidden" value="${cm.no}" name="no"> <input
									type="hidden" value="${cm.email}" name="email">
								<c:if test="${cm.email==skey}">
									<input class='button' style="width: 100px" type="submit" value="삭제">
									<br>
								</c:if>
							</form>
						</td>
					</tr>
							
			
		</table>
		</c:forEach>
		<!--  댓글 내용쓰기 grade이 1일때만 가능-->
		<c:if test="${grade==1 && view.bbsno==3}">
		<div class='p'>답글 내용</div>
		<form name="cmreply" action="cmok" method="post">
			<input type="hidden" value="${skey}" name="email">
			 <input	type="hidden" value="${view.no}" name="no">
			<textarea name="cmcontent" rows="2" cols="80" maxlength="800"></textarea>
			
			<input class='button' type="submit" value="확인" onclick="return CM()">
		</form>
	</c:if>
</div>

</body>
<jsp:include page="../../main/bottom.jsp"></jsp:include>
</html>