<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset='UTF-8'>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript" src='/GreenSell/js/register.js'></script>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>

<script>
	function test() {
		win_post = window.open('zip_form', "post",
				"toolbar=no ,width=450 ,height=400 ,directories=no,"
						+ "status=yes,scrollbars=yes,menubar=no");
	}
	var idchk = false;
	var nicknamechk = false;

	$(document).ready(function() {

		$("input[name='email']").keyup(function() {
			if ($("input[name='email']").val() == '') {
				$("#idchk").html('');
			} else {
				$.ajax({
					type : "post",
					url : "idchk",
					data : "email=" + $("input[name='email']").val(),
					success : function(data) {
						var str = '';
						if (data == '사용불가')
							str = "<font color=red>" + data + "</font>";
						else
							str = "<font color=green>" + data + "</font>";
						$("#idchk").html(str);
					}
				});
			}
		});

		$("input[name='nickname']").keyup(function() {
			if ($("input[name='nickname']").val() == '') {
				$("#nickchk").html('');
			} else {
				$.ajax({
					type : "post",
					url : "nickchk",
					data : "nickname=" + $("input[name='nickname']").val(),
					success : function(data) {
						var str = '';
						if (data == '사용불가')
							str = "<font color=red>" + data + "</font>";
						else
							str = "<font color=green>" + data + "</font>";
						$("#nickchk").html(str);
					}
				});
			}
		});

		$("input[name='phone']").keyup(function() {
			
			var phone=$("input[name='phone']").val();
			var length=phone.length;
			var split = phone.split("-");
			if(length==4 && phone.substr(3)!="-"){
				var phonestr = phone.substring(0,3)+"-"+phone.substr(3);
				$("input[name='phone']").val(phonestr);
			}
			if(length==8 && phone.substr(7)!="-"){
				var phonestr = phone.substring(0,3)+"-"+phone.substring(4,7)+"-"+phone.substr(7);
				$("input[name='phone']").val(phonestr);
			}
			if(length==13){
				var phonestr = split[0]+"-"+split[1]+split[2].substring(0,1)+"-"+split[2].substr(1);
				$("input[name='phone']").val(phonestr);
			}
			if(length==12 && split[1].length==4){
				var phonestr = split[0]+"-"+split[1].substring(0,3)+"-"+split[1].substring(3,4)+split[2];
				$("input[name='phone']").val(phonestr);
			}
			
			
			if ($("input[name='phone']").val() == '') {	
				$("#phonechk").html('');
			} else {
				$.ajax({
					type : "post",
					url : "phonechk",
					data : "phone=" + $("input[name='phone']").val(),
					success : function(data) {
						var str = '';
						if (data == '사용불가')
							str = "<font color=red>" + data + "</font>";
						else
							str = "<font color=green>" + data + "</font>";
						$("#phonechk").html(str);
					}
				});
			}
		});
		$("input[name='account']").keyup(function() {
			if ($("input[name='account']").val() == '') {
				$("#accountchk").html('');
			} else {
				$.ajax({
					type : "post",
					url : "accountchk",
					data : {
						      account:$("input[name='account']").val(),
						      bank:$('#bank').val()
					       },
					success : function(data) {
						var str = '';
						
						/* $("select[name='bank']").change(function() {
							
							if ($("#sinhan").val() == '신한') {
								$("option[value='신한']").attr("selected","selected");
							} else if ($("#kb").val() == '국민') {
								$("option[value='국민']").attr("selected","selected");
							} else {
								$("option[value='농협']").attr("selected","selected");
							}
						}); */

						if (data == '사용불가')
							str = "<font color=red>" + data + "</font>";
						else
							str = "<font color=green>" + data + "</font>";
						$("#accountchk").html(str);
					}
				});
			}
		});
				$("input[name='name']").keyup(function() {
			
				if ($("input[name='name']").val() == '') {
				
					$("#namechk").html('');
				} else {
					$.ajax({
						type : "post",
						url : "namechk",
						data : "name=" + $("input[name='name']").val(),
						success : function(data) {
						var str = '';
						if (data == '사용불가')
							str = "<font color=red>" + data + "</font>";
						else
							str = "<font color=green>" + data + "</font>";
						$("#namechk").html(str);
					}
				});
			}
		});
	});
</script>
</head>

<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<form name='register_form' action="result" method="post">
		<div class='container'>
			<div class='border'>회원가입</div>
			<div class='p'>이메일</div>
			<div style='text-align: left; margin-left: 50px'>
				<input name='email' id='textbox' type='text' placeholder="이메일"
					style='width: 300px'> <span id="idchk"
					style='margin-left: 15px'></span>
			</div>

			<div class='p'>이름</div>
			<div style='text-align: left; margin-left: 50px'>
			<input name='name' id='name' class='textbox' type='text' placeholder="이름"
				maxlength="6" style='width: 300px'> <span id="namechk" style="margin-left: 15px; "></span>
			</div>
			<div class='p'>별명</div>
			<div style='text-align: left; margin-left: 50px'>
				<input name='nickname' id='textbox' type='text' placeholder="별명"
					maxlength="10" style='width: 300px'><span id="nickchk"
					style='margin-left: 15px'></span>
			</div>
			<div class='p'>비밀번호</div>
			<input name="password" id='textbox' maxlength="20" type='password'
				placeholder="비밀번호" style='width: 200px;'> <input
				name="password2" id='textbox' maxlength="20" type='password'
				placeholder="비밀번호 확인" style='width: 200px;'>
			<div class='p'>연락처</div>
			<div style='text-align: left; margin-left: 50px'>
				<input id='textbox' name='phone' type='text'
					placeholder="연락처 ( - 포함 )" maxlength="13" style='width: 300px'><span
					id="phonechk" style="margin-left: 15px"></span>
			</div>
			<div class='p'>주소</div>
			<input class='textbox' name="zipcode" id='zip' type='text'
				placeholder="우편번호" readonly style='width: 200px'> <input
				class='button' type='button' value='검색' style='width: 200px'
				onclick="test()"> <br> <input class='textbox'
				name="address" id='zip2' type='text' placeholder="상세주소"
				style="margin-top: 10px; width: 400px">

			<div class='p'>계좌번호</div>
			<div style='text-align: left; margin-left: 50px'>
			<select name='bank' class='rf' id="bank" style='width: 150px'>
				<option  value='국민' id="kb">국민은행</option>
				<option  value='신한' id="sinhan">신한은행</option>
				<option value='농협' id="nh">농협은행</option>
			</select> <input name="account" id='account' class="textbox" maxlength="20" type='text'
				placeholder="계좌번호" style='width: 150px;'> <span
				id="accountchk" style="margin-left: 15px"></span>
				</div>
			<div class='p'>비밀번호 Q&A</div>
			<select name='question' class='rf'>
				<option value='가장기억에 남는 선생님은?'>가장기억에 남는 선생님은?</option>
				<option value='나의 고향은?'>나의 고향은?</option>
				<option value='나의 삶의 좌우명은?'>나의 삶의 좌우명은?</option>
			</select> <input name="answer" id='textbox' maxlength="16" type='text'
				placeholder="답변" style='width: 200px;'> <input
				class='button' id="register" type="button" value='회원가입'
				style="margin-top: 15px" onclick="inputCheck()" id="btn_pass">
		</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>