<%@page import="com.greensell.sell.beans.ItemSellVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/main.csss">
<style>

</style>
<script>

	
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"></jsp:include>
<div class='body2'>

<form action="detail" method="post" name="listform">
<c:forEach var="list" items="${itemlist}" varStatus="status">
<div class='container'>
	<div class="imgbox">
	
	<div class='img'>
		<c:out value=""></c:out>
		<a href="sell_detail?no=${list.no}"><img src="/GreenSell/img/item/${fristimg[status.index]}" class='img'></a>
		
	</div>
	<div class='item'>
	  ${list.itemname}
	</div>
	<div class='price'>
		${list.itemprice}
	</div>
	</div>
</div>
</c:forEach>

</form>
</div>

</body>
</html>