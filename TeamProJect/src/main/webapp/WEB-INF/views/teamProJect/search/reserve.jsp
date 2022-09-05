<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Come to Busan - 부산온나</title>
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

<!--헤더 -->
<%@ include file="../header.jsp" %>
	<div style="padding-top: 100px;"></div>
	
	<div class="rReserve">
		<div class="rRight">
			<section class="rInfo">
				<p class="rName">
					<strong class="rStrong">숙소이름</strong>
					${pensionDTO.pen_name }<!-- 기장 비치하임펜션 -->
				</p>
				<p class="rName">
					<strong class="rStrong">객실타입 / 기간</strong>
					<%-- ${.rm_name } /  --%> A301호 / 1박
				</p>
				<p class="rName">
					<strong class="rStrong">체크인</strong>
					${rm_checkin} <%--${.check_in_t } 09.13 월 --%>15:00
				</p>
				<p class="rName">
					<strong class="rStrong">체크아웃</strong>
					${rm_checkout} <%-- ${.check_out_t } 09.14 화 --%>11:00
				</p>
			</section>
			<section class="total_price">
				<p>
					<strong class="rsTotalPrice">
						<b>총 결제 금액</b>
						(VAT포함)
					</strong>
					<span class="in_price">
						<!-- {.rm_price}원 -->99,000원
					</span>
				</p>
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다.</li>
					<li>결제완료 후 <span style="color: red;">예약자 이름</span>으로 바로 <span style="color: red;">체크인</span>하시면 됩니다.</li>
				</ul>
			</section>
			<button class="btn btn-primary w-100"
				style="border-radius:10px; font-size: 30px; font-family: 'Do Hyeon', sans-serif;">결 제 하 기</button>
		</div>
		<div class="rLeft">
			<div>
				<section class="info_chkin">
					<h3 style="margin-top: 0;">예약자 정보</h3>
					<strong>예약자 이름</strong>
					<p class="inp_wrap">
						<input type="text" name="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20">
					</p>
				</section>
			</div>
		</div>
		
	</div>

	<div style="padding-bottom: 1000px;"></div>
<!--footer -->
<%@ include file="../footer.jsp" %>

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
</body>
</html>