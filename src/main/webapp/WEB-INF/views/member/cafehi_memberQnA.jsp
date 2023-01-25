<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 QnA</title>
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
<div class="d-flex justify-content-center">
<div class="float-start mt-5 p-5">
	<jsp:include page="/cafeHi_module/myPageNav.jsp"/>
</div>
	<div class="w-50 m-auto" style="padding-top: 5%">
	 <div class="m-5">
    <h3>나의 QnA</h3>
  	
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

							<c:forEach var="myQnA" items="${myQnAList}">
								<tbody>
									<tr>
										<td>${myQnA.qna_num }</td>
										<td><a href="getQnA.do?qna_num=${myQnA.qna_num }"
											style="text-decoration: none; color: black; font-weight: bold;">
												<c:if test="${myQnA.classification ne null }">${myQnA.classification }&nbsp; </c:if>${myQnA.qna_title }</a></td>
										<td>${myQnA.member_id }</td>
										<td><fmt:formatDate value="${myQnA.qna_writetime }"
												pattern="yyyy-MM-dd" /></td>
										<td>${myQnA.qna_hit }</td>
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