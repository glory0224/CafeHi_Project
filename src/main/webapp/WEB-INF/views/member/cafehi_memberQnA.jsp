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
    	<div class="search_area">
					<form action="myQnAInfo.do" method="post">
						<select name="searchType">
							 <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							  <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							  <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						</select> 
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<input class="btn btn-success" type="text" name="keyword" value="${scri.keyword}">
						<button class="btn btn-success" id="searchMyBtn">검색</button>
						<!--------------------검색 엔진--------------------  -->
					</form>
		</div>
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
							<c:when test="${myQnaListSize == 0 }">
								<tbody align="center">	
									<tr>
        							<td colspan="5"><b>게시글이 없습니다.</b></td>
        							</tr>
								</tbody>
							</c:when>
							<c:otherwise>
							<c:forEach var="qna" items="${myQnaList}">
								<tbody>
									<tr>
										<td>${qna.qna_num }</td>
										<td><a href="getQnA.do?qna_num=${qna.qna_num }&
																page=${scri.page}&
																perPageNum=${scri.perPageNum}&
																searchType=${scri.searchType}&
																keyword=${scri.keyword}"
											style="text-decoration: none; color: black; font-weight: bold;">
												<c:if test="${qna.qna_title_classification ne 'none' }">${qna.qna_title_classification }&nbsp; </c:if>${qna.qna_title }</a></td>
										<td>${qna.member.member_id }</td>
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
										<li class="page-item"><a class="page-link" href="myQnAInfo.do${pageMaker.makeQuery(pageMaker.startPage - 1)}" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&laquo;</span> </a></li>
										</c:if>
										
									<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
									<li class="page-item ">
					
												<a class="page-link ${scri.page eq num? 'bg-success' : 'text-dark' }" href="myQnAInfo.do${pageMaker.makeQuery(num)}" style='text-decoration: none; color: white; '>${num }</a>
									</li>
									</c:forEach>
									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class="page-item"><a class="page-link" href="myQnAInfo.do${pageMaker.makeQuery(pageMaker.endPage + 1)}" style='text-decoration: none; color: black;'>
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

 <jsp:include page="/cafeHi_module/footer.jsp"/>
 
<script type="text/javascript">
  $(function(){
	  $('#searchMyBtn').click(function() {
	   self.location = "cafhi_memberQnA"
	     + '${pageMaker.makeQuery(1)}'
	     + "&searchType="
	     + $("select option:selected").val()
	     + "&keyword="
	     + encodeURIComponent($('#keywordInput').val());
	    });
	 }); 
  </script>
</body>
</html>