<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.container {
		margin:auto;
		width: 250px;
		height: 250px;
		display: inline-block;
	}
	.img {
		width: 250px;
		height: 200px;
		border: 1px solid #EEE;
	}
	.item {
		text-align: right;
		margin-top: 5px;
		height: 15px;
		font-size: 13px;
	}
	.price {
		text-align: right;
		height: 30px;
	}
	 .body {

	max-width: 1200px;
	margin: 50px auto;
	text-align: center;
}
</style>
<script>

	
</script>
</head>
<body>

<jsp:include page="../main/header.jsp"></jsp:include>
<div class='body'>

<form action="detail" method="post" name="listform">
<c:forEach var="list" items="${itemlist}">
<div class='container'>
	<div class="imgbox">
	
	<div class='img'>
		<img src='img.png' class='img'>
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