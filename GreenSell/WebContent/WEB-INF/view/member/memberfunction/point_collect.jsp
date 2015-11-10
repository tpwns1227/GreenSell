<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%   
response.setHeader("Cache-Control","no-store");   
response.setHeader("Pragma","no-cache");   
response.setDateHeader("Expires",0);   
response.setHeader("Cache-Control", "no-cache");

if(session.getAttribute("skey")==null){
%>
<script>history.go(-1)</script>
<%
}
%> 
<meta charset='utf-8'>
<html>
<head>
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			
			if ($("#price").val() == '') {
				alert("가격을 입력해 주세요.");
				$("#price").focus();
				return;
			} else {
				var chk = /^\d+$/;
				if (!chk.test($("#price").val())) {
					alert('숫자만 입력해 주세요.');
					$("#price").focus();
					return;
				} else {
					if (document.collectForm.price.value.length < 4) {
						alert("천원 이상 입력해 주세요.");
						$("#price").focus();
						return;
					}
				}
			}
			if(document.collectForm.price.value.substring(0,1)>0){}
			else{
			alert("금액을 다시 확인해 주세요.");
			return;
			}
			var point = parseInt('${point}');
			if(document.collectForm.price.value > point){
				alert("회수 할 수 있는 금액 한도를 넘었습니다.");
				return;
			}

			document.collectForm.submit();
			
		});
	});
</script>
</head>
<body>
<jsp:include page="../../main/header.jsp"/>
	<form name='collectForm' action='pointcollect'>
		<div class='container'>
			<div class='border'>포인트 환전</div>
			<div class='p'>이메일</div>
			<input type='text' name="email" class='textbox' value='${skey}' readonly>
			<div class='p'>계좌</div>
			<input type="text" class='textbox' style="width: 100" readonly value="${mvo.bank}">
			<input type='text' name="email" class='textbox' style="width: 300" value='${mvo.account}' readonly>
			<div class='p'>회수금액</div>
			<input type='text' id="price" name='price' class='textbox'
				placeholder='금액'> <input type='button' id="btn"
				class='button' value='회수' style="margin-top: 25px">
		</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"/>
</body>
</html>