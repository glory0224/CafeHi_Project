<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CAFEHI 회원정보 변경</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link href="/cafeHi/css/main.css" rel="stylesheet" >
<!-- 유효성 검사 js  -->
<script src="/cafeHi/js/check.js"></script>

</head>
<body>

<jsp:include page="/cafeHi_module/header.jsp"/>

<div class="w-50 m-auto" style="padding-top: 5%">
<form class="container" action="updateUser.do" method="post" id="userForm">
	<h1 class="text-center m-5">회원 정보</h1>
	<input name="user_seq" value="${UserSeq }" type="hidden" />
  <div class="m-5">
    <label for="user_id" class="form-label">아이디</label>
    <div class="d-flex justify-content-between">
  	<input type="text" id="user_id" class="form-control" name="user_id" value="${UserId }" readonly="readonly">
  	<div class="ms-3">
	<input class="btn btn-md btn-success " data-bs-toggle="modal" data-bs-target="#user_id_modal" type="button" value="변경">
	</div>
	</div>
  </div>
    <div class="m-5">
    <label for="user_name" class="form-label">이름</label>
  	<div class="d-flex justify-content-between">
  	<input type="text" id="user_name" class="form-control" name="user_name" value="${UserName }" readonly="readonly">
  	<div class="ms-3">
	<input class="btn btn-md btn-success " data-bs-toggle="modal" data-bs-target="#user_name_modal" type="button" value="변경">
	</div>
	</div>
  </div>
  <div class="m-5">
    <label for="user_contact" class="form-label">연락처</label>
 	<div class="d-flex justify-content-between">
  	<input type="text" id="user_contact" class="form-control" name="user_contact" value="${UserContact }" readonly="readonly">
  	<div class="ms-3">
	<input class="btn btn-md btn-success " data-bs-toggle="modal" data-bs-target="#user_contact_modal" type="button" value="변경">
	</div>
	</div>
  </div>
  <div class="m-5">
    <label for="user_email_id" class="form-label">메일</label>
 	<div class="d-flex justify-content-between">
  	<input type="text" id="user_email_id" class="form-control" name="user_email_id" value="${UserEmailId}${UserEmailAddress}" readonly="readonly">
  	<div class="ms-3">
	<input class="btn btn-md btn-success " data-bs-toggle="modal" data-bs-target="#user_email_modal" type="button" value="변경">
	</div>
	</div>
  </div>
  <div class="m-5">
    <label for="user_address" class="form-label">주소</label>
  	<input type="text" id="user_address" class="form-control" name="user_address" value="${UserRoadAddress }" readonly="readonly"><br>
  	<input type="text" id="user_address" class="form-control" name="user_address" value="${UserJibunAddress }" readonly="readonly">
  	<div class="d-flex justify-content-end mt-3">
	<input class="btn btn-md btn-success " data-bs-toggle="modal" data-bs-target="#user_address_modal" type="button" value="변경" >
	</div>
	
  </div>
  <div class="m-5">
    <label for="user_address" class="form-label">상세 주소</label>
  	<div class="d-flex justify-content-between">
  	<input type="text" id="user_address" class="form-control" name="user_address" value="${UserDetailAddress }" readonly="readonly">
  	<div class="ms-3">
	<input class="btn btn-md btn-success " data-bs-toggle="modal" data-bs-target="#user_address_detail_modal" type="button" value="변경">
	</div>
	</div>
  </div>

</form>

</div>

<!-- Modal -->
<div class="modal fade" id="user_id_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="updateUserId.do">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b>${UserName }</b>님의 회원정보 중 아이디를 수정하기 <br> 위한 페이지입니다.</h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<label for="user_id" class="form-label">변경할 아이디를 입력하세요.</label> 
      	<input name="user_seq" value="${UserSeq }" type="hidden" />
        <input type="text" id="user_id" class="form-control" name="user_id" placeholder="${UserId }">
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="변경">
      </div>
    </div>
     </form>
  </div>
