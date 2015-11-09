<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String logemail = (String) session.getAttribute("skey");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
<title>Green Sell</title>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
	// 등록 폼 체크
	function MSG() {
		var form = document.MsgWriteForm;
		if (form.title.value == '') {
			alert('제목을 입력하세요.');
			form.title.focus();
			return false;
		} else if (form.MsgWriteForm.value == '') {
			alert('내용을 입력해주세요.');
			form.MsgWriteForm.focus();
			return false;
		}

		else {
			return true;
		}

	}
</script>
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>

	<form name="MsgWriteForm" action="msgwriteok" method="post">
<div class='container'>
		<div class='border'>답장하기</div>
		<div class='p'>제목</div>
		<input class='textbox' maxlength="50" name="title" type='text' placeholder="제목" >
		<div class='p'>받는이</div>
		<input name="rvemail" class='textbox' type='text' placeholder="받는이" value="${email}" readonly>
		<div class='p'>보내는 이</div>
		<input name="sendemail" class='textbox' type='text' placeholder="보내는이" value="<%=logemail%>" readonly>
		<div class='p'>내용</div>
		<textarea placeholder="내용" maxlength="1000" name="content"></textarea>
		<input class='button' type='button' value='목록' style='width: 200px'
			onclick="goUrl('msglistview?email=${logemail}');">
			<input class='button' type='submit' value='작성'
			style='width: 200px' onclick="return MSG()"/>
</div>
	</form>

</body>
<jsp:include page="../../main/bottom.jsp"></jsp:include>
</html>