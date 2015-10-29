<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.greensell.model.bbs.PageCount" %>
<%
    	int limit = 10;
   		int offset = 0;
   		int pagelink = 0;
   		String offset_get = request.getParameter("offset");
   		if(offset_get==null)
   		{
   			offset =0;
   		}
   		else
   		{
   			offset = Integer.parseInt(offset_get);
   		}
   		
   		String pagelink_get = request.getParameter("pagelink");
   		if(pagelink_get==null)
   		{
   			pagelink = 1;
   		}
   		else
   		{
   			pagelink = Integer.parseInt(pagelink_get);
   		}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}
</script>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body><br><br><br>
	<form name="bbslistform">
	<%
    	int rcnt = 11;
    %>
	<table width="550" align="center">
       <tr>
          <td width="8%" align="center" bgcolor="#47CFF2">&nbsp;번호</td>
          <td width="40%" align="center" bgcolor="#47CFF2">&nbsp;제목</td>
          <td width="20%" align="center" bgcolor="#47CFF2">&nbsp;이름</td>
          <td width="22%" align="center" bgcolor="#47CFF2">&nbsp;일자</td>
          <td width="10%" align="center" bgcolor="#47CFF2">&nbsp;조회수</td>
       </tr>
       <c:choose>
          <c:when test="find.title != null">
           <c:forEach var="list"  items="${selecttitle}">
           <tr>
			<div class='container'>
				<td align="center"><div class='no'>${list.no}</div></td>
				<td align="center"><div class='title'><a href="view?no=${list.no}">${list.title}</a></div></td>
				<td align="center"><div class='email'>${list.email}</div></td>
				<td align="center"><div class='bbsdate'>${list.bbsdate}</div></td>
				<td align="center"><div class='hits'>${list.hits}</div></td>
			</div>
	      </tr>
	      </c:forEach>
         </c:when>
         <c:when test="find.bbscontent != null">
            <c:forEach var="list"  items="${seleccontent}">
	    	<tr>
				<div class='container'>
					<td align="center"><div class='no'>${list.no}</div></td>
					<td align="center"><div class='title'><a href="view?no=${list.no}">${list.title}</a></div></td>
					<td align="center"><div class='email'>${list.email}</div></td>
					<td align="center"><div class='bbsdate'>${list.bbsdate}</div></td>
					<td align="center"><div class='hits'>${list.hits}</div></td>
				</div>
			</tr>
	        </c:forEach>
        </c:when>    
	    <c:otherwise>
	    <c:forEach var="list"  items="${selectAll}">
	    <tr>
				<div class='container'>
					<td align="center"><div class='no'>${list.no}</div></td>
					<td align="center"><div class='title'><a href="view?no=${list.no}">${list.title}</a></div></td>
					<td align="center"><div class='email'>${list.email}</div></td>
					<td align="center"><div class='bbsdate'>${list.bbsdate}</div></td>
					<td align="center"><div class='hits'>${list.hits}</div></td>
				</div>
		</tr>
		</c:forEach>
		</c:otherwise>
	   </c:choose>
	</table>
</form>
<form>
     <table width="550" align="center" border="1">
     	<tr>
     		<td align="center">
    		<select name="find">
     			<option value="title" selected>제 목</option>
     			<option value="bbscontent">내 용</option>
     		</select>
     		<input type="text" name="search" size="20">
     		<input type="submit" value="글찾기">
			<input type="button" value="글쓰기" onclick="goUrl('write');">
     		</td>
    	</tr>
     </table>
</form>

<%
    	//페이지 처리하기
    	PageCount pc = new PageCount(rcnt);
    	
%>
<%= pc.showPaging(pagelink,"list") %>

</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>