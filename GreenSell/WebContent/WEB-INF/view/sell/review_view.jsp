<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset='UTF-8'>

<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<script type="text/javascript">
	function review(){
		location.href="review_write?email=${email}";
	}
</script>
<style type="text/css">
table {
	margin-left: 50px;
}

td {
	text-align: center;
}

.bt {
	border-bottom: 1px;
}

.tdbold {
	font-size: 15px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class='container' style="width: 500px; height: auto">
		<div class='border'>${email}의 후기</div>
		<hr width='400px'>
		<table>
			<tr>
				<td width="50px">
					<div class='tabold'>작성자</div>
				</td>
				<td width="250px">
					<div class='tdbold'>내용</div>
				</td>
				<td width="100px">
					<div class='tdbold'>날짜</div>
				</td>
				<td width="50px">
					<div class='tdbold'>평점</div>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>날짜</td>
				<td>평점</td>
			</tr>
			
			
		</table>
		<p/><p/>
		<input type="button" value="후기쓰기" onclick="review()" style="width: 95px; height: 30px">
		</div>
</body>
</html>