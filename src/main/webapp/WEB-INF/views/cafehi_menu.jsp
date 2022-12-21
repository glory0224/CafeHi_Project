<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi Menu</title>

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
 
<div class="d-flex justify-content-center">

	<!-- 카페하이 메뉴 탭  -->
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="coffee-tab" data-bs-toggle="tab"
				data-bs-target="#coffeeMenu" type="button" role="tab" aria-controls="coffeeMenu"
				aria-selected="true">커피</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="coldbrew-tab" data-bs-toggle="tab"
				data-bs-target="#coldbrewMenu" type="button" role="tab"
				aria-controls="coldbrewMenu" aria-selected="false" onclick="location.href='coldbrewList.do'">콜드브루</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="latte-tab" data-bs-toggle="tab"
				data-bs-target="#latteMenu" type="button" role="tab"
				aria-controls="latteMenu" aria-selected="false">라떼</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="smoothie-tab" data-bs-toggle="tab"
				data-bs-target="#smoothieMenu" type="button" role="tab"
				aria-controls="smoothieMenu" aria-selected="false">스무디</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="side-tab" data-bs-toggle="tab"
				data-bs-target="#sideMenu" type="button" role="tab"
				aria-controls="sideMenu" aria-selected="false">사이드&브런치</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="beverage-tab" data-bs-toggle="tab"
				data-bs-target="#beverageMenu" type="button" role="tab"
				aria-controls="beverageMenu" aria-selected="false">음료</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="fruit-tab" data-bs-toggle="tab"
				data-bs-target="#fruitMenu" type="button" role="tab"
				aria-controls="fruitMenu" aria-selected="false">생과일주스</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="tea-tab" data-bs-toggle="tab"
				data-bs-target="#teaMenu" type="button" role="tab"
				aria-controls="teaMenu" aria-selected="false">차</button>
		</li>
	</ul>
</div>
 	
	<!-- 카페하이 메뉴 내용 -->
	<div class="tab-content  w-50 m-auto mt-4" id="myTabContent">

		<div class="tab-pane fade active show" id="coffeeMenu" role="tabpanel"
			aria-labelledby="coffee-tab"><jsp:include page="/cafehi_menu/cafehi_coffee.jsp" /></div>
			
		<div class="tab-pane fade" id="coldbrewMenu" role="tabpanel"
			aria-labelledby="coldbrew-tab"><jsp:include page="/cafehi_menu/cafehi_coldbrew.jsp" /></div>
			
		<div class="tab-pane fade" id="latteMenu" role="tabpanel"
			aria-labelledby="latte-tab"><jsp:include page="/cafehi_menu/cafehi_latte.jsp" /></div>
			
		<div class="tab-pane fade" id="smoothieMenu" role="tabpanel"
			aria-labelledby="smoothie-tab"><jsp:include page="/cafehi_menu/cafehi_smoothie.jsp" /></div>
			
		<div class="tab-pane fade" id="sideMenu" role="tabpanel"
			aria-labelledby="side-tab"><jsp:include page="/cafehi_menu/cafehi_side&bruch.jsp" /></div>
			
		<div class="tab-pane fade" id="beverageMenu" role="tabpanel"
			aria-labelledby="beverage-tab"><jsp:include page="/cafehi_menu/cafehi_beverage.jsp" /></div>
			
		<div class="tab-pane fade" id="fruitMenu" role="tabpanel"
			aria-labelledby="fruit-tab"><jsp:include page="/cafehi_menu/cafehi_fruits juice.jsp" /></div>
			
		<div class="tab-pane fade" id="teaMenu" role="tabpanel"
			aria-labelledby="tea-tab"><jsp:include page="/cafehi_menu/cafehi_tea.jsp" /></div>

</div>

   



    
    <jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>