</div>


<div class="modal fade" id="user_name_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="updateUserName.do">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b>${UserName }</b>님의 회원정보 중 이름을 수정하기 <br> 위한 페이지입니다.</h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<label for="user_name" class="form-label">변경할 이름을 입력하세요.</label>
      	<input name="user_seq" value="${UserSeq }" type="hidden" /> 
        <input type="text" id="user_name" class="form-control" name="user_name" placeholder="${UserName }">
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="변경">
      </div>
    </div>
     </form>
  </div>
</div>

<div class="modal fade" id="user_contact_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="updateUserContact.do">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b>${UserName }</b>님의 회원정보 중 연락처를 수정하기 <br> 위한 페이지입니다.</h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<label for="user_contact" class="form-label">변경할 전화번호를 입력하세요.</label>
      	<input name="user_seq" value="${UserSeq }" type="hidden" /> 
        <input type="text" id="user_contact" class="form-control" name="user_contact" placeholder="${UserContact }">
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="변경">
      </div>
    </div>
     </form>
  </div>
</div>

<div class="modal fade" id="user_email_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="updateUserEmail.do">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b>${UserName }</b>님의 회원정보 중 이메일을 수정하기 <br> 위한 페이지입니다.</h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<label for="user_contact" class="form-label">변경할 이메일을 입력하세요.</label>
      	<input name="user_seq" value="${UserSeq }" type="hidden" /> 
      	<div class="d-flex justify-content-between">
        <input type="text" id="userEmailId" class="form-control" name="user_email_id" placeholder="${UserEmailId }"> &nbsp;
        <select class="form-select" aria-label="Default select example" name="user_email_address" id="userEmailAddress">
	    	<option value="">선택</option>
	    	<option>@naver.com</option>
	    	<option>@daum.net</option>
			<option>@gmail.com</option>
			<option>@hanmail.com</option>
		 	<option>@yahoo.co.kr</option>
    	</select>
    	</div>      
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="변경">
      </div>
    </div>
     </form>
  </div>
</div>

<div class="modal fade" id="user_address_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="updateUserAddress.do">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b>${UserName }</b>님의 회원정보 중 주소를 수정하기 <br> 위한 페이지입니다.</h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<label for="user_address" class="form-label">변경할 주소를 입력하세요.</label>
      	<input name="user_seq" value="${UserSeq }" type="hidden" /> 
        <input type="text" id="userRoadAddress" class="form-control" name="user_road_address" placeholder="도로명 주소" readonly="readonly"><br>
  		<input type="text" id="userJibunAddress" class="form-control" name="user_jibun_address" placeholder="지번 주소" readonly="readonly"><br>
  		<input class="btn btn-sm btn-success float-end" type="button" onclick="find_address()" value="주소 찾기">
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="변경">
      </div>
    </div>
     </form>
  </div>
</div>

<div class="modal fade" id="user_address_detail_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <form action="updateUserDetailAddress.do">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel"><b>${UserName }</b>님의 회원정보 중 상제 주소를 수정하기 <br> 위한 페이지입니다.</h1>
        <div class="ms-3">
        <button type="button" class="btn-close btn-success " data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      </div>
      <div class="modal-body">
      	<label for="user_address" class="form-label">변경할 상세 주소를 입력하세요.</label>
      	<input name="user_seq" value="${UserSeq }" type="hidden" /> 
        <input type="text" id="userDetailAddress" class="form-control" name="user_detail_address" placeholder="${UserDetailAddress }" >
      </div>
      <div class="modal-footer">
     
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">취소</button>
        <input class="btn btn-md btn-success " type="submit" value="변경">
      </div>
    </div>
     </form>
  </div>
</div>



  <!--카페 하이 FOOTER -->
 <jsp:include page="/cafeHi_module/footer.jsp"/>
</body>

<!-- 다음 주소 찾기  -->
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