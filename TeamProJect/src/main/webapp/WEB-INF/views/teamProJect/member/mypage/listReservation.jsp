<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Free Tour and Travel Website Tempalte | Smarteyeapps.com</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/fav.jpg">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slider/css/owl.theme.default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
     
</head>
<style>
a > b{
font-size: 19px;
}
a > b:hover{
color:blue;
}
</style>
<body>
<!--헤더 -->
<%@ include file="../../header.jsp" %>
 
<!--  ************************* Page Title Starts Here ************************** -->
<div class="page-nav no-margin row">
    <div class="container">
        <div class="row">
            <h2>예약내역조회</h2>
        </div>
    </div>
</div>

<!-- 마이페이지 폼 시작-->
<!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- DataTales Example -->
                    <div class="card shadow my-5">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">예약내역조회</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr class="text-center">
                                            <th>예약번호</th>
                                            <th style="width: 20%">숙소이름</th>
                                            <th style="width: 20%">방 이름</th>
                                            <th>체크인</th>
                                            <th>체크아웃</th>
                                            <th>예약취소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${list}" var="r">
	                                        <tr>
	                                            <td class="text-center">${r.res_number}</td>
	                                            <td class="text-center"><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${r.pen_id}&pen_name=${r.pen_name}"><b>${r.pen_name}</b></a></td>
	                                            <td class="text-center">${r.rm_name}</td>
	                                            <td class="text-center">${r.check_in_d}</td>
	                                            <td class="text-center">${r.check_out_d}</td>
	                                            <td>
	                                             <button class="text-center" onclick="cancelPay()" >취소하기
	                                             </button> 
	                                            </td>
<!-- 	                                            <td class="text-center"> -->
<%-- 	                                            <c:choose> --%>
<%-- 	                                            <c:when test="${r.res_status}"> --%>
<!-- 	                                            <b style="color: purple;">예약</b> -->
<%-- 	                                            </c:when> --%>
<%-- 	                                            <c:otherwise> --%>
<!-- 	                                            <b style="color: red;">취소</b> -->
<%-- 	                                            </c:otherwise> --%>
<%-- 	                                            </c:choose> --%>
<!-- 	                                            </td> -->
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


<!-- 마이페이지 폼 끝-->

<!--  ************************* Footer Start Here ************************** --> 
     
    <%@ include file="../../footer.jsp" %>
    
    	<script>
		var res_num = '${businessDTO.PEN_ID }' + '${param.room_id}' + '${uidRandom }';
// 		alert(res_num);
		function cancelPay(){
// 			debugger;
			var amount = res_num;
			alert(amount);
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
			        var msg = '정말로 취소하시겠습니까 ?';
			        console.log(reservation);
			        alert(msg);
			        $.ajax({
			         	url: "cancelReservation",
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

    </body>

    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
</html>
