<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 계정 정보 페이지</title>
</head>
<body>
<jsp:include page="/cafeHi_module/header.jsp"/>

		<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">관리자 페이지</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">카페하이 관리자 정보 페이지입니다.</p>
		</div>
	</div>
	
	<div class="d-flex justify-content-center">
<div class="float-start mt-5 p-5">
<jsp:include page="/cafeHi_module/adminPageNav.jsp"/>
</div>
<div class="w-50 m-auto" style="padding-top: 5%">
	<input name="userSeq" value="<sec:authentication property="principal.member.member_code"/>" type="hidden" />
  <div class="m-5">
    <label for="userId" class="form-label">아이디</label>
  	<h3><b><sec:authentication property="principal.member.member_id"/></b></h3>
  </div>
    <div class="m-5">
    <label for="userName" class="form-label">이름</label>
  	<h3><b><sec:authentication property="principal.member.member_name"/></b></h3>
  </div>
  <div class="m-5">
    <label for="contact" class="form-label">연락처</label>
  	<h3><b><sec:authentication property="principal.member.member_contact"/></b></h3>
  </div>
  <div class="m-5">
    <label for="contact" class="form-label">이메일</label>
  	<h3><b><sec:authentication property="principal.member.member_email"/></b></h3>
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
<div style="padding-right: 30px">
</div>
</div>
</div>
</div>

<jsp:include page="/cafeHi_module/footer.jsp" />
</body>
</html>