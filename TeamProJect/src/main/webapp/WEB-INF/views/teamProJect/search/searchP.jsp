<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Come to Busan - 부산온나</title><!-- Free Tour and Travel Website Tempalte | Smarteyeapps.com -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    
</head>

<body>
<%@ include file="../header.jsp" %>
<!--헤더 -->
    <div style="background-color: #f5f5f5">

		<!-- 메인페이지 검색 창 -->
		<div class=main_first_box>
			<form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get">
				<div class="mtb"></div><br>
				<div class=main_twice_box>
					<input type="hidden" name="bu_id" id="bu_id" value="1">
					<div class="main_search_all"> <!-- style="padding-top: 10px;" -->
						<div class=main_checkinout>
							<div role=button>
								<div class="main_checkinout_buttonbox">
									<div>
										<input type='date' id="checkin" min="${today }" value="${today }" class="main_checkin_1" name="checkin" onchange="dateChk()" required><!-- min="${today }" value="${today }" -->
									</div>
									<div>
										<input type='date' id="checkout" min="${tomorrow }" value="${tomorrow }" class="main_checkout_1" name="checkout" onchange="dateChk()" required><!-- min="${tomorrow }" value="${tomorrow }" -->
									</div>
								</div>
							</div>
						</div>
						<div class=main_count_box>
							<div role="button" >
								<input type="hidden" name="ro_count" value="2">
								<!-- select 저장용 -->
								<select id="select_ro_count" class="form-select form-select-lg" onchange="change_ro_count()" style="border: none; width: 50px;">
									<option value="1">1</option>
									<option value="2" selected>2</option>
									<option value="3">3</option>
									<option value="4">4</option>
								</select>
							</div>
						</div>
						<div style="border-left: 1px solid #c8c8c8;">
							<input type=search class=main_search_text placeholder=지역,숙소명 name="pen_address" required>
						</div>
						<div class="main_search_button_box">
							<button type=submit style="border: none;" class="btn main_search_button">검 색</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 메인검색창 끝 -->
		
<table border="1">
<tr><td>펜션 이름</td><td>펜션 주소</td></tr>
<c:forEach var="PensionDTO" items="${pensionList }">
<tr>
	<%-- <td>${PensionDTO.pen_image }</td> --%>
    <td>${PensionDTO.pen_name }</td>
    <td>${PensionDTO.pen_address }</td>
<%--     <td>${PensionDTO.rm_price }</td> --%>  <!-- 방가격중 최저가가 나타나도록 구현 -->
    <td><!-- 리뷰 갯수  --></td></tr>	<!-- 펜션 리뷰개수 쿼리 -->
</c:forEach>
</table>
	



</div>
			<!-- 숙소 리스트 -->

			<!-- 숙소 리스트 끝 -->

</body>
</html>