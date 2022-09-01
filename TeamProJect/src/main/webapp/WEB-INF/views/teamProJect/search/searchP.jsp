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

<div style="padding-bottom: 60px;"></div>

		<!-- 검색창 시작 -->
	<div class="search container-fluid" style="background-color: gainsboro;">
		<div class="container" style="background-color: white; border-radius: 10px; padding: 2.5px 2.5px 2.5px 2.5px;">
			<form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get"  style="margin: auto ;border: solid white !important;">
				<div class="row form-detail" style="margin: auto;">
					<div class="col-md-2 ffb">
                            <input type='date' id="checkin" min="${today }" value="${rm_checkin }" class="main_checkin_1" name="rm_checkin" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px;" required>
					</div>
					<div class="col-md-2 ffb">
                            <input type='date' id="checkout" min="${tomorrow }" value="${rm_checkout }" class="main_checkout_1" name="rm_checkout" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px; border-left: 0;" required>
					</div>
					<div class="col-md-1 ffb">
<!-- 					<input type="hidden" name="ro_count" value="2"> -->
						<!-- select 저장용 -->
						<div>
							<input type="hidden" name="rm_resable_num" value="${rm_resable_num}">
                           <select id="select_ro_count" class="form-select form-select-lg" onchange="change_ro_count()" name="rm_resable_num" value="${rm_resable_num }"
                           style="border: none; width: 99%; height: 48px; margin: 0px 2.25px; padding: 13px;">
                              <option value="1" <c:if test="${rm_resable_num == 1}">selected</c:if>>1</option>
                              <option value="2" <c:if test="${rm_resable_num == 2}">selected</c:if>>2</option>
                              <option value="3" <c:if test="${rm_resable_num == 3}">selected</c:if>>3</option>
                              <option value="4" <c:if test="${rm_resable_num == 4}">selected</c:if>>4</option>
                           </select>
						</div>
					</div>
                 	<div class="col-md-2 ffb">
						<input type=search class=main_search_text placeholder="지 역" name="pen_address" value="${pen_address }"
						style="width:99%; height: 48px; margin: 0px 2.25px; padding-left: 0;"><!--  required -->
					</div>
					<div class="col-md-2 ffb">
						<input type=search class=main_search_text placeholder="숙 소 명" name="pen_name" value="${pen_name }"
						style="width:99%; height: 48px; margin: 0px 2.25px; padding-left: 0;"><!--  required -->
					</div>
					<div class="col-md-3 ffb">
						<button class="btn btn-primary w-100" type=submit
						style="border: none; border-radius: 10px; height: 48px; font-size: 27px; font-family: 'Do Hyeon', sans-serif;" >검 색</button>
					</div>
				</div>
			</form>
		</div>
	</div>
<!-- 검색창 끝 -->
		

	 		<!-- 펜션리스트 불러오기 -->
	 	<div class="section search-result-wrap mt-4">
			<div class="container">
				<div class="row posts-entry" style="padding-bottom: 10px;">
				   <c:forEach var="PensionDTO" items="${pensionList }" varStatus="status">
					<div class="col-lg-8 pensionlist">
						<div class="row text-start pt-5 border-top mb-4"></div>
						<div class="blog-entry d-flex blog-entry-search-item pensions"
							data-pensionid="6867">
							<button class="img-link me-4">
							<a href="/pension/detail?pensionid=6867&amp;startDate=2022/08/28&amp;endDate=2022/08/29"class="bg-white border-0">
								<img src="${pageContext.request.contextPath }/resources/upload/${PensionDTO.pen_image }" alt="Image" class="img-fluid">
							</a>
							</button>
							<div class="pensionInfo">
								<h2><a href="/pension/detail?pensionid=6867&amp;startDate=2022/08/28&amp;endDate=2022/08/29"class="bg-white border-0">${PensionDTO.pen_name }</a>
								</h2>
								<p>${PensionDTO.pen_address }</p>
								<p>${PensionDTO.rm_price } 원</p>
								<p>별점 4.1<p>
								<p>리뷰 ${PensionDTO.rv }개</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>


     <%@ include file="../footer.jsp" %>
	 



</div>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
</body>


</html>