<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%
    	String skey=request.getParameter("skey");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
</head>
<body>
<table>
	<c:forEach var="cm" items="${comment}">
			<div class='p'>댓글</div>
			<table width='400px' style='margin-left: 50px'>
			<tr>
				<td width='150px'>내용</td>
				<td width='150px'>작성자</td>
				<td width='150px' colspan='2'>작성일</td>
			</tr>
					<tr>
						<td align="center">awre${cm.conetnt}</td>
						<td>${cm.email}aweraw</td>
						<td>${cm.wdate}awer</td>
						<td>
							<form action="postdelete">
								<input type="hidden" value="${cm.cmno}" name="cmno"> <input
									type="hidden" value="${skey}" name="skey"> <input
									type="hidden" value="${cm.no}" name="no"> 
									<input type="hidden" value="${cm.email}" name="email">
									<input type="hidden" value="${cm.point}" name="point">
								<c:if test="${cm.email==skey}">
									<input class='button' type="submit" value="삭제">
									<br>
								</c:if>
							</form> <br>
			</c:forEach>
			
			<div class='p'>댓글 내용</div>
		<form name="cmreply" action="postok" method="post">
			<input type="hidden" value="${skey}" name="email">
			 <input	type="hidden" value="${cm.no}" name="no">
			<textarea name="ceontent" rows="2" cols="80"></textarea>
			
			<input class='button' type="submit" value="확인">
		</form>
	</div>


</table>
</body>
</html>