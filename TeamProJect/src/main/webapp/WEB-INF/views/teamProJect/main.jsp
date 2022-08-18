<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="/webjars/jquery/3.6.0/jquery.min.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(document).ready(() => {
		$('#btn').bind('click', () => {
			$.ajax({
				url:'test',
				//data:{"id":$('#id').val()},
				success:(rdata) => {
					debugger;
				$('div').html(rdata).css('color', 'blue');				
				}
			})	
		})
	});
</script>
</head>
<body>
<input type="button" value="asdasd" id="btn">
${pageContext.request.contextPath}
<div></div>
</body>
</html>