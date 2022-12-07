<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi 로그인</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="/cafeHi/js/check.js"></script>

</head>
<body>

<!-- 카페 하이 헤더  -->   
<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="container">
<div class="m-auto w-50 p-50">
<main class="form-signin">
  <form class="m-auto w-50 p-50" action="login.do" method="post" id="loginForm">
    <img class="mb-4" src="../assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">

    <h1 class="h3 mb-3 fw-normal">로그인</h1><br>
	
    <div class="form-floating">
      <input type="text" class="form-control" id="floatingInput" placeholder="Id" name="user_id">
      <label for="floatingInput">아이디</label>
    </div><br>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="user_pw">
      <label for="floatingPassword">비밀번호</label><br>
    </div>

    <div class="checkbox mb-3">
     <!--  <label>
        <input type="checkbox" value="remember-me"> 로그인 상태 유지
      </label> -->
    </div>
    <!-- <button class="w-100 btn btn-lg btn-success" type="submit">로그인</button><br> -->
    <input class="w-100 btn btn-lg btn-success " type="button" value="로그인" onclick="loginCheck();">
 <div class="d-flex justify-content-evenly" style="margin-top: 20px">
	<span><a href="cafehi_pwSearch.jsp" onclick="window.open('cafehi_pwSearch.jsp','', 'width=800, height=600'); return false;" style="text-decoration: none; color:black">비밀번호 찾기</a></span>
	<!-- window 내장 메소드 open 사용 시 return false;를 해주지 않으면 팝업창이 열리고 해당 페이지도 넘어간다. 그렇기 때문에 return false로 href가 실행되지 않도록 한다. -->
	<span><a href="" onclick="window.open('idSearch.do','', 'width=800, height=600'); return false;" style="text-decoration: none; color:black">아이디 찾기</a></span>
	<span><a href="signup.do" style="text-decoration: none; color:black">회원 가입</a></span>
	</div>
  </form>





</main>
</div>
<!--카페 하이 FOOTER -->
<jsp:include page="/cafeHi_module/footer.jsp"/>

</div>





</body>

</html>