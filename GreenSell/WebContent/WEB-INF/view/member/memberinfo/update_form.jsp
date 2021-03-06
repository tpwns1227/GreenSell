<%@page import="com.greensell.member.beans.MemberVO"%>
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<script type="text/javascript">

function test() {
	   win_post = window.open('zip_form', "post",
	         "toolbar=no ,width=450 ,height=400 ,directories=no,"
	               + "status=yes,scrollbars=yes,menubar=no");
	}

	if ('${result}' == '비밀번호가 일치하지 않습니다.') {
		alert('${result}');
	}
	$(document)
			.ready(
					function() {

						if ('${member.bank}' == '농협')
							$("#nh").attr("selected", "selected");
						else if ('${member.bank}' == '국민')
							$("#kb").attr("selected", "selected");
						else
							$("#sinhan").attr("selected", "selected");

						if ('${member.question}' == '가장기억에 남는 선생님은?')
							$("#q1").attr("selected", "selected");
						else if ('${member.question}' == '나의 고향은?')
							$("#q2").attr("selected", "selected");
						else
							$("#q3").attr("selected", "selected");

						$("#updatebtn").click(
								function() {
									if ($("#phonechk").text() == '사용불가'
											|| $("#nickchk").text() == '사용불가') {
										alert('사용 불가 항목을 모두 확인해 주세요.');
										return;
									}
									$("#info").css('display', 'none');
									$("#pw").css('display', '');
								});

						$("#okbtn").click(function() {
							document.update.submit();
						});

						$("#cancle").click(function() {
							$("#info").css('display', '');
							$("#pw").css('display', 'none');
						});
						
						$("input[name='phone']").keyup(
								function() {
									
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
											data : "phone="
													+ $("input[name='phone']")
															.val(),
											success : function(data) {
												var str = '';
												if (data == '사용불가')
													str = "<font color=red>"
															+ data + "</font>";
												else
													str = "<font color=green>"
															+ data + "</font>";
												$("#phonechk").html(str);
											}
										});
									}
								});

						
						$("input[name='phone']").keyup(function() {
							
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
										
										$("select[name='bank']").change(function() {
											
											if ($("#sinhan").val() == '신한') {
												$("option[value='신한']").attr("selected",selected)
											} else if ($("#kb").val() == '국민') {
												$("option[value='국민']").attr("selected",selected)
											} else {
												$("option[value='농협']").attr("selected",selected)
											}
										});

										if (data == '사용불가')
											str = "<font color=red>" + data + "</font>";
										else
											str = "<font color=green>" + data + "</font>";
										$("#accountchk").html(str);
									}
								});
							}
						});

					});
</script>

<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>

	<form name="update" action="update_form" method="post">
		<div class='container'>
			<div id="info">
				<div class='border'>내 정보</div>
				<div class='p'>이메일</div>
				<input name="email" id='textbox' type='text' value='${member.email}'
					readonly>
				<div class='p'>이름</div>
				<input name="name" id='textbox' type='text' value='${member.name }'
					readonly>
				<div class='p'>별명</div>
				<div style='text-align: left; margin-left: 50px'>
					<input name='nickname' id='textbox' type='text' placeholder="별명"
						value="${member.nickname}" style='width: 400px' readonly="readonly"><span
						id="nickchk" style='margin-left: 15px'></span>
				</div>
				<div class='p'>연락처</div>
				<div style='text-align: left; margin-left: 50px'>
					<input id='textbox' name='phone' type='text'
						value="${member.phone}" placeholder="연락처 ( - 포함 )"
						style='width: 300px'><span id="phonechk"
						style="margin-left: 15px"></span>
				</div>
				<div class='p'>주소</div>
				<input class='textbox' name="zipcode" readonly id='zip' type='text'
					placeholder="우편번호" value="${member.zipcode}" style='width: 200px'>
				<input class='button' type='button' value='검색' style='width: 200px'
					onclick="test()"> <br> <input class='textbox'
					name="address" id='zip2' type='text' value="${member.address}"
					placeholder="상세주소" style="margin-top: 10px; width: 400px">
				<div class='p'>계좌번호</div>
				<div style='text-align: left; margin-left: 50px'>
				<select name='bank' class='rf' id="bank" style='width: 150px'>
					<option id="nh" value='농협'>농협은행</option>
					<option id="kb" value='국민'>국민은행</option>
					<option id="sinhan" value='신한'>신한은행</option>
				</select> <input name="account" id='textbox' value="${member.account}"
					type='text' placeholder="계좌번호" style='width: 150px;'>
					<span id="accountchk" style='margin-left: 15px'></span>
					</div>
				<div class='p'>비밀번호 Q&A</div>
				<select name='question' class='rf'>
					<option id="q1" value='가장기억에 남는 선생님은?'>가장기억에 남는 선생님은?</option>
					<option id="q2" value='나의 고향은?'>나의 고향은?</option>
					<option id="q3" value='나의 삶의 좌우명은?'>나의 삶의 좌우명은?</option>
				</select> <input name="answer" id='textbox' type='text'
					value="${member.answer}" placeholder="답변" style='width: 200px;'>

				<input id="updatebtn" class='button2' type="button" value='정보수정'
					style="margin-top: 15px;">
			</div>
			<div id="pw" style="display: none">
				<div class='p'>비밀번호 확인</div>
				<input name="password" id='textbox' type="password"><br /> <input
					id="okbtn" class='button2' type="button" value='확인'
					style="margin-top: 15px;"> <input type="button" id="cancle" class='button2'
					value="취소" style="margin-top: 15px;">
			</div>
		</div>
	</form>

	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>