<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
response.setHeader("Cache-Control", "no-cache");

if(session.getAttribute("skey")==null){
%>
<script>history.go(-1)</script>
<%
}
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<title>Green Sell</title>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("tr:even").css("background-color", "#12CC66");
});
</script>
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
<body style="width: 500px">

	<div class='container' style="width: 500px; height: auto">
		<div class='border'>포인트 내역</div>
		<hr width='400px'>
		<table width='400px'>
			<tr>
				<th width="50px">
					<div class='tdbold'>입출금</div>
				</th>
				<th width="100px">
					<div class='tdbold'>가격</div>
				</th>
				<th>
				<div class='tdbold'>수수료</div>
				</th>
				<th width="150px">
					<div class='tdbold'>날짜</div>
				</th>
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
		</div>
</body>
</html>