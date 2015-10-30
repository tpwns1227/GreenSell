<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/input.css">
<script type="text/javascript" src="/GreenSell/js/input.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<div class='border'>게시물 수정</div>
		<div class='p'>제품명</div>
		<input class='textbox' name="itemname" type='text' placeholder="제품명">
		<div class='p'>카테고리</div>
		<select name='category' class='pf'>
			<option value='a1'>의류/잡화</option>
			<option value='a2'>가구/전자</option>
			<option value='a3'>여행/스포츠</option>
			<option value='a4'>도서/티켓</option>
			<option value='a5'>기타</option>
		</select>
		<div class='p'>제품상태</div>
		<select name='itemstate' class='pf'>
			<option value='a1'>미개봉 상품</option>
			<option value='a2'>A급 상품</option>
			<option value='a3'>B급 상품</option>
			<option value='a4'>C급 상품</option>
		</select>
		<div class='p'>사진</div>
		<div id='image1'>
			<input type="file" id="img1" onchange="ch()" name="imgname1" /> <label
				class='img1' for="img1">클릭</label>
		</div>
		<div class='p'>가격</div>
		<input class='textbox' name="itemprice" type='text' placeholder="가격">
		<div class='p'>상세설명</div>
		<textarea name="itemdetail" placeholder="상세설명"></textarea>
		<input type="submit" class="button" value="수정"
			style='width: 400px; margin-top: 25px;'>
	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>
</body>
</html>