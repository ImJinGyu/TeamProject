<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
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
    <script src="${pageContext.request.contextPath }/resources/js/loginajax.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	
 <div class="login_form_width" style="padding-top:100px; margin-bottom: 100px">
  <!-- 고객 & 사용자 탭 -->
  <ul class="nav nav-tabs nav-justified mt-3" role="tablist" style="width:312px; margin:0 auto;">
   <li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" style="color:black;" href="#member-login">고객 로그인</a></li>
   <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" style="color:black;" href="#business-login">사업자 로그인</a></li>
   <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" style="color:black;" href="#admin-login">관리자 로그인</a></li>
  </ul>
 <div class="tab-content">

<!-- 고객 로그인 폼 -->
 <div id="member-login" class="container tab-pane active">		
  <div class="login">
   <div class="fix_title">
    <div class="logo">
     	<a href="${pageContext.request.contextPath }/search/main"><img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png"></a>
    </div>
   </div>
<!--     네이버 로그인 -->
    <div id="naver_id_login_div"  style="margin-bottom: 5px">
    <script src="${pageContext.request.contextPath}/resources/js/apilogin/naver_login.js"></script>
	</div>
	<!--     카카오 로그인 --> 
    <a href="https://kauth.kakao.com/oauth/authorize?client_id=	47791105334d48d9d0b4bf1ca0cea8ba&redirect_uri=http://localhost:8080/TeamProject/apilogin/kakao_login&response_type=code">
    <img src="${pageContext.request.contextPath}/resources/images/kakao_login_medium_wide.png" style="width: 100%; height: 45px">
    </a>
   <p class="space_or">
   <span>또는</span>
   <form class="needs-vallidation" action="loginPro" method="get">
    <div class="form-group">
     <input class="form-control" type="email" name="user_id" id="user_id" required placeholder="이메일주소">
    </div>
    <div class="form-group">
     <input class="form-control" type="password" name="password" id="password" required placeholder="비밀번호">
     <input type="hidden" id="user_type" name="user_type" value="1">
    </div>
     <input class="btn btn-danger w-100" id="loginbtn" type="submit" value="로 그 인" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px;">
     <span id="loginspan"></span>
    <div class="link_half">
     <div><a href="${pageContext.request.contextPath }/member/passSearch?user_type=1"><span>비밀번호 찾기</span></a></div>
     <div><a href="${pageContext.request.contextPath }/member/join"><span>회원가입</span></a></div>
    </div>
   </form>
  </div>
 </div>
 <!-- DB에서 고객과 사업자 정보를 분리하여 관리할 경우 input태그 name을 고객 폼과 다르게 해야함-->
 <!-- 사업자 로그인 폼 -->
 <div id="business-login" class="container tab-pane fade">		
  <div class="login">
   <div class="fix_title">
	<div class="logo">
     	<a href="${pageContext.request.contextPath }/search/main"><img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png"></a>
    </div>
   </div>
     <br>
    <form class="needs-vallidation" action="loginPro" method="get">
     <div class="form-group">
      <input class="form-control" type="email" name="user_id" id="user_id" required placeholder="이메일주소">
     </div>
     <div class="form-group">
      <input class="form-control" type="password" name="password" id="password" required placeholder="비밀번호">
      <input type="hidden" id="user_type" name="user_type" value="2">
     </div>
     <input class="btn btn-danger w-100" id="loginbtn" type="submit" value="로 그 인" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px;">
     <div class="link_half">
      <div><a href="#"><span>비밀번호 찾기</span></a></div>
      <div><a href="${pageContext.request.contextPath }/member/passSearch?user_type=2"><span>회원가입</span></a></div>
     </div>
    </form>
  </div>
 </div>
 
  <!-- 관리자 로그인 폼 -->
 <div id="admin-login" class="container tab-pane fade">		
  <div class="login">
   <div class="fix_title">
	<div class="logo">
     	<a href="${pageContext.request.contextPath }/search/main"><img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png"></a>
    </div>
   </div>
   <br>
    <form class="needs-vallidation" action="loginPro" method="get">
     <div class="form-group">
      <input class="form-control" type="text" name="user_id" id="user_id" required placeholder="관리자 아이디">
     </div>
     <div class="form-group">
      <input class="form-control" type="password" name="password" id="password" required placeholder="비밀번호">
      <input type="hidden" id="user_type" name="user_type" value="0">
     </div>
     <input class="btn btn-danger w-100" id="loginbtn" type="submit" value="로 그 인" style="font-size: 27px; font-family: 'Do Hyeon', sans-serif; padding: 0.75px 0.75px;">
    </form>
  </div>
 </div>

</body>
</html>