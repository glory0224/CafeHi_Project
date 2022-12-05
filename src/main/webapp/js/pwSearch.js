function pwSearch() {
	//window 객체를 사용해서 창을 열기 때문에 id값을 가져올 때도 window.document로 범위를 설정해줘야 id가 넘어온다.
	userId =  window.document.getElementById( 'userId' );
	contact = window.document.getElementById( 'contact' );
	
	// 빈칸 체크
	if(userId.value == "") {
		alert('아이디를 입력해주세요');
		userId.focus();
		return;
	}else if(contact.value == "") {
		alert('연락처를 입력해주세요');
		contact.focus();
		return;
		}
	
	
	
	// 아이디 체크
	Reg = /^[a-z]+[a-z0-9]{5,19}$/g;

	if (!Reg.test(userId.value)) {
		alert('아이디는 영문, 숫자 포함 6 - 20자로 입력해주세요.');
		userId.focus();
		return;
	}

	// 연락처를 끝까지 안 쓸 경우 체크
	if(contact.value.length < 13){
		alert('연락처를 끝까지 작성해주세요.');
		contact.focus();
		return;
	}


	document.getElementById('pwSearchForm').submit();


}



// 전화번호 정규식 
function phoneFormat(target) {
  // 특수문자 제거
  target.value = target.value.replace(/[^0-9]/g, "");

  const value = target.value.split("");

  const textArr = [
    // 첫번째 구간 (00 or 000)
    [0, value.length > 9 ? 3 : 2],
    // 두번째 구간 (000 or 0000)
    [0, value.length > 10 ? 4 : 3],
    // 남은 마지막 모든 숫자
    [0, 4]
  ];

  // 총 3번의 반복 ({2,3}) - ({3,4}) - ({4})
  target.value = textArr
    .map(function(v)  { 
  	  return value.splice(v[0], v[1]).join("") 
    })
    .filter(function(text) { 
   	  return text 
    })
    .join("-");
}
