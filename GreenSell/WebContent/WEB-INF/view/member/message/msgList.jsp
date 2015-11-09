<%@page import="com.greensell.model.bbs.PageCount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/bbs.css">
<title>Green Sell</title>
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	    $("tr:even").css("background-color", "#12CC66");
	    setInterval(function () {  
	    $("#search").click(function(){  
		   
			   $.ajax({ 
		         type : "get", 
		         url : "searchbbs", 
		         data : "no=${no}&title="+$("#searchbox").val(),
		         success : function(data){ 
		        	  
		        	 $("#searchresult").html(data);
		         } 
		      });
});
	    },1000);
	    
	    
});
</script>
<body>
<jsp:include page="../../main/header.jsp"></jsp:include>
<div id="searchresult">
<center>
	<table style="width: 900px">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			 <td align="center" width="500"><a href="msgview?no=${list.no}&email=${list.email}">${list.getTitle()}</a></td>
			<td align="center">${list.getEmail()}</td>
			<td align="center">${list.getMdate()}</td> 
		</tr>
		</c:forEach>
	</table>
	
	<%--페이지 처리하기 추후에 수정하기--%>
	<%-- <%
	int totalcount = (Integer)request.getAttribute("totalcount");
	int nowpage = (Integer)request.getAttribute("page");
	int totalpage = (totalcount/10)+1;
	String str = "";
	str = "<table width=\"550\" border\"1\" align=\"center\">";
	str = str+"<tr><td align=\"center\" bgcolor=\"#CCCCCC\">";
	int selectpageing = (nowpage/10);
	
	if(selectpageing==0){
		selectpageing = 1;
	}else{
		selectpageing = (selectpageing*10)+1;
	}
	if((nowpage%10)==0){
		selectpageing = selectpageing-10;
	}
	
	if(nowpage!=1){
		str = str+"[<a href=list?page=1><font size=2 color=red>처음</font></a>]";
	}
	else{
		str = str+"[<font size=2 color=gray>처음</font>]";
	}
	
	if(nowpage>10){
		str = str+"[<a href=list?page="+(nowpage-10)+"><font size=2 color=blue>이전10</font></a>]";
	}
	else{
		str = str+"[<font size=2 color=gray>이전10</font>]";
	}
	
	for(int i = selectpageing; i < selectpageing+10;i++)
	{
		if(i>totalpage)
		{
			break;
		}
		if(i!=nowpage)
		{
			str = str+"[<a href=list?page="+i+"><font size=2 color=black>"+i+"</font></a>]";
		}
		else
		{
			str = str+"[<font size=2 color=red>"+i+"</font>]";
		}
	}
	
	int nextpage;
	if((nowpage%10)==0){
		nextpage = (nowpage/10)*10;
	}else{
		nextpage = ((nowpage/10)+1)*10;
	}
	if((totalpage) > nextpage)
	{
		str = str+"[<a href=list?page="+(nextpage+1)+"><font size=2 color=blue>다음10</font></a>]";
	}
	else
	{
		str = str+"[<font size=2 color=gray>다음10</font>]";
	}
	
	if(nowpage!=totalpage)
	{
		str = str+"[<a href=list?page="+totalpage+"><font size=2 color=red>마지막</font></a>]";
	}
	else
	{
		str = str+"[<font size=2 color=gray>마지막</font>]";
	}
	str = str +"</td></tr></table>";

	out.print(str);	
	%> --%>

	<div>
	
			<div class="container">
				<input type="text" id="searchbox" class="textbox" style="width: 150px"> 
				<input type="button" id="search" style="width: 100px; height: 40px" value="검색">
				<input type="button" style="width: 100px; height: 40px" value="글쓰기" onclick="location.href='msgwrite?email=${skey}'">
			</div>
	</div>

</center></div>
</body>


<jsp:include page="../../main/bottom.jsp"></jsp:include>
</html>