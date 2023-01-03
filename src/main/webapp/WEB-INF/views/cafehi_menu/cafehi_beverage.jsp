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
<script src="/cafeHi/js/menu/beverageCount.js"></script>
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
			<img alt="" src="${beverageList0.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList0.menu_name }</p>
              <p class="card-text text-center">${beverageList0.menu_explain }</p>
              <p class="card-text text-center">${beverageList0.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList0.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount0" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount0' class="m-1">
                  	${beverageList0.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList0("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList0("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList1.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList1.menu_name }</p>
              <p class="card-text text-center">${beverageList1.menu_explain }</p>
              <p class="card-text text-center">${beverageList1.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList1.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount1" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount1' class="m-1">
                  	${beverageList1.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList1("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList1("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList2.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList2.menu_name }</p>
              <p class="card-text text-center">${beverageList2.menu_explain }</p>
              <p class="card-text text-center">${beverageList2.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList2.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount2" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount2' class="m-1">
                  	${beverageList2.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList2("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList2("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList3.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList3.menu_name }</p>
              <p class="card-text text-center">${beverageList3.menu_explain }</p>
              <p class="card-text text-center">${beverageList3.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList3.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount3" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount3' class="m-1">
                  	${beverageList3.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList3("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList3("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList4.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList4.menu_name }</p>
              <p class="card-text text-center">${beverageList4.menu_explain }</p>
              <p class="card-text text-center">${beverageList4.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList4.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount4" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount4' class="m-1">
                  	${beverageList4.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList4("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList4("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList5.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList5.menu_name }</p>
              <p class="card-text text-center">${beverageList5.menu_explain }</p>
              <p class="card-text text-center">${beverageList5.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList5.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount5" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount5' class="m-1">
                  	${beverageList5.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList5("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList5("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList6.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList6.menu_name }</p>
              <p class="card-text text-center">${beverageList6.menu_explain }</p>
              <p class="card-text text-center">${beverageList6.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList6.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount6" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount6' class="m-1">
                  	${beverageList6.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList6("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList6("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList7.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList7.menu_name }</p>
              <p class="card-text text-center">${beverageList7.menu_explain }</p>
              <p class="card-text text-center">${beverageList7.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList7.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount7" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount7' class="m-1">
                  	${beverageList7.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList7("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList7("minus")' value='-' />
                  </div>
                 
				</form>		                
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${beverageList8.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	
              <p class="card-text text-center">${beverageList8.menu_name }</p>
              <p class="card-text text-center">${beverageList8.menu_explain }</p>
              <p class="card-text text-center">${beverageList8.menu_price }원</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <input type="button" class="btn btn-sm btn-outline-success" value="구매하기"> &nbsp;
                  <form action="insertCart.do" method="post">
                  <input type="hidden" name="menu_code" value="${beverageList8.menu_code }">
                  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                  <input id="beverageAmount8" type="hidden" name="orderAmount" value="0">
                  <div class="d-flex justify-content-between">
                  <input type="submit" class="btn btn-sm btn-outline-success" value="장바구니 담기">
                   <div id='beverageCount8' class="m-1">
                  	${beverageList8.menu_count }
					</div>
				<input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList8("plus")' value='+' /> &nbsp;
                  <input class="btn btn-sm btn-outline-success" type='button' onclick='countBeverageList8("minus")' value='-' />
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