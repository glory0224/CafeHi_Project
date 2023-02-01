<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<title>카페하이 주문</title>
</head>
<body>
<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="w-50 m-auto p-5">
<form class="container" action="CafehiOrder.do" method="post" id="memberForm">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	<h1 class="text-center m-5">카페 하이 주문</h1>
	
	<input name="userSeq" value="<sec:authentication property="principal.member.member_code"/>" type="hidden" />
  <div class="m-5">
    <label for="userId" class="form-label">고객명</label>
  	<h3><b><sec:authentication property="principal.member.member_name"/></b></h3>
  </div>
    <div class="m-5">
    <label for="userName" class="form-label">상품명</label>
  	<h3><b>${Menu.menu_name }</b></h3>
  </div>
  <div class="m-5">
    <label for="contact" class="form-label">상품가격</label>
  	<h3><b>${Menu.menu_price } 원</b></h3>
  </div>
  <div class="m-5">
    <label for="contact" class="form-label">수량</label>
  	<h3><b>${orderAmount } 개</b></h3>
  </div>
  <div class="m-5">
    <label for="address" class="form-label">도로명 주소</label>
  	<h3><b><sec:authentication property="principal.member.member_road_address"/></b></h3>
  </div>
  <div class="m-5">
    <label for="address" class="form-label">지번 주소</label>
  	<h3><b><sec:authentication property="principal.member.member_jibun_address"/></b></h3>
  </div>
  <div class="m-5">
    <label for="address" class="form-label">상세 주소</label>
  	<h3><b><sec:authentication property="principal.member.member_detail_address"/></b></h3>
  </div>
	
	
<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input id="signup" class="btn btn-md btn-success " type="submit" value="주문하기">
      </div>
</div>


</form>
</div>

<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>