<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- bootstrap v5.13 -->
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/loginSt.css" />
</head>
<body>

<div class="login">
 <div class="fix_title">
  <strong class="logo">
   <a href="${pageContext.request.contextPath }/main">부산온나</a>
  </strong>
 </div>
 네이버 로그인(예정) <br>
 카카오톡 로그인(예정)
 <p class="space_or">
  <span>또는</span>
 <form class="needs-vallidation">
  <div class="form-group">
   <input class="form-control" type="email" id="email" required placeholder="이메일주소">
  </div>
  <div class="form-group">
   <input class="form-control" type="password" id="password" required placeholder="비밀번호">
  </div>
  <input class="btn btn-danger w-100" type="submit" value="로그인">
  <div class="link_half">
   <div><a href="#"><span>비밀번호 재설정</span></a></div>
   <div><a href="${pageContext.request.contextPath }/join"><span>회원가입</span></a></div>
  </div>
 </form>
</div>


</body>
</html>