var t = 0;

$(document).ready(function() {

	$("input[value='다음']").click(function() {
		t -= 600;
		$("#slidebox").animate({
			top : t
		}, 500, function() {
			$("input[value='다음']").blur();
		});
	});

	$("#type").click(function() {
		if (document.sellForm.howsell.value == '경매') {
			$("#auction").html('시작가격');
		} else {
			$("#auction").html('판매가격');
		}
	});

	$("input[value='이전']").click(function() {
		t += 600;
		$("#slidebox").animate({
			top : t
		}, 500, function() {
			$("input[value='다음']").blur();
		});
	});

});

function ch() {
	document.querySelector('.img1').innerHTML = document.querySelector('#img1').value;
	document.getElementById('image2').innerHTML = "<input type='file' id='img2' onchange='ch2()'><label class='img2' for='img2'>클릭</label>";
};

function ch2() {
	document.querySelector('.img2').innerHTML = document.querySelector('#img2').value;
	document.getElementById('image3').innerHTML = "<input type='file' id='img3' onchange='ch3()'><label class='img3' for='img3'>클릭</label>";
};

function ch3() {
	document.querySelector('.img3').innerHTML = document.querySelector('#img3').value;
	document.getElementById('image4').innerHTML = "<input type='file' id='img4' onchange='ch4()'><label class='img4' for='img4'>클릭</label>";
};

function ch4() {
	document.querySelector('.img4').innerHTML = document.querySelector('#img4').value;

};
