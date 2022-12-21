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

<c:forEach var="coldbrew" items="${coldbrewList }">
      
        <div class="col">
          <div class="card shadow-sm">
			<img alt="" src="${coldbrew.menu_img_path }" width="100%" height="400">
            <div class="card-body">
            	<input type="hidden" name="menu_code" value="${coldbrew.menu_code }">
              <p class="card-text text-center">${coldbrew.menu_name }</p>
              <p class="card-text text-center">${coldbrew.menu_explain }</p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-sm btn-outline-secondary">구매하기</button>
                  <button type="button" class="btn btn-sm btn-outline-secondary">장바구니</button>
                </div>
                <small class="text">${coldbrew.menu_price }원</small>
              </div>
            </div>
          </div>
        </div>
</c:forEach>


      </div>

<!-- <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		<div class="col">
			<div class="card shadow-sm">
				<img alt="" src="/cafeHi/img/menu/coffee/ColdBrew.JPG" width="100%"
					height="400">
				<div class="card-body">
					<p class="card-text text-center">콜드 브루</p>
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
				<img alt="" src="/cafeHi/img/cafehi_logo.jpeg"
					width="100%" height="400">
				<div class="card-body">
					<p class="card-text text-center">스페셜 티(싱글 원두)</p>
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
				<img alt="" src="/cafeHi/img/cafehi_logo.jpeg"
					width="100%" height="400">
				<div class="card-body">
					<p class="card-text text-center">콜드 브루 라떼</p>
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
				<img alt="" src="/cafeHi/img/cafehi_logo.jpeg"
					width="100%" height="400">
				<div class="card-body">
					<p class="card-text text-center">아인 슈페너</p>
					<div class="d-flex justify-content-between align-items-center">
						<div class="btn-group">
							<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
						</div>
						<small class="text-muted">5,500원</small>
					</div>
				</div>
			</div>
		</div>

		<div class="col">
			<div class="card shadow-sm">
				<img alt="" src="/cafeHi/img/cafehi_logo.jpeg"
					width="100%" height="400">
				<div class="card-body">
					<p class="card-text text-center">콜드 브루 (병)</p>
					<div class="d-flex justify-content-between align-items-center">
						<div class="btn-group">
							<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
						</div>
						<small class="text-muted">15,000원</small>
					</div>
				</div>
			</div>
		</div>
 -->




	</div>
</body>
</html>