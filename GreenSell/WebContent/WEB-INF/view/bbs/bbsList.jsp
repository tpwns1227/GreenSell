<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
<title>Green Sell</title>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$(document).ready(function(){
	    $("tr:even").css("background-color", "#12CC66");
	});
	
});

</script>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

<center>
	<table style="width: 900px">
		<tr>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
		</tr>
		<c:forEach var="list" items="${bbslist}">
		<tr>
			<td align="center" width="500"><a href="view?no=${list.no}&email=${list.email}">${list.title}</a></td>
			<td align="center">${list.email}</td>
			<td align="center">${list.bbsdate}</td>
			<td align="center">${list.hits}</td>
		</tr>
		</c:forEach>
		<tr>
			<td>
				����¡
			</td>
		</tr>
	</table>
	
	<div>
	
			<div class="container">
				<input type="text" class="textbox" style="width: 150px"> 
				<input type="button" style="width: 100px; height: 40px" value="�˻�">
				
				<input type="button" style="width: 100px; height: 40px" value="�۾���">
			</div>
		
	</div>
	
</center>
</body>


<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>