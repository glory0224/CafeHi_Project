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
<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

<c:forEach var="latte" items="${latteList }">
      
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${latte.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	<input type="hidden" name="menu_code" value="${latte.menu_code }">
              <p class="card-text text-center">${latte.menu_name }</p>
              <p class="card-text text-center">${latte.menu_explain }</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">구매하기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">장바구니</button>
                </div>
                <small class="text">${latte.menu_price }원</small>
              </div>
            </div>
          </div>
        </div>
</c:forEach>


      </div>

 <!--      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/IceVinilaLatte.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">바닐라 라떼</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">5,000원</small>
              </div>
            </div>
          </div>
        </div>

        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/IceCreamLatte.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">아이스크림 라떼</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">6,000원</small>
              </div>
            </div>
          </div>
        </div>
        
                <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/IceCaffeMoca.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">카페모카</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">4,700원</small>
              </div>
            </div>
          </div>
        </div>
        
                <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/HazelnutLatte.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">헤이즐넛 라떼</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">4,500원</small>
              </div>
            </div>
          </div>
        </div>
        
                <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/DolceLatte.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">돌체 라떼</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">4,700원</small>
              </div>
            </div>
          </div>
        </div>
        
                <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/CitronBianco.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">유자 비앙코</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">5,000원</small>
              </div>
            </div>
          </div>
        </div>
        
                <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="/cafeHi/img/menu/latte/CaramelMacchiato.JPG" width="100%" height="400">
            <div class="card-body">
              <p class="card-text text-center">카라멜 마끼아또</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                </div>
                <small class="text-muted">4,700원</small>
              </div>
            </div>
          </div>
        </div>







      </div> -->

 
</body>
</html>