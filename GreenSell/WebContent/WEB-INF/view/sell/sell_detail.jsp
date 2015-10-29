<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/detail.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script>
	$(document).ready(function(){
		$(".simg").click(function(){
			var s = $(this).attr('src');
			$(".mimg").attr('src', s);
		});
	});
	
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='test'>
	<div class="container3">
		<div class='img' style='text-align: left;'>
			<img src='/GreenSell/img/item/${imglist.get(0)}' class='mimg'>
			
			<c:forEach var="img" items="${imglist}">
				<img src="/GreenSell/img/item/${img}" class='simg'>
			</c:forEach>	
		</div>		
		<c:if test="${itemone.getHowsell() == '중고'}">
		<div class='info'>
			<div class='bold2'>제품명</div>
			<div class='font'>${itemone.getItemname()}</div>
			<div class='bold2'>상태</div>
			<div class='font'>${itemone.getItemstate()}</div>
			<div class='bold2'>가격</div>
			<div class='font'>${itemone.getItemprice()}</div>		
			<div class='bold2'>판매방법</div>
			<div class='font'>${itemone.getHowsell()}</div>
			<div class='bold2'>카테고리</div>
			<div class='font'>${itemone.getCategory()}</div>
			<div class='bold2'>판매자</div>
			<div class='font'>${itemone.getEmail()}</div>
			<div class='bold2'>설명</div>
			<textarea class='tb' readonly>${itemone.getItemdetail()}</textarea>
			<input class='callbtn' type="button" value="연락처">
			<input class='callbtn' type="button" value="안전거래">
		</div>
		</c:if>
		<c:if test="${auctionitem.getHowsell()=='경매'}">
		<div class='info2'>
			<div class='bold2'>제품명</div>
			<div class='font'>${auctionitem.getItemname()}</div>
			<div class='bold2'>상태</div>
			<div class='font'>${auctionitem.getItemstate()}</div>
			<div class='bold2'>경매시작가</div>
			<div class='font'>${auctionitem.getStartprice()}</div>		
			<div class='bold2'>현재가격</div>
			<div class='font'>${auctionitem.getNowprice()}</div>
			<div class='bold2'>마감시간</div>
			<div class='font'>${auctionitem.getFinishtime()}</div>
			<div class='bold2'>입찰횟수</div>
			<div class='font'>${auctionitem.getTendernumber()}</div>
			<div class='bold2'>판매방법</div>
			<div class='font'>${auctionitem.getHowsell()}</div>
			<div class='bold2'>카테고리</div>
			<div class='font'>${auctionitem.getCategory()}</div>
			<div class='bold2'>판매자</div>
			<div class='font'>${auctionitem.getEmail()}</div>
			<div class='bold2'>설명</div>
			<textarea class='tb' readonly>${auctionitem.getItemdetail()}</textarea>
			<input class='callbtn' type="button" value="입찰하기">
		</div>
		</c:if>
	</div>
	</div>
	
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>
