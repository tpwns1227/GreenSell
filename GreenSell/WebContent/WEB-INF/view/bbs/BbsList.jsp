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
<body><br><br><br>
	<form>
	<table width="550" align="center">
       <tr>
          <td width="8%" align="center" bgcolor="#47CFF2">&nbsp;번호</td>
          <td width="40%" align="center" bgcolor="#47CFF2">&nbsp;제목</td>
          <td width="20%" align="center" bgcolor="#47CFF2">&nbsp;이름</td>
          <td width="22%" align="center" bgcolor="#47CFF2">&nbsp;일자</td>
          <td width="10%" align="center" bgcolor="#47CFF2">&nbsp;조회수</td>
       </tr>
	<tr>
    <c:forEach var="list" items="${selectAll}">	
			<div class='container'>
				<td align="center"><div class='no'>${list.no}</div></td>
				<td align="center"><div class='title'><a href="view?no=${list.no}">${list.title}</a></div></td>
				<td align="center"><div class='email'>${list.email}</div></td>
				<td align="center"><div class='bbsdate'>${list.bbsdate}</div></td>
				<td align="center"><div class='hits'>${list.hits}</div></td>
			</div>
		</c:forEach>
		</tr>
		</table>
</form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>