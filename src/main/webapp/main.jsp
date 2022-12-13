<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CafeHi!</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link href="/cafeHi/css/main.css" rel="stylesheet" >
</head>

<body>

<%
	// 쿠키로 팝업창 열기 
/* 	boolean check = false;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
	for(Cookie c : cookies){
		if(c.getName().equals("cookieName")){
			check = true;
		}
	}
	}
	if(!check){
		out.print("<script>window.open('cafehi_popup.jsp','','width=800, height=600')</script>");
	} */
 %>

<jsp:include page="/cafeHi_module/mainHeader.jsp"/>

<main>

  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div class="carousel-item active">
      <!-- CAFE Hi 소개 페이지 이미지 링크   -->
      <a href="all/Introduce.do"><img alt="#" src="/cafeHi/img/cafehi_view.jpeg" width="100%" height="100%"></a>
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>CAFE Hi</h1>
            <h3>Introduce CAFE Hi!</h3>
          </div>
        </div>
      </div>
      <div class="carousel-item">
         <!-- CAFE Hi MENU 페이지 이미지 링크   -->
        <a href="all/Menu.do"><img alt="" src="/cafeHi/img/cafehi_menu.jpeg" preserveAspectRatio="xMidYMid slice" focusable="false" width="100%" height="100%"></a>
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Menu</h1>
            <p>카페 하이의 다양한 메뉴를 확인하세요!</p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <!-- CAFE Hi EVENT 페이지 이미지 링크   -->
        <a href="all/Event.do"><img alt="" src="/cafeHi/img/cafehi_back.jpeg" preserveAspectRatio="xMidYMid slice" focusable="false" width="100%" height="100%"></a>       
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>EVENT</h1>
            <p>진행중인 이벤트를 확인하세요!</p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <div class="container marketing">

<div>
	<h4>CONTENTS</h4>
</div>
    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2 class="fw-normal">Heading</h2>
        <p>Some representative placeholder content for the three columns of text below the carousel. This is the first column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2 class="fw-normal">Heading</h2>
        <p>Another exciting bit of representative placeholder content. This time, we've moved on to the second column.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
      <div class="col-lg-4">
        <svg class="bd-placeholder-img rounded-circle" width="140" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">140x140</text></svg>

        <h2 class="fw-normal">Heading</h2>
        <p>And lastly this, the third column of representative placeholder content.</p>
        <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


    <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">MEMBERSHIP</h2>
        <p class="lead row-md-2"></p>
        <p class="lead row-md-2">멤버쉽에 가입하여</p>
        <p class="lead row-md-2">이벤트 참여와 가격 할인을 받으세요.</p>
        <a href="all/Membership.do"><button type="button" class="btn btn-outline-dark">자세히 보기</button></a>
        
      </div>
      <div class="col-md-5">
        <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" alt="" src="img/membership1.PNG" width="500" height="500" >

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-4">
        <h2 class="featurette-heading fw-normal lh-1"> <span class="text-muted">EVENT</span></h2>
        <p class="lead row-md-4"></p>
        <p class="lead">진행중인 다양한 이벤트를 확인하세요.</p>
        <a href="all/Event.do"><button type="button" class="btn btn-outline-dark">자세히 보기</button></a>
      </div>
      <div class="col-md-5 order-md-1">
		<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" alt="" src="img/cafehi_event.jpeg" width="500" height="500" >
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading fw-normal lh-1">STORE</h2>
        <p class="lead row-md-4"></p>
        <h4 ><span class="text-muted row-md-10">CAFE Hi~!</span></h4>
        <p class="lead row-md-4"></p>
        <p class="lead row-md-4">찾아오시는데 불편하지 않게</p>
        <p class="lead row-md-4">위치를 알려드릴게요!</p>
      	<a href="all/Place.do"><button type="button" class="btn btn-outline-dark">자세히 보기</button></a>
      </div>
      <div class="col-md-5">
		<img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" alt="" src="img/cafehi1.jpeg" width="500" height="500" >
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div>


  <!--카페 하이 FOOTER -->
  <jsp:include page="/cafeHi_module/footer.jsp"/>
 
</main>


<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>




</body>
</html>