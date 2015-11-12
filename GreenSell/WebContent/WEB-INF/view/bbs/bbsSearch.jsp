<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<center>
	<table style="width: 900px">
		<tr height="30px">
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="list" items="${bbslist}">
		<tr height="30px">
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
	if((totalcount%10)==0){
		totalpage-=1;
	}
	if(totalpage==0){
		totalpage=1;
	}
	String str = "";
	str = "<table width=\"550\" border\"1\" align=\"center\">";
	str = str+"<tr><td align=\"center\" bgcolor=\"#12CC66\">";
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
	%>

	<div>
	
			<div class="container">
				<input type="text" id="searchbox"  class="textbox" style="width: 150px; height: 33px"> 
				<input type="button" id="search" style="width: 100px; height: 40px" value="검색">
				<c:if test="${amdin>0 || no==3}">
				<input type="button" id="write" style="width: 100px; height: 40px" value="글쓰기">
				</c:if>
			</div>
	</div>

</center>