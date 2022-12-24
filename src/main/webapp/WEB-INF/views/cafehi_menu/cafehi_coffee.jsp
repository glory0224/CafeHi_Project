<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="/cafeHi_module/header.jsp"/>
 
	<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">Menu</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">카페 하이의 메뉴를 소개합니다!</p>
		</div>
	</div>

<jsp:include page="/cafeHi_module/cafehi_menuNav.jsp"/> 

<div class="w-50 m-auto mt-4">
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

<c:forEach var="coffee" items="${coffeeList }">
      	
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coffee.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${coffee.menu_name }</p>
              <p class="card-text text-center">${coffee.menu_explain }</p>
              <p class="card-text text-center">${coffee.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">구매하기</button>
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${coffee.menu_code }">
                  <input id="resultAmount" type="hidden" name="StringAmount" >
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input type="submit" class="btn btn-sm btn-outline-secondary" value="장바구니">
                  <!-- <input type="button" class="btn btn-sm btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#member_cart_modal" value="장바구니"> -->
				  </form>	                
                </div>
           
								<input type='button' onclick='count("plus")' value='+' /> 
								<input type='button' onclick='count("minus")' value='-' />
								<span id='result'>0</span><p>개</p>
								
              </div>
            </div>
          </div>
        </div>
        
</c:forEach>


      </div>   
</div>

<%-- <c:forEach var="coffee" items="${coffeeList }">
<div class="modal fade" id="member_cart_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="insertCart.do" method="post" id="cartForm">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"> ${coffee.menu_name }를 얼마나 담으시겠어요? </h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<input type="hidden" name="menu_code" value="${coffee.menu_code }">
      	<input id="resultAmount" type="hidden" name="StringAmount" >
      	<input type='button' onclick='count("plus")' value='+' /> <input
									type='button' onclick='count("minus")' value='-' />
								<span id='result'>0</span><p>개</p>
								<input id="amountResult" type="hidden" name="amount" >
      	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" /> 
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="담기">
      </div>
    </div>
     </form>
  </div>
</div>
</c:forEach> --%>
    <jsp:include page="/cafeHi_module/footer.jsp"/>
    
<script type="text/javascript">
function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result'); 
	 
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number > 0)  {
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  document.getElementById('resultAmount').value = resultElement.innerText; 
	}
</script>
</body>
</html>