function inputCheck() {
	if (document.register_form.email.value == "" && document.register_form.email.value == null) {
		alert("이메일을 입력해주세요");
		document.register_form.email.focus();
		return;
	}
	var str = document.register_form.email.value;
  
	var atPos = str.indexOf('@');

	var atLastPos = str.lastIndexOf('@');

	var dotPos = str.indexOf('.');

	var spacePos = str.indexOf(' ');

	var commaPos = str.indexOf(',');

	var eMailSize = str.length;

	if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1
			&& commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
	
	else {
		alert("이메일 형식이 올바르지 않습니다. 확인해주세요");
		document.register_form.email.focus();
		return;
		}
	if (document.register_form.name.value == ""
			|| document.register_form.name.value == null) {
		alert("이름을 입력해주세요");
		document.register_form.name.focus();
		return;
	}
	if (document.register_form.nickname.value == "") {
		alert("별명을 입력해주세요");
		document.register_form.nickname.focus();
		return;
	}
	if (document.register_form.password.value == ""
			|| document.register_form.password.value == null) {
		alert("비밀번호를 입력해주세요");
		document.register_form.password.focus();
		return;
	}
	if (document.register_form.password2.value == ""
			|| document.register_form.password2.value == null) {
		alert("비밀번호 확인을 입력해주세요");
		document.register_form.password2.focus();
		return;
	}

	if (document.register_form.password.value != document.register_form.password2.value) {
		alert("비밀번호가 일치 하지않아요.");
		document.register_form.password2.focus();
		return;
	}
	if (document.register_form.address.value == ""
			|| document.register_form.address.value == null) {
		alert("상세주소를 입력해주세요");
		document.register_form.address2.focus();
		return;
	}
	if (document.register_form.bank.value == "0") {
		alert("은행을 선택해주세요");
		document.register_form.bank.focus();
		return;
	}
	if (document.register_form.account.value == ""
			|| document.register_form.account.value == null) {
		alert("계좌번호를 입력해주세요");
		document.register_form.account.focus();
		return;
	}
	if (document.register_form.question.value == "0") {
		alert("비밀번호찾기 질문을 선택해주세요");
		document.register_form.question.focus();
		return;
	}
	if (document.register_form.answer.value == ""
			|| document.register_form.answer.value == null) {
		alert("비밀번호찾기 질문에 대한 답을 입력하세요");
		document.register_form.answer.focus();
		return;
	}
	
	
	if(document.register_form.password.value.length < 6){
		alert("비밀번호는 최소 6자 이상 입력하셔야 합니다.");
		return;
	}
	
	if($("#idchk").text()=='사용불가' || $("#nickchk").text()=='사용불가' || $("#phonechk").text()=='사용불가' ||
		$("#name").text()=='사용불가' || $("#account").text()=='사용불가'){
		alert("사용불가 항목을 확인해 주세요.");
		return;
	}
	
	
	document.register_form.submit();
	

	
}




