<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi 소개</title>
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
		<h1 class="display-4 fw-normal">Introduce</h1>

		<div class="pricing-header pb-md-4 mx-auto text-center">

			<div
				class="d-flex flex-column flex-md-row align-items-center pb-3 mb-4 "></div>
			<p class="fs-5 text-muted">카페 하이를 소개합니다!</p>
		</div>
	</div>


	<div class="container m-auto" style="margin-top: 100px;">

		<div class="d-flex justify-content-between">
			<div>
				<img src="/cafeHi/img/cafehi_logo.jpeg" class="img-thumbnail"
					style="width: 400px; height: 400px;">
			</div>
			<div>
				<h2 class="cp_infomt_text">
					<b>CAFE Hi LoGo</b><br>

				</h2>
				<h4>
					<br>CAFEHi의 Hi의 로고는 히브리어로 삶(생명)을 뜻하는 <br> <br> 하이
					חי(Chai)의 글자 모양을 디자인 했습니다.<br> <br> 또한 이 하이 חי(Chai)는
					히브리어로 헤트ח와 요드י<br> <br> 두 글자를 합성한 단어로 <br> <br>
					<b>신에게 자기의 삶(생명)을 의탁한다</b>는 의미가 있습니다.
				</h4>
			</div>
		</div>
		<br><br><br><br>
		<!-- <div class="container"> -->
		<div class="d-flex justify-content-between">
						<div>
						<h2 class="cp_infomt_text">
					<b>카페 하이는</b><br>
			
				</h2>
				
				<h4>
					<br>2021년 연수점을 시작으로 모든 매장을 직영하며, <br> <br>지역사회 속에서
					일상을 풍요롭게 하는 <br> <br>특별한 카페하이만의 경험을 전달하면서 <br> <br>업계를
					선도하는 기업으로 성장해 오고 있습니다.
				</h4>
			</div>
			<div>
<img src="/cafeHi/img/cafehi_inner.jpeg" class="img-thumbnail"
				style="width: 400px; height: 400px;">
			</div>
		</div>
		<br><br><br><br>
		<div class="d-flex justify-content-between">
			<div>
				<img src="/cafeHi/img/cafehi_welcome.png" class="img-thumbnail"
					style="width: 400px; height: 400px;">
			</div>
			<div>
				<h2 class="cp_infomt_text">
					<b>카페 하이는</b><br>
				</h2>
				<h4>
					
					 <br>국내에 새로운 커피 문화를 소개하며,  <br> <br>국내 협력사와의 동반성장,  <br> <br>글로벌 인재 양성, 고용창출, 환경보호 등
							<br> <br>다양한 이해관계자들과 지역사회를 배려하는 <br> <br> 사회적 책임과 성장을 함께 추구하고 있습니다.
				</h4>
			</div>
		</div>
		<br><br><br><br>
				<div class="d-flex justify-content-between">
						<div>
						<h2 class="cp_infomt_text">
					<b>카페 하이는</b><br><br>
			
				</h2>
				
				<h4>
					전세계 각국에서 수만여 명의 파트너들이 근무하는 <br><br> 세계 최고의 커피 전문 회사로, <br><br> 최상급
						아라비카 원두의 윤리적 구매와 <br><br> 50년 이상의 전문적인 로스팅 기술을 통한 철저한 품질 관리와 <br><br> 기업의 사회적 책임 완수를
						통해 <br><br> 특별한 카페 하이의 경험과 문화를 한 잔의 커피와 함께 제공하며,<br><br> 커피 문화를 선도하고
						있습니다.
				</h4>
			</div>			
			<div>
<img src="/cafeHi/img/cafehi_intro.jpeg" class="img-thumbnail"
				style="width: 400px; height: 400px;">
			</div>
	</div>

</div>
	<!--카페 하이 FOOTER -->
	<%@ include file="/cafeHi_module/footer.jsp"%>
</body>
</html>