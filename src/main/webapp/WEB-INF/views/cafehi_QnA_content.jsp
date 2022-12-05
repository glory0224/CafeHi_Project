<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
<%-- 	<%
		String number = request.getParameter("num");
		
		int num = 0;
		// 넘어오는 파라미터가 문자열이거나 일부러 지워서 넘기는 등등 다양하게 넘어올 수 있기 때문에 예외 처리 
		try{
		 num  = Integer.parseInt(number);
		}catch(Exception e){
			// 그런 경우에는 게시글 목록으로 강제 이동
			response.sendRedirect("cafehi_QnA_board.jsp");
			return;
		}
		QnADAO qnaDao = new QnADAO();
		// 게시글 번호를 조회해서 게시글에 해당하는 데이터를 DTO에 담아서 반환 
		QnADTO qna = qnaDao.selectNum(num);
		// 받아온 데이터가 해당 게시글 목록 범위를 넘어가는 수이거나 음수와 같은 데이터를 null check한다.
		if(qna == null){
			response.sendRedirect("cafehi_QnA_board.jsp");
			return;
		}
		
		

		
		
	%> --%>
	
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
								<th>작성자</th><td>${QnA.user_id }</td>
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
									<td colspan="3"><input type="text"  value="${QnA.qna_title }" size=100 readonly></td>
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
							<%-- <%if(qna.getId().equals(session.getAttribute("userId"))){ %> --%>
							<c:if test="${QnA.user_id eq  sessionScope.UserId }">
							<input class="btn btn-success" type="button" value="수정" onclick="location.href='QnAUpdate.do?qna_num=${QnA.qna_num}'">
							<input class="btn btn-success" type="button" value="삭제" onclick="alert('정말로 삭제하시겠습니까?'); location.href='DeleteQnA.do?qna_num=${QnA.qna_num}'">
							</c:if>
							<%-- <%} %> --%>
							<input class="btn btn-success" type="button" value="목록" onclick="location.href='QnAList.do'">
							</div>

						</div>
						</div>
						</div>
	</main>
	
	
	<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>