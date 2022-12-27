var code = "";			// 이메일전송 인증번호 저장을 위한 코드 
var blank = "";			// 공백 비교, ""로 if문에서 직접 비교 하려 했더니 동작하지 않아서 따로 변수 등록 후 비교 

function idSearch() {
	//window 객체를 사용해서 창을 열기 때문에 id값을 가져올 때도 window.document로 범위를 설정해줘야 id가 넘어온다.
	authEmail =  window.document.getElementById( 'authEmail' );
	auth_num = window.document.getElementById( 'auth_num' );
	
	// 빈칸 체크
	if(authEmail.value == "") {
		alert('이메일을 입력해주세요');
		authEmail.focus();
		return;
	}else if(auth_num.value == "") {
		alert('인증번호를 입력해주세요');
		auth_num.focus();
		return;
		}
		
	// 이메일 형식 체크 
	// RFC 5322 이메일 정규 표현식
	emailReg = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
	
	if(!emailReg.test(email)){
		alert('올바른 이메일 형식을 입력하세요. \n ex) ID@naver.com or ID@yale.edu.com');
		return false;
	}
	
	
	document.getElementById('idSearchForm').submit();


}




	
		/* 회원가입 했던 인증번호 이메일 전송 */
/*	window.document.getElementById("#mail-Check-Btn").click(function(){
		var email = window.document.getElementById("#authEmail").val(); 		// 입력한 이메일
		var checkBox = window.document.getElementByClassName(".mail_auth_input");  // 인증번호 입력란
		var boxWrap =  window.document.getElementByClassName(".mail_auth_input_box");  // 인증번호 입력란 박스 
		// RFC 5322 이메일 정규 표현식
		emailReg = new RegExp("([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*])");
		
		if(email == blank){
			alert("이메일을 입력해주세요.");
			return false;
		}else if(!emailReg.test(email)){
			alert('올바른 이메일 형식을 입력하세요. \n ex) ID@naver.com or ID@yale.edu.com');
			return false;
		}
		
		$.ajax({
			
			type:"GET",
			url:"http://localhost:8080/cafeHi/mailCheck.do?email=" + email,
			success:function(data){
				//console.log("data : " + data);
				alert(email + " 메일로 인증번호 전송이 완료 되었습니다.");
				checkBox.prop("disabled", false);
				boxWrap.attr("id", "mail_auth_input_box_true");
				code = data;
			},
			error : function(){
				alert("메일 전송을 하지 못했습니다.");
			}
		});
	});
*/



/* 인증번호 비교 */
/*	$("#mail_auth_check").click(function(){
		$("#mail_boolean_result").attr("checked", true);
		var inputCode = $(".mail_check_input").val();		// 입력코드
		var checkResult = $("#mail_auth_input_box_warn");	// 비교 결과
		var checkBoolean = $("#mail_auth_boolean");
		
		if(inputCode == blank){
			alert("인증번호를 먼저 전송해주세요.");
			return false;
		} 
		
		if(inputCode == code){
			checkResult.html("인증번호가 일치합니다.");		// 일치하는 경우 
			checkResult.attr("class", "correct");
			checkBoolean.prop("checked", true);
			if (checkBoolean.checked == true) {
	            console.log('true');

	            } else {
	                console.log('false');
	            }
			
		} else {
			checkResult.html("인증번호를 다시 확인해주세요.");		// 일치하지 않는 경우 
			checkResult.attr("class", "incorrect");
			checkBoolean.attr("checked", false);
			if (document.getElementsById('mail_auth_boolean').checked == true) {
	            console.log('true');

	            } else {
	                console.log('false');
	            }
		}
	});*/
	
