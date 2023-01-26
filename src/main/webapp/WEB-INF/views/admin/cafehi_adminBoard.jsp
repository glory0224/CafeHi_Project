<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시글 페이지</title>
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
							
							<!-- 페이징 view  -->
							<tr align="center">
								<td colspan=5 style="border: none; margin-top: 30px;">
								
									<div class="container mt-3">
									<ul class="pagination justify-content-center" >
										<c:if test="${pageDTO.prev }">
										<li class="page-item"><a class="page-link" href="AdminQnAInfo.do?pageNum=${pageDTO.startPage - 1 }&amount=${pageDTO.amount }" style='text-decoration: none; color: black;'>
												<span aria-hidden="true">&laquo;</span> </a></li>
										</c:if>
									<c:forEach var="num" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
									<li class="page-item ">
									<a class="page-link ${pageDTO.pageNum eq num? 'bg-success' : 'text-dark' }" href="AdminQnAInfo.do?pageNum=${num }&amount=${pageDTO.amount }" style='text-decoration: none; color: white; '>
												<c:out value="${num }"/>
												</a>
									</li>
									</c:forEach>
									<c:if test="${pageDTO.next }">
									<li class="page-item"><a class="page-link" href="AdminQnAInfo.do?pageNum=${pageDTO.endPage + 1 }&amount=${pageDTO.amount }" style='text-decoration: none; color: black;'>
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
<form id="AdminQnA" method="get">
		<input type="hidden" name="pageNum" value="${pageDTO.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageDTO.cri.amount }">
		<input type="hidden" name="keyword" value="${pageDTO.cri.keyword }">
</form>
	
 <jsp:include page="/cafeHi_module/footer.jsp"/>
 
 <script type="text/javascript">
	$(".search_area button").on("click", function(e){
        e.preventDefault();
        let val = $("input[name='keyword']").val();
        AdminQnA.find("input[name='keyword']").val(val);
        AdminQnA.find("input[name='pageNum']").val(1);
        AdminQnA.submit();
    });
	</script>

</body>
</html>