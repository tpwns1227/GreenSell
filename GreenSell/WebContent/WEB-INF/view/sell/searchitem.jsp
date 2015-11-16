<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${itemlist.size()>0}">  
<c:forEach var="list" items="${itemlist}" varStatus="status">
<div class='container'>
	<div class="imgbox">
	
	<div class='img'>
		<c:out value=""></c:out>
		<a href="sell_detail?no=${list.no}"><img
										src="/GreenSell/img/item/${fristimg[status.index]}"
										class='img'></a>
	</div>
	
	<table width='250px'>
		<tr>
			<td width='100' align='left'><span>
			<c:if test="${list.sellstate=='판매중'}">
				<font color="blue">${list.sellstate}</font>
			</c:if>
			<c:if test="${list.sellstate=='판매 완료'}">
				<font color="red">${list.sellstate}</font>
			</c:if>
			</span></td>
			<td width='150' align='right'><span class='item'
				style="right: 0px">
				<c:if test="${list.itemname.length()>13}">
					${list.itemname.substring(0,8)}...
				</c:if>
				<c:if test="${list.itemname.length()<=13}">
					${list.itemname}
				</c:if>
				
				
				</span></td>
		</tr>
	</table>	
	<div class='price'>
		<c:if test="${list.howsell=='중고'}">
		<fmt:formatNumber value="${list.itemprice}" />원
		</c:if>
		<c:if test="${list.howsell=='경매'}">
			<c:if test="${list.nowprice==0}">
			<fmt:formatNumber value="${list.startprice}"/>원
			</c:if>
			<c:if test="${list.nowprice!=0}">
			<fmt:formatNumber value="${list.nowprice}"/>원
			</c:if>
		</c:if>
	</div>
	</div>
</div>

</c:forEach>
</c:if>