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
//main페이지로 값 전달: 부모로 값전달하기 위해서는 opener사용
/* function sendAdd(zipcode,sido, gugun, dong, bunji){
	opener.document.getElementById("zip").value=zipcode;
	var adr = sido + " " + gugun + " " + dong + " " + bunji;
 	opener.document.getElementById("zip2").value=adr;
    window.close();
} */
//널값체크
$(document).ready(
		function() {
			$("#okbtn").click(
					function() {

						var checkValue = $("#bidprice").val();
						if (checkValue == "") {
							alert("입찰금을 입력하세요.");
							$("#bidprice").focus();
							return false;
						} else {
							var price = $("#bidprice").val();
							var nowemail = '${skey}';
							var ino = '${itemno}';
							$.ajax({
								type : "get",
								url : "bid",
								data : "bidprice=" + price + "&email="
										+ nowemail + "&itemno=" + ino,
								success : function(data) {
									var json = eval("("+data+")");
									opener.$("#nowprice").html(json.nowprice);
									opener.$("#num").html(json.tendernumber);
									
									window.close();
								}
							});
						}

					});
		});
</script>
</head>
<body>
	<div align="center">
	<div class='border' style="margin-left: 100px">입찰금</div>
	<input class='textbox' id="bidprice" type="text" name="bidprice"
		size="15">
	<br>
	<input class='button' id="okbtn" style='width: 95px' type="button"
		value="확인">
	<input class='button' style='width: 95px' type="button" value="취소"
		onclick="window.close()">
</div>
</body>
</html>