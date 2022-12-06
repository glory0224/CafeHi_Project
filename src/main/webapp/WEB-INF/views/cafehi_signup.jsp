<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="<%=request.getContextPath() %>" scope="application"/>
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
    <h4><label for="user_id" class="form-label">아이디</label><input id="idCheck" class="btn btn-sm btn-success float-end" type="button" value="중복 확인"></h4>
    <input type="text" id="user_id" class="form-control" placeholder="영문, 숫자 포함 6 - 20자" name="user_id">
    <br>
    <div><font id="id_feedback" size="2"></font></div>
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
    <h4><label for="checkPassword" class="form-label">비밀번호 확인</label></h4>
    <input type="password" id="checkPassword" class="form-control" placeholder="비밀번호를 다시 한번 입력하세요." onchange="pwCheck()">
    <br>
    <div id="pwcheck"></div>
  </div>
  <div class="m-5">
    <h4><label for="userContact" class="form-label">연락처</label></h4>
    <input type="text" id="userContact" class="form-control" placeholder="연락처를 입력하세요." name="user_contact" maxlength="13">
  </div>
  <div class="m-5">
    <h4><label for="userEmailId " class="form-label">이메일</label></h4>
    <div class="d-flex justify-content-between">
    <input type="text" id="userEmailId" class="form-control" placeholder="이메일을 입력하세요." name="user_email_id"> &nbsp;
    <select class="form-select" aria-label="Default select example" id="userEmailAddress" name="user_email_address" >
    	<option value="">선택</option>
    	<option>@naver.com</option>
    	<option>@daum.net</option>
		<option>@gmail.com</option>
		<option>@hanmail.com</option>
	 	<option>@yahoo.co.kr</option>
    </select>
  </div>
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
      <input id="signup" class="btn btn-md btn-success " type="button" value="회원가입" onclick="check();">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script type ="text/javascript">
	/* Ajax방식을 Spring에 적용하기 전에 Pom.xml에 json 관련 dependency가 들어 있는지 확인한다. */
	$('#idCheck').click(function(){
		let user_id = $('#user_id').val();
			
		$.ajax({
			url : "http://localhost:8080/cafeHi/IdCheck.do",
			type : "post",
			data : {user_id: user_id},
			dataType : 'json',
			success : function(result){
				if(result == 1){
					userId = document.getElementById('user_id');
					userId.value = "";
					$("#id_feedback").html('이미 사용중인 아이디입니다.');
					$("#id_feedback").attr('color','#dc3545');
				} else{
					$("#id_feedback").html('사용할 수 있는 아이디입니다.');
					$("#id_feedback").attr('color','#2fb380');
				} 
			},
			error : function(){
				alert("서버요청실패");
			}
		})
			 
	})
</script>

</html>