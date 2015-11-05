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
	   
	   $("input[name='phone']").keyup(function(){  
		   if($("input[name='phone']").val()=='')
	   		{$("#phonechk").html('');}
     		else{  
		   $.ajax({ 
		         type : "post", 
		         url : "phonechk", 
		         data : "phone="+$("input[name='phone']").val(),
		         success : function(data){
		        	 var str = '';
		        	 if(data == '중복된번호입니다')
		        		 str = "<font color=red>"+data+"</font>";
		        		 else 
		        		str = "<font color=green>"+data+"</font>"; 
		        	 $("#phonechk").html(str);
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
				style='width: 300px'> 
				 <span id="idchk" style='margin-left: 15px'></span>
				</div>
		   
			<div class='p'>이름</div>
			<input name='name' id='textbox' type='text' placeholder="이름" maxlength="6">
			<div class='p'>별명</div>
			<div style='text-align: left; margin-left: 50px'>
			<input name='nickname' id='textbox' type='text' placeholder="별명" maxlength="10"
				style='width: 300px'><span id="nickchk" style='margin-left: 15px'></span>
				</div>
			<div class='p'>비밀번호</div>
			<input name="password" id='textbox' maxlength="20" type='password' placeholder="비밀번호" style='width: 200px;'>
			<input name="password2" id='textbox' maxlength="20" type='password' placeholder="비밀번호 확인" style='width: 200px;'>
			<div class='p'>연락처</div>
			<div style='text-align: left; margin-left: 50px'>
			<input id='textbox' name='phone' type='text' placeholder="연락처 ( - 포함 )"
				style='width: 300px'><span id="phonechk" style="margin-left: 15px"></span>
				</div>
			<div class='p'>주소</div>
			<input class='textbox' name="zipcode" id='zip' type='text' placeholder="우편번호"
				style='width: 200px'> 
			<input class='button' type='button' value='검색' style='width: 200px' onclick="test()">
			<br>
			<input class='textbox' name="address" id='zip2' type='text' placeholder="상세주소" style="margin-top: 10px; width: 400px">

			<div class='p'>계좌번호</div>
			<select name='bank' class='rf'>
				<option value='농협'>농협은행</option>
				<option value='국민'>국민은행</option>
				<option value='신한'>신한은행</option>
			</select> 
			<input name="account" id='textbox' maxlength="20" type='text' placeholder="계좌번호" style='width: 200px;'>
			<div class='p'>비밀번호 Q&A</div>
			<select name='question' class='rf'>
				<option value='가장기억에 남는 선생님은?'>가장기억에 남는 선생님은?</option>
				<option value='나의 고향은?'>나의 고향은?</option>
				<option value='나의 삶의 좌우명은?'>나의 삶의 좌우명은?</option>
			</select> 
			<input name="answer" id='textbox' maxlength="16" type='text' placeholder="답변" style='width: 200px;'> 
			<input class='button' id="register" type="button" value='회원가입' style="margin-top: 15px" onclick="inputCheck()" id="btn_pass">
		</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>