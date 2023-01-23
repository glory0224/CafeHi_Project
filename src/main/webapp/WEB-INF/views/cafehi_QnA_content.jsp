<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi 게시글</title>
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
	

		<div
		class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 mt-4 "></div>
	<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
		<h1 class="display-4 fw-normal">QnA 게시판</h1>
		<div
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
		<p class="fs-5 text-muted">문의 사항을 게시글에 남겨주세요!</p>
	</div>
	<main class="mt-5 pt-5 w-50 m-auto">
		<div class="container-fluid px-4">
			<h1 class="mb-4">게시글</h1>

			<div class="card mb-4">
				<div class="card-body">
					<table class="table table-striped">
							<tr>
								<th>작성자</th><td>${QnA.member_id }</td>
								<th>조회수</th><td>${QnA.qna_hit }</td>
							</tr>
							
							<tr>
								<th>작성일</th><td><fmt:formatDate value="${QnA.qna_writetime }" pattern="yyyy-MM-dd"/></td>
								<c:choose>
									<c:when test="${QnA.fileName eq null }">
										<th>첨부파일</th><td>없음</td>
									</c:when>
									<c:otherwise>
										<th>첨부파일</th>
										<!-- url encoding 문제로 인해 c:url 태그 사용  -->
										<c:url value="getFile.do" var="url">
											<c:param name="upload_path" value="${QnA.upload_path }"/>
											<c:param name="fileName" value="${QnA.fileName }"/>
										</c:url>
										<td><a href="${url }">${QnA.fileName }</a> </td>
										
										
									</c:otherwise>
								</c:choose>
							</tr>
							<tr>
							<c:choose>
								<c:when test="${QnA.qna_title eq null }">
									<th>제목</th>
									<td>없음</td>
								</c:when>
								<c:otherwise>
									<th>제목</th>
									<td colspan="3"><c:if test="${QnA.classification ne null }">${QnA.classification } &nbsp; </c:if>${QnA.qna_title }</td>
								</c:otherwise>
								
							</c:choose>
							</tr>
							<tr>
									<c:choose>
								<c:when test="${QnA.qna_title eq null }">
									<th>제목</th>
									<td>없음</td>
								</c:when>
								<c:otherwise>
									<th>제목</th>
									<td colspan="3"><textarea rows="20" cols="100" readonly>${QnA.qna_content }</textarea></td>
								</c:otherwise>
								
							</c:choose>
							</tr>
						</table>
						</div>
 						<div class="d-flex flex-row-reverse bd-highlight">
						<div class="justify-content-between">
						<sec:authorize access="isAnonymous()">
							<input class="btn btn-success" type="button" value="목록" onclick="location.href='QnAList.do'">
						</sec:authorize>

						<!-- 로그인 중인 사용자 분류 -->
						
						<sec:authorize access="hasAnyRole('ROLE_USER')">
							<c:if test="${QnA.member_id eq  securityId }">
							<input class="btn btn-success" type="button" value="수정" onclick="location.href='QnAUpdate.do?qna_num=${QnA.qna_num}'">
							<input class="btn btn-success" type="button" value="삭제" onclick="alert('정말로 삭제하시겠습니까?'); location.href='DeleteQnA.do?qna_num=${QnA.qna_num}'">
							<input class="btn btn-success" type="button" value="목록" onclick="location.href='QnAList.do'">
							</c:if>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<c:if test="${QnA.member_id eq  securityId }">
							<input class="btn btn-success" type="button" value="수정" onclick="location.href='AdminQnAUpdate.do?qna_num=${QnA.qna_num}'">
							<input class="btn btn-success" type="button" value="삭제" onclick="alert('정말로 삭제하시겠습니까?'); location.href='DeleteQnA.do?qna_num=${QnA.qna_num}'">
							<input class="btn btn-success" type="button" value="목록" onclick="location.href='QnAList.do'">
							</c:if>
						</sec:authorize>
					
						</div>

						</div>
						</div>
						</div>
	</main>
	
	
	<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>