<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<title>Insert title here</title>
<style type="text/css">
table {
	margin-left: 50px;
}

td {
	text-align: center;
}

.bt {
	border-bottom: 1px;
}

.tdbold {
	font-size: 15px;
	font-weight: bold;
}
</style>

</head>
<body>

	<div class='container' style="width: 500px; height: auto">
		<div class='border'>포인트 내역</div>
		<hr width='400px'>
		<table width='400px'>
			<tr>
				<td width="50px">
					<div class='tdbold'>입출금</div>
				</td>
				<td width="100px">
					<div class='tdbold'>가격</div>
				</td>
				<td>
				<div class='tdbold'>수수료</div>
				</td>
				<td width="150px">
					<div class='tdbold'>날짜</div>
				</td>
			</tr>
			<c:if test="${point.size()>0}">  
<c:forEach var="point" items="${point}" varStatus="status">
		<c:out value=""></c:out>
	<tr>
	<td>
	<c:if test="${point.sort == 0 }">
	입금
	</c:if>
	<c:if test="${point.sort == 1 }">
	출금
	</c:if>
	</td>
	<td>
		${point.price}
	</td>
	<td>
		${point.commission }
	</td>
	<td>
		${point.pdate}
	</td>
	</tr>
	  
</c:forEach>
</c:if>
			
		</table>
</body>
</html>