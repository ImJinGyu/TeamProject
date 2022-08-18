<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="writePro" method="post">
<table border="1">
<tr><th>글쓴이</th><td><input type="text" size="25"></td></tr>
<tr><th>비밀번호</th><td><input type="password" size="25"></td></tr>
<tr><th>제목</th><td><input type="text" size="25"></td></tr>
<tr><th>내용</th><td><textarea rows="15" cols="27"></textarea></td></tr>
<tr><th colspan="2"><input type="submit" value="글쓰기"></th></tr>
</table>
</form>
</body>
</html>