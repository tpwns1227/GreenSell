<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/radio.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>

<script type="text/javascript">
var count = 8;
	/* function go() {
		count = 8;
		location.href = 'reitemlist?category=' + document.listform.radios.value
				+ '&howsell=${howsell}&count='+count;
	} */
	
	$(document).ready(function() {

		 var category = '${category}';
		 
		/* if (category == '의류/잡화') {
			$("input[value='의류/잡화']").attr("checked", "checked");
		} else if (category == '가구/전자') {
			$("input[value='가구/전자']").attr("checked", "checked");
		} else if (category == '여행/스포츠') {
			$("input[value='여행/스포츠']").attr("checked", "checked");
		} else if (category == '도서/티켓') {
			$("input[value='도서/티켓']").attr("checked", "checked");
		} else if (category == '기타') {
			$("input[value='기타']").attr("checked", "checked");
		} else {
			$("input[value='전체']").attr("checked", "checked");
		} */
		
		$("input[name='radios']").change(function(){
			category=$(this).val();
			count=8;
			$.ajax({
				type : "post",
				url : "searchitem",
				data : "str=" + $("#searchbar").val()+"&howsell=${howsell}&category="+category+ "&count="+count,
				success : function(data) {
					$("#searchdiv").html(data);
				}	
			});
		});
	
		$("#searchbar").keyup(function() {
				$.ajax({
					type : "post",
					url : "searchitem",
					data : "str=" + $("#searchbar").val()+"&howsell=${howsell}&category="+category+ "&count="+count,
					success : function(data) {
						$("#searchdiv").html(data);
					}	
				});
		});
		
		$("#plusimg").click(function(){
			count = count + 8;
			 $.ajax({
				type : "post",
				url : "searchitem",
				data : "str=" + $("#searchbar").val()+"&howsell=${howsell}&category="+category+ "&count="+count,
				success : function(data) {
					$("#searchdiv").html(data);
				}	
			}); 
		});
		
		

	});
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"></jsp:include>


	<div class='body2'>
		<form action="detail" method="post" name="listform">
			<div align="center">
				<input type="radio" id="radio1" name="radios" value="전체" checked> 
					<label for="radio1">전체</label>
					<input type="radio" id="radio2" name="radios" value="의류/잡화">
				<label for="radio2">의류/잡화</label> <input type="radio" id="radio3"
					name="radios" value="가구/전자"> <label
					for="radio3">가구/전자</label> <input type="radio" id="radio4"
					name="radios" value="여행/스포츠"> <label
					for="radio4">여행/스포츠</label> <input type="radio" id="radio5"
					name="radios" value="도서/티켓"> <label
					for="radio5">도서/티켓</label> <input type="radio" id="radio6"
					name="radios" value="기타"> <label
					for="radio6">기타</label> <br>

					<input class='textbox' type="text" id="searchbar"
					placeholder="제품명을 검색해 주세요.">
			</div>
			<p />
       
 		
<div id="searchdiv"> 	      

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
</div>
</form>
</div>

<div style="margin-left: 1000px"><input type="button" style="width: 95px; height: 30px" id="plusimg" value="더보기"></div>


<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>