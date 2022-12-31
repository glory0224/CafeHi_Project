<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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


	<form action="QnAList.do" method="post">
		<main class=" w-50 m-auto">
			<div class="container-fluid px-4">
				<h1 class="mb-4">게시판</h1>

				<div class="card mb-4">

					<div class="card-header">
					
						<!-- 검색 엔진   -->
					<div class="search_area">
						<%-- <select class="btn btn-success" name="qna_select">
							<%if(qna_select == null || qna_select == ""){ %>
							<c:forEach items="${conditionMap }" var="option">
								<option value="${option.value }">${option.key }</option>
							</c:forEach>
						</select>
						<input type="hidden" name="pageNum" value="1">
						<input type="hidden" name="amount" value="10">
						<!-- 서치할 내용의 값을 value에 담아서 넘긴다. -->
						<input class="btn btn-success" type="text" name="qna_search">
						<input class="btn btn-success" type="submit" value="검색"> --%>
						
						<%-- <select  class="btn btn-success" name="type">
							<option value="" <c:out value="${pageDTO.cri.type == null? 'selected' : '' }"/>>--</option>
							<option value="T" <c:out value="${pageDTO.cri.type eq 'T'? 'selected' : '' }"/>>제목</option>
							<option value="C" <c:out value="${pageDTO.cri.type eq 'C'? 'selected' : '' }"/>>내용</option>
							<option value="W" <c:out value="${pageDTO.cri.type eq 'W'? 'selected' : '' }"/>>작성자</option>
							<option value="TC" <c:out value="${pageDTO.cri.type eq 'TC'? 'selected' : '' }"/>>제목 + 내용</option>
							<option value="TW" <c:out value="${pageDTO.cri.type eq 'TW'? 'selected' : '' }"/>>제목 + 작성자</option>
							<option value="TCW" <c:out value="${pageDTO.cri.type eq 'TCW'? 'selected' : '' }"/>>제목 + 내용 + 작성자</option>
						</select> --%>
						
						
						<%-- <input type="hidden" name="type" value="${pageDTO.cri.type }"> --%>
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input class="btn btn-success" type="text" name="keyword" value="${pageDTO.cri.keyword }">
						<button class="btn btn-success">검색</button>
						<!-- <input class="btn btn-success" type="button" value="검색" > -->
						
						
						
						<!--------------------검색 엔진--------------------  -->
						<a class="btn btn-success float-end" href="QnAWritePage.do"> <i
							class="fas fa-edit"></i> 글 작성
						</a>
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

							<c:forEach var="qna" items="${qnaList}">
								<tbody>
									<tr>
										<td>${qna.qna_num }</td>
										<td><a href="getQnA.do?qna_num=${qna.qna_num }"
											style="text-decoration: none; color: black; font-weight: bold;">
												${qna.qna_title }</a></td>
										<td>${qna.member_id }</td>
										<td><fmt:formatDate value="${qna.qna_writetime }"
												pattern="yyyy-MM-dd" /></td>
										<td>${qna.qna_hit }</td>
									</tr>
							</c:forEach>
							
							<!-- 페이징 view  -->
							<tr align="center">
								<td colspan=5 style="border: none; margin-top: 30px;">
								
									<div class="container mt-3">
									<ul class="pagination justify-content-center" >
										<c:if test="${pageDTO.prev }">
										<li class="page-item"><a class="page-link" href="QnAList.do?pageNum=${pageDTO.startPage - 1 }&amount=${pageDTO.amount }" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&laquo;</span> </a></li>
										</c:if>
									<c:forEach var="num" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
									<li class="page-item ">
									<a class="page-link ${pageDTO.pageNum eq num? 'bg-success' : 'text-dark' }" href="QnAList.do?pageNum=${num }&amount=${pageDTO.amount }" style='text-decoration: none; color: white; '>
												<c:out value="${num }"/>
												</a>
									</li>
									</c:forEach>
									<c:if test="${pageDTO.next }">
									<li class="page-item"><a class="page-link" href="QnAList.do?pageNum=${pageDTO.endPage + 1 }&amount=${pageDTO.amount }" style='text-decoration: none; color: black;'>
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
		</main>
	</form>
	<form id="QnAForm" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.cri.amount }">
		<input type="hidden" name="keyword" value="${pageDTO.cri.keyword }">
	</form>
	
	<jsp:include page="/cafeHi_module/footer.jsp"/>

	
	<script type="text/javascript">
	$(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        QnAForm.find("input[name='keyword']").val(val);
        QnAForm.find("input[name='pageNum']").val(1);
        QnAForm.submit();
    });
	</script>
</body>
</html>