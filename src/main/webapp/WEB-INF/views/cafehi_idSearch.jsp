<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페하이 아이디 찾기</title>

<!--https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=thgml4814&logNo=220230382339 참고하기  -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  

</head>
<body>



<h2 class="text-center mt-4">CAFEHi 아이디 찾기</h2>

<form class="container" action="/idSearch.do" method="post" id="idSearchForm">
  <div class="m-5">
    <p><label for="user_email_id" class="form-label">가입한 계정의 이메일을 입력하세요.</label></p>
    <div class="d-flex justify-content-between">
    <input type="text" id="authEmail" class="form-control" placeholder="가입한 계정의 이메일을 입력하세요." name="member_email">&nbsp;
    </div>
    <br>
  </div>
	
<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input class="btn btn-md btn-success " type="button" value="아이디 찾기" onclick="idSearch();">
     </div>
</div>


</form>

</body>
<script src="/cafeHi/js/idSearch.js"></script> 

<script>
var code = "";			// 이메일전송 인증번호 저장을 위한 코드 
var blank = "";			// 공백 비교, ""로 if문에서 직접 비교 하려 했더니 동작하지 않아서 따로 변수 등록 후 비교 

/* 회원가입 했던 인증번호 이메일 전송 */
window.document.getElementById("#mail-Check-Btn").click(function(){
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

</script>

</html>

