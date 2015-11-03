<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${itemlist.size()>0}">  
<c:forEach var="list" items="${itemlist}" varStatus="status">
<div class='container'>
	<div class="imgbox">
	
	<div class='img'>
		<c:out value=""></c:out>
		<a href="sell_detail?no=${list.no}">
		<img src="/GreenSell/img/item/${fristimg[status.index]}" class='img'></a>
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
</c:if>