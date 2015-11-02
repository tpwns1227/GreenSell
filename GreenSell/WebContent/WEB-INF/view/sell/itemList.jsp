<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/radio.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>

<script type="text/javascript">

function go(){
	location.href='reitemlist?category='+document.listform.radios.value+'&howsell='+'${howsell}'
}
$(document).ready(function(){
	

var category = '${category}';

if (category == '의류/잡화') {
	$("input[value='의류/잡화']").attr("checked", "checked");
}
else if (category == '가구/전자') {
	$("input[value='가구/전자']").attr("checked", "checked");
}
else if (category == '여행/스포츠') {
	$("input[value='여행/스포츠']").attr("checked", "checked");
}
else if (category == '도서/티켓') {
	$("input[value='도서/티켓']").attr("checked", "checked");
}
else if (category == '기타') {
	$("input[value='기타']").attr("checked", "checked");
} else {
	$("input[value='전체']").attr("checked", "checked");
}
});
 
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"></jsp:include>


<div class='body2'>


<form action="detail" method="post" name="listform">
	<div align="center">
	<input type="radio" id="radio1" name="radios" value="전체" onclick="go()" checked>
       <label for="radio1">전체</label>
    <input type="radio" id="radio2" name="radios" value="의류/잡화" onclick="go()">
       <label for="radio2">의류/잡화</label>
    <input type="radio" id="radio3" name="radios" value="가구/전자" onclick="go()">
       <label for="radio3">가구/전자</label>
    <input type="radio" id="radio4" name="radios" value="여행/스포츠" onclick="go()">
       <label for="radio4">여행/스포츠</label>
    <input type="radio" id="radio5" name="radios"value="도서/티켓" onclick="go()">
       <label for="radio5">도서/티켓</label>
    <input type="radio" id="radio6" name="radios" value="기타" onclick="go()">
       <label for="radio6">기타</label>
       </div>
       <p/>
          
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