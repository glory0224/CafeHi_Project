// JS 유효성 검사
function check() {
	
	var userId = document.getElementById('userId');
	var userName = document.getElementById('userName');
	var userPassword = document.getElementById('userPassword');
	var checkPassword = document.getElementById('checkPassword');
	var contact = document.getElementById('userContact');
	var detailAddress = document.getElementById('userDetailAddress');
	var privacyCheck = document.getElementById('privacyCheck').checked;
	

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
	}  else if (detailAddress.value == "") {
		alert('상세주소를 입력해주세요');
		detailAddress.focus();
		return;
	} else if (!privacyCheck) {
		alert('개인정보 제공에 체크해주세요.');
		privacyCheck.focus();
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
		console.log(userId.value)
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
		document.getElementById('pwcheck').innerHTML = '비밀번호가 서로 일치합니다.';
	} else {
		document.getElementById('pwcheck').innerHTML = '비밀번호가 서로 일치하지 않습니다.';
		userPassword.value = "";
		checkPassword.value = "";
		userPassword.focus();
	}
}




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





