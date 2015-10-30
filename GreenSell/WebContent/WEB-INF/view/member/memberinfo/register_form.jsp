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
	
	$(document).ready(function(){ 
	   $("input[name='email']").keyup(function(){  
	      if($("input[name='email']").val()=='')
		   		{$("#idchk").html('');}
	      else{
		   $.ajax({ 
	         type : "post", 
	         url : "idchk", 
	         data : "email="+$("input[name='email']").val(),
	         success : function(data){ 
	        	 var str = '';
	        	 if(data == '사용불가')
	        		 str = "<font color=red>"+data+"</font>";
	        		 else 
	        		str = "<font color=green>"+data+"</font>"; 
	        	 $("#idchk").html(str);
	         } 
	      }); 
	      }
	   }); 
	   
	   $("input[name='nickname']").keyup(function(){  
		   if($("input[name='nickname']").val()=='')
	   		{$("#nickchk").html('');}
     		else{  
		   $.ajax({ 
		         type : "post", 
		         url : "nickchk", 
		         data : "nickname="+$("input[name='nickname']").val(),
		         success : function(data){ 
		        	 var str = '';
		        	 if(data == '사용불가')
		        		 str = "<font color=red>"+data+"</font>";
		        		 else 
		        		str = "<font color=green>"+data+"</font>"; 
		        	 $("#nickchk").html(str);
		         } 
		      }); 
     		}
		   }); 
	   
	   
	   
	});  


	
</script>
</head>

<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<form name='register_form' action="home">
		<div class='container'>
			<div class='border'>회원가입</div>
			<div class='p'>이메일</div>
			<div style='text-align: left; margin-left: 50px'>
			<input name='email' id='textbox' type='text' placeholder="이메일"
				style='width: 300px'> 
				 <span id="idchk" style='margin-left: 15px'></span>
				</div>
		   
			<div class='p'>이름</div>
			<input name='name' id='textbox' type='text' placeholder="이름">
			<div class='p'>별명</div>
			<div style='text-align: left; margin-left: 50px'>
			<input name='nickname' id='textbox' type='text' placeholder="별명"
				style='width: 300px'><span id="nickchk" style='margin-left: 15px'></span>
				</div>
			<div class='p'>비밀번호</div>
			<input name="password" id='textbox' type='password' placeholder="비밀번호" style='width: 200px;'>
			<input name="password2" id='textbox' type='password' placeholder="비밀번호 확인" style='width: 200px;'>
			<div class='p'>연락처</div>
			<input name="phone" id='textbox' type='text' placeholder="연락처 ( - 제외 )"
				style='width: 300px'> <input class='button2' type='button'
				value='인증'>
			<div class='p'>주소</div>
			<input class='textbox' name="zipcode" id='zip' type='text' placeholder="우편번호"
				style='width: 200px'> 
			<input class='button' type='button' value='검색' style='width: 200px' onclick="test()">
			<br>
			<input class='textbox' name="address" id='zip2' type='text' placeholder="상세주소" style="margin-top: 10px; width: 400px">

			<div class='p'>계좌번호</div>
			<select name='bank' class='rf'>
				<option value='nh'>농협은행</option>
				<option value='kb'>국민은행</option>
				<option value='sh'>신한은행</option>
			</select> 
			<input name="account" id='textbox' type='text' placeholder="계좌번호" style='width: 200px;'>
			<div class='p'>비밀번호 Q&A</div>
			<select name='question' class='rf'>
				<option value='a1'>가장기억에 남는 선생님은?</option>
				<option value='a2'>나의 고향은?</option>
				<option value='a3'>나의 삶의 좌우명은?</option>
			</select> 
			<input name="answer" id='textbox' type='text' placeholder="답변" style='width: 200px;'> 
			<input class='button' type="button" value='회원가입' style="margin-top: 15px" onclick="inputCheck()">
		</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>