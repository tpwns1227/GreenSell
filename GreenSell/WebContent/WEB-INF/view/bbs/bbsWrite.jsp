<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String email = (String) session.getAttribute("skey");
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
		location.href = url;
	}
	// 등록 폼 체크
	function WC() {
		var form = document.BbsWriteForm;
		if (form.title.value == '') {
			alert('제목을 입력하세요.');
			form.title.focus();
			return false;
		} else if (form.bbscontent.value == '') {
			alert('내용을 입력해주세요.');
			form.bbscontent.focus();
			return false;
		}

		else {
			return true;
		}

	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<form name="BbsWriteForm" action="writeok" method="post">
		<input type="hidden" name="mode" value="W" />
		<div class='container'>
			<div class='border'>글쓰기</div>
			<div class='p'>제목</div>
			<input class='textbox' name="title" type='text' placeholder="제목">
			<br>
			<div class='p'>작성자</div>
			<input class='textbox' type='text' value="<%=email%>"
				readonly="readonly"> <br>
			<div class='p'>내용</div>
			<textarea placeholder="내용" name="bbscontent"></textarea>
			<input class='button' type='button' value='목록' style='width: 200px'
				onclick="goUrl('list');"> <input class='button'
				type='button' value='작성' style='width: 200px' onclick="return WC()">
		</div>
	</form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>