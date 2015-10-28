<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script>
var l=0;
$(document).ready(function(){
	$("img").click(function(){
		l -= 400;
		$("#slidebox").animate({left: l},500,function(){
			$("img").blur();
			var imgs = ${imglist.size()};
			if(l<(imgs*-399)){
				$("#slidebox").css('left',0);
				l=0;
			}
		});	
	});
	
/* 	$("img").click(function(){
		t += 600;
		$("#slidebox").animate({left: l},500,function(){
			$("img").blur();
		});	
	}); */
	
});
</script>
</head>
<body>

	<div id="slide"
		style="width: 400px; height: 400px; overflow:hidden; position: relative">
		<div id="slidebox" style="left: 0px; position: absolute">
			<table border="0" cellpadding="0" cellspacing="0"><tr>
			<c:forEach var="img" items="${imglist}">
				<td>
				<img src="/GreenSell/img/item/${img}"
					style="width: 400px; height: 400px">
				</td>
			</c:forEach>
			<td><img src="/GreenSell/img/item/${imglist.get(0)}" style="width: 400px; height: 400px"></td>
			</tr></table>
		</div>
	</div>
	<c:forEach var="img" items="${imglist}">
		<img src="/GreenSell/img/item/${img}" style="width: 96.5px; height: 96.5px">
	</c:forEach>
	
	

</body>
</html>