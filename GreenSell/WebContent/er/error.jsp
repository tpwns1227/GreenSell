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
<h1>�ý��� ������ �߻��߽��ϴ�.</h1>

<p><span class="drop">��</span>�����Ⱑ �� Spring Framework Workbook�� ���� ������
���� ���� ȯ���մϴ�. ��û�� ������ ���ο��� ������ �߻��߽��ϴ�. ���� �ð����� �ý��� �����ڰ� ������ ã�� �ذ��� ���Դϴ�. 
Spring Framework Workbook�� ���� ������ �ٸ� ����� �̿��Ͻðų�, ��� �Ŀ� �ٽ� �湮�� �ֽñ� �ٶ��ϴ�.</p>

<ul id="menu">
	<li><a href="<%= request.getContextPath() %>/user">Home</a></li>
	<li><a href="http://www.javajigi.net" target="_blank">�ڹ����� Ŀ�´�Ƽ</a></li>
	<li><a href="http://wiki.javajigi.net" target="_blank">�ڹ����� ��Ű</a></li>
</ul>
</div>
</body>
</html>
