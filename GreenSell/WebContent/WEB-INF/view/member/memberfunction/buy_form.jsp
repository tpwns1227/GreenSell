<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>

	<div class='body2'>
		<div class='border'>구매 목록</div>
	</div>
	<div class='body2' style="margin-bottom: 50px">
		<c:forEach var="list" items="${itemlist}" varStatus="sar">
			<div class='container'>

				<div class='img'>
					<a href="sell_detail?no=${list.no}"><img
						src='/GreenSell/img/item/${fristimg[sar.index]}' class='img'></a>
					<table width='250px'>
						<tr>
							<td width='100' align='left'><span>
							<c:if test="${tolist[sar.index]=='인수중'}">
							<a href="takeoverok?no=${list.no}&email=${skey}">인수</a>
							</c:if>
							<c:if test="${tolist[sar.index]=='완료'}">
							<a>완료</a>
							</c:if>
							
							</span></td>
							<td width='150' align='right'><span class='item'
								style="right: 0px">${list.itemname}</span></td>
						</tr>
					</table>
			<div class='price'>${list.itemprice}</div>
				</div>
			</div>
		</c:forEach>


	</div>

	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>