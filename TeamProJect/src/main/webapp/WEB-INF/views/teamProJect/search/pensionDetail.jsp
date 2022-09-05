<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <title>${pensionDTO.pen_name } | 부산온나</title>
    
</head>


<body>
<%@ include file="../header.jsp" %>

	<div>
		<div style="padding-top: 100px;"></div>
		<div class="pdDetail">
			<div class="pdTop"><!--  style="border: 1px solid blue; margin: 0 10% 20px 10%;" -->
				<div class="pdLeft" ><!-- style="float: left; width: 500px" -->
					<!-- 펜션 사진 (지원) -->
					<div class="pdGallery">
						<img alt="" src="${pageContext.request.contextPath }/resources/upload/${pensionDTO.pen_image }"><!-- 펜션 사진 -->
					</div>
				</div>
				<!-- //pdGallery -->
				<div class="pdRight"><!--  style="text-align: left;" -->
					<!-- 펜션 정보(이름 주소) (지원) -->
					<div class="pdInfo">
						<!-- <p class="pdBadge"></p> -->
			 			<h2 style="font-weight: bold; color: black;">
			 				${pensionDTO.pen_name }</h2>
						<p class="pdAddress">${pensionDTO.pen_address }</p>
					</div>
					<!-- //pdInfo -->
				</div>
				<!-- //pdRight -->
				<div class="pdC">
					<strong class="pdStrong">사장님 한마디</strong>
					<button class="pdButton">더보기</button>	<!-- 나중에 누가 더보기 구현좀.. -->
					<div class="pdClamp pdDiv">
						일광 해수욕장과 인근에 있어 객실에서 편안하게 오션뷰 감상이 가능한 펜션입니다<!-- 
						<br>
						일상에서 벗어나 가족과 함께하는 여행, 연인과의 로맨틱한 휴가를 즐길 수 있습니다 -->
					</div>
					<!-- //pdClamp pdDiv -->
				</div>
				<!-- //pdC -->
			</div>
			<!-- //pdTop -->
		</div>
		<!-- //pdDetail -->
	</div>
	
	<div class="pdTab" style="border-bottom: 1px solid gainsboro;"><!-- style="margin: 0 auto; padding: 0 16px; margin-top: 38px;" -->
			<button class="tButton">
				<span>객실안내/예약</span>
			</button>
			<button class="tButton">
				<span>숙소정보</span>
			</button>
			<button class="tButton">
				<span>리뷰</span>
			</button>
	</div>
	<!-- //tab -->
	
	<form action="${pageContext.request.contextPath }/search/reserve?pen_name=${pensionDTO.pen_name }&rm_checkin=${rm_checkin}&rm_checkout=${rm_checkout}" method="get" data-sel-date="" data-sel-date2=""
		style="margin: 15px 0; padding: 0; border: 0; box-sizing: border-box;">
		<input id="" type="hidden" name="pen_name" value="${pensionDTO.pen_name }">
		<input id="" type="hidden" name="" value="">
		<input id="" type="hidden" name="" value="">
		<input id="" type="hidden" name="" value="">
		<!-- 객실안내/예약 -->
		<article class="roomInfo">
			<div style="padding: 2.5px 2.5px 2.5px 2.5px;">
				<div class="row form-detail" style="margin: auto; border: 1px solid gainsboro; border-radius: 10px; width: auto; background: white;">
					<div class="col-md-2 ffb">
	                	<input type='date' id="checkin" min="${today }" value="${rm_checkin }" class="main_checkin_1" name="rm_checkin" onchange="dateChk()"
	                		style="width: 99%; margin: 0px 2.25px; padding: 0;" required>
						</div>
					<div class="col-md-2 ffb">
	                	<input type='date' id="checkout" min="${tomorrow }" value="${rm_checkout }" class="main_checkout_1" name="rm_checkout" onchange="dateChk()"
							style="width: 99%; margin: 0px 2.25px; padding: 0; border-left: 0;" required>
					</div>
				</div>
			</div>
		 	<div><!--  style="border: 1px solid red; margin: 10px 25%;" -->
				<div style="padding: 15px 2.5px;">
				 <c:forEach var="businessDTO" items="${searchRoomList }">
				 	<div class="room">
					 	<p class="pic_view"><img class="pensionPic" src="${pageContext.request.contextPath }/resources/upload/${businessDTO.RM_IMAGE }"
					 		style="display: inline-block;"></p>
					 	
						<strong class="penTitle">${businessDTO.RM_NAME }</strong>
						
						<div><!--  class="roomInfo" -->
							<div class="roomPrice">
								<div class="srPrice">
									
									<!-- 표시 금액 -->
									<div>
										<p class="subDate" style="text-decoration: inherit; visibility: hidden;">
										</p><!-- checkout_d - checkin_d -->
										<p style="color: black; font-size: 30px; border-bottom: 1px solid gainsboro; padding-bottom:5px; overflow: hidden; ">
										 <b style="float: left; font-size: 27px; color: #8c8c8c;">가격</b>
										<span style="float: right;"><b><fmt:formatNumber type="number" maxFractionDigits="3" value="${businessDTO.RM_PRICE }"/> 원</b></span></p>
									</div>
								</div>
								
								<%-- <div>
									체크인 / 체크아웃
									<div>
									${businessDTO.RM_CHECKIN } / ${businessDTO.RM_CHECKOUT }
									</div>
								</div> --%>
								
							</div>
						</div>
						
						<!-- <div style="margin: 15px 0;"></div> -->
					 	
					 	<div class="rButton">
					 		<button class="btn btn-primary w-100" style="border-radius:7px; height: 40px; ">
					 			<h4 style="color:white; font-family: 'Do Hyeon', sans-serif;">예 약 하 기</h4>
					 		</button>
					 	</div>
					 	<div style="margin: 0 0 25px 0;"></div>
				 	</div>
				 </c:forEach>
				</div>
			</div>
		</article>
	</form>
	
	<div>
	</div>
	

	
	
	
	
<!-- <table border="1"> -->
<!-- <tr><td>방 사진</td><td>방 호실</td></tr> -->
<%-- <c:forEach var="PensionDTO" items="${pensionList }"> --%>
<!-- <tr> -->
	<%-- <td>${PensionDTO.pen_image }</td> --%>
<%--     <td><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name=${PensionDTO.pen_name }">${PensionDTO.pen_name }</a></td> --%>
<%--     <td>${PensionDTO.pen_address }</td> --%>
<%--     <td>${PensionDTO.rm_price }</td> --%>  <!-- 방가격중 최저가가 나타나도록 구현 -->
<!--     <td>리뷰 갯수 </td></tr>	펜션 리뷰개수 쿼리 -->
<%-- </c:forEach> --%>
<!-- </table> -->
	
<!-- 	<div> -->
<!-- 		<ul> -->
<!-- 			<li><a href="#">객실안내/예약</a></li> -->
<!-- 			<li><a href="#">숙소정보</a></li> -->
<!-- 			<li><a href="#">리뷰</a></li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
	

</body>

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
</html>