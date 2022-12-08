// JS 유효성 검사

// 회원가입 유효성 검사
function signupcheck() {
	
	var userId = document.getElementById('user_id');
	var userName = document.getElementById('userName');
	var userPassword = document.getElementById('userPassword');
	var checkPassword = document.getElementById('checkPassword');
	var contact = document.getElementById('userContact');
	var userEmail = document.getElementById('userEmail');
	var userRoadAddress = document.getElementById('userRoadAddress');
	var userJibunAddress = document.getElementById('userJibunAddress');
	var detailAddress = document.getElementById('userDetailAddress');
	var privacyCheck = document.getElementById('privacyCheck').checked;
	var mailCheck = document.getElementById('mail_check_boolean').checked;
	
	

	// 회원가입란 공백 체크 
	// input 태그의 도로명 주소와 지번 주소의 공백 체크를 시도했는데 버튼이 넘어가지 않았다. 어떻게 체크힐 것인지 고민해야겠다. 
		
	if (userId.value == "") {
		alert('아이디를 입력해주세요');
		userId.focus();
		return;
	} else if (userName.value == "") {
		alert('이름을 입력해주세요');
		userName.focus();
		return;
	} else if (userPassword.value == "") {
		alert('비밀번호를 입력해주세요');
		userPassword.focus();
		return;
	} else if (checkPassword.value == "") {
		alert('비밀번호를 한번 더 입력해주세요');
		checkPassword.focus();
		return;
	} else if (contact.value == "") {
		alert('연락처를 입력해주세요');
		contact.focus();
		return;
	} else if (userEmail.value == "") {
		alert('이메일을 입력해주세요');
		userEmail.focus();
		return;
	} else if (userRoadAddress.value == "" && userJibunAddress.value == "") {
		alert('주소 찾기 버튼을 눌러 주소를 선택해주세요');
		return;
	} else if (detailAddress.value == "") {
		alert('상세주소를 입력해주세요');
		detailAddress.focus();
		return;
	} else if (!privacyCheck) {
		alert('개인정보 제공에 체크해주세요.');
		privacyCheck.focus();
		return;
	}
	
	if(!mailCheck){
		alert('인증번호가 일치 하지 않습니다. 메일 인증 절차를 다시 진행해주세요.');
		return;
	}
	
	
	// RFC 5322 이메일 정규 표현식
	emailReg = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	
	if(!emailReg.test(userEmail.value)){
		alert('올바른 이메일 형식을 입력하세요. \n ex) ID@naver.com or ID@yale.edu.com');
		return;
	}
	
	
	// 전화번호 정규표현식 - 계속 먹히지 않아서 애먹었는데 알고보니 edge에서 실행하지 않고 chrome으로 실행 했더니 작동함 - 이것때문에 애먹었다.
	phonReg = /^01(0|1|6|7|8|9]{1})-?([0-9]{3,4})-?[0-9]{4}$/;
	
	if(!phonReg.test(contact.value)) {
		alert('올바른 연락처 형식을 입력하세요.\n ex) 010-1234-1234 (특수문자 외 숫자만 입력도 가능)');
		return;
	}

	
	


	// 정규 표현식
	Reg = /^[a-z]+[a-z0-9]{5,19}$/g;

	if (!Reg.test(userId.value)) {
		alert('아이디는 영문, 숫자 포함 6 - 20자로 입력해주세요.');
		userId.focus();
		return;
	}

	if (! /^[a-z]+[a-z0-9]{5,19}$/g.test(userPassword.value)) {
		alert('비밀번호는 영문, 숫자 포함 6 - 20자로 입력해주세요.');
		userPassword.focus();
		return;
	}
	
	
	document.getElementById('userForm').submit();


}


// 패스워드가 서로 일치한 것인지 확인
function pwCheck() {
	userPassword = document.getElementById('userPassword');
	checkPassword = document.getElementById('checkPassword');
	if (userPassword.value == checkPassword.value) {
		document.getElementById('pwcheck').innerHTML = "<span style='color: green;'>비밀번호가 서로 일치합니다.</span>";
		
		
	} else {
		document.getElementById('pwcheck').innerHTML = "<span style='color: red;'>비밀번호가 서로 일치하지 않습니다.</span>";
		
		userPassword.value = "";
		checkPassword.value = "";
		userPassword.focus();
	}
}



// 로그인 공백 확인
function loginCheck(){
	userId = document.getElementById('floatingInput');
	userPassword = document.getElementById('floatingPassword');
	if (userId.value == "") {
		alert('아이디를 입력해주세요');
		floatingInput.focus();
		return;
	} else if (userPassword.value == "") {
		alert('비밀번호를 입력해주세요');
		floatingPassword.focus();
		return;
		}
		
	document.getElementById('loginForm').submit();
}


// 유저 정보 업데이트 유효성 검사 

function updateIdCheck(){
	var userId = document.getElementById('userId');
	Reg = /^[a-z]+[a-z0-9]{5,19}$/g;
	
	if (userId.value == "") {
		alert('아이디를 입력해주세요');
		userId.focus();
		return;
	} else if(!Reg.test(userId.value)){
		alert('아이디는 영문, 숫자 포함 6 - 20자로 입력해주세요.');
		userId.focus();
		return;
	}
	
	document.getElementById('userUpdateIdForm').submit();
}

function updateNameCheck(){
	var userName = document.getElementById('userName');
	if (userName.value == "") {
		alert('이름을 입력해주세요');
		userName.focus();
		return;
	}
	
	document.getElementById('userUpdateNameForm').submit();
}

function updateContactCheck(){
	var contact = document.getElementById('userContact');
	
	phonReg = /^01(0|1|6|7|8|9]{1})-?([0-9]{3,4})-?[0-9]{4}$/;
	
	
	if (contact.value == "") {
		alert('이름을 입력해주세요');
		contact.focus();
		return;
	} else if(!phonReg.test(contact.value)) {
		alert('올바른 연락처 형식을 입력하세요.\n ex) 010-1234-1234 (특수문자 외 숫자만 입력도 가능)');
		return;
	}
	
	document.getElementById('userUpdateContactForm').submit();
}



function updateEmailCheck(){
	
	var userEmail = document.getElementById('userEmail');
	emailReg = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	
	if (userEmail.value == "") {
		alert('이메일을 입력해주세요');
		userEmail.focus();
		return;
	} else if(!emailReg.test(userEmail.value)){
		alert('올바른 이메일 형식을 입력하세요. \n ex) ID@naver.com or ID@yale.edu.com');
		userEmail.focus();
		return;
	}
	
	document.getElementById('userUpdateEmailForm').submit();
}

function updateAddressCheck(){
	
	var userRoadAddress = document.getElementById('userRoadAddress');
	var userJibunAddress = document.getElementById('userJibunAddress');
	
	if (userRoadAddress.value == "" && userJibunAddress.value == "") {
		alert('주소 찾기 버튼을 눌러 주소를 선택해주세요');
		return;
	}
	
	document.getElementById('userUpdateAddressForm').submit();
		
}

function updateDetailAddressCheck(){
	
	var userDetailAddress = document.getElementById('userDetailAddress');
	
	if (userDetailAddress.value == ""){
		alert('상세주소를 입력해주세요.');
		userDetailAddress.focus();
		return;
	}
	
	document.getElementById('userUpdateDetailAddressForm').submit();
}




