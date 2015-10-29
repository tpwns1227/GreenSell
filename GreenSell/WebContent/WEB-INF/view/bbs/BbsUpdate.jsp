<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

	<table align="center" width="500">
		<tr>
			<td colspan="1">
				제목 :<input type="text" value=" ${view.title}" name="title">
				<p>
				작성자 : <input type="text" value="${view.email}" name="email">
				날짜 : ${view.bbsdate}
				조회수 : ${view.hits}
				<hr>
				<p>
				내용<br>
				<textarea name="bbscontent" cols="80" rows="10" value="${view.bbscontent}"></textarea>
				<br>
				<hr>
			</td>
		</tr>	
		<tr>
			<td align="right"><input type="button" value="수정">
			<input type="button" value="목록" onclick="list()">
			</td>
		</tr>
		<tr>
		</tr>
	</table>
            
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>