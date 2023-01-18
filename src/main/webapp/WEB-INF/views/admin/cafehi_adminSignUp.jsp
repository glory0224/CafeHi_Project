<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 등록 페이지</title>
<!-- 유효성 검사 js  -->
<script src="/cafeHi/js/check.js"></script>
</head>
<body>

<!-- 카페 하이 헤더  -->   
<jsp:include page="/cafeHi_module/header.jsp"/>

	<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">관리자 페이지</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">카페하이 관리자 정보 페이지입니다.</p>
		</div>
	</div>
	
<div class="float-start mt-5 p-5">
<jsp:include page="/cafeHi_module/adminPageNav.jsp"/>
</div>

<div class="w-50 m-auto" style="padding-top: 5%">
<form class="container" action="insertAdmin.do" method="post" id="adminForm">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	<h1 class="text-center m-5">관리자 등록</h1>
  <div class="m-5">
    <h4><label for="member_id" class="form-label">아이디</label><input id="idCheck" class="btn btn-sm btn-success float-end" type="button" value="중복 확인"></h4>
    <input type="text" id="member_id" class="form-control" placeholder="영문, 숫자 포함 6 - 20자" name="member_id">
    <br>
    <div><font id="id_feedback" size="2"></font></div>
    <input id="id_check_boolean" type="checkbox" style="display: none" >
    <input id="id_boolean" type="checkbox" style="display: none" >
  </div>
    <div class="m-5">
    <h4><label for="memberName" class="form-label">이름</label></h4>
    <input type="text" id="memberName" class="form-control" placeholder="이름을 입력하세요." name="member_name">
  </div>
  <div class="m-5">
    <h4><label for="memberPassword" class="form-label">비밀번호</label></h4>
    <input type="password" id="memberPassword" class="form-control" placeholder="영문, 숫자 포함 6 - 20자" name="member_pw">
  </div>
  <div class="m-5">
    <h4><label for="checkPassword" class="form-label">비밀번호 확인</label></h4>
    <input type="password" id="checkPassword" class="form-control" placeholder="비밀번호를 다시 한번 입력하세요." onchange="pwCheck()">
    <br>
    <div id="pwcheck"></div>
  </div>
  <div class="m-5">
    <h4><label for="memberContact" class="form-label">연락처</label></h4>
    <input type="text" id="memberContact" class="form-control" placeholder="연락처를 입력하세요." name="member_contact" maxlength="13">
  </div>
  <div class="m-5">
    <h4><label for="memberEmail " class="form-label">이메일</label></h4>
    <div class="d-flex justify-content-between mail_check_wrap">
    <input type="text" id="memberEmail" class="form-control" placeholder="이메일을 입력하세요." name="member_email"> &nbsp;
   		<input id="email_duplicate_button" class="btn btn-sm btn-success" type="button" value="중복 확인"> &nbsp;
    	<input id="email_check_button" class="btn btn-sm btn-success" type="button" value="인증번호 전송">
    	
    </div>
    <div><font id="email_duplicate_feedback" size="2"></font></div>
    <input id="email_duplicate_boolean" type="checkbox" style="display: none" >
    <input id="email_dup_boolean" type="checkbox" style="display: none" >
    <br>
    <div class="d-flex justify-content-between email_check_input_box" id="email_check_input_box_false">
    		<input class="email_check_input form-control" disabled="disabled" placeholder="인증번호를 입력하세요.">
    		 &nbsp;
    		<input id="email_num_check" class="btn btn-sm btn-success" type="button" value="인증번호 확인">
    </div>
    
    <span id="email_check_input_box_warn"></span>
    <input id="email_check_boolean" type="checkbox" style="display: none" >
    <input id="email_chk_boolean" type="checkbox" style="display: none" >
  </div> 

<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input id="signup" class="btn btn-md btn-success " type="button" value="회원가입" onclick="adminSignupCheck()">
      </div>
</div>


</form>


</div>

<!--카페 하이 FOOTER -->
<jsp:include page="/cafeHi_module/footer.jsp"/>

