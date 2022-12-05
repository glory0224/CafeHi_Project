<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi Membership</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link href="/cafehi/css/cafehi_membership.css" rel="stylesheet" >


<!-- 페이지의 체크 표시 모양을 내기 위한 svg -->

<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check" viewBox="0 0 16 16">
    <title>Check</title>
    <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
  </symbol>
</svg> 

</head>
<body>


<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="container py-3">

 
 
  <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom"></div>
    <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
      <h1 class="display-4 fw-normal">Membership</h1>
  <div class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 border-bottom"></div>
      <p class="fs-5 text-muted">카페 하이의 멤버쉽에 가입하고 포인트 적립 및 사용뿐만 아니라 다양한 이벤트에 참여하실 수 있습니다.</p>
    </div>



  <main>
    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-success">
          <div class="card-header py-3 bg-success border-success text-bg-success">
            <h4 class="my-0 fw-normal">VIP</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">15%</h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>적립 포인트가 20000점 이상 <br> 고객 대상</li>
              <li>결제 금액의 15% 포인트 적립</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-warning ">
          <div class="card-header py-3 bg-warning border-warning text-bg-warning">
            <h4 class="my-0 fw-normal text-white">Gold</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">10%</h1>
            <ul class="list-unstyled mt-3 mb-4">
               <li>적립 포인트가 15000점 이상 <br> 고객 대상</li>
              <li>결제 금액의 10% 포인트 적립</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="col">
        <div class="card mb-4 rounded-3 shadow-sm border-secondary">
          <div class="card-header py-3 text-bg-secondary border-secondary bg-secondary">
            <h4 class="my-0 fw-normal">Silver</h4>
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title">5%</h1>
            <ul class="list-unstyled mt-3 mb-4">
              <li>적립 포인트가 10000점 이상 <br> 고객 대상</li>
              <li>결제 금액의 5% 포인트 적립</li>
            </ul>
          </div>
        </div>
      </div>      	 
    </div>
    <div class="d-flex justify-content-end"><a class="text-decoration-none text-black" href="info.do"><button type="button" class="btn btn-outline-dark">내 등급 확인하러 가기</button></a></div>

    <h2 class="display-6 text-center mb-4">등급별 혜택</h2>

    <div class="table-responsive">
      <table class="table text-center">
        <thead>
          <tr>
            <th style="width: 34%;"></th>
            <th style="width: 22%;">VIP</th>
            <th style="width: 22%;">Gold</th>
            <th style="width: 22%;">Silver</th>
          </tr>
        </thead>
        <tbody>
        	<tr>
            <th scope="row" class="text-start">포인트 적립</th>
            <td><svg class="bi" width="10" height="24"></svg><b>15%</b></td>
            <td><svg class="bi" width="10" height="24"></svg><b>10%</b></td>
            <td><svg class="bi" width="10" height="24"></svg><b>5%</b></td>

          </tr>
          <tr>
            <th scope="row" class="text-start">생일 축하 무료 음료 쿠폰</th>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">coupon (할인 쿠폰)</th>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td></td>
          </tr>
        </tbody>

        <tbody>
          <tr>
            <th scope="row" class="text-start">회원 전용 이벤트</th>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td></td>
          </tr>
          <tr>
            <th scope="row" class="text-start">케이터링 서비스 (월 2회 제한)</th>
            <td><svg class="bi" width="24" height="24"><use xlink:href="#check"/></svg></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
    </div>
  </main>
</div>
<jsp:include page="/cafeHi_module/footer.jsp"/>
</body>
</html>