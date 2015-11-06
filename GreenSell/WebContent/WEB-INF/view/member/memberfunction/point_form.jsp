<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					if (document.pointForm.price.value.length < 4) {
						alert("천원 이상 입력해 주세요.");
						$("#price").focus();
						return;
					}else if(document.pointForm.price.value.length > 6){
						alert("100만원 이상은 한번에 충전할 수없습니다.");
						return;
					}
				}
			}
			
			if(document.pointForm.price.value.substring(0,1)>0){}
			else{
			alert("금액을 다시 확인해 주세요.");
			return;
			}
			
			
			document.pointForm.submit();
			
		});
	});
</script>
</head>
<body>
<jsp:include page="../../main/header.jsp"/>
	<form name='pointForm' action='point'>
		<div class='container'>
			<div class='border'>포인트 충전</div>
			<div class='p'>이메일</div>
			<input type='text' name="email" class='textbox' value='${skey}'
				readonly>
			<div class='p'>충전금액</div>
			<input type='text' id="price" name='price' class='textbox'
				placeholder='금액'> <input type='button' id="btn"
				class='button' value='충전' style="margin-top: 25px">
		</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"/>
</body>
</html>