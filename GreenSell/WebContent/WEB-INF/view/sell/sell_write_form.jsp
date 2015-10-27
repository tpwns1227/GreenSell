<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript">
	//슬라이드 관련

	var t = 0; //top 값으로 인해 보여줄 값 변경

	//슬라이드 형식으로 이전값으로 올림.
	function up() {
		t = t + 900;
		if (t > -6000 && t < 1) {
			$("#slidebox").animate({
				top : t
			}, 500);
		} else {
			return;
		}
	}

	//슬라이드형식으로 다음 값으로 넘김
	function down() {
		t = t - 900;
		if (t > -6000 && t < 1) {
			$("#slidebox").animate({
				top : t
			}, 500);
		} else {
			return;
		}
	}
	//jquery이용해서 스페이스바가 입력됬을때 아무 효과 없도록
	$(document).keyup(function(e) {
		if (e.keyCode == 32) {
			return false;
		}
	});

	//jquery이용해서 엔터가 입력됬을때 아무 효과 없도록
	$(document).keypress(function(e) {
		if (e.keyCode == 13) {

			return false;
		}
	})

	//다음버튼 입력에 대한 다음 값
	function Next(rtype) {
		var str = eval('document.inputproduct.' + rtype + '.value');
		if (str != null && str != '') {
			down();
		} else {
			alert("물품 정보를 입력해 주세요.");
			return;
		}
	}
</script>
<style type="text/css">
</style>
</head>
<body>
<jsp:include page="../main/header.jsp"></jsp:include>
	<form name="inputproduct" action="sellcontent_write_form">
		<center>

			<div id="slide"
				style="width: 1200px; height: 900px; overflow: hidden; position: relative;">
				<div id="slidebox" style="top: 0px; position: absolute;">


					<fieldset id="productname"
						style="border: none; width: 1200px; height: 900px">
						<fieldset style="width: 660px; margin: 400px;">
							<legend>제품명을 입력해 주세요.</legend>
							<input type="text" name="pname"
								onkeypress="if(event.keyCode == 13) {return false;}">&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="button" name="npnamebtn" value="다음"
								onclick="Next('pname')">

						</fieldset>
					</fieldset>



					<fieldset id="selection" style="border: none;">
						<fieldset style="width: 660px; margin: 400px;">
							<legend>판매 방법</legend>
							<input type="radio" value="경매" name="selltype">경매 <input
								type="radio" value="판매" name="selltype">판매 <br> <input
								type="button" id="nselltypebtn" value="다음"
								onclick="Next('selltype')">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="button" value="이전" onclick="up()">
						</fieldset>
					</fieldset>




					<fieldset id="categorys" style="border: none;">
						<fieldset style="width: 660px; margin: 400px;">
							<legend>카테고리 선택</legend>
							<input type="radio" name="category" value="의류/잡화">의류/잡화 <input
								type="radio" name="category" value="가구/전자">가구/전자 <input
								type="radio" name="category" value="여행/스포츠">여행/스포츠 <input
								type="radio" name="category" value="도서/티켓">도서/티켓 <input
								type="radio" name="category" value="기타">기타 <br>
							<input type="button" id="ncategorybtn" value="다음"
								onclick="Next('category')">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="button" id="bcategorybtn" value="이전" onclick="up()">

						</fieldset>
					</fieldset>


					<fieldset id="pprice" style="border: none;">
						<fieldset style="width: 660px; margin: 400px;">
							<legend>가격 설정</legend>
							<input type="text" name="price"
								onkeypress="if(event.keyCode == 13) {return false;}">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" name="npricebtn" value="다음"
								onclick="Next('price')">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="button" id="bpricebtn" value="이전" onclick="up()">
						</fieldset>
					</fieldset>



					<fieldset id="pstate" style="border: none">
						<fieldset style="width: 660px; margin: 400px;">
							<legend>판매 방법</legend>
							<input type="radio" name="state" id="state" value="미개봉">미개봉
							<input type="radio" name="state" id="state" value="A급">A급
							<input type="radio" name="state" id="state" value="B급">B급
							<input type="radio" name="state" id="state" value="C급">C급
							<br> <input type="button" id="nstatebtn" value="다음"
								onclick="Next('state')">&nbsp;&nbsp;&nbsp;&nbsp; <input
								type="button" id="bstatebtn" value="이전" onclick="up()">
						</fieldset>
					</fieldset>


					<fieldset id="pphoto" style="border: none;">
						<fieldset style="width: 660px; margin: 400px;">
							<legend>사진 추가</legend>

							<input type="file" name="img_1">
							<input type="submit" value="다음"> &nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" id="bphotobtn" value="이전" onclick="up()">
						</fieldset>
					</fieldset>

				</div>
			</div>

		</center>
	</form>

</body>
</html>