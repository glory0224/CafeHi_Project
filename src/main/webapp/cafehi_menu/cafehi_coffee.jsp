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

<c:forEach var="coffee" items="${coffeeList }">
      
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coffee.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	<input type="hidden" name="menu_code" value="${coffee.menu_code }">
              <p class="card-text text-center">${coffee.menu_name }</p>
              <p class="card-text text-center">${coffee.menu_explain }</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">구매하기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">장바구니</button>
                </div>
                <small class="text">${coffee.menu_price }원</small>
              </div>
            </div>
          </div>
        </div>
</c:forEach>


      </div>

 
</body>
</html>