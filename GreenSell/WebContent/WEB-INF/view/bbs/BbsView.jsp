<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

function CM() {
	if(document.view.cm.value==""){
		alert("댓글을 넣어주세요.");
		document.view.cm.focus();
		return;
	}
}

function list(){
	location.href="BbsList";
}
</script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
<form name="view">
	<table align="center" width="500">
		<tr>
		
			<td>
				제목 <input type="text" name="title" readonly="readonly">
				<p>
				작성자 : <input type="text" name="email" readonly="readonly">
				날짜 : <input type="text" name="date" readonly="readonly">
				조회수 : <input type="text" name="hits">
				<hr>
				<p>
				내용<textarea rows="3" cols="90" name="centent" ></textarea><br>
				<hr>
			</td>
		</tr>
		<tr>
			<td align="left"><input type="button" value="목록" onclick="list()"></td>
		</tr>
		<tr>
			<td>
			댓글 입력
                 <p>
                     <textarea name="cm" rows="2" cols="80"></textarea>  
                      <input type="button" value="확인" onclick="CM()">
                 </p>
			
			</td>
		</tr>
	</table>
  </form>             
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>