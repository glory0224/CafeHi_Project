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
<title>카페하이 주문 목록</title>
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
			<c:when test="${orderListCount == 0 }">
			<div>	
        	<h3>주문 목록이 없습니다.</h3>
        	<br>
        	<button type="button" class="btn btn-success" onclick = "location.href='Menu.do'">카페하이 메뉴 보기</button>
        	</div>
    </c:when>

			<c:otherwise>
					<table class="table table-striped" border="1" width="400px">
					
						<tr>
							<th class="table-success">주문 메뉴</th>
							<th class="table-success">주문 메뉴 가격</th>
							<th class="table-success">주문 메뉴 수량</th>
							<th class="table-success">배송비</th>							
							<th class="table-success">총 금액</th>
							<th class="table-success">주문 상태</th>							
							<th class="table-success">주문 날짜</th>							
							<th class="table-success">취소 날짜</th>
						</tr>
						
									
									<c:forEach var="orderMenuList" items="${orderList}" varStatus="status">
									<tr align="center">
										<td>${orderMenuList.menu.menu_name } </td>
										<td> <fmt:formatNumber value="${orderMenuList.menu.menu_price }" pattern="#,###,###"/> 원</td>
										<td>${orderMenuList.total_order_count } 개</td>
									<%-- <td>${orderMenuList.total_order_price } 개</td> --%>
									<c:choose>
										<c:when test="${orderMenuList.order.include_delivery}">
											
											<td>2500원</td>
										</c:when>
										<c:when test="${orderMenuList.order.include_delivery eq false}">
											<td>없음</td>
										</c:when>
									</c:choose>
									
									<td><fmt:formatNumber value="${orderMenuList.total_order_price }" pattern="#,###,###"> </fmt:formatNumber>원</td>									
									<%-- <td><fmt:formatNumber value="${orderMenuList.total_order_count }" pattern="#,###,###"> </fmt:formatNumber>원</td> --%>									
									<c:if test="${orderMenuList.order.order_status eq '주문취소' }">
									<td><b style="color: green;">${orderMenuList.order.order_status }</b></td>
									</c:if>
									<c:if test="${orderMenuList.order.order_status eq '주문완료' }">
									<td>${orderMenuList.order.order_status }</td>
									</c:if>
									
									<!-- java 8 LocalDateTime을 지원하지 않는다. 따라서 jstl 사용시 특정 패턴의 변수로 바꿔준 뒤 사용한다. -->
									<fmt:parseDate value="${orderMenuList.order.order_writetime }" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both"/>								
									<td><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${parseDateTime }"/></td>									
									<c:if test="${orderMenuList.order.order_status eq '주문완료' }">
									<td>
									<form action="CafehiOrderCancel.do" method="post">
									<input type="hidden" name="order_code" value="${orderMenuList.order.order_code}">
									<input type="hidden" name="order_menu_code" value="${orderMenuList.order_menu_code}">									
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">									
									<button class="btn btn-success btn-sm">주문취소</button>
									</form>
									</td>
									</c:if>
									
									<c:if test="${orderMenuList.order.order_status eq '주문취소' }">
										<fmt:parseDate value="${orderMenuList.order.order_updatetime }" pattern="yyyy-MM-dd'T'HH:mm" var="parseCancelDateTime" type="both"/>
										<td><b style="color: green;"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${parseCancelDateTime }"/></b></td>
									</c:if>		
									</tr>
									</c:forEach>
											
						
						
					</table>
					<br>
					<div class="d-flex justify-content-evenly">
					<div class="float-end">
					
					<button type="button" class="btn btn-success" onclick = "location.href='Menu.do'">카페하이 메뉴 보기</button>
					</div>
					</div>
			</c:otherwise>
		</c:choose>
		</div>
	</div>
	
	
	<!--카페 하이 FOOTER -->
	<jsp:include page="/cafeHi_module/footer.jsp" />
</body>
</html>