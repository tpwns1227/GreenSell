<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="/GreenSell/js/script.js"></script>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
  </style>
  
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

	<div class='body2'>
	
	<div class="container" style="width: 1015px; height: 500px; margin-bottom: 60px">
  <br>
  <div id="myCarousel" style="width: 1015px; height: 500px" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" style="width: 1015px; height: 500px" role="listbox">
      <div class="item active">
        <img src="/GreenSell/img/useimg/초록이3.jpg" alt="Chania" width="460" height="345">
      </div>

      <div class="item">
        <img src="/GreenSell/img/useimg/introduce.png" alt="Chania" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="/GreenSell/img/useimg/logo.png" alt="Flower" width="460" height="345">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
	
			

		<c:forEach var="list" items="${itemlist}" varStatus="var">
			<div class='container' style="margin:auto; width: 250px; height: 250px; display: inline-block;">

				<div class='img'>
					<a href="sell_detail?no=${list.no}"> <img
						src='/GreenSell/img/item/${fristimg[var.index]}' class='img'></a>
				</div>

				<table style="width: 250px; border-spacing: 0px">
					<tr>
						<td><div>${list.howsell}</div></td>
						<td align="right"><c:if test="${list.itemname.length()>13}">
					${list.itemname.substring(0,8)}...
				</c:if> <c:if test="${list.itemname.length()<=13}">
					${list.itemname}
				</c:if></td>
					</tr>
					<tr style="border-spacing: 0px">
						<td colspan="2" align="right"><c:if
								test="${list.sellstate=='판매중'}">
								<font color="blue">${list.sellstate}</font>
							</c:if> <c:if test="${list.sellstate=='판매 완료'}">
								<font color="red">${list.sellstate}</font>
							</c:if></td>
					</tr>
				</table>
			</div>
		</c:forEach>
</div>

	<jsp:include page="bottom.jsp"></jsp:include>

</body>
</html>