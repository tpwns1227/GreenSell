<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
<table width="550" align="center">
    	<tr>
    		<td align="center">
    		<font size="4">�Խ��� �̸�</font>
    		</td>
    	</tr>
    </table><br><hr>
    <table width="550" align="center">
    	<tr>
    		<td width="10%" align="center" bgcolor="#47CFF2">&nbsp;��ȣ</td>
    		<td width="45%" align="center" bgcolor="#47CFF2">&nbsp;����</td>
    		<td width="20%" align="center" bgcolor="#47CFF2">&nbsp;�̸�</td>
    		<td width="13%" align="center" bgcolor="#47CFF2">&nbsp;����</td>
    		<td width="12%" align="center" bgcolor="#47CFF2">&nbsp;��ȸ��</td>
    	</tr>
    	<tr>
    		<td align="center">&nbsp;�۹�ȣ</td>
    		<td align="center">&nbsp;����</a></td>
    		<td align="center">&nbsp;�ۼ���</td>
    		<td align="center">&nbsp;�۾���¥</td>
    		<td align="center">&nbsp;��ȸ��</td>
    	</tr>
    	<tr>
    		<td align="center">&nbsp;�۹�ȣ</td>
    		<td align="center">&nbsp;����</a></td>
    		<td align="center">&nbsp;�ۼ���</td>
    		<td align="center">&nbsp;�۾���¥</td>
    		<td align="center">&nbsp;��ȸ��</td>
    	</tr>

    </table>
     <br>
     <!-- //////////////////////////////// -->
     <form action="search.jsp" method="post" name="sform">
     	<table width="550" align="center">
     		<tr>
     			<td align="center">
     			<select name="find">
     				<option value=title selected>�� ��</option>
     				<option value=content>�� ��</option>
     			</select>
     			<input type="text" name="search" size="20">
     			<input type="button" value="��ã��">
     			<input type="button" value="�۾���">
     			</td>
     		</tr>
     	</table>
     </form>
</body>
<jsp:include page="../main/bottom.jsp"></jsp:include>
</html>