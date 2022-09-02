<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
       <style>
/* #menu a { */
/*   position: relative; */
/*   display: inline-block; */
/*   transition: .3s; */
/* } */
/* #menu a::after { */
/*   position: absolute; */
/*   bottom: 0; */
/*   left: 50%; */
/*   content: ''; */
/*   width: 0; */
/*   height: 1px; */
/*   background-color: rgb(235,70,70); */
/*   transition: .3s; */
/*   -webkit-transform: translateX(-50%); */
/*   transform: translateX(-50%); */
/* } */
/* #menu a:hover::after { */
/*   width: 100%; */
/* } */

.navbar-nav > li > .dropdown-menu {
    margin-top: 0;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    display: block;
    transform: scale(0);
    transition: ease-out 0.3s;
}
.dropdown:hover .dropdown-menu {
    transform: scale(1);
}
.dropdown-menu1
{
	border:none;
	display: block;
  transform: scale(1)!important;
	height: 0px;
	overflow: hidden;
	padding: 0px;
	top: 180px;
	transition: all .3s;
}
.dropdown:hover .dropdown-menu1
{
	display: block;
	top: 100%;
	height: inherit;
}



header .navs ul li ul li {
	margin:0px;
    padding: 20px;

}
    </style>
    
</head>

    <body>
        <header id="menu-jk" class="container-fluid">
            <div class="row">
                <div class="col-md-3 logo">
                	<a href="${pageContext.request.contextPath }/search/main"><!-- 로고에 메인페이지 링크 추가 -->
                    	<img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png" alt="">
                    	
                	</a>
                	
                     <a data-toggle="collapse" data-target="#menu" href="#menu"><i class="fas d-block d-md-none  small-menu fa-bars"></i></a>
                </div>
                <div class="col-sm-3"></div>
                <div id="menu" class="col-lg-6 col-md-6	 d-none d-md-block navs ">
                    <ul>
                        
                     <c:choose> 
						<c:when test="${sessionScope.user_id == null}">
							<li><a href="${pageContext.request.contextPath }/map">지도</a></li>
							<li><a href="#">펜션목록</a></li>
	                        <li><a href="${pageContext.request.contextPath}/ member/mypage/listReservation">예약내역</a></li>
<%-- 							<li><a href="${pageContext.request.contextPath }/reservationList/reserveList">예약내역</a></li> --%>
			               <li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">더보기 <span class="caret"></span></a>
						          <ul class="dropdown-menu dropdown-menu1">
						            <li><a href="#">공지사항</a></li>
						            <li><a href="#">이벤트</a></li>
						            <li><a href="${pageContext.request.contextPath}/member/mypage/listInquiry">1:1 문의</a></li>
						          </ul>
						        </li>
							<li><a href="${pageContext.request.contextPath }/member/join">회원가입</a></li>
							<li><a href="${pageContext.request.contextPath }/member/login">로그인</a></li>
						</c:when> 
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/map">지도</a></li>
							<li><a href="#">펜션목록</a></li>
	                        <li><a href="${pageContext.request.contextPath}/ member/mypage/listReservation">예약내역</a></li>
<%-- 							<li><a href="${pageContext.request.contextPath }/reservationList/reserveList">예약내역</a></li> --%>
			               <li class="dropdown">
						          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">더보기 <span class="caret"></span></a>
						          <ul class="dropdown-menu dropdown-menu1">
						            <li><a href="#">공지사항</a></li>
						            <li><a href="#">이벤트</a></li>
						            <li><a href="${pageContext.request.contextPath}/member/mypage/listInquiry">1:1 문의</a></li>
						          </ul>
									<li><a href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
										 <li class="dropdown">
							          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">id <span class="caret"></span></a>
							          <ul class="dropdown-menu dropdown-menu1">
							            <li><a href="${pageContext.request.contextPath}/member/mypage/">마이페이지</a></li>
							            <li><a href="#">포인트내역 조회</a></li>
							            <li><a href="#">내가쓴 댓글</a></li>
							            <li><a href="${pageContext.request.contextPath}/member/mypage/listInquiry">1:1 문의</a></li>
							          </ul>
						        </li>
						</c:otherwise> 
					</c:choose>
<!--                         <li><a href="contact-us.html">Contact US</a></li> -->
                    </ul>
                </div>
                <div class="col-md-3 d-none d-lg-block socila-link">
                    <ul>
<!--                         <li> --> <!-- 페이스북 --> 
<!--                             <i class="fab fa-facebook-square"></i> -->
<!--                         </li> -->
<%-- 							<c:if test="${sessionScope.user_id != null}"> --%>
<%-- 								<c:choose>  --%>
<%-- 									<c:when test="${sessionScope.user_type == '0'}"> --%>
<%-- 										<li><a href="${pageContext.request.contextPath }/admin/a_index">관리자 페이지</a></li> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<li><a href="${pageContext.request.contextPath }/member/m_myPage">My Page</a></li>  --%>
<%-- 									</c:otherwise>  --%>
<%-- 								</c:choose> --%>
<%-- 							</c:if> --%>
                    </ul>
                </div>
            </div>
        </header>
        