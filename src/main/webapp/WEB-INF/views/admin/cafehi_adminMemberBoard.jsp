<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 QnA 관리</title>
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
	 <div class="m-5">
    <h1>전체 회원 QnA 목록</h1>
  	
  </div>
    <div class="m-5">
    	<table class="table  table-striped">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>

							<c:forEach var="memberQnA" items="${memberQnAList}">
								<tbody>
									<tr>
										<td>${memberQnA.qna_num }</td>
										<td><a href="getQnA.do?qna_num=${memberQnA.qna_num }"
											style="text-decoration: none; color: black; font-weight: bold;">
												<c:if test="${memberQnA.classification ne null }">${memberQnA.classification }&nbsp; </c:if>${memberQnA.qna_title }</a></td>
										<td>${memberQnA.member_id }</td>
										<td><fmt:formatDate value="${memberQnA.qna_writetime }"
												pattern="yyyy-MM-dd" /></td>
										<td>${memberQnA.qna_hit }</td>
									</tr>
							</c:forEach>
							
							
							</tbody>
						</table>
  	</div>
	</div>
</div>
 <jsp:include page="/cafeHi_module/footer.jsp"/>

</body>
</html>