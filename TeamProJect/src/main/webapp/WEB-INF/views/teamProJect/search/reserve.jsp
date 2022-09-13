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
					${businessDTO.PEN_NAME }<!-- 기장 비치하임펜션 -->
				</p>
				<p class="rName">
					<strong class="rStrong">객실타입 / 기간</strong>
					${businessDTO.RM_NAME }
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
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${businessDTO.RM_PRICE }"/> 원<!-- 99,000원 -->
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
						<input type="text" name="userName" placeholder="체크인시 필요한 정보입니다." maxlength="20">
					</p>
					<p class="alert_txt">
						<!-- 한글, 영문, 숫자만 입력 가능. (문자 사이 공백은 1칸만 입력 가능) -->
					</p>
					
					<div style="padding-bottom: 50px;"></div>
					
					<div>
						<strong>휴대폰 번호</strong>
						<span>개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</span>
						<div>
							<div class="inp_wrap">
								<input type="tel" name="userPhone" placeholder="체크인시 필요한 정보입니다." maxlength="13" value="" class="">
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
// 		var headerName = $("meta[name='_csrf_header']").attr("content")
// 		var token = $("meta[name='_csrf']").attr("content")
		
// 		$(document).ajaxSend(function(e, xhr) {
// 			xhr.setRequestHeader(headerName, token);
// 		})
		
		function iamport(){
			var amount = '${rm_price }';
			//가맹점 식별코드
			IMP.init('imp84747824');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : '${room.roomNum}' + new Date().getTime(),
			    name : '(주)부산온나' , 	//결제창에서 보여질 이름
			    amount : amount, 		//실제 결제되는 가격
			    buyer_email : '${user.email}',
			    buyer_name : '${user.name}',
			    buyer_tel : '${user.phone}',
			    buyer_addr : '${user.roadAddr}',
			    buyer_postcode : '${user.zipNo}'
			}, function(rsp) {
				console.log(rsp);
				
		        var reservation = {
	        		reservationNum: rsp.merchant_uid,
                    checkin: '${date1}',
                    checkout: '${date2}',
					paymentPrice: '${prePayment}',
                    roomNum: '${room.roomNum}',
                    userid: '${user.userId}',
                    pensionid: '${pension.pensionid}'
       	   	 	};
       	   	 	
			    if (rsp.success) {
			        var msg = '결제가 완료되었습니다.';
			        console.log(reservation);
			        alert(msg);
			      
			        $.ajax({
			         	url: "/verifyIamport/" + rsp.imp_uid,
			        	type: "POST",
			        	headers: { "Content-Type": "application/json" },
			        	data: JSON.stringify(reservation),
			        	dataType:"json",
			            contentType:"application/json; charset=utf-8"
			        })
			      
			        location.href = '${pageContext.request.contextPath}/member/mypage/listReservation';
			    } else {
			      var msg = rsp.error_msg;
			      alert(msg);
			    }
			});
		}
	</script>
	
<!-- 	<script> -->
// 		var point = '${user.point}';
// 		var prePayment = '${prePayment}';
// 		$(function() {
// 			$('#point').val((point * 1).toLocaleString());
// 			$('#usePoint').keyup(function() {
// 				if($('#usePoint').val() - $('#point').val() > 0) {
// 					alert('사용 가능 포인트를 초과하였습니다.')
// 					$('#point').val(point.toLocaleString());
// 					$('#usePoint').val(0);
// 					$('#discount').html('0 원');
// 					$('#payment').text(prePayment + ' 원');
// 				}
// 				else {
// 					if(prePayment - $('#usePoint').val() < 1000) {
// 						alert('최소 결제 금액은 1,000입니다.')
// 						$('#usePoint').val((prePayment - 1000));
// 						$('#point').val((point - prePayment - 1000).toLocaleString());
// 						$('#discount').html('- ' + (prePayment -1000 * 1).toLocaleString() + ' 원');
// 						$('#payment').text('1,000 원');
// 					}
// 					else {
// 						$('#point').val((point - $('#usePoint').val()).toLocaleString());
// 						$('#discount').html('- ' + $('#usePoint').val() + ' 원');
// 						$('#payment').text((prePayment - $('#usePoint').val()).toLocaleString() + ' 원');
// 					}
// 				}
// 			})
// 		})
<!-- 	</script> -->

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    
</body>
</html>