<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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

<div class="d-flex justify-content-between">
<div class="float-start mt-5 p-5">		 
<jsp:include page="/cafeHi_module/adminPageNav.jsp"/>
</div>
<img class="w-50 m-auto" style="padding-top: 5%" src="/cafeHi/img/cafehi_view.jpeg">
</div>

<jsp:include page="/cafeHi_module/footer.jsp" />
</body>
</html>