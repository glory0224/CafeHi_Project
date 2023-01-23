<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 게시글 작성 페이지</title>
</head>
<body>
<jsp:include page="/cafeHi_module/header.jsp"/>
	
	<div
		class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
	<div class="pricing-header p-3 pb-md-4 mx-auto text-center">
		<h1 class="display-4 fw-normal">QnA 관리자 게시판</h1>
		<div
			class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
		<p class="fs-5 text-muted">공지할 글을 작성해주세요.</p>
	</div>
	<main class="mt-5 pt-5 w-50 m-auto">
		<div class="container-fluid px-4">
			<h1 class="mb-4">게시글 등록</h1>

			<div class="card mb-4">
				<form action="InsertAdminQnA.do" method="post" 
					 enctype="multipart/form-data" >
					 <input type="hidden" name="member_code" value="<sec:authentication property="principal.member.member_code"/>">
					 <input type="hidden" name="qna_hit" value="0">
					 <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<div class="card-body">
						<table class="table table-striped">
							
							<tr>
								<th>작성자</th>
								<td><input type="text" value="<sec:authentication property="principal.member.member_id"/>" name="member_id"
									readonly="readonly"></td>
								
							</tr>
							<tr>
								<th>분류</th>
								<td>
								<select name="classification">
								<option value="[공지사항]">[공지사항]</option>
								<option value="[긴급공지]">[긴급공지]</option>
								<option value="[업데이트]">[업데이트]</option>
								</select>
								</td>
							</tr>
							<tr>
								
								<th>제목</th>
								<td>
								
								
								<input type="text"  name="qna_title" size="100">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea rows="20" cols="100"  name="qna_content"></textarea></td>
							</tr>

							<tr>
								<th>파일<br>첨부
								</th>
								<td><input type="file" name="uploadfile" ></td>
							</tr>
							
						</table>
					</div>
					<div class="d-flex flex-row-reverse bd-highlight mt- 3 mb-3">
						<div class="justify-content-end">
							<input class="btn btn-success" type="submit" value="작성">
							&nbsp; <input class="btn btn-success" type="button" value="목록"
								onclick="location.href='QnAList.do'">
						</div>
					</div>
				</form>
			</div>
		</div>
	</main>


	<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>