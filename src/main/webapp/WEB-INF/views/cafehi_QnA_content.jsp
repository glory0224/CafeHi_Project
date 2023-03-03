<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<jsp:include page="/cafeHi_module/header.jsp" />


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
								<th>작성자</th>
								<td>${QnA.member_id }</td>
								<th>조회수</th>
								<td>${QnA.qna_hit }</td>
							</tr>

							<tr>
								<th>작성일</th>
								<fmt:parseDate value="${QnA.qna_writetime }"
									pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both"></fmt:parseDate>
								<td><fmt:formatDate value="${parseDateTime }"
										pattern="yyyy.MM.dd HH:mm" /></td>
								<c:choose>
									<c:when test="${QnA.upload_path == 'none' }">
										<th>첨부파일</th>
										<td>${QnA.upload_file_name }</td>
									</c:when>
									<c:otherwise>
										<th>첨부파일</th>
										<td><button
												style="text-decoration: underline; border: none; font-weight: bold; background-color: transparent;"
												onclick="fileDown()">${QnA.upload_file_name }</button></td>

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
										<td colspan="3"><c:if
												test="${QnA.qna_title_classification ne 'none' }">
												<b>${QnA.qna_title_classification }</b> &nbsp; </c:if>${QnA.qna_title }</td>
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
							<input class="btn btn-success" type="button" value="목록"
									onclick="location.href='QnAList.do'">
							</div>
							 &nbsp;

				<!-- 로그인 중인 사용자 분류 -->

						<sec:authorize access="hasAnyRole('ROLE_USER')">
							<c:if test="${QnA.member_id eq  securityId }">
							  
							<div class="justify-content-between">
								<form action="DeleteQnA.do" method="post">
									<input class="btn btn-success" type="submit" value="삭제"
										onclick="alert('정말로 삭제하시겠습니까?');">
									<input type="hidden" name="qna_num" value="${QnA.qna_num }">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />								
								</form>
							</div>
							 &nbsp;
							<div class="justify-content-between">
								<input class="btn btn-success" type="button" value="수정"
									onclick="location.href='QnAUpdate.do?qna_num=${QnA.qna_num}'">
							</div>
							 &nbsp;
							</c:if>
						</sec:authorize>
						
						
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<c:if test="${QnA.member_id eq  securityId }">
							<div class="justify-content-between">
								<input class="btn btn-success" type="button" value="수정"
									onclick="location.href='AdminQnAUpdate.do?qna_num=${QnA.qna_num}'">
							</div>
							&nbsp;
							<div class="justify-content-between">
								<form action="AdminDeleteQnA.do" method="post">
									<input class="btn btn-success" type="submit" value="삭제"
										onclick="alert('정말로 삭제하시겠습니까?');">
									<input type="hidden" name="qna_num" value="${QnA.qna_num }">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />		
								</form>
								
							</div>
							&nbsp;
							</c:if>
						</sec:authorize>

						

				</div>
			</div>
		</div>
	
	</main>


	<jsp:include page="/cafeHi_module/footer.jsp" />
</body>


<script type="text/javascript">
	function fileDown() {

		var form = document.createElement("form");

		form.setAttribute("charset", "UTF-8");

		form.setAttribute("method", "Post"); //Post 방식

		form.setAttribute("action", "qnaFileDownload.do"); //요청 보낼 주소

		var upload_path = document.createElement("input");

		var QnAUpload_path = "<c:out value = '${QnA.upload_path}'/>"; // jstl 문법으로 EL 표현식 값을 변수로 받아오는 방식

		upload_path.setAttribute("type", "hidden");

		upload_path.setAttribute("name", "upload_path");

		upload_path.setAttribute("value", QnAUpload_path);

		form.appendChild(upload_path);

		var upload_file_name = document.createElement("input");

		var QnAUpload_file_name = "<c:out value = '${QnA.upload_file_name}'/>";

		upload_file_name.setAttribute("type", "hidden");

		upload_file_name.setAttribute("name", "upload_file_name");

		upload_file_name.setAttribute("value", QnAUpload_file_name);

		form.appendChild(upload_file_name);

		var csrfInput = document.createElement("input");

		var csrfParam = "<c:out value = '${_csrf.parameterName }'/>";
		var csrfToken = "<c:out value = '${_csrf.token }'/>";

		csrfInput.setAttribute("type", "hidden");
		csrfInput.setAttribute("name", csrfParam);
		csrfInput.setAttribute("value", csrfToken);

		form.appendChild(csrfInput);

		document.body.appendChild(form);

		form.submit();

	}
</script>
</html>