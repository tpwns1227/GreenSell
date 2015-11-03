<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<form action="updateok" method="post">
	<table align="center" width="500">
		<tr>
			<td colspan="1">
				제목 :<input type="text" value=" ${view.title}" name="title">
				<p>
				작성자 : <input type="text" value="${view.email}" name="email" readonly="readonly">
				날짜 : ${view.bbsdate}
				조회수 : ${view.hits}
				<hr>
				<p>
				내용<br>
				<textarea name="bbscontent" cols="80" rows="10" >${view.bbscontent}</textarea>
				<br>
				<hr>
			</td>
		</tr>	
		<tr>
			<td align="right"><input type="submit" value="수정" onclick="location.href='updateok'" >
			<input type="hidden" value="${view.no }" name="no">
			<input type="button" value="목록" onclick="location.href='list?no=${view.bbsno}'">
			</td>
		</tr> 
		<tr>
		</tr>
	</table>
 </form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>