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

<!-- 카페 하이 헤더  -->   
<jsp:include page="/cafeHi_module/header.jsp"/>



<form class="container m-auto w-50 p-50" action="idSearch.do" method="post" id="idSearchForm">
<img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
<h2 class="text-center mt-4">CAFE Hi 아이디 찾기</h2>
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
  <div class="m-5">
    <p><label for="user_email_id" class="form-label">가입한 계정의 이메일을 입력하세요.</label></p>
    <div class="d-flex justify-content-between">
    <input type="text" id="authIdEmail" class="form-control" placeholder="가입한 메일 ID @ 가입한 메일 주소" name="member_email">&nbsp;
    </div>
    <br>
  </div>
	
<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input class="btn btn-md btn-success " type="button" value="아이디 찾기" onclick="idSearch();">
     </div>
</div>


</form>
<!--카페 하이 FOOTER -->
<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
<script src="/cafeHi/js/idSearch.js"></script> 

</html>

