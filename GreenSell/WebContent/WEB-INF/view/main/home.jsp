<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script>
	
</script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class='body2'>

		<c:forEach var="list" items="${itemlist}" varStatus="var">
			<div class='container'>
			
				<div class='img'>
					<a href="sell_detail?no=${list.no}">
					<img src='/GreenSell/img/item/${fristimg[var.index]}' class='img'></a>
				</div>
				
				<table style="width: 250px"><tr><td><div>${list.howsell}</div></td>
				<td align="right"><div class='item'>${list.itemname}</div></td></tr></table>
				
				<div class='price'>${list.itemprice}</div>
			</div>
		</c:forEach>

	</div>
	<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>