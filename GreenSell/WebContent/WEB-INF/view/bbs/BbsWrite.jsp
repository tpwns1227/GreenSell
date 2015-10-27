<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	function boardWriteCheck() {
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
		<div class='container1'>
		<div class='top' id='logo'>
			<img src='img/useimg/logo.png' height='70'>
		</div>
		<div class='top' id='site'>
			<a href="">내 정보</a><a href="login_form">로그인</a>
		</div>
	</div>

	<div class='container2'>
		<div class='menu'>
			<a href="#">홈</a> <a href="#">판매하기</a> <a href="#">경매 게시판</a> <a
				href="#">중고 게시판</a> <a href="#">고객지원</a>
		</div>
		<div class='search'>
				<input id='box' type='text' placeholder='Search...' /> <input
					id='button' value='검색' type='button' />
		</div>
	</div>
	<div>
		<hr>
	</div>
	<br><br><br>
	<table border="1" align="center">
		<tr>
			<th align="center">제목</th>
			<td><input type="text" name="title" size="60" maxlength="30" /></td>
		</tr>
		<tr>
			<th align="center">작성자</th>
			<td><input type="text" name="email" maxlength="20" /></td>
		</tr>
		<tr>
				<td colspan="2">
					<textarea name="contents" cols="80" rows="10"></textarea>
				</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="목록" onclick="goUrl('list');"/>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit"" value="글쓰기" />
			</td>
		</tr>
	</table>
</body>
</html>