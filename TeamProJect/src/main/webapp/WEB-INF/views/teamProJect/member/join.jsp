<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>회원가입 | 부산온나</title>
    <!-- bootstrap v5.13 -->
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loginSt.css" />
	<link rel="stylesheet" href="https://www.goodchoice.kr/css/common.css?rand=1660711669">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script type="text/javascript">
    
    </script>
    <style type="text/css">
    
    .btn {
    margin-bottom: 10px;
    }
    
    </style>

</head>
<body>
<div class="layer_fix pop_login pop_mem_reserve fix_disable">
    <section>
    <form id="joinForm" action="https://www.goodchoice.kr/user/joinProcess" autocomplete="off" method="post" novalidate="novalidate">
    		<div class="logo">
     		<a href="${pageContext.request.contextPath }/search/main"><img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png"></a>
    		</div>

        <div class="join">
            <strong class="sub_title">회원가입</strong>
            
            <b>이메일 &nbsp <button type="button" class="btn btn-danger">중복확인</button></b>
            <div class="inp_type_2 form-errors" style="margin-bottom: 3px;"><!-- focus / err -->
                <input type="email" name="uemail" id="gcuseremail" placeholder="이메일 주소를 입력해주세요.">
				<label id="gcuseremail_msg" class="validate_msg_label" style="color: red;"></label>
				<input type="hidden" id="user_type" value="1">
            </div><span id="checkIdResult"><!-- 이메일아이디 일치 여부 표시 영역 --></span><br>
            <button type="button" class="btn btn-danger" onclick="" disabled="">인증번호 전송</button>
            
<!--              <div class="inp_type_2 form-errors" id="emailCheck" style="margin-bottom: 10px;"> -->
<!--                 <input type="email" name="uemail" id="gcuseremailCheck" placeholder="인증번호를 입력해주세요." disabled=""> -->
<!-- 				<label id="gcuseremail_msg" class="validate_msg_label" style="color: red;"></label><br> -->
<!-- 				<input type="hidden" id="user_type" value="1"> -->
<!--             </div> -->

            <b>비밀번호</b>
            <div class="inp_type_2 form-errors form-password-rule">
                <input type="password" name="upw" placeholder="비밀번호를 입력해주세요." id="new_pw">
				<label id="new_pw_msg" class="validate_msg_label"></label>
            </div>

            <b>비밀번호 확인</b><span id="checkRetypePassResult"><!-- 비밀번호 일치 여부 표시 영역 --></span>
            <div class="inp_type_2 form-errors">
                <input type="password" name="upw_retry" placeholder="비밀번호를 확인해주세요." id="new_pw_re">
				<label id="new_pw_re_msg" class="validate_msg_label"></label>
            </div>
            
            
            <b>휴대폰 번호</b>
            <div class="inp_type_2 form-errors"><!-- focus / err -->
                <input type="tel" name="uphone" id="gcuserphone" placeholder="휴대폰 번호를 입력해주세요.">
				<label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
            </div>
            
            <b>이름</b>
            <div class="inp_type_2 form-errors"><!-- focus / err -->
                <input type="" name="uphone" id="gcuserphone" placeholder="이름을 입력해주세요.">
				<label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
            </div>
            
            <b>주민번호</b>
            <div class="inp_type_2 form-errors"><!-- focus / err -->
                <input type="tel" name="uphone" id="gcuserphone" placeholder="주민번호를 입력해주세요.">
				<label id="gcusertel_msg" class="validate_msg_label" style="color: red;"></label>
            </div>
            
            <b>주소</b>
            <button type="button" class="btn btn-danger" id="">검색</button>
            
            <div class="inp_type_2 form-errors">
            <input type="text" name="zipcode" class="" value="" placeholder="우편번호" /> 
            </div>
            
            <div class="inp_type_2 form-errors">
            <input type="text" name="zipcode" class="" value="" placeholder="주소" style=""/> 
            </div>
<!--             ada -->
            <div class="inp_type_2 form-errors">
            <input type="text" name="zipcode" class="" value="" placeholder="상세주소" style=""/> 
            </div>
            <button type="button" class="btn btn-danger w-100" style="margin-bottom: 20px; font-size: 27.7px; font-family: 'Do Hyeon', sans-serif;">가 입 하 기</button>
        </div>
    </form>
</section>



</div>
</body>
</html>