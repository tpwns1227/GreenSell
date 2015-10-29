<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String email=(String)session.getAttribute("skey");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<title>게시판 글쓰기</title>
<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}
	// 등록 폼 체크
	function BbsWriteCheck() {
		var form = document.boardWriteForm;
		if (form.subject.value == '') {
			alert('제목을 입력하세요.');
			form.subject.focus();
			return false;
		}
		if (form.writer.value == '') {
			alert('작성자을 입력하세요');
			form.writer.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
	<br><br><br> 
	<form name="BbsWriteForm" action="writeok" method="post">
	<input type="hidden" name="mode" value="W" />
	<table border="1"  align="center" summary="게시판 글쓰기">
		<caption><font size="20">게시판 글쓰기</font></caption>
		<tr>
			<th align="center">제목</th>
			<td><input type="text" name="title" size="60" maxlength="30" placeholder="제목을 입력해 주세요"/></td>
		</tr>
		<tr>
			<th align="center">작성자</th>
			<td><input type="text" name="email" value="<%=email %>" maxlength="20" /></td>
		</tr>
		<tr>
				<td colspan="2">
					<textarea name="bbscontent" cols="80" rows="10" placeholder="내용을 입력해 주세요" ></textarea>
				</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="목록" onclick="goUrl('list');"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="글쓰기" />
			</td>
		</tr>
	</table>
	</form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>