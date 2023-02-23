<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<title>카페하이 주문</title>
</head>
<body>
<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="w-50 m-auto p-5">
<form class="container" action="CafehiOrder.do" method="post" id="orderForm">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	<h1 class="text-center m-5">카페 하이 주문</h1>	
	<input name="member_code" value="<sec:authentication property="principal.member.member_code"/>" type="hidden" />
	<input name="menu_code" value="${Menu.menu_code }" type="hidden" />

<!-- 주문 정보 처리 -->

  <h2 class="m-5" style="text-align: center"><b>주문 정보</b></h2>
  <div class="m-5">
    <label for="userId" class="form-label">고객명</label>
  	<h3><b><sec:authentication property="principal.member.member_name"/></b></h3>
  </div>
    <div class="m-5">
    <label for="menu_name" class="form-label">상품명</label>
  	<h3><b>${Menu.menu_name }</b></h3>
  	<input type="hidden" name="menu_name" value="${Menu.menu_name }">
  </div>
  <div class="m-5">
    <label for="menu_price" class="form-label">상품가격</label>
  	<h3><b>${Menu.menu_price } 원</b></h3>
  	<input type="hidden" name="menu_price" value="${Menu.menu_price }">
  </div>
  <div class="m-5">
    <label for="total_order_count" class="form-label">수량</label>
  	<h3><b>${orderAmount } 개</b></h3>
  	<input type="hidden" name=total_order_count value="${orderAmount }">
  </div>
  <br>
  <h2 class="m-5" style="text-align: center"><b>배송지 정보</b></h2>
  <br>
  <div class="m-5">
    <label for="address" class="form-label">도로명 주소</label>
  	<h3><b><sec:authentication property="principal.member.member_road_address"/></b></h3>
  </div>
  <div class="m-5">
    <label for="address" class="form-label">지번 주소</label>
  	<h3><b><sec:authentication property="principal.member.member_jibun_address"/></b></h3>
  </div>
  <div class="m-5">
    <label for="address" class="form-label">상세 주소</label>
  	<h3><b><sec:authentication property="principal.member.member_detail_address"/></b></h3>
  </div>
  <br>
  
<!-- 결제 처리  -->

  <h2 class="m-5" style="text-align: center"><b>결제 정보</b></h2>
   <br>
   <div class="m-5">
    <label for="order_price" class="form-label">주문 가격</label>
  	<h3><b>${Menu.menu_price * orderAmount} 원</b></h3>
  </div>
 
  <div class="m-5">
    <label for="deliveryFee" class="form-label">배송비 </label> <p style="color: red">배송비는 주문 가격 30000원 이상부터 무료입니다.</p>
  	<c:if test="${(Menu.menu_price * orderAmount) lt 30000 }">
  	<h3><b>2500 원</b></h3>
  	<input type="hidden" name="deliveryFee" value="2500">
  	<input type="hidden" name="include_delivery" value="1"> 	
 	 </c:if>
 	 <c:if test="${(Menu.menu_price * orderAmount) ge 30000 }">
 	 	<h3><b>무료</b></h3>
 	 	<input type="hidden" name="include_delivery" value="0">
 	 </c:if>
  </div>
  
  <div class="m-5">
  	<label for="total_price" class="form-label">총 금액 </label>
  		<c:if test="${(Menu.menu_price * orderAmount) lt 30000 }">
  		<h3><b>${ (Menu.menu_price * orderAmount) + 2500 } 원</b></h3>
  		<c:set var="totalPrice" value="${ (Menu.menu_price * orderAmount) + 2500 }"/>
  		</c:if>
  		<c:if test="${(Menu.menu_price * orderAmount) ge 30000 }">
  		<h3><b>${ Menu.menu_price * orderAmount } 원</b></h3>
  		<c:set var="totalPrice" value="${ Menu.menu_price * orderAmount }"/>
  		</c:if>
  </div>
  
