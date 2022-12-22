<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
<div class="d-flex justify-content-center">

	<!-- 카페하이 메뉴 탭  -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="coffee-tab" data-bs-toggle="tab"
				aria-selected="false" type="button" role="tab" 
				onclick="location.href='coffeeList.do'">커피</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="coldbrew-tab" data-bs-toggle="tab"
				 type="button" role="tab"
				 aria-selected="false" onclick="location.href='coldbrewList.do'">콜드브루</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="latte-tab" data-bs-toggle="tab"
				type="button" role="tab"
				 aria-selected="false" onclick="location.href='latteList.do'">라떼</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="smoothie-tab" data-bs-toggle="tab"
				 type="button" role="tab"
				 aria-selected="false" onclick="location.href='smoothieList.do'">스무디</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="side-tab" data-bs-toggle="tab"
				 type="button" role="tab"
				 aria-selected="false" onclick="location.href='sideList.do'">사이드&브런치</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="beverage-tab" data-bs-toggle="tab"
				 type="button" role="tab"
				 aria-selected="false" onclick="location.href='beverageList.do'">음료</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="fruit-tab" data-bs-toggle="tab"
				 type="button" role="tab"
				 aria-selected="false" onclick="location.href='fruitJuiceList.do'">생과일주스</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tea-tab" data-bs-toggle="tab"
				 type="button" role="tab"
				 aria-selected="false" onclick="location.href='teaList.do'">차</button>
		</li>
	</ul>
</div>
</body>
</html>