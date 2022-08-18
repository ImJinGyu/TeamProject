<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/insertForm.jsp</title>
</head>
<body>
<!-- http://localhost:8080/Model2/insertForm.me -->
<!-- <form action="insertPro.me" method="post"> -->
<!-- 아이디 : <input type="text" name="id"><br> -->
<!-- 비밀번호 : <input type="password" name="pass"><br> -->
<!-- 이름 : <input type="text" name="name"><br> -->
<!-- <input type="submit" value="회원가입"> -->
<!-- </form> -->
<form action="insertPro" method="post">
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>
이름 : <input type="text" name="name"><br>
<input type="submit" value="회원가입"><br>
</form>
<input type="button" value="추가" onclick="location.href='writeForm'">
</body>
</html>