<!-- 멤버쉽 포인트 처리 --> 
 <div class="m-5">
  <c:choose>
  	<c:when test="${Membership.membership_grade eq 'VIP' and Membership.membership_point ge 15000}">
  		 <label for="membership_grade" class="form-label">내 멤버쉽 등급</label>
  		 <h3><b>VIP</b></h3>  <br>
  		 <label for="total_price" class="form-label">예상 적립 포인트</label>
  		 <fmt:parseNumber var= "GradeDiscount" integerOnly=" true" value= "${ totalPrice * 0.15 }" pattern="#,###"/>
  		 <h3><b><c:out value="${GradeDiscount }"></c:out> Point</b></h3> <br>
  		 <input type="hidden" name="membership_update_point" value="${GradeDiscount }">
  		<label for="membership_point" class="form-label">내 포인트</label>
  		<h3><b>${Membership.membership_point} Point</b></h3>
  		<input type="hidden" name="membership_point" value="${Membership.membership_point}">
  	</c:when>
  	<c:when test="${Membership.membership_grade eq 'GOLD' and Membership.membership_point ge 10000 }">
  		<label for="membership_grade" class="form-label">내 멤버쉽 등급</label>
  		<h3><b>GOLD</b></h3> <br>
  		<label for="total_price" class="form-label">예상 적립 포인트</label> 
  		 <fmt:parseNumber var= "GradeDiscount" integerOnly=" true" value= "${ totalPrice * 0.1 }" pattern="#,###"/>
  		 <h3><b><c:out value="${GradeDiscount }"></c:out> Point</b></h3> <br>
  		  <input type="hidden" name="membership_update_point" value="${GradeDiscount }">
  		<label for="membership_point" class="form-label">내 포인트</label>
  		<h3><b>${Membership.membership_point} Point</b></h3>
  		<input type="hidden" name="membership_point" value="${Membership.membership_point}">
  	</c:when>
  	<c:when test="${Membership.membership_grade eq 'SILVER'  and Membership.membership_point ge 5000 }">
  		<label for="membership_grade" class="form-label">내 멤버쉽 등급</label>
  		<h3><b>SILVER</b></h3>  <br>
  		<label for="total_price" class="form-label">예상 적립 포인트</label>
  		 <fmt:parseNumber var= "GradeDiscount" integerOnly=" true" value= "${ totalPrice * 0.05 }" pattern="#,###"/>
  		 <h3><b><c:out value="${GradeDiscount }"></c:out> Point</b></h3>  <br>
  		 <input type="hidden" name="membership_update_point" value="${GradeDiscount }">
  		<label for="membership_point" class="form-label">내 포인트</label>
  		<h3><b>${Membership.membership_point} Point</b></h3>
  		<input type="hidden" name="membership_point" value="${Membership.membership_point}">
  	</c:when>
  	<c:when test="${Membership.membership_grade eq 'STANDARD'  and Membership.membership_point lt 5000 and Membership.membership_point ge 0 }">
  		<label for="membership_grade" class="form-label">내 멤버쉽 등급</label>
  		<h3><b>STANDARD</b></h3> <br>
  		<label for="total_price" class="form-label">예상 적립 포인트</label>
  		 <fmt:parseNumber var= "GradeDiscount" integerOnly=" true" value= "${ totalPrice * 0.03 }" pattern="#,###"/>
  		 <h3><b><c:out value="${GradeDiscount }"></c:out> Point</b></h3>  <br>
  		 <input type="hidden" name="membership_update_point" value="${GradeDiscount }">
  		<label for="membership_point" class="form-label">내 포인트</label>
  		<h3><b>${Membership.membership_point} Point</b></h3>
  		<input type="hidden" name="membership_point" value="${Membership.membership_point}">
  	</c:when>
  </c:choose>
  	
  </div> 		
  	
<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input id="signup" class="btn btn-md btn-success " type="submit" value="주문하기">
      </div>
</div>
</form>

</div>
<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>