<script type ="text/javascript">

	/* Ajax방식을 Spring에 적용하기 전에 Pom.xml에 json 관련 dependency가 들어 있는지 확인한다. */
	/* Spring security의 Ajax를 사용하기 위해서는 Header에 csrf 토큰을 추가해서 보내야한다.  */
	
	/* 회원가입 아이디 중복 체크  */
	$('#idCheck').click(function(){
		$("#id_boolean").attr("checked", true);
		let member_id = $('#member_id').val();
		
		$.ajax({
			url : "http://localhost:8080/cafeHi/IdCheck.do",
			type : "post",
			data : {member_id: member_id},
			dataType : 'json',
			beforeSend : function(xhr){
				xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			},
			success : function(result){
				if(result == 1){
					memberId = document.getElementById('member_id');
					memberId.value = "";
					$("#id_feedback").html('이미 사용중인 아이디입니다.');
					$('#id_check_boolean').attr("checked", false);
					$("#id_feedback").attr('color','#dc3545');
				}
				
				if(result == 0){
					$("#id_feedback").html('사용할 수 있는 아이디입니다.');
					$('#id_check_boolean').attr("checked", true);
					$("#id_feedback").attr('color','#2fb380');
				}
				
				if(member_id == ""){
					$("#id_feedback").html('아이디를 입력해주세요.');
					$('#id_check_boolean').attr("checked", false);
					$("#id_feedback").attr('color','#dc3545');
				}
				
				
				
				
			},
			error : function(data){
				console.log(data)
				alert("서버요청실패");
			}
		}); // ajax 종료 
			 
	}); // function 종료
	
	/* 회원가입 이메일 중복 체크  */
	$('#email_duplicate_button').click(function(){
		$("#email_dup_boolean").attr("checked", true);
		let member_email = $('#memberEmail').val();
		
		$.ajax({
			url : "http://localhost:8080/cafeHi/EmailCheck.do",
			type : "post",
			data : {member_email: member_email},
			dataType : 'json',
			beforeSend : function(xhr){
				xhr.setRequestHeader( "${_csrf.headerName}", "${_csrf.token}" );
			},
			success : function(result){
				if(result == 1){
					member_email = document.getElementById('member_email');
					member_email.value = "";
					$("#email_duplicate_feedback").html('이미 사용중인 이메일입니다.');
					$('#email_duplicate_boolean').attr("checked", false);
					$("#email_duplicate_feedback").attr('color','#dc3545');
				} else{
					$("#email_duplicate_feedback").html('사용할 수 있는 이메일입니다.');
					$('#email_duplicate_boolean').attr("checked", true);
					$("#email_duplicate_feedback").attr('color','#2fb380');
				} 
			},
			error : function(data){
				console.log(data)
				alert("서버요청실패");
			}
		}); // ajax 종료 
			 
	}); // function 종료
	
	var code = "";			// 이메일전송 인증번호 저장을 위한 코드 
	var blank = "";			// 공백 비교, ""로 if문에서 직접 비교 하려 했더니 동작하지 않아서 따로 변수 등록 후 비교 
	
	/* 회원가입 인증번호 이메일 전송 */
	$("#email_check_button").click(function(){
		if(!(document.getElementById('email_duplicate_boolean').checked)){
			alert('중복 확인 되지 않은 이메일에는 인증번호를 전송할 수 없습니다.');
			return false;
		}
		var email = $("#memberEmail").val(); 		// 입력한 이메일
		var checkBox = $(".email_check_input");  // 인증번호 입력란
		var boxWrap = $(".email_check_input_box");  // 인증번호 입력란 박스 
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
				boxWrap.attr("id", "email_check_input_box_true");
				code = data;
			},
			error : function(){
				alert("메일 전송을 하지 못했습니다.");
			}
		});
	});

	
	/* 인증번호 비교 */
	$("#email_num_check").click(function(){
		$("#email_chk_boolean").attr("checked", true);
		var inputCode = $(".email_check_input").val();		// 입력코드
		var checkResult = $("#email_check_input_box_warn");	// 비교 결과
		var checkBoolean = $("#email_check_boolean");
		
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
			if (document.getElementsById('email_check_boolean').checked == true) {
	            console.log('true');

	            } else {
	                console.log('false');
	            }
		}
	});
</script>
</body>
</html>