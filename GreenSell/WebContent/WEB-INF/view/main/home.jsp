<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/home.css">

<script>
	
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='body'>

		<c:forEach var="list" items="${itemlist}">
			<div class='container'>
				<div class='img'>
					<img src='img.png' class='img'>
				</div>
				<div class='item'>${list.itemname}</div>
				<div class='price'>${list.itemprice}</div>
			</div>
		</c:forEach>

	</div>


</body>
</html>