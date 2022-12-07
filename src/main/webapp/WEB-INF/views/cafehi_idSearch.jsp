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
    <input type="text" id="userEmailId" class="form-control" placeholder="이메일 아이디를 입력하세요." name="user_email_id">&nbsp;
    <select class="form-select" aria-label="Default select example" id="userEmailAddress" name="user_email_address" >
    	<option value="">선택</option>
    	<option>@naver.com</option>
    	<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
	 	<option>@yahoo.co.kr</option>
    </select>
    </div>
    <br>
    <div class="d-flex justify-content-end">
    	<button type="button" class="btn btn-sm btn-success" id="mail-Check-Btn">본인인증</button>
    </div>
    <br>
    <div class="mail-check-box">
    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
  	</div>
  	<span id="mail-check-warn"></span>
  </div>
	
<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input class="btn btn-md btn-success " type="button" value="아이디 찾기" onclick="idSearch();">
     </div>
</div>


</form>

</body>
<script src="/cafehi/js/idSearch.js"></script> 

</html>

