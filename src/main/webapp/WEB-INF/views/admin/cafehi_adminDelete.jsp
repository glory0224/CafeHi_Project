<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="/cafeHi/js/check.js"></script>
<title>관리자 계정 삭제 페이지</title>
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
	<h3>관리자 계정 탈퇴</h3>
	<form class="container" action="deleteMember.do" method="post" id="memberDeleteForm">
		<div class="m-5">
		<label for="member_id" class="form-label">ID</label>
		<br>
      	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input id="deleteId" class="form-control" type="text" name="member_id"/>
		<br>
		<label for="member_id" class="form-label">Password</label>
		<br>
		<input id="deletePw" class="form-control" type="password" name="member_pw"/>
		</div>
		<div class="d-flex justify-content-end">
		<button class="btn btn-md btn-success " type="button" onclick="button_event()">삭제</button>
		</div>
	</form>
	</div>
</div>
 <jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>