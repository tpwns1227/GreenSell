var t = 0;

$(document).ready(function(){

	$("input[value='다음']").click(function() {

		if ($("#itemname").val() == '' || $("#itemname").val() == null) {
			alert("제품명을 입력해 주세요.");
			$("#itemname").focus();
			return;
		}else{
			if(document.sellForm.itemname.value.length < 2){
				alert("두글자 이상 입력해 주세요.");
				$("#itemname").focus();
				return;
			}
		}
		
		if ($(this).attr('id') == 'imgnextbtn') {
			if ($("#img1").val() == '' || $("#img1").val() == null) {
				alert('사진을 최소 한장이상 올려주세요');
				return;
			}
			
			var exp = $("#img1").val().substr($("#img1").val().lastIndexOf('.')+1);
			exp = exp.toUpperCase();
			if(exp=='JPG' || exp=='PNG' || exp=='BMP' || exp=='JPEG' || exp=='GIF'){
			}else{
				alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
				return;
			}
			var exp2 =$("#img2").val();
			if(exp2!=null){
			var exp2 = $("#img2").val().substr($("#img2").val().lastIndexOf('.')+1);
			exp2 = exp2.toUpperCase();
			if(exp2=='JPG' || exp2=='PNG' || exp2=='BMP' || exp2=='JPEG' || exp2=='GIF' || exp2==null || exp2==''){
			}else{
				alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
				return;
			}}
			var exp3 =$("#img3").val();
			if(exp3!=null){
			var exp3 = $("#img3").val().substr($("#img3").val().lastIndexOf('.')+1);
			exp3 = exp3.toUpperCase();
			if(exp3=='JPG' || exp3=='PNG' || exp3=='BMP' || exp3=='JPEG' || exp3=='GIF' || exp3==null || exp3==''){
			}else{
				alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
				return;
			}}
			var exp4 =$("#img4").val();
			if(exp4!=null){
			exp4 = $("#img4").val().substr($("#img4").val().lastIndexOf('.')+1);
			exp4 = exp4.toUpperCase();
			if(exp4=='JPG' || exp4=='PNG' || exp4=='BMP' || exp4=='JPEG' || exp4=='GIF'|| exp4==null || exp4==''){
			}else{
				alert('JPG, PNG, BMP, GIF 형식의 파일만 지원합니다.');
				return;
			}}

		}
		
		if ($(this).attr('id') == 'pricebtn') {
			if(document.sellForm.itemprice.value.substring(0,1)>0){}
			else{
			alert("앞자리는 0이 올 수 없습니다.");
			return;
			}
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
					if(document.sellForm.itemprice.value.length < 4 ){
						alert("천원 이상 입력해 주세요.");
						$("#itemprice").focus();
						return;
					}
					
					
					
				}
			}
			
		}
		
		if($(this).attr('id')=='calenderbtn'){
			if($("#calender").val()=='' || $("#calender").val()==null){
				alert('경매 마감일자를 선택해 주세요.');
				return;
			}
		}
		
		t -= 350;
		$("#slidebox").animate({
			top : t
		}, 500, function() {
			$("input[value='다음']").blur();
		});

		if (document.sellForm.howsell.value == '경매') {
			$("#auction").text('경매 시작가격');
			$("#finishdate").css('display', '');
		} else {
			$("#auction").text('판매가격');
			$("#finishdate").css('display', 'none');
		}

	});
	
	$("#fin").click(function(){
		if($("#detail").val()=='' || $("#detail").val()==null){
		alert('상세설명을 입력해 주세요.');
		return;
		}
		var i = confirm("경매글의 경우 추후 삭제가 불가능 합니다.\r\n 정말로 입력하시겠습니까?");
		if(i){
			document.sellForm.submit();
		}else{
			return;
		}
	});

	$("input[value='이전']").click(function() {
		t += 350;
		$("#slidebox").animate({
			top : t
		}, 500, function() {
			$("input[value='이전']").blur();
		});
	});

	$("#calender").datepicker({
		nextText : '▶',
		prevText : '◀',
		dateFormat : "yy-mm-dd",
		dayNamesMin : [ '월', '화', '수', '목', '금', '토', '일' ],
		showButtonPanel : true,
		closeText : '닫기',
		minDate : +1,
		maxDate : +7
	});
	
});




function ch() {
	if(document.getElementById("addimg2")!=null){
	}else{	
		document.getElementById('image2').innerHTML = "<input type='file' id='img2' onchange='ch2()' name='imgname2'><label id='addimg2' class='img2' for='img2'>클릭</label>";
		$('.pp').css('margin-top','90px');
	}
	document.querySelector('.img1').innerHTML = document.querySelector('#img1').value;
};

function ch2() {
	if(document.getElementById("addimg3")!=null){
	}else{
	document.getElementById('image3').innerHTML = "<input type='file' id='img3' onchange='ch3()' name='imgname3'><label id='addimg3' class='img3' for='img3'>클릭</label>";
	$('.pp').css('margin-top','65px');
	}
	document.querySelector('.img2').innerHTML = document.querySelector('#img2').value;
};

function ch3() {
	if(document.getElementById("addimg4")!=null){
	}else{	
	document.getElementById('image4').innerHTML = "<input type='file' id='img4' onchange='ch4()' name='imgname4'><label id='addimg4' class='img4' for='img4'>클릭</label>";
	$('.pp').css('margin-top','40px');
	}
	document.querySelector('.img3').innerHTML = document.querySelector('#img3').value;
};

function ch4() {
	document.querySelector('.img4').innerHTML = document.querySelector('#img4').value;
};