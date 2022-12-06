function idSearch() {
	//window 객체를 사용해서 창을 열기 때문에 id값을 가져올 때도 window.document로 범위를 설정해줘야 id가 넘어온다.
	userName =  window.document.getElementById( 'user_name' );
	contact = window.document.getElementById( 'user_contact' );
	
	// 빈칸 체크
	if(userName.value == "") {
		alert('이름을 입력해주세요');
		userName.focus();
		return;
	}else if(contact.value == "") {
		alert('연락처를 입력해주세요');
		contact.focus();
		return;
		}
	
	// 연락처를 끝까지 안 쓸 경우 체크
	if(contact.value.length < 13){
		alert('연락처를 끝까지 작성해주세요.');
		contact.focus();
		return;
	}
	
	// 이름 체크
	Reg = /^[가-힣a-zA-Z]+$/;
	
	if (!Reg.test(userName.value)) {
		alert('이름은 영문 또는 한글만 입력가능합니다.');
		userName.focus();
		return;
	}


	document.getElementById('idSearchForm').submit();


}


