<%@page import="com.greensell.member.beans.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%--
	String addr = (String) session.getAttribute("addr");
	String bank = (String) session.getAttribute("bank");
	String account = (String) session.getAttribute("account");
	String question = (String) session.getAttribute("question");
	String answer = (String) session.getAttribute("answer");
	--%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function(){
	var bank = '${member.bank}';
	if(bank == 'nh'){
		$("#nh").attr("selected","selected");	
	}
	
	
	
});
</script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<body>
	<jsp:include page="../../main/header.jsp"></jsp:include>
	<div class='container'>
	<form name="yes">
		<div class='border'>정보 수정</div>
		<div class='p'>비밀번호</div>
		<input name="password" id='pass' type='password' placeholder="비밀번호"
			style='width: 200px;'> <input name="password2" id='textbox'
			type='password' placeholder="비밀번호 확인" style='width: 200px;'>
		<div class='p'>주소</div>
		<input name="zipcode" id='zip' type='text' placeholder="우편번호"
			style='width: 200px' value="" readonly=""> <input
			class='button' type='button' value='검색' style='width: 200px'>
		<input name="address" id='add' type='text' placeholder="상세주소"
			style="margin-top: 10px; width: 400px"
			value='${member.address}' readonly="">

		<div class='p'>계좌번호</div>
		<%
			String bankArr[] = {"농협","국민","신한"};
		%>
		<select id='bank' name='bank' class='rf' >
		<%-- <%
			String bank = ((MemberVO)request.getAttribute("member")).getBank();
			for(int i=0;i<bankArr.length;i++){
				if(bank.equals(bankArr[i]))
					out.print("<option value='" + bankArr[i] + "' selected>은행" + "</option>");
				else
					out.print("<option value='" + bankArr[i] + "' >은행"  + "</option>");
			}
		%> --%>
		
		<option value="국민" id='gm'>국민</option>
		<option value="농협" id='nh'>농협</option>
		<option value="신한" id='sh'>신한</option>
		
		</select> <input name="account" id='count' type='text' placeholder="계좌번호"
			value='${member.account}' style='width: 200px;'>
		<div class='p'>비밀번호 Q&A</div>
		<%
		    String questionArr[]={"a1","a2","a3"};
		%>
		<select name='question' class='rf'>
		<% 
		    String question =  ((MemberVO)request.getAttribute("member")).getQuestion();
		for(int i=0; i<questionArr.length; i++){
		 if(question.equals(questionArr[i]))
		  	  out.print("<option value='"+questionArr[i]+"' selected>질문"+(i+1)+"</option>");
		 else	
			 out.print("<option value='"+questionArr[i]+"'>질문"+(i+1)+"</option>");
		}		 
	   %>	
			
			
		</select> <input name="answer" id='textbox' type='text' placeholder="답변"
			value='${member.answer }' style='width: 200px;'> <input class='button'
			type="button" value='수정완료' style="margin-top: 15px"
			onclick="inputCheck()">
			</form>
	</div>
	<jsp:include page="../../main/bottom.jsp"></jsp:include>
</body>
</html>