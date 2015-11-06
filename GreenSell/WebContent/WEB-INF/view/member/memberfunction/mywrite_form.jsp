<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<title>Green Sell</title>
</head>
<body>

<div class='body2'>
		<c:if test="${skey==email}">
		<div class='border'>내가 올린 글</div>
		</c:if>
		<c:if test="${skey!=email}">
		<div class='border'>${email}이 올린 글</div>
		</c:if>
		
	</div>
	<div class='body2' style="margin-bottom: 50px">
		<c:forEach var="list" items="${itemlist}" varStatus="sar">
			<div class='container'>

				<div class='img'>
					<a href="sell_detail?no=${list.no}"><img
						src='/GreenSell/img/item/${fristimg[sar.index]}' width="150px" height="150px" class='img'></a>
					<table width='250px'>
						<tr>
							<td width='100px' align='left'></td>
							<td width='150px' align='right'><span class='item'
								style="right: 0px">${list.itemname}</span></td>
						</tr>
					</table>
			<div class='price'>${list.itemprice}</div>
				</div>
			</div>
		</c:forEach>
	</div>


</body>
</html>