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
    <p><label for="user_name" class="form-label">이름</label></p>
    <input type="text" id="user_name" class="form-control" placeholder="이름을 입력하세요." name="user_name">
  </div>

  <div class="m-5">
    <p><label for="user_contact" class="form-label">연락처</label></p>
    <input type="text" id="user_contact" class="form-control" placeholder="연락처를 입력하세요." name="user_contact"  maxlength= 13">
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

