<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
<table width="550" align="center">
    	<tr>
    		<td align="center">
    		<font size="4">게시판 이름</font>
    		</td>
    	</tr>
    </table><br><hr>
    <table width="550" align="center">
    	<tr>
    		<td width="10%" align="center" bgcolor="#47CFF2">&nbsp;번호</td>
    		<td width="45%" align="center" bgcolor="#47CFF2">&nbsp;제목</td>
    		<td width="20%" align="center" bgcolor="#47CFF2">&nbsp;이름</td>
    		<td width="13%" align="center" bgcolor="#47CFF2">&nbsp;일자</td>
    		<td width="12%" align="center" bgcolor="#47CFF2">&nbsp;조회수</td>
    	</tr>
    	<tr>
    		<td align="center">&nbsp;글번호</td>
    		<td align="center">&nbsp;제목</a></td>
    		<td align="center">&nbsp;작성자</td>
    		<td align="center">&nbsp;글쓴날짜</td>
    		<td align="center">&nbsp;조회수</td>
    	</tr>
    	<tr>
    		<td align="center">&nbsp;글번호</td>
    		<td align="center">&nbsp;제목</a></td>
    		<td align="center">&nbsp;작성자</td>
    		<td align="center">&nbsp;글쓴날짜</td>
    		<td align="center">&nbsp;조회수</td>
    	</tr>

    </table>
     <br>
     <!-- //////////////////////////////// -->
     <form action="search.jsp" method="post" name="sform">
     	<table width="550" align="center">
     		<tr>
     			<td align="center">
     			<select name="find">
     				<option value=title selected>제 목</option>
     				<option value=content>내 용</option>
     			</select>
     			<input type="text" name="search" size="20">
     			<input type="button" value="글찾기">
     			<input type="button" value="글쓰기">
     			</td>
     		</tr>
     	</table>
     </form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>