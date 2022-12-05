<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오시는 길</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
</head>
<body>

<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="p-5 m-5 text-center">
		<h1 class="display-4 fw-normal">Place</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">찾아오시는 길</p>
		</div>
			<h4>인천광역시 연수구 벚꽃로 162 카페하이</h4><br>
	</div>

<div class="d-flex justify-content-center">
<div id="map" style="width:750px;height:350px;"></div><br>
<!-- <button type="button" class="btn btn-success" onclick="getCurrentPosBtn()">현재위치확인</button> -->
</div>
<br>
<h4 class="text-center"><b>수인분당</b> 원인재역 4번 출구에서 우측 방향 약 425m에 위치</h4>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e749709c955133d12fe9eb9cff0f878"></script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.41479, 126.68260), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = '/cafeHi/img/cafehi_logo2.png', // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(30, 30), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(10, 43)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
markerPosition = new kakao.maps.LatLng(37.41479, 126.68260); // 마커가 표시될 위치입니다

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition, 
image: markerImage // 마커이미지 설정 
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
</script>
		

<jsp:include page="/cafeHi_module/footer.jsp"/>

</body>
</html>