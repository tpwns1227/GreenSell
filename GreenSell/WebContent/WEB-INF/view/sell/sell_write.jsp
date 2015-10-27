<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script>
	var t=0;
	$(document).ready(function(){
		
		$("input[value='다음']").click(function(){
			t -= 600;
			$("#slidebox").animate({top: t},500,function(){
				$("input[value='다음']").blur();
			});	
		});
		
		$("#type").click(function(){
			if(document.sellForm.howsell.value=='경매'){
				$("#auction").html('경매 시작가');
			}else{
				$("#auction").html('판매가격');
			}
		});
		
		$("input[value='이전']").click(function(){
			t += 600;
			$("#slidebox").animate({top: t},500,function(){
				$("input[value='다음']").blur();
			});	
		});
		
	});

</script>
<style type="text/css">

.next {
	margin-top: 250px;
	height: 350px;
}

</style>
</head>
<body>
	
	
	<jsp:include page="../main/header.jsp"></jsp:include>
	
	<form name="sellForm">
	<div class='container'>
	
	<div id="slide"	style="width: 500px; height: 600px; overflow: hidden; position: relative">
	<div id="slidebox" style="top: 0px; position: absolute">
		
		<div class="next">
		<div class='p'>제품명</div>
		<input id='textbox' type='text' placeholder="제품명"><br>
		<input class="button" type="button" style="width: 150px" value="다음">
		</div>
		
		<div class="next">
		<div class='p'>카테고리</div>
		<input type="radio" name="category" value="의류/잡화">의류/잡화
		<input type="radio" name="category" value="가구/전자">가구/전자
		<input type="radio" name="category" value="여행/스포츠">여행/스포츠 
		<input type="radio" name="category" value="도서/티켓">도서/티켓 
		<input type="radio" name="category" value="기타">기타 <br>
		<input class="button" type="button" style="width: 150px" value="다음">&nbsp;&nbsp;&nbsp;&nbsp; 
		<input	type="button"  class="button" style="width: 150px" value="이전">
		</div>
		
			
		<div class="next">
		<div class='p'>제품상태</div>
		<input type="radio" name="state" id="state" value="미개봉">미개봉
		<input type="radio" name="state" id="state" value="A급">A급
		<input type="radio" name="state" id="state" value="B급">B급
		<input type="radio" name="state" id="state" value="C급">C급<br> 
		<input class="button" type="button" style="width: 150px" value="다음">&nbsp;&nbsp;&nbsp;&nbsp; 
		<input type="button"  class="button" style="width: 150px" value="이전">
		</div>
		
		
		<div class="next">
		<div class='p'>사진추가</div>
		<input id='textbox' type='text' placeholder="사진추가"><br>
		<input class="button" type="button" style="width: 150px" value="다음">&nbsp;&nbsp;&nbsp;&nbsp; 
		<input	type="button"  class="button" style="width: 150px" value="이전">
		</div>
		
		<div class="next">
		<div class='p'>판매방법</div>
		<input type="radio" value="경매" name="howsell">경매
		<input type="radio" value="판매" name="howsell">판매 <br> 
		<input class="button" type="button" id="type" style="width: 150px" value="다음">&nbsp;&nbsp;&nbsp;&nbsp; 
		<input	type="button"  class="button" style="width: 150px" value="이전">
		</div>
		
		<!-- 경매일 경우 경매 시작가로 이름바뀜 -->
		
		<div class="next">
		<div class='p' id="auction">가격</div>
		<input id='textbox' type='text' placeholder="가격"><br>
		<input class="button" type="button" style="width: 150px" value="다음">&nbsp;&nbsp;&nbsp;&nbsp; 
		<input	type="button"  class="button" style="width: 150px" value="이전">
		</div>
		
		
		<div style="margin-top: 150px; height: 450px;">
		<div class='p'>상세설명</div>
		<textarea id='textbox' rows="15" cols="30" placeholder="상세설명" style="width: 400px; height: 200px"></textarea>
		
		
		<div style="margin: 20px 0px 20px 0px">
		<hr width="400px">
		
		<input class='button' type='button' value='글올리기'>
		
		<div style="margin: 20px 0px 20px 0px">
			<hr width="170px" style="margin-left: 50px; float: left">
			or
			<hr width="170px" style="margin-right: 50px; float: right">
			<input class='button' type="reset" value='다시 쓰기'>
		</div>
		</div>
		</div>

	</div>
	</div>
	</div>
	
	</form>
	<jsp:include page="../main/bottom.jsp"></jsp:include>

</body>
</html>