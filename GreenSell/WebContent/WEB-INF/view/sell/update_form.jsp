<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Green Sell</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/input.css">
<script type="text/javascript" src="/GreenSell/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var category = '${itemone.category}';
		var itemstate = '${itemone.itemstate}';		
		
		if (category == '의류/잡화') {
			$("option[value='의류/잡화']").attr("selected", "selected");
		}
		else if (category == '가구/전자') {
			$("option[value='가구/전자']").attr("selected", "selected");
		}
		else if (category == '여행/스포츠') {
			$("option[value='여행/스포츠']").attr("selected", "selected");
		}
		else if (category == '도서/티켓') {
			$("option[value='도서/티켓']").attr("selected", "selected");
		}
		else if (category == '기타') {
			$("option[value='기타']").attr("selected", "selected");
		}
		if (itemstate == '미개봉상품') {
			$("option[value='미개봉상품']").attr("selected", "selected");
		}
		else if (itemstate == 'A급') {
			$("option[value='A급']").attr("selected", "selected");
		}
		else if (itemstate == 'B급') {
			$("option[value='B급']").attr("selected", "selected");
		}
		else if (itemstate == 'C급') {
			$("option[value='C급']").attr("selected", "selected");
		}
		
		
		$("#updatebtn").click(function(){
			
			if($("#price").val()==''){
				alert("가격을 입력해 주세요.");
				return;
			}
			
			if($("#detail").text()==''){
				alert("상세설명을 입력해 주세요.");
				return;
			}
			
			if ($(this).attr('id') == 'pricebtn') {
				if($("#itemprice").val()=='' || $("#itemprice").val()==null){
					alert('가격을 입력해 주세요.');
					$("#itemprice").focus();
					return;
				}else{
					var chk =  /^\d+$/;
					if(!chk.test($("#itemprice").val())){
						alert('숫자만 입력해 주세요.');
						$("#itemprice").focus();
						return;
					}else{
						if(document.sellForm.itemprice.value.length < 4){
							alert("천원 이상 입력해 주세요.");
							$("#itemprice").focus();
							return;
						}
					}
				}
				
			}
			
			
		var exp = $("#img1").val().substr($("#img1").val().lastIndexOf('.')+1);
		exp = exp.toUpperCase();
		if(exp=='' || exp=='JPG' || exp=='PNG' || exp=='BMP' || exp=='JPEG' || exp=='GIF'){
		}else{
			alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
			return;
		}
		var exp2 =$("#img2").val();
		if(exp2!=null){
		var exp2 = $("#img2").val().substr($("#img2").val().lastIndexOf('.')+1);
		exp2 = exp2.toUpperCase();
		if(exp2=='' || exp2=='JPG' || exp2=='PNG' || exp2=='BMP' || exp2=='JPEG' || exp2=='GIF' || exp2==null || exp2==''){
		}else{
			alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
			return;
		}}
		var exp3 =$("#img3").val();
		if(exp3!=null){
		var exp3 = $("#img3").val().substr($("#img3").val().lastIndexOf('.')+1);
		exp3 = exp3.toUpperCase();
		if(exp3=='' || exp3=='JPG' || exp3=='PNG' || exp3=='BMP' || exp3=='JPEG' || exp3=='GIF' || exp3==null || exp3==''){
		}else{
			alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
			return;
		}}
		var exp4 =$("#img4").val();
		if(exp4!=null){
		exp4 = $("#img4").val().substr($("#img4").val().lastIndexOf('.')+1);
		exp4 = exp4.toUpperCase();
		if(exp4=='' || exp4=='JPG' || exp4=='PNG' || exp4=='BMP' || exp4=='JPEG' || exp4=='GIF'|| exp4==null || exp4==''){
		}else{
			alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
			return;
		}}
		
		if(confirm("수정하시겠 습니까?")){
			document.updateForm.submit();
		}else{
			return;
		}
		
		});

	});
	
	function ch1(){
		document.querySelector('.img1').innerHTML = document.querySelector('#img1').value;
	}
	function ch2(){
		document.querySelector('.img2').innerHTML = document.querySelector('#img2').value;
	}
	function ch3(){
		document.querySelector('.img3').innerHTML = document.querySelector('#img3').value;
	}
	function ch4(){
		document.querySelector('.img4').innerHTML = document.querySelector('#img4').value;
	}
	
	
	
	
</script>
</head>
<body>

	<jsp:include page="../main/header.jsp"></jsp:include>
	<div class='container'>
		<form action="update_result" method="post" name="updateForm"
			enctype="multipart/form-data">
			<div class='border'>게시물 수정</div>
			<input type="hidden" name="no" value="${itemone.no}">
			<div class='p'>제품명</div>
			<input class='textbox' name="itemname" type='text' placeholder="제품명"
				value="${itemone.itemname}">
			<div class='p'>카테고리</div>
			<select name='category' class='pf'>
				<option value='의류/잡화'>의류/잡화</option>
				<option value='가구/전자'>가구/전자</option>
				<option value='여행/스포츠'>여행/스포츠</option>
				<option value='도서/티켓'>도서/티켓</option>
				<option value='기타'>기타</option>
			</select>
			<div class='p'>제품상태</div>
			<select name='itemstate' class='pf'>
				<option value='미개봉상품'>미개봉 상품</option>
				<option value='A급'>A급</option>
				<option value='B급'>B급</option>
				<option value='C급'>C급</option>
			</select>

			<div class='p'>사진</div>
			<div id='image1'>
				<c:forEach items="${names}" var="img" varStatus="v">
					<input type="file" id="img${v.count}" onchange="ch${v.count}()"
						name="imgname${v.count}" value="${img}" />
					<label class='img${v.count}' for="img${v.count}">${img}</label>
				</c:forEach>
				<c:if test="${names.size()<4}">
					<c:forEach begin="${names.size()+1}" end="4" varStatus="v">
					<input type="file" id="img${names.size()+v.count}" onchange="ch${names.size()+v.count}()"
						name="imgname${names.size()+v.count}" />
					<label class='img${names.size()+v.count}' for="img${names.size()+v.count}">
					<c:if test="${img!=null}">${img}</c:if>
					<c:if test="${img==null}">클릭</c:if>
					</label>
					</c:forEach>
				</c:if>
				
			</div>
			
			
			<div class='p'>가격</div>
			<input class='textbox' id="itemprice" maxlength="" name="itemprice" type='text'
				value="${itemone.itemprice}" placeholder="가격">
			<div class='p'>상세설명</div>
			<textarea name="itemdetail" maxlength="1000" id="detail" placeholder="상세설명">${itemone.itemdetail}</textarea>
			<input type="button" id="updatebtn" class="button" value="수정"
				style='width: 400px; margin-top: 25px;'>
		</form>
	</div>
	<jsp:include page="../main/bottom.jsp"></jsp:include>

</body>
</html>