<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<meta charset="UTF-8">
<title>카페하이 장바구니</title>
</head>
<body>
	<jsp:include page="/cafeHi_module/header.jsp" />

	<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">마이 페이지</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">환영합니다! 카페하이입니다. 이곳에서 다양한 정보를 조회 하실 수
				있습니다.</p>
		</div>
	</div>

	<div class="d-flex justify-content-center">
		<div class="float-start mt-5 p-5">
			<jsp:include page="/cafeHi_module/myPageNav.jsp" />
		</div>
		<div class="w-50 m-auto" style="padding-top: 5%">
		<c:choose>
			<c:when test="${map.count == 0 }">
			<div>	
        	<h3>장바구니가 비었습니다.</h3>
        	<br>
        	<button type="button" class="btn btn-success" onclick = "location.href='Menu.do'">카페하이 메뉴 보기</button>
        	</div>
    </c:when>

			<c:otherwise>
				<!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
				<!-- form을 실행한다.  -->
				<!-- form의 id를 form1로 하고, method 방식을 post로 한다. 그리고 update.do페이지로 이동시킨다. -->
				<form method="post" action="modifyCart.do">
					<table class="table table-striped" border="1" width="400px">
					
						<tr>
							<th class="table-success">상품명</th>
							<th class="table-success">단가</th>
							<th class="table-success">수량</th>
							<th class="table-success">금액</th>
							<th class="table-success">&nbsp;</th>
						</tr>
						<!-- map에 있는 list출력하기 위해 forEach문을 사용해 row라는 변수에 넣는다. -->
						<c:forEach var="row" items="${map.list}">
							<tr align="center">
								<td>${row.menu_name}</td>

								<td><fmt:formatNumber value="${row.menu_price}"
										pattern="#,###,###" /></td>
								<!-- fmt:formatNumber 태그는 숫자를 양식에 맞춰서 문자열로 변환해주는 태그이다 -->
								<!-- 여기서는 금액을 표현할 때 사용 -->
								<!-- ex) 5,000 / 10,000 등등등-->

								<td><input type="number" name="amount" style="width: 50px; border: none;"
									value="<fmt:formatNumber value="${row.amount}" pattern="#,###,###" />">
									<!-- 물건의 개수 (amount)를 fmt태그를 사용해서 패턴의 형식에 맞춰서 문자열로 변환함 --> <!--1,000 / 5,000 등등~  -->

									<input type="hidden" name="cart_code" value="${row.cart_code}">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />

								</td>
								<td><fmt:formatNumber value="${row.money}"
										pattern="#,###,###" /></td>
								<td><%-- <button><a href="deleteCart.do?cart_code=${row.cart_code}">삭제</a></button> --%>
								<button type="button" class="btn btn-success btn-sm" onclick = "location.href='deleteCart.do?cart_code=${row.cart_code}'">삭제</button>
									<!-- 삭제 버튼을 누르면 delete.do로 장바구니 개별 id (삭제하길원하는 장바구니 id)를 보내서 삭제한다. -->
								</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="right">장바구니 금액 합계 : <fmt:formatNumber
									value="${map.sumMoney}" pattern="#,###,###" /><br> 배송료 :
								${map.fee}<br> 총합계 : <fmt:formatNumber value="${map.sum}"
									pattern="#,###,###" />
							</td>
						</tr>
					</table>
					<br>
					<div class="d-flex justify-content-evenly">
					<div class="float-end">
					
					<button class="btn btn-success">수정</button>
					<button type="button" class="btn btn-success" onclick = "location.href='deleteCartAll.do'">장바구니 비우기</button>
					<button type="button" class="btn btn-success" onclick = "location.href='Menu.do'">카페하이 메뉴 보기</button>
					<!-- btnUpdate와 btnDelete id는 위쪽에 있는 자바스크립트가 처리한다. -->
					</div>
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	
	
	<!--카페 하이 FOOTER -->
	<jsp:include page="/cafeHi_module/footer.jsp" />
</body>

</html>