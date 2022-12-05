<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi 게시글 수정</title>
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

<%-- 	<%
	
	String n = request.getParameter("num");
	if (n == null || n == "") {
		response.sendRedirect("cafehi_QnA_board.jsp");
		return;
	}

	int num = 0;

	// 숫자 형태 타입 이외의 데이터 타입이 들어올 경우에 예외 처리
	try {
		num = Integer.parseInt(n);
	} catch (Exception e) {
		response.sendRedirect("cafehi_QnA_board.jsp");
		return;
	}
	
	//db에서 해당 유저의 게시글 정보 받아온다.
	QnADAO qnaDao = new QnADAO();
	QnADTO qna = qnaDao.selectNum(num);
	
	//정보가 없다면 QnA 게시글 목록으로 이동
	if(qna == null){
		response.sendRedirect("cafehi_QnA_board.jsp");
		return;
	}
	%> --%>
	<div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 mt-4 "></div>
		<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
		<h1 class="display-4 fw-normal">QnA 게시판</h1>
		<div
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
		<p class="fs-5 text-muted">문의 사항을 게시글에 남겨주세요!</p>
	</div>
	
	<form action="QnAUpdate.do" method="post">
		<main class="mt-5 pt-5 w-50 m-auto">
		<div class="container-fluid px-4">
			<h1 class="mb-4">게시글 수정</h1>

			<div class="card mb-4">
				<div class="card-body">
					<!--게시글 번호를 hidden으로 넘겨준다.  -->
					<input type="hidden" name="qna_num" value="${QnA.qna_num }">
					<table class="table table-striped">
							<tr>
								<th>작성자</th><td>${QnA.user_id }</td>
								<th>조회수</th><td>${QnA.qna_hit }</td>
							</tr>
							
							<tr>
								<th>작성일</th><td><fmt:formatDate value="${QnA.qna_writetime }" pattern="yyyy-MM-dd"/></td>
								<c:choose>
									<c:when test="${QnA.upload_path eq null }">
										<th>첨부파일</th><td>없음</td>
									</c:when>
									<c:otherwise>
										<th>첨부파일</th>
										<td onclick="location.href='cafehi_fileDown.jsp?fileName=${QnA.upload_path} &writeId=${QnA.user_id }'">${QnA.upload_path }</td>
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
									<td colspan="3"><input type="text"  value="${QnA.qna_title }" size=100 name="qna_title"></td>
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
									<td colspan="3"><textarea rows="20" cols="100" name="qna_content">${QnA.qna_content }</textarea></td>
								</c:otherwise>
								
							</c:choose>
							</tr>
						</table>
						</div>
 						<div class="d-flex flex-row-reverse bd-highlight">
							<div class="justify-content-between">
							<input class="btn btn-success" type="submit" value="수정">
							<button type="button" class="btn btn-success" onclick = "location.href='javascript:history.back();'">이전</button>
							
							</div>

						</div>
						</div>
						</div>
	</main>

</form>
	<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>