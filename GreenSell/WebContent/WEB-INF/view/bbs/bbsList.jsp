<%@page import="com.greensell.model.bbs.PageCount"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	
	$(document).ready(function(){
	    $("tr:even").css("background-color", "#12CC66");
	});
	
});

</script>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>

<center>
	<table style="width: 900px">
		<tr>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
		</tr>
		<c:forEach var="list" items="${bbslist}">
		<tr>
			<td align="center" width="500"><a href="view?no=${list.no}&email=${list.email}">${list.title}</a></td>
			<td align="center">${list.email}</td>
			<td align="center">${list.bbsdate}</td>
			<td align="center">${list.hits}</td>
		</tr>
		</c:forEach>
	</table>
	<%
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
		str = str+"[<a href=list?page=1><font size=2 color=red>ó��</font></a>]";
	}
	else{
		str = str+"[<font size=2 color=gray>ó��</font>]";
	}
	
	if(nowpage>10){
		str = str+"[<a href=list?page="+(nowpage-10)+"><font size=2 color=blue>����10</font></a>]";
	}
	else{
		str = str+"[<font size=2 color=gray>����10</font>]";
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
		str = str+"[<a href=list?page="+(nextpage+1)+"><font size=2 color=blue>����10</font></a>]";
	}
	else
	{
		str = str+"[<font size=2 color=gray>����10</font>]";
	}
	
	if(nowpage!=totalpage)
	{
		str = str+"[<a href=list?page="+totalpage+"><font size=2 color=red>������</font></a>]";
	}
	else
	{
		str = str+"[<font size=2 color=gray>������</font>]";
	}
	str = str +"</td></tr></table>";

	out.print(str);	
	%>

	<div>
	
			<div class="container">
				<input type="text" class="textbox" style="width: 150px"> 
				<input type="button" style="width: 100px; height: 40px" value="�˻�">
				
				<input type="button" style="width: 100px; height: 40px" value="�۾���" onclick="location.href='write?no=${no}'">
			</div>
	</div>
	
</center>
</body>


<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>