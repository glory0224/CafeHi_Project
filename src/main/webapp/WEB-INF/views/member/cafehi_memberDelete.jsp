<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHI 회원 탈퇴</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="/cafeHi/js/check.js"></script>
</head>
<body>
<jsp:include page="/cafeHi_module/header.jsp"/>
	<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">마이 페이지</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">환영합니다! 카페하이입니다. 이곳에서 다양한 정보를 조회 하실 수 있습니다.</p>
		</div>
	</div>
<div class="d-flex justify-content-between">
<div class="float-start mt-5 p-5">
	<jsp:include page="/cafeHi_module/myPageNav.jsp"/>
</div>
	<div class="w-50 m-auto" style="padding-top: 5%">
	<h3>회원 탈퇴</h3>
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
		<button class="btn btn-md btn-success " type="button" onclick="button_event()">회원 삭제</button>
		</div>
	</form>
	</div>
</div>
 <jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>