<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String skey = (String) session.getAttribute("skey");
%>
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
<title>Green Sell</title>
</head>
<body>


	<jsp:include page="../main/header.jsp"></jsp:include>


	<div class='container'>
		<div class='border'>글보기</div>
		<div class='p'>제목</div>
		<input class='textbox' value='${view.title}' readonly type='text'>
		<div class='p'>작성자</div>
		<input class='textbox' type='text' value='${view.email}' readonly>
		<table width='400px'>
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
			<div class='p'>댓글</div>
			<table width='400px' style='margin-left: 50px'>
			<tr>
				<td width='150px'>내용</td>
				<td width='150px'>작성자</td>
				<td width='150px' colspan='2'>작성일</td>
			</tr>
					<tr>
						<td align="center">${cm.cmcontent}</td>
						<td>${cm.email}</td>
						<td>${cm.cmdate}</td>
						<td>
							<form action="cmdelete">
								<input type="hidden" value="${cm.cmno}" name="cmno"> <input
									type="hidden" value="${skey}" name="skey"> <input
									type="hidden" value="${cm.no}" name="no"> <input
									type="hidden" value="${cm.email}" name="email">
								<c:if test="${cm.email==skey}">
									<input class='button' type="submit" value="삭제">
									<br>
								</c:if>
							</form> <br>
			</c:forEach>
		</table>
		<!--  댓글 내용쓰기 grade이 1일때만 가능-->
		<c:if test="${grade==1}">
		<div class='p'>댓글 내용</div>
		<form name="cmreply" action="cmok" method="post">
			<input type="hidden" value="${skey}" name="email">
			 <input	type="hidden" value="${view.no}" name="no">
			<textarea name="cmcontent" rows="2" cols="80" maxlength="50"></textarea>
			
			<input class='button' type="submit" value="확인" onclick="return CM()">
		</form>
	</div>
	</c:if>

	<!--  섹스 -->
	<%-- <table align="center" width="500">
		<tr>
			<td colspan="1">제목 : ${view.title}
				<p>작성자 : ${view.email} 날짜 : ${view.bbsdate} 조회수 : ${view.hits}
				<hr>
				<p>
					내용<br>${view.bbscontent} <br>
				<hr>
			</td>
		</tr>

		<c:forEach var="cm" items="${comment}">
			<div class='container'>
				<tr>
					<td align="center"><div>${cm.email}
							${cm.cmdate}
							<p>${cm.cmcontent}</td>
					<td>
						<form action="cmdelete">
							<input type="hidden" value="${cm.cmno}" name="cmno"> <input
								type="hidden" value="${skey}" name="skey"> <input
								type="hidden" value="${cm.no}" name="no"> <input
								type="hidden" value="${cm.email}" name="email">
							<c:if test="${cm.email==skey}">
								<input type="submit" value="삭제">
								<br>
							</c:if>
						</form> <br>
			</div>

			</td>
			</tr>
			</div>
		</c:forEach>

		<tr>
			<!--session값 확인해서 수정,삭제 활성화  -->
			<!-- 수정 클릭시 게시글 번호를 넘겨 BbsUpdate.jsp로 이동 -->
			<td align="right">
				<!--작성자아이디와 로그인 정보가 일치 했을때  --> <c:if test="${view.email==skey}">

					<input type="button" id="up" value="수정"
						onclick="location.href='update?no=${view.no}'">
					<form action="delete">
						<input type="submit" id="de" value="삭제"
							onclick="location.href='delete'"> <input type="hidden"
							value="${view.no}" name="no"> <input type="hidden"
							value="${view.bbsno}" name="bbsno">

					</form>
				</c:if> <input type="button" value="목록"
				onclick="location.href='list?no=${view.bbsno}'">
			</td>
		</tr>

		<tr>
		</tr>


		<tr>
			<td>댓글 입력
				<p>
				<form name="cmreply" action="cmok" method="post">
					<input type="hidden" value="${skey}" name="email"> <input
						type="hidden" value="${view.no}" name="no">
					<textarea name="cmcontent" rows="2" cols="80"></textarea>
					<input type="submit" value="확인" onclick="return CM()">

				</form>
				</p>

			</td>
		</tr>
	</table> --%>

</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>