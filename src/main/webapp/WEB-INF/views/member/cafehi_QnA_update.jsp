<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi 게시글 수정</title>
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
</head>
<body>
	<jsp:include page="/cafeHi_module/header.jsp"/>

	<div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 mt-4 "></div>
		<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
		<h1 class="display-4 fw-normal">QnA 게시판</h1>
		<div
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
		<p class="fs-5 text-muted">문의 사항을 게시글에 남겨주세요!</p>
	</div>
	
	<form action="QnAUpdate.do" method="post" enctype="multipart/form-data" id="updateQnAForm">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		<input type="hidden" id="page"  name="page" value="${scri.page }" readonly="readonly">
		<input type="hidden" id="perPageNum"  name="perPageNum" value="${scri.perPageNum }" readonly="readonly">
		<input type="hidden" id="searchType" name="searchType" value="${scri.searchType }" readonly="readonly">
		<input type="hidden" id="keyword" name="keyword" value="${scri.keyword }" readonly="readonly">
		
		<main class="mt-5 pt-5 w-50 m-auto">
		<div class="container-fluid px-4">
			<h1 class="mb-4">게시글 수정</h1>

			<div class="card mb-4">
				<div class="card-body">
					<!--게시글 번호를 hidden으로 넘겨준다.  -->
					<input type="hidden" name="qna_num" value="${QnA.qna_num }">
					<input type="hidden" name="upload_path" value="${QnA.upload_path }">
					
					<table class="table table-striped">
							<tr>
								<th>작성자</th><td>${QnA.member_id }</td>
								<th>조회수</th><td>${QnA.qna_hit }</td>
							</tr>
							
							<tr>
								<th>작성일</th>
								<fmt:parseDate value="${QnA.qna_writetime }" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both"></fmt:parseDate>
								<td><fmt:formatDate value="${parseDateTime }" pattern="yyyy.MM.dd HH:mm" /></td>
								<th>첨부파일</th>
								<td><input type="file" name="uploadfile"></td>
								
							</tr>
							<tr>
							<c:choose>
								<c:when test="${QnA.qna_title eq null }">
									<th>제목</th>
									<td>없음</td>
								</c:when>
								<c:otherwise>
									<th>제목</th>
									<td colspan="3"><input type="text"  value="${QnA.qna_title }" size=100 name="qna_title"></td>
								</c:otherwise>
								
							</c:choose>
							</tr>
							<tr>
									<c:choose>
								<c:when test="${QnA.qna_content eq null }">
									<th>내용</th>
									<td>없음</td>
								</c:when>
								<c:otherwise>
									<th>내용</th>
									<td colspan="3"><textarea rows="20" cols="100" name="qna_content">${QnA.qna_content }</textarea></td>
								</c:otherwise>
								
							</c:choose>
							</tr>
						</table>
						</div>
 						<div class="d-flex flex-row-reverse bd-highlight">
							<div class="justify-content-between">
							<button class="btn btn-success" onclick="document.getElementById('updateQnAForm').submit();">수정</button>
							<input class="btn btn-success" type="button" value="목록" id="updateToList_btn">
							
							</div>

						</div>
						</div>
						</div>
						
	</main>

</form>


	<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
<script type="text/javascript">
	$.ajax({
	   url: path ,
	   type: 'get',
	   contentType: "application/json",
	   data: {
	   },
	   success: function(data) {
	      alert("성공");
	   },
	   error: function(xhr, error, msg) {
	      console.log(xhr);
	      console.log(error);
	      console.log(msg);
	   },
	   dataType: 'json'
	})
	
	
	
	// 목록 버튼 클릭
	$("#updateToList_btn").click(function(){
		self.location = "/cafeHi/QnAList.do?"
				+ "page=${scri.page}&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
	});
</script>
</html>