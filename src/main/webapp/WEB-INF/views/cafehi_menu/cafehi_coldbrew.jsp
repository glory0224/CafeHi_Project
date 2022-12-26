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
<!-- 수량 증가 JavaScript -->
<script src="/cafeHi/js/menu/coldbrewCount.js"></script>
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

      
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coldbrewList0.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${coldbrewList0.menu_name }</p>
              <p class="card-text text-center">${coldbrewList0.menu_explain }</p>
              <p class="card-text text-center">${coldbrewList0.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${coldbrewList0.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="coldbrewAmount0" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='coldbrewCount0' class="m-1">
                  	${coldbrewList0.menu_amount }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList0("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList0("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coldbrewList1.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${coldbrewList1.menu_name }</p>
              <p class="card-text text-center">${coldbrewList1.menu_explain }</p>
              <p class="card-text text-center">${coldbrewList1.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${coldbrewList1.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="coldbrewAmount1" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='coldbrewCount1' class="m-1">
                  	${coldbrewList1.menu_amount }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList1("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList1("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coldbrewList2.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${coldbrewList2.menu_name }</p>
              <p class="card-text text-center">${coldbrewList2.menu_explain }</p>
              <p class="card-text text-center">${coldbrewList2.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${coldbrewList2.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="coldbrewAmount2" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='coldbrewCount2' class="m-1">
                  	${coldbrewList2.menu_amount }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList2("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList2("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coldbrewList3.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${coldbrewList3.menu_name }</p>
              <p class="card-text text-center">${coldbrewList3.menu_explain }</p>
              <p class="card-text text-center">${coldbrewList3.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${coldbrewList3.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="coldbrewAmount3" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='coldbrewCount3' class="m-1">
                  	${coldbrewList3.menu_amount }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList3("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList3("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coldbrewList4.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${coldbrewList4.menu_name }</p>
              <p class="card-text text-center">${coldbrewList4.menu_explain }</p>
              <p class="card-text text-center">${coldbrewList4.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${coldbrewList4.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="coldbrewAmount4" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='coldbrewCount4' class="m-1">
                  	${coldbrewList4.menu_amount }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList4("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countColdBrewList4("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>


  </div>
   </div>

  <!--카페 하이 FOOTER -->
  <jsp:include page="/cafeHi_module/footer.jsp"/>

</body>
</html>