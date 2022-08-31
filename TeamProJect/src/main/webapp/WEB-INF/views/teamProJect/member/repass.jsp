<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>로그인 | 부산온나</title>
    <!-- bootstrap v5.13 -->
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loginSt.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/join.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/email_certify_ajax.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/daum_address_api.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
</head>
<body>
<script>
AOS.init({duration: 1000});
</script>

 <div class="login_form_width" style="padding-top:100px; margin-bottom: 100px">

<!-- 고객 로그인 폼 -->
 <div id="member-login" class="container tab-pane active" data-aos="flip-left" data-aos-anchor-placement="top-bottom" >		
  <div class="login">
    
   <form class="needs-vallidation" action="repassPro?user_id=${memberDTO.user_id}&user_type=${memberDTO.user_type}" method="post" onsubmit="return repassfun()">
   <div class="fix_title">
	    <div class="logo">
	     	<span style="font-size:40px; font-style: italic;"><b>새 비밀번호</b></span><br>
	    </div>
   </div>
    <div class="form-group">
     <input class="form-control" type="password" name="password" id="password" required placeholder="이메일주소" style="margin-bottom: 5px;" onkeyup="checkPass(this.value)">
     <div id="passmsg" style="font-size: 15px;"><!-- 패스워드 정규식 조건 만족 여부1 --></div>
    </div>
    <br>
    <div class="fix_title">
	    <div class="logo">
	     	<span style="font-size:40px; font-style: italic;"><b>새 비밀번호 확인</b></span><br>
	    </div>
   </div>
    <div class="form-group">
     <input class="form-control" type="password" name="password2" id="password2" required placeholder="이메일주소" style="margin-bottom: 5px;" onblur="checkRetypePass(this.value)">
     <div id="pass2msg" style="font-size: 15px;"><!-- 패스워드 일치여부 --></div>
    </div>
     
     
    <div class="link_half">
    </div>
     <input class="btn btn-danger w-100" id="passbtn" type="submit" value="패스워드 변경" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px; margin-bottom: 4px;">
   </form>
  </div>
 </div>

</body>
</html>