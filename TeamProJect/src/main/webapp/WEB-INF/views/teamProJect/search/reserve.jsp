<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="ko">
<!-- <html lang="en"> -->

<head>
	
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>결제페이지 | 부산온나</title>
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
					${businessDTO.PEN_NAME }<!-- 기장 비치하임펜션 -->
				</p>
				<p class="rName">
					<strong class="rStrong">객실타입 / 기간</strong>
					${businessDTO.RM_NAME } / <span>${days } 박</span>
				</p>
				<p class="rName">
					<strong class="rStrong">체크인</strong>
					${rm_checkin} ${businessDTO.RM_CHECKIN } <%--${.check_in_t } 09.13 월 15:00 --%>
				</p>
				<p class="rName">
					<strong class="rStrong">체크아웃</strong>
					${rm_checkout} ${businessDTO.RM_CHECKOUT }<%-- ${.check_out_t } 09.14 화 11:00--%>
				</p>
			</section>
			<section class="total_price">
				<p>
					<strong class="rsTotalPrice">
						<b>총 결제 금액</b>
						(VAT포함)
					</strong>
					<span class="in_price">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${total }"/> 원<!-- 99,000원 -->
					</span>
				</p>
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다.</li>
					<li>결제완료 후 <span style="color: red;">예약자 이름</span>으로 바로 <span style="color: red;">체크인</span>하시면 됩니다.</li>
				</ul>
			</section>
			<button class="btn btn-primary w-100"
				style="border-radius:10px; font-size: 30px; font-family: 'Do Hyeon', sans-serif;" onclick="iamport()">결 제 하 기
			</button>
		</div>
		<div class="rLeft">
			<div>
				<section class="info_chkin">
					<h3 style="margin-top: 0;">예약자 정보</h3>
					<strong>예약자 이름</strong>
					<p class="inp_wrap">
						<input type="hidden" name="user_id" value="${user_id}">
						<input type="text" name="user_name" maxlength="20" value="${memberDTO.user_name }" readonly style="margin: 10.5px 0; color: black;"><!--  placeholder="체크인시 필요한 정보입니다." -->
					</p>
					<p class="alert_txt">
						<!-- 한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능) -->
					</p>
					
					<div style="padding-bottom: 50px;"></div>
					
					<div>
						<strong>휴대폰 번호 </strong>
						<span>개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span>
						<div>
							<div class="inp_wrap">
								<input type="tel" name="user_phonenumber" maxlength="13" value="${memberDTO.user_phonenumber }" readonly class="" style="margin: 10.5px 0; color: black;"><!--  placeholder="체크인시 필요한 정보입니다." -->
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		
	</div>

	<div style="padding-bottom: 1000px;"></div>
<!--footer -->
<%@ include file="../footer.jsp" %>
	
	<script>
		var res_num = '${businessDTO.PEN_ID }' + '${param.room_id}' + '${uidRandom }';
// 		alert(res_num);
		function iamport(){
// 			debugger;
			var amount = '${total }';
// 			var b = '${businessDTO.USER_ID }';
			IMP.init('imp84747824');	//가맹점 식별코드	
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : res_num,
			    name : '(주)부산온나' , 	//결제창에서 보여질 이름
			    amount : amount, 		//실제 결제되는 가격
			    buyer_email : '${user.email}',
			    buyer_id : '${memberDTO.user_name }',
			    buyer_tel : '${user.phone}',
			    buyer_addr : '${user.roadAddr}',
			    buyer_postcode : '${user.zipNo}'}, 
			    
		function(rsp) {
			    	
				console.log(rsp);
		        var reservation = {
	        		res_num: rsp.merchant_uid,	// 예약번호
                    check_in: '${rm_checkin}' + '${businessDTO.RM_CHECKIN }',
                    check_out: '${rm_checkout}' + '${businessDTO.RM_CHECKOUT }',
					totalPrice: '${total }',
//                     roomNum: '${room.roomNum}',
                    user_id: '${businessDTO.USER_ID }',
                    pensionid: '${pension.pensionid}' };
       	   	 	
			    if (rsp.success) {
			        var msg = '결제가 완료되었습니다.';
			        console.log(reservation);
			        alert(msg);
			        $.ajax({
			         	url: "insertReservation",
			        	type: "POST",
			        	data: { 'user_id'	 :'${sessionScope.user_id}',
				        		'user_type'	 :'${sessionScope.user_type}',
				        		'pen_id'	 :'${businessDTO.PEN_ID }',
				        		'room_id'	 :'${param.room_id}',
				        		'rm_name'	 :'${businessDTO.RM_NAME }',
				        		'check_in_d' :'${rm_checkin}',
				        		'check_out_d':'${rm_checkout}',
				        		'check_in_t' :'${businessDTO.RM_CHECKIN }',
				        		'check_out_t':'${businessDTO.RM_CHECKOUT }',
			        		    'rm_price'	 :'${total }',
			        		    'res_status' :'1'
			        		   },
			        	dataType:"json",
			        })
			      
			        location.href = '${pageContext.request.contextPath}/member/mypage/listReservation';
			    } else {
			      var msg = rsp.error_msg;
			      alert(msg);
			    }
			});
		}
	</script>
	
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    
</body>
</html>