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
<body>
<jsp:include page="../WEB-INF/view/main/header.jsp"></jsp:include>
<div id="welcome">
<h1>�ý��� ������ �߻��߽��ϴ�.</h1>

<p><span class="drop">��</span>���մϴ� ���� ���� �������� ������ �߻��߾��.</p>


</div>
<jsp:include page="../WEB-INF/view/main/bottom.jsp"></jsp:include>
</body>
</html>
