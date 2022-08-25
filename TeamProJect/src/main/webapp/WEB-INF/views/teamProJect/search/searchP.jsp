<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
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
							<input type=search class=main_search_text placeholder=지역,숙소명 name="bu_address" required>
						</div>
						<div class="main_search_button_box">
							<button type=submit style="border: none;" class="btn main_search_button">검 색</button>
						</div>
					</div>
				</div>
			</form>
		</div>





</div>
			<!-- 숙소 리스트 -->
			<div class="search_list_mainbox">
				<c:forEach var="p" items="${p_list}">
					<div class="search_list_box">
						<form action="${pageContext.request.contextPath}/reservation/detail" class="search_list_abox" method="get">
							<input type="hidden" name="bu_email" value="${bu.bu_email }">
							<input type="hidden" name="checkin" value="${checkin }">
							<input type="hidden" name="checkout" value="${checkout }">
							<input type="hidden" name="ro_count" value="${ro_count }">
							<div class="reserve_room" style="width: 690px; margin-top: 0px; padding-left: 385px;">
								<p class="reserve_pic_view" style="width: 330px;">
									<img src="${bu.picLocation}" class="rounded" style="width: 330px; height: 226px; object-fit: cover;">
								</p>
								<div style="margin: 0 auto"></div>
								
								<div class="search_room_title" style="width: 300px; margin-bottom: -2px;">
									<strong >${bu.bu_title}</strong>
									<p class="gray_text" style="font-size: 14px; margin-top:10px;">
										<img src="https://cdn4.iconfinder.com/data/icons/music-ui-solid-24px/24/location_map_marker_pin-2-512.png" style="width: 20px;"> ${bu.bu_address}
									</p>
								</div>
								<div class="reserve_room_price row" style="width: 300px;">
									<div class="col-sm-6">
										<strong class="medium_text">가격</strong>
									</div>
									<div class="col-sm-6 right_text">
										<b class="large_text"><fmt:formatNumber value="${bu.minPrice}" pattern="#,###" />원</b>
									</div>
								</div>
								<input type="submit" class="reserve_room_btn default_btn medium_text rounded" value="숙소 살펴보기" style="margin-left: -5px;">
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
			<!-- 숙소 리스트 끝 -->
			
		</div>
	</div>

</body>
</html>