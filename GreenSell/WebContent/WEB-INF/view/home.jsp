<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<!-- 주ㅇ우우우우우석 -->
<body>
	<table border="1">
		<tr>
			<td>${img_1}</td>
			<td>
				<table>
					<tr><th colspan="2">판매 정보</th></tr>
					<tr>
						<td>제품명</td>
						<td>${pname}</td>
					</tr>
					<tr>
						<td>판매방법</td>
						<td>${selltype }</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>${category }</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>${price }</td>
					</tr>
					<tr>
						<td>물품 등급</td>
						<td>${state }</td>
					</tr>	
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<fieldset>
			<legend>제품 설명</legend>
			<textarea rows="30" cols="80"></textarea>
			</fieldset>
			</td>
		</tr>
		<tr>
			<td><input type="button" value="완료">
		</tr>
	</table>
</body>
</html>