<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHi 회원가입</title>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<!-- <link href="./css/cafehi_signin.css" rel="stylesheet" > -->

<!-- 회원가입 유효성 검사 js  -->
<script src="/cafeHi/js/check.js"></script>

</head>
<body>
<!-- 카페 하이 헤더  -->   
<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="w-50 m-auto p-5">
<form class="container" action="insertUser.do" method="post" id="userForm">
	<h1 class="text-center m-5">회원 가입</h1>
  <div class="m-5">
    <h4><label for="userId" class="form-label">아이디</label></h4>
    <input type="text" id="userId" class="form-control" placeholder="영문, 숫자 포함 6 - 20자" name="user_id">
  </div>
    <div class="m-5">
    <h4><label for="userName" class="form-label">이름</label></h4>
    <input type="text" id="userName" class="form-control" placeholder="이름을 입력하세요." name="user_name">
  </div>
  <div class="m-5">
    <h4><label for="userPassword" class="form-label">비밀번호</label></h4>
    <input type="password" id="userPassword" class="form-control" placeholder="영문, 숫자 포함 6 - 20자" name="user_pw">
  </div>
  <div class="m-5">
    <h4><label for="checkPassword" class="form-label">비밀번호 확인</label></h4><label id="pwcheck" style="margin-left: 10px; margin-bottom: 10px;"></label>
    <input type="password" id="checkPassword" class="form-control" placeholder="비밀번호를 다시 한번 입력하세요." onchange="pwCheck()">
  </div>
  <div class="m-5">
    <h4><label for="userContact" class="form-label">연락처</label></h4>
    <input type="text" id="userContact" class="form-control" placeholder="연락처를 입력하세요." name="user_contact" maxlength="13">
  </div>
  <div class="m-5">
  <h4><label for="user_address" class="form-label">주소</label> <input class="btn btn-sm btn-success float-end" type="button" onclick="find_address()" value="주소 찾기"></h4>
    
   <div class="mt-3">
    <input type="text" id="userRoadAddress" class="form-control" placeholder="도로명 주소" name="user_road_address" readonly="readonly">
   </div>
     
   <div class="mt-3">
    <input type="text" id="userJibunAddress" class="form-control" placeholder="지번 주소" name="user_jibun_address" readonly="readonly">
   </div>  
    <div class="mt-3">
    <input type="text" id="userDetailAddress" class="form-control" placeholder="상세주소" name="user_detail_address">
    </div>
   
  </div>
  






    <div class="d-flex justify-content-end">
      <div class="form-check">
      <input class="form-check-input" type="checkbox" id="privacyCheck">
      <label class="form-check-label" for="privacyCheck">
        개인정보 수집에 동의합니다. 
      </label>
    </div>
     </div>
<div class="d-flex justify-content-end">
	<div style="margin-top: 40px;">
      <input class="btn btn-md btn-success " type="button" value="회원가입" onclick="check();">
      <!-- <input class="btn btn-md btn-success " type="submit" value="회원가입" > -->
      </div>
</div>


</form>


</div>

<!--카페 하이 FOOTER -->
<jsp:include page="/cafeHi_module/footer.jsp"/>


</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function find_address() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' || data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                
                
                
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = extraRoadAddr;
                }

               
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("userRoadAddress").value = roadAddr + ' ' + extraRoadAddr;
                    document.getElementById("userJibunAddress").value = data.jibunAddress;
                    
                } else {
                    document.getElementById("userAddress").value = roadAddr;
                    document.getElementById("userJibunAddress").value = data.jibunAddress;
                }
				
                return;
                
                
            }
        }).open();
    }
</script>


</html>