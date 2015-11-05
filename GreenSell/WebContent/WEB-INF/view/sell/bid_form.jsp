<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/zip.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#okbtn").click(
						function() {
							
							if($("#wemail").val()=='${skey}'){
								alert("판매자는 입찰이 불가능 합니다");
								return;
							}
							
							if($("#nowemail").val()=='${skey}'){
								alert('이미 입찰하셨습니다.');
								return;
							}
							
							
							var price = parseInt($("#bidprice").val());
							var stpr = parseInt($("#startpr").val());
							var nowpr = parseInt($("#nowpr").val());
							var nowemail = '${skey}';
							var ino = '${itemno}';
							var checkValue = $("#bidprice").val();
							if (checkValue == '' || checkValue == null) {//공백 체크
								alert('가격을 입력해 주세요.');
								$("#bidprice").focus();
								return;
							} else {
								var chk = /^\d+$/;
								if (!chk.test($("#bidprice").val())) {//숫자체크
									alert('숫자만 입력해 주세요.');
									$("#bidprice").focus();
									return;
								} else {//가격 체크
									if (price > nowpr && price > stpr) {
										$.ajax({
											type : "get",
											url : "bid",
											data : "bidprice=" + price
													+ "&email=" + nowemail
													+ "&itemno=" + ino,
											success : function(data) {
												var json = eval("(" + data
														+ ")");
												opener.$("#nowprice").html(
														json.nowprice);
												opener.$("#num").html(
														json.tendernumber);
												opener.$("#nowemail").html(
														json.nowemail);

												window.close();
											}
										});
									} else {
										if (nowpr == 0) {
											alert('시작가보다 더 높은 금액을 입력해 주세요.');
											$("#bidprice").focus();
											return;
										}else{
											alert('현재가보다 더 높은 금액을 입력해 주세요.');
											$("#bidprice").focus();
											return;
										}
									}
								}
							}

						});
			});
</script>
</head>
<body>
	<div align="center">
		<div class='border' style="margin-left: 100px">입찰금</div>
		<input class='textbox' maxlength="9" id="bidprice" type="text" name="bidprice"
			size="15"> <br> <input class='button' id="okbtn"
			style='width: 95px' type="button" value="확인"> <input
			class='button' style='width: 95px' type="button" value="취소"
			onclick="window.close()">
			<input type="hidden" id="nowpr">
			<input type="hidden" id="startpr">
			<input type="hidden" id="nowemail">
			<input type="hidden" id="wemail">
			<script>
				$("#nowpr").val(opener.$("#nowprice").html());
				$("#startpr").val(opener.$("#startprice").html());
				$("#nowemail").val(opener.$("#nowemail").html());
				$("#wemail").val(opener.$("#wemail").html());
			</script>
			
	</div>
</body>
</html>