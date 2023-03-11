<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
	
<!-- <script type="text/javascript" src="./js/QnASearch.js"></script> -->
<title>CAFEHI 질문게시판</title>
</head>
<body>
	<jsp:include page="/cafeHi_module/header.jsp"/>

	<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">QnA</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">문의 사항을 게시판에 남겨주세요!</p>
		</div>
	</div>


	
		<main class=" w-50 m-auto">
			<div class="container-fluid px-4">
				<h1 class="mb-4">게시판</h1>

				<div class="card mb-4">

					<div class="card-header">
					
						<!-- 검색 엔진   -->
					
					<div class="search_area">
					<form action="QnAList.do" method="post">
						<select name="searchType">
							 <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							  <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							  <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							  <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select> 
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input class="btn btn-success" type="text" name="keyword" value="${scri.keyword}">
						<button class="btn btn-success" id="searchBtn">검색</button>
						<!--------------------검색 엔진--------------------  -->
					</form>
						<sec:authorize access="hasAnyRole('ROLE_USER')">
						<a class="btn btn-success float-end" href="QnAWritePage.do"> <i
							class="fas fa-edit"></i> 글 작성
						</a>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<a class="btn btn-success float-end" href="QnAAdminWritePage.do"> <i
							class="fas fa-edit"></i> 관리자 글 작성
						</a>
						</sec:authorize>
						
					</div>
					</div>
					<div class="card-body">
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
							
							<c:choose>
							<c:when test="${qnaListSize == 0 }">
								<tbody align="center">	
									<tr>
        							<td colspan="5"><b>게시글이 없습니다.</b></td>
        							</tr>
								</tbody>
							</c:when>
							<c:otherwise>
							<c:forEach var="qna" items="${qnaList}">
								<tbody>
									<tr>
										<td>${qna.qna_num }</td>
										<td><a href="getQnA.do?qna_num=${qna.qna_num }"
											style="text-decoration: none; color: black; font-weight: bold;">
												<c:if test="${qna.qna_title_classification ne 'none' }">${qna.qna_title_classification }&nbsp; </c:if>${qna.qna_title }</a></td>
										<td>${qna.member_id }</td>
										<!-- LocalDateTime format Parse -->
										<fmt:parseDate value="${qna.qna_writetime }" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both"></fmt:parseDate>
										<td><fmt:formatDate value="${parseDateTime }"
												pattern="yyyy.MM.dd HH:mm" /></td>
										<td>${qna.qna_hit }</td>
									</tr>
							</c:forEach>

							<!-- 페이징 view  -->
							<tr align="center">
								<td colspan=5 style="border: none; margin-top: 30px;">
								
									<div class="container mt-3">
									<ul class="pagination justify-content-center" >
										<c:if test="${pageMaker.prev }">
										<li class="page-item"><a class="page-link" href="QnAList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&laquo;</span> </a></li>
										</c:if>
										
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
									<li class="page-item ">
									<%-- <a class="page-link ${pageMaker.pageNum eq num? 'bg-success' : 'text-dark' }" href="QnAList.do?pageNum=${num }" style='text-decoration: none; color: white; '>
												<c:out value="${num }"/>
												</a> --%>
												<a href="QnAList.do${pageMaker.makeQuery(num)}">${num }</a>
									</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link" href="QnAList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&raquo;</span></a></li> 
									</c:if>
									</ul>
									</div>
								
								</td>
							</tr>
							</c:otherwise>
							</c:choose>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>

	
	<jsp:include page="/cafeHi_module/footer.jsp"/>

</body>

<script>
 $(function(){
  $('#searchBtn').click(function() {
   self.location = "listSearch"
     + '${pageMaker.makeQuery(1)}'
     + "&searchType="
     + $("select option:selected").val()
     + "&keyword="
     + encodeURIComponent($('#keywordInput').val());
    });
 });   
 </script>
</html>