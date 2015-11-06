<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Green Sell</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/member.css">
	<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
</head>
<script type="text/javascript">
function go(){
	if(document.searchpw.email.value=="" || document.searchpw.email.value==null){
		alert('이메일을 입력하세요')
	}else if(document.searchpw.answer.value="" || document.searchpw.answer.value==null){
		alert('대답을 입력해주세요')	
	}
}

$(document).ready(function(){
	$("#emailbtn").click(function(){
		 $.ajax({ 
	         type : "post", 
	         url : "emailchk", 
	         data : "email="+$("input[name='email']").val(),
	         success : function(data){ 	
	        	if(data=='사용불가'){
	        		alert('이메일 형식을 입력해 주세요.');
	        		return;
	        	}else if(data==null || data==''){
	        		alert('존재하지 않는 이메일 입니다.')	
	        	}else{
	        	 $("input[name='question']").attr('value',data);
	        	 $("#pwq").css('display', '');
	        	}
	         } 
	      }); 	
	});
	
	$("#viewpwdbtn").click(function(){
		$.ajax({ 
	         type : "post", 
	         url : "qustion_answer", 
	         data : "email="+$("input[name='email']").val()+"&qanswer="+$("input[name='qanswer']").val(),
	         success : function(data){ 	
	        	 if(data=='ok'){
	        		 $("#emailchk").css('display', 'none');
	        		 $("#pwq").css('display', 'none');
	        		 $("#pwd").css('display','');	 
	        	 }else{
	        		 alert(data);
	        	 }
	         } 
	      }); 
	});
	
	$("#pwdupdate").click(function(){
		var pw1 = $("#password").val();
		var pw2 = $("#password2").val();
		
		if(pw1=='' || pw2==''){
			alert('비밀번호를 입력해 주세요.');
			return;
		}
		if(pw1.length<6 && pw2.length<6){
			alert("비밀번호는 최소 6자 이상 입력하셔야 합니다.");
			return;
		}
			
			
		if(pw1!=pw2){
			alert("비밀번호가 일치하지 않아요")
			return;
		}else{
			document.searchpw.submit();
		}
		
		
	});
	
	
	
	
});

</script>
<body>
<jsp:include page="../../main/header.jsp"></jsp:include>
<form name="searchpw" action="updatepw" method="post">
<div class='container'>
		
		<div id='emailchk'>
		<div class='border'>비밀번호 찾기</div>
		<div class='p'>이메일</div>
		<input name="email" id='textbox' type='text' placeholder="이메일">
		<input id="emailbtn" type="button" class="button" value="확인" style="margin-top: 15px">
		</div>
		
		<div id="pwq" style="display: none">
		<div class='p'>질문</div>
		<input name="question" class='textbox' type='text' readonly="readonly">
		<div class='p'>대답</div>
		<input name="qanswer" class='textbox' type='text' placeholder="대답"> <br>
		<input id="viewpwdbtn" class='button' type="button" value='비밀번호 찾기' onclick="go()" style="margin-top: 15px" >
		</div>
		
		<div id="pwd" style="display: none">
			<div class='p'>비밀번호 변경</div>
			<input type="password" maxlength="20" id="password" name="password" class="textbox" placeholder="변경 비밀번호" style="width: 200px">
			<input type="password" maxlength="20" id="password2" name="password2" class="textbox" placeholder="비밀번호 확인" style="width: 200px">
			<input id="pwdupdate" class='button' type="button" value='변경하기' style="margin-top: 15px" >
		</div>
		
	</div>
	</form>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>