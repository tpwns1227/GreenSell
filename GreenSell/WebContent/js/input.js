var t = 0;

$(document).ready(function() {

	$("input[value='다음']").click(function() {
		t -= 600;
		$("#slidebox").animate({
			top : t
		}, 500, function() {
			$("input[value='다음']").blur();
		});
	
	if (document.sellForm.howsell.value == '경매') {
		$("#auction").text('경매 시작가격');
		$("#finishdate").css('display','');
	} else {
		$("#auction").text('판매가격');
		$("#finishdate").css('display','none');
	}

	});
	

		   $(".calen").datepicker({
				   nextText: '▶',
				   prevText: '◀',  
			      dateFormat:"yy-mm-dd",
			      dayNamesMin:['월','화','수','목','금','토','일'],
			      showButtonPanel:true,
			      closeText: '닫기'
		   });
	
	

	$("input[value='이전']").click(function() {
		t += 600;
		$("#slidebox").animate({
			top : t
		}, 500, function() {
			$("input[value='이전']").blur();
		});
	});

});

function ch() {
	document.querySelector('.img1').innerHTML = document.querySelector('#img1').value;
	document.getElementById('image2').innerHTML = "<input type='file' id='img2' onchange='ch2()' name='imgname2'><label class='img2' for='img2'>클릭</label>";
};

function ch2() {
	document.querySelector('.img2').innerHTML = document.querySelector('#img2').value;
	document.getElementById('image3').innerHTML = "<input type='file' id='img3' onchange='ch3()' name='imgname3'><label class='img3' for='img3'>클릭</label>";
};

function ch3() {
	document.querySelector('.img3').innerHTML = document.querySelector('#img3').value;
	document.getElementById('image4').innerHTML = "<input type='file' id='img4' onchange='ch4()' name='imgname4'><label class='img4' for='img4'>클릭</label>";
};

function ch4() {
	document.querySelector('.img4').innerHTML = document.querySelector('#img4').value;

};
