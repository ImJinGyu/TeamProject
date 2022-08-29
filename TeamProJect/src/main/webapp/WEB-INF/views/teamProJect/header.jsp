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
</head>

    <body>
        <header id="menu-jk" class="container-fluid">
            <div class="row">
                <div class="col-md-3 logo">
                	<a href="${pageContext.request.contextPath }/search/main"><!-- 로고에 메인페이지 링크 추가 -->
                    	<img src="${pageContext.request.contextPath }/resources/images/busan_onna_logo.png" alt="">
                	</a>
                     <a data-toggle="collapse" data-target="#menu" href="#menu"><i class="fas d-block d-lg-none  small-menu fa-bars"></i></a>
                </div>
                <div id="menu" class="col-lg-6 col-md-9 d-none d-md-block navs">
                    <ul>
                        <li><a href="${pageContext.request.contextPath }/search/main">부산온나</a></li>
                        <li><a href="${pageContext.request.contextPath }/reservationList/reserveList">예약내역</a></li>
                        <li>
                        <c:choose> 
							<c:when test="${sessionScope.user_id == null}">
								<li><a href="${pageContext.request.contextPath }/member/login">로그인</a></li>
								<li><a href="${pageContext.request.contextPath }/member/join">회원가입</a></li>
							</c:when> 
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/member/logout">로그아웃</a></li>
							</c:otherwise> 
						</c:choose>
						</li>
<!--                         <li><a href="contact-us.html">Contact US</a></li> -->
                    </ul>
                </div>
                <div class="col-md-3 d-none d-lg-block socila-link">
                    <ul>
<!--                         <li> --> <!-- 페이스북 --> 
<!--                             <i class="fab fa-facebook-square"></i> -->
<!--                         </li> -->
						<c:if test="${sessionScope.user_id != null}">
							<c:choose> 
								<c:when test="${sessionScope.user_id == 'admin'}">
									<li><a href="${pageContext.request.contextPath }/admin/admin_page">관리자 페이지</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath }/member/m_myPage">My Page</a></li> 
								</c:otherwise> 
							</c:choose>
						</c:if>
                        <li>
                            <i class="fab fa-twitter-square"></i>
                        </li>
                        <li>
                            <i class="fab fa-instagram"></i>
                        </li>
<!--                         <li> --> <!-- 링크드인 -->
<!--                             <i class="fab fa-linkedin"></i> -->
<!--                         </li> -->
                    </ul>
                </div>
            </div>
        </header>
        