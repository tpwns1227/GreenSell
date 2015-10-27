<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<meta charset='UTF-8'>
<head>
<script type="text/javascript" src='script.js'></script>
<script type="text/javascript">

function idCheck(id)
{
if(email=="")
	{
	alert("이메일를 입력하세요");
	document.register_form.email.focus(); 
	}
else
	{
	window.open(url, "post", "width=300, height=150");
	}
}

function inputCheck() 
{
	if(document.register_form.email.value=="" || document.register_form.email.value=null)
		{
		alert("이메일을 확인해주세요");
		document.register_form.email.focus();
		return;
		}
	if(document.register_form.pass1.value=="" || document.register_form.pass1.value==null)
		{
		alert("패스워드를 입력해주세요");
		document.register_form.pass1.focus();
		return;
		}
	if(document.register_form.pass2.value=="" || document.register_form.pass2.value==null)
		{
	alert("비밀번호를 다시한번 입력해주세요");
	document.regForm.mem_repasswd.focus();
	return;
		}
	
	if(document.register_form.pass1.value!=document.register_form.pass2.value)
		{
	alert("비밀번호가 일치 하지않습니다.");
	document.regForm.mem_repasswd.focus();
	return;
		}
	
	if(document.register_form.name.value=="")
	{
	alert("이름을 입력해주세요");
	document.regForm.mem_name.focus();
	return;
	}
	
	if(document.regForm.mem_num1.value=="")
	{
	alert("주민번호앞을 입력해주세요");
	document.regForm.mem_num1.focus();
	return;
	}
	
	if(document.regForm.mem_num2.value=="")
	{
	alert("주민번호 뒤자리를 입력해주세요");
	document.regForm.mem_num2.focus();
	return;
	}
	
	if(document.regForm.mem_email.value=="")
	{
	alert("이메일이 일치하지 않습니다");
	document.regForm.mem_email.focus();
	return;
	}
	
	var str = document.regForm.mem_email.value;
	
	var atPos = str.indexOf('@');
	
	var atLastPos = str.lastIndexOf('@');
	
	var dotPos = str.indexOf('.');
	
	var spacePos = str.indexOf(' ');
	
	var commaPos = str.indexOf(',');
	
	var eMailSize = str.length;

	if(atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 
		&& commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize);

	else
	{
	alert("이메일을 입력해주세요");
	document.regForm.mem_email.focus();
	return;
	}

	if(document.regForm.mem_phone.value=="")
	{
	alert("핸드폰번호를 입력해주세요");
	document.regForm.mem_phone.focus();
	return;
	}
	
	if(document.regForm.mem_job.value=="0")
	{
	alert("직업을 골라주세여");
	document.regForm.mem_job.focus();
	return;
	}

</script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
</head>
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<form name='register_form' action="result">
		<div class='container'>
			<div class='border'>회원가입</div>
			<div class='p'>이메일</div>
			<input name='email' id='textbox' type='text' placeholder="이메일"
				style='width: 300px'> <input class='button2' type='button'
				value='중복'>
			<div class='p'>이름</div>
			<input name='name' id='textbox' type='text' placeholder="이름"
				style='width: 300px'>
			<div class='p'>별명</div>
			<input name='nickname' id='textbox' type='text' placeholder="별명"
				style='width: 300px'> <input class='button2' type='button'
				value='중복'>
			<div class='p'>비밀번호</div>
			<input name="pass1" id='textbox' type='password' placeholder="비밀번호">
			<input name="pass2" id='textbox' type='password' placeholder="비밀번호 확인">
			<div class='p'>연락처</div>
			<input name="phone" id='textbox' type='text' placeholder="연락처 ( - 제외 )"
				style='width: 300px'> <input class='button2' type='button'
				value='인증'>
			<div class='p'>주소</div>
			<input name="address" id='textbox' type='text' placeholder="우편번호"
				style='width: 300px'> 
			<input class='adsearch' type='button' value='검색'>
			<br>
			<input id='textbox' type='text' placeholder="상세주소" style="margin-top: 10px; width: 400px">

			<div class='p'>계좌번호</div>
			<select name='bank'>
				<option value='nh'>농협은행</option>
				<option value='kb'>국민은행</option>
				<option value='sh'>신한은행</option>
			</select> 
			<input name="banknum" id='textbox' type='text' placeholder="계좌번호">
			<div class='p'>비밀번호 Q&A</div>
			<select name='question'>
				<option value='a1'>질문1</option>
				<option value='a2'>질문2</option>
				<option value='a3'>질문3</option>
			</select> 
			<input name="answer" id='textbox' type='text' placeholder="답변"> 
			<input class='button' type="submit" value='회원가입' style="margin-top: 30px">
		</div>
	</form>
</body>
</html>