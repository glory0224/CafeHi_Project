<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 관리</title>
</head>
<body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
	

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
	<form action="MemberList.do" method="post">
		
			<div class="container-fluid px-4">
				<h1 class="mb-4">회원 관리</h1>

				<div class="card mb-4">

					<div class="card-header">
					
						<!-- 검색 엔진   -->
					<div class="search_area">		
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input class="btn btn-success" type="text" name="keyword" value="${pageDTO.cri.keyword }">
						<button class="btn btn-success">검색</button>					
						<!--------------------검색 엔진--------------------  -->
						
					</div>
					</div>
					<div class="card-body">
						<table class="table  table-striped">
							<thead>
								<tr>
									<th>회원 번호</th>
									<th>회원 아이디</th>
									<th>회원 이름</th>
									<th>회원 연락처</th>
									<th>회원 이메일</th>
									<th>회원 도로명 주소</th>
									<th>회원 지번 주소</th>
									<th>회원 상세 주소</th>
								</tr>
							</thead>

							<c:forEach var="member" items="${memberList}">
								<tbody>
									<tr>
										<td>${member.member_code }</td>
										<td><a href="getQnA.do?qna_num=${member.member_id }"
											style="text-decoration: none; color: black; font-weight: bold;">
												${member.member_name }</a></td>
										<td>${member.member_contact }</td>
										<td>${member.member_email }</td>
										<td>${member.member_road_address }</td>
										<td>${member.member_jibun_address }</td>
										<td>${member.member_detail_address }</td>
									</tr>
							</c:forEach>
							
							<!-- 페이징 view  -->
							<tr align="center">
								<td colspan=5 style="border: none; margin-top: 30px;">
								
									<div class="container mt-3">
									<ul class="pagination justify-content-center" >
										<c:if test="${pageDTO.prev }">
										<li class="page-item"><a class="page-link" href="getMemeberList.do?pageNum=${pageDTO.startPage - 1 }&amount=${pageDTO.amount }" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&laquo;</span> </a></li>
										</c:if>
									<c:forEach var="num" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
									<li class="page-item ">
									<a class="page-link ${pageDTO.pageNum eq num? 'bg-success' : 'text-dark' }" href="getMemeberList.do?pageNum=${num }&amount=${pageDTO.amount }" style='text-decoration: none; color: white; '>
												<c:out value="${num }"/>
												</a>
									</li>
									</c:forEach>
									<c:if test="${pageDTO.next }">
									<li class="page-item"><a class="page-link" href="getMemeberList.do?pageNum=${pageDTO.endPage + 1 }&amount=${pageDTO.amount }" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&raquo;</span></a></li> 
									</c:if>
									</ul>
									</div>
								
								</td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	</form>
</div>
</div>
	<form id="MemberForm" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.cri.amount }">
		<input type="hidden" name="keyword" value="${pageDTO.cri.keyword }">
	</form>
	
	<jsp:include page="/cafeHi_module/footer.jsp"/>

	
	<script type="text/javascript">
	$(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        MemberForm.find("input[name='keyword']").val(val);
        MemberForm.find("input[name='pageNum']").val(1);
        MemberForm.submit();
    });
	</script>
</body>
</html>