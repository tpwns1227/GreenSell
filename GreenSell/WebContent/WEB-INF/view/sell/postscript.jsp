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
						<td align="center">${cm.content}</td>
						<td>${cm.email}</td>
						<td>${cm.wdate}</td>
						<td>
							<form action="postdelete">
									<input type="hidden" value="${cm.email}" name="email">
									<input type="hidden" value="${cm.point}" name="point">
									<input type="hidden" value="${cm.content}" name="content">
									<input type="hidden" value="${skey}" name="wemail">
									
								<c:if test="${cm.email==skey}">
									<input class='button' type="submit" value="삭제">
									<br>
								</c:if>
							</form> <br>
			</c:forEach>
			
			<div class='p'>댓글 내용나라${cm.email }나라나라</div>
		<form name="postok" action="postok" method="post">
		<div class='p'>평점</div>
		<select style="width: 400px" name="point">
			<option selected="selected">1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
		</select>
			<textarea name="content" rows="2" cols="80"></textarea>
			
			<input type="hidden" value="${ct.getEmail()}" name="email">
			<input type="hidden" value="${ct.getPoint()}" name="point">
			<input type="hidden" value="${ct.getContent()}" name="content">
			<input class='button' type="submit" value="확인">
		</form>
	</div>
</table>
</body>
</html>