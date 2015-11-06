<%@page contentType="text/html; charset=euc-kr"%>
<%
	response.setStatus(200);
%>
<html>
<head>
<title>Green Sell</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="<%= request.getContextPath() %>/css/global.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
<div id="welcome">
<h1>시스템 에러가 발생했습니다.</h1>

<p><span class="drop">자</span>바지기가 쓴 Spring Framework Workbook의 샘플 예제에
오신 것을 환영합니다. 요청한 페이지 내부에서 에러가 발생했습니다. 빠른 시간내에 시스템 관리자가 원인을 찾아 해결할 것입니다. 
Spring Framework Workbook의 샘플 예제의 다른 기능을 이용하시거나, 잠시 후에 다시 방문해 주시기 바랍니다.</p>

<ul id="menu">
	<li><a href="<%= request.getContextPath() %>/user">Home</a></li>
	<li><a href="http://www.javajigi.net" target="_blank">자바지기 커뮤니티</a></li>
	<li><a href="http://wiki.javajigi.net" target="_blank">자바지기 위키</a></li>
</ul>
</div>
</body>
</html>
