<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/input.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript" src="/GreenSell/js/input.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<body>

	<jsp:include page="../main/header.jsp"></jsp:include>

	<form name="sellForm" action="sellinput" method="post"
		enctype="multipart/form-data">
		<div class='container'>

			<div id="slide">
				<div id="slidebox" style="top: 0px; position: absolute">

					<div class="next">
						<div class='p'>제품명</div>
						<input name="itemname" id="itemname" class='textbox' type='text'
							placeholder="제품명" maxlength="30">
						<div class='nb'>
							<input class="button" type="button" value="다음">
						</div>
					</div>

					<div class="next">
						<div class='p'>카테고리</div>
						<select name='category'>
							<option value='의류/잡화'>의류/잡화</option>
							<option value='가구/전자'>가구/전자</option>
							<option value='여행/스포츠'>여행/스포츠</option>
							<option value='도서/티켓'>도서/티켓</option>
							<option value='기타'>기타</option>
						</select>
						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" class="button" value="다음">
							</div>
						</div>
					</div>


					<div class="next">
						<div class='p'>제품상태</div>
						<select name='itemstate'>
							<option value='미개봉상품'>미개봉 상품</option>
							<option value='A급'>A급</option>
							<option value='B급'>B급</option>
							<option value='C급'>C급</option>
						</select>
						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" class="button" value="다음">
							</div>
						</div>
					</div>


					<div class="next">
						<div class='p'>사진추가</div>

						<div id='image1'>
							<input type="file" id="img1" onchange="ch()" name="imgname1" />
							<label class='img1' for="img1">클릭</label>
						</div>
						<div id='image2'></div>
						<div id='image3'></div>
						<div id='image4'></div>
						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" id="imgnextbtn" class="button" value="다음">
							</div>

						</div>
					</div>

					<div class="next">
						<div class='p'>판매방법</div>
						<select name='howsell' id="howsell">
							<option value='경매'>경매</option>
							<option value='중고'>중고</option>
						</select>
						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" class="button" value="다음">
							</div>
						</div>
					</div>

					<!-- 경매일 경우 경매 시작가로 이름바뀜 -->

					<div class="next">
						<div class='p' id="auction">가격</div>
						<input class='textbox' id="itemprice" name="itemprice" type='text'
							placeholder="가격" maxlength="9"><br>
						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" id='pricebtn' class="button" value="다음">
							</div>
						</div>
					</div>

					<div class="next" id="finishdate">
						<!-- 경매일 경우  -->
						<div class='p' id="auction">마감날짜<font size="1px" >
						<strong>(선택일 00시에 마감됩니다. 경매는 전날까지만 진행됩니다.)</strong></font></div>
						<input readonly="readonly" class="calen textbox" name="finishtime"
							type='text' placeholder="날짜" id="calender"> <br>
						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" id="calenderbtn" class="button" value="다음">
							</div>
						</div>
					</div>

					<div style="margin-top: 150px; height: 450px;">
						<div class='p'>상세설명</div>
						<textarea id="detail" maxlength="1000" name="itemdetail" placeholder="상세설명"></textarea>

						<div class='bt'>
							<div class='pb'>
								<input class="button" type="button" value="이전">
							</div>
							<div class='nb'>
								<input type="button" id="fin" class="button" value="등록">
							</div>
							<input type="hidden" name='email' value="${skey}">
						</div>
					</div>

				</div>
			</div>
		</div>

	</form>
	<jsp:include page="../main/bottom.jsp"></jsp:include>

</body>
</html>