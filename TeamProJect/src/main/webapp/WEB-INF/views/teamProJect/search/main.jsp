<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <style>
    .text-center {
    color: #007bff!important;
    margin: 0;
    padding: 0;
    border: 0;
    box-sizing: border-box;
    font-size: 26px;
    display: block;
    font-weight: 700;
    --bs-gutter-x: 1.0rem;
    --bs-gutter-y: 0;
    text-align: center!important;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans","Liberation Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
}
	
    </style>
</head>

<body>
<!--헤더 -->
<%@ include file="../header.jsp" %>
 
    <!-- ******************** Slider Starts Here ******************* -->
    <div class="slider">
        <!-- Set up your HTML -->
        <div class="owl-carousel ">
            <div class="slider-img">
                <div class="item">
                    <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-0.jpg" alt=""></div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                                <div class="animated bounceInDown slider-captions">
<!--                                     <h1 class="slider-title">Most Stylish Free Travel Website</h1> -->
<!--                                     <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-1.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">It's time for better help.</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-2.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-3.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-4.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-5.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-6.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--             <div class="item"> -->
<%--                 <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-7.jpg" alt=""></div> --%>
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"> -->
<!--                             <div class="slider-captions "> -->
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            <div class="item">
                <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-8.jpg" alt=""></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12">
                            <div class="slider-captions ">
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!--             <div class="item"> -->
<%--                 <div class="slider-img"><img src="${pageContext.request.contextPath }/resources/images/slider/busan_onna_slider-9.jpg" alt=""></div> --%>
<!--                 <div class="container"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-12 col-xs-12"> -->
<!--                             <div class="slider-captions "> -->
<!--                                 <h1 class="slider-title">Most Attractive Travel Template</h1> -->
<!--                                 <p class="slider-text hidden-xs">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's</p> -->
                               
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
            
        </div>
    </div>
<!--     <div class="search container-fluid"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-4 "> -->
<!--                     <h4>Where you want to go?</h4> -->
<!--                 </div> -->
<!--                 <div class="col-md-8"> -->
<!--                     <div class="row form-detail"> -->
<!--                         <div class="col-md-3 ffb"> -->
<!--                             <select name="" id="" class="form-control"> -->
<!--                                 <option value="">Travel Destinaton</option> -->
<!--                                 <option value="1">Australia</option> -->
<!--                                 <option value="2">Canada</option> -->
<!--                             </select> -->
<!--                         </div> -->
<!--                          <div class="col-md-3 ffb"> -->
<!--                             <input placeholder="Select Date" type="text" class="form-control"> -->
<!--                         </div> -->
<!--                          <div class="col-md-3 ffb"> -->
<!--                              <select name="" id="" class="form-control"> -->
<!--                                 <option value="">Travel Type</option> -->
<!--                                 <option value="1">First Option</option> -->
<!--                                 <option value="2">Second Option</option> -->
<!--                             </select> -->
<!--                         </div> -->
<!--                          <div class="col-md-3 ffb"> -->
<!--                             <button class="btn btn-primary w-100">Search</button> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->


	<!-- 검색창 시작 -->
	<div class="search container-fluid" style="background-color: gainsboro;">
		<div class="container" style="background-color: white; border-radius: 10px; padding: 2.5px 2.5px 2.5px 2.5px;">
			<form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get"  style="margin: auto ;border: solid white !important;">
				<div class="row form-detail" style="margin: auto;">
					<div class="col-md-2 ffb">
                            <input type='date' id="checkin" min="${today }" value="${today }" class="main_checkin_1" name="rm_checkin" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px;" required>
					</div>
					<div class="col-md-2 ffb">
                            <input type='date' id="checkout" min="${tomorrow }" value="${tomorrow }" class="main_checkout_1" name="rm_checkout" onchange="dateChk()"
                            style="width: 99%; margin: 0px 2.25px; border-left: 0;" required>
					</div>
					<div class="col-md-1 ffb">
<!-- 					<input type="hidden" name="ro_count" value="2"> -->
						<!-- select 저장용 -->
						<div>
                           <select id="select_ro_count" class="form-select form-select-lg" onchange="change_ro_count()" name="rm_resable_num" value="${rm_resable_num }"
                           style="border: none; width: 99%; height: 48px; margin: 0px 2.25px; padding: 13px;">
							     <option value="1">1</option>
							     <option value="2" selected>2</option>
							     <option value="3">3</option>
							     <option value="4">4</option>
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
	
<!--     <div style="background-color: #f5f5f5"> -->

		<!-- 메인페이지 검색 창 -->
<!-- 		<div class=main_first_box> -->
<%-- 			<form action="${pageContext.request.contextPath}/search/searchP" name="f" method="get"> --%>
<!-- 				<div class="mtb"></div><br> -->
<!-- 				<div class=main_twice_box> -->
<!-- 					<input type="hidden" name="bu_id" id="bu_id" value="1"> -->
<!-- 					<div class="main_search_all"> style="padding-top: 10px;" -->
<!-- 						<div class=main_checkinout> -->
<!-- 							<div role=button> -->
<!-- 								<div class="main_checkinout_buttonbox"> -->
<!-- 									<div> -->
<%-- 										<input type='date' id="checkin" min="${today }" value="${today }" class="main_checkin_1" name="checkin" onchange="dateChk()" required><!-- min="${today }" value="${today }" --> --%>
<!-- 									</div> -->
<!-- 									<div> -->
<%-- 										<input type='date' id="checkout" min="${tomorrow }" value="${tomorrow }" class="main_checkout_1" name="checkout" onchange="dateChk()" required><!-- min="${tomorrow }" value="${tomorrow }" --> --%>
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class=main_count_box> -->
<!-- 							<div role="button" > -->
<!-- 								<input type="hidden" name="ro_count" value="2"> -->
<!-- 								select 저장용 -->
<!-- 								<select id="select_ro_count" class="form-select form-select-lg" onchange="change_ro_count()" style="border: none; width: 50px;"> -->
<!-- 									<option value="1">1</option> -->
<!-- 									<option value="2" selected>2</option> -->
<!-- 									<option value="3">3</option> -->
<!-- 									<option value="4">4</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div style="border-left: 1px solid #c8c8c8;"> -->
<!-- 							<input type=search class=main_search_text placeholder=지역,숙소명 name="bu_address" required> -->
<!-- 						</div> -->
<!-- 						<div class="main_search_button_box"> -->
<!-- 							<button type=submit style="border: none;" class="btn main_search_button">검 색</button> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</form> -->
<!-- 		</div> -->
    

    <!-- ******************** Popular Packages Starts Here ******************* -->
  <section class="container-fluid popular-pack">
        <div class="container">
             <div class="session-title row">
              <h2>부산 온나 #
                <a class="text"></a></h2> 
                <style>
               		.text {
					  margin-left: .6rem;
					  border-right: 2px solid #777;
					  padding-right: .4rem;
					  font-size: 2.2rem;
					  animation: cursor .9s infinite steps(2);
					}
					
					@keyframes cursor {
					  from { border-right: 2px solid #222; }
					  to { border-right: 2px solid #777; }
					}
                </style> 
                
                <script>
                
                const $text = document.querySelector(".text");
             // 글자 모음
             const letters = ["TOP 6", "펜션", "TOP 6"];
             // 글자 입력 속도
             const speed = 100;
             let i = 0;
             // 타이핑 효과
             const typing = async () => {  
               const letter = letters[i].split("");
               
               while (letter.length) {
                 await wait(speed);
                 $text.innerHTML += letter.shift(); 
               }
               
               // 잠시 대기
               await wait(800);
               
               // 지우는 효과
               if (letters[i + 1]) remove();
             }
             // 글자 지우는 효과
             const remove = async () => {
               const letter = letters[i].split("");
               
               while (letter.length) {
                 await wait(speed);
                 
                 letter.pop();
                 $text.innerHTML = letter.join(""); 
               }
               
               // 다음 순서의 글자로 지정, 타이핑 함수 다시 실행
               i++;
               typing();
             }
             // 딜레이 기능 ( 마이크로초 )
             function wait(ms) {
               return new Promise(res => setTimeout(res, ms))
             }
             // 초기 실행
             setTimeout(typing, 1500);
                </script>
            </div>
            
            <div class="row pack-row">
             <c:forEach items="${TopList }" var="PensionDTO" begin="0" end="5">
                <div class="col-md-4">
                    <div class="colpack">
                    	<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name=${PensionDTO.pen_name}">
                        <img src="${pageContext.request.contextPath }/resources/upload/${PensionDTO.pen_image }" alt="">
                        </a>
                        <div class="details row no-margin">
                            <h4>${PensionDTO.pen_name}</h4>
                            <p>${PensionDTO.pen_address }</p>
                            <p>평점 ${PensionDTO.star }</p>
                            <ul class="rat">
                            <li>
                            <fmt:parseNumber var="star" type="number" value="${PensionDTO.star}" />
                            <c:forEach var="i" begin="1" end="5" step="1">
                            			<c:choose>
                            			<c:when test="${i <= star}">
                            			<i class="fa fa-star" style="color: #fdae5c"></i>
                            			</c:when>
                            			<c:otherwise>
                            			<i class="fa fa-star" style="color: #fdae5c; font-weight: 100;"></i>
                            			</c:otherwise>
                            			</c:choose>
                            		</c:forEach> 
                            </li>
                            </ul>
                            
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>

    
    
  <!--################### Tour Review Starts Here #######################--->   
    
     
<!--      <div class="review container-fluid"> -->
<!--          <div class="container"> -->
<!--               <div class="session-title"> -->
<!--                 <h2>What people say about Us</h2> -->
<!--                 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sollicitudin nisi id consequat bibendum. Phasellus at convallis elit. In purus enim, scelerisque id arcu vitae</p> -->
<!--             </div> -->
<!--             <div class="row review-row"> -->
<!--                 <div class="col-md-6"> -->
<!--                     <div class="review-col"> -->
<!--                         <div class="profil"> -->
<%--                           <img src="${pageContext.request.contextPath }/resources/images/testimonial/member-01.jpg" alt="">   --%>
<!--                         </div> -->
<!--                         <div class="review-detail"> -->
<!--                             <h4>Canadian Rockies</h4> -->
<!--                             <p>The sightseeing and activities were better than we even thought! I still can’t believe we did so much in such a short time, but we did not feel stressed. We really loved the tour and would do it all over again in a minute! Thanks.</p> -->
<!--                             <h6>John Smith</h6> -->
<!--                             <ul class="rat"> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!--                 <div class="col-md-6"> -->
<!--                     <div class="review-col"> -->
<!--                         <div class="profil"> -->
<%--                           <img src="${pageContext.request.contextPath }/resources/images/testimonial/member-02.jpg" alt="">   --%>
<!--                         </div> -->
<!--                         <div class="review-detail"> -->
<!--                             <h4>Lake Tahoe Adventure</h4> -->
<!--                             <p>The sightseeing and activities were better than we even thought! I still can’t believe we did so much in such a short time, but we did not feel stressed. We really loved the tour and would do it all over again in a minute! Thanks.</p> -->
<!--                             <h6>John Smith</h6> -->
<!--                             <ul class="rat"> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!--                 <div class="col-md-6"> -->
<!--                     <div class="review-col"> -->
<!--                         <div class="profil"> -->
<%--                           <img src="${pageContext.request.contextPath }/resources/images/testimonial/member-02.jpg" alt="">   --%>
<!--                         </div> -->
<!--                         <div class="review-detail"> -->
<!--                             <h4>Discover Costa Rica</h4> -->
<!--                             <p>The sightseeing and activities were better than we even thought! I still can’t believe we did so much in such a short time, but we did not feel stressed. We really loved the tour and would do it all over again in a minute! Thanks.</p> -->
<!--                             <h6>John Smith</h6> -->
<!--                             <ul class="rat"> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                
<!--                 <div class="col-md-6"> -->
<!--                     <div class="review-col"> -->
<!--                         <div class="profil"> -->
<%--                           <img src="${pageContext.request.contextPath }/resources/images/testimonial/member-03.jpg" alt="">   --%>
<!--                         </div> -->
<!--                         <div class="review-detail"> -->
<!--                             <h4>Canadian Rockies</h4> -->
<!--                             <p>The sightseeing and activities were better than we even thought! I still can’t believe we did so much in such a short time, but we did not feel stressed. We really loved the tour and would do it all over again in a minute! Thanks.</p> -->
<!--                             <h6>John Smith</h6> -->
<!--                             <ul class="rat"> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                                 <li><i class="fa fa-star"></i></li> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--          </div> -->
<!--      </div> -->
     
     
      <!--################### Blog Starts Here #######################--->  
     
<!--         <div class="blog container-fluid"> -->
<!--             <div class="container"> -->
<!--                  <div class="session-title row"> -->
<!--                     <h2>Our Latest Blog</h2> -->
<!--                     <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi sollicitudin nisi id consequat bibendum. Phasellus at convallis elit. In purus enim, scelerisque id arcu vitae</p> -->
<!--                 </div> -->
<!--                 <div class="row blog-row"> -->
<!--                     <div class="col-md-4"> -->
<!--                         <div class="blogcol"> -->
<%--                             <img src="${pageContext.request.contextPath }/resources/images/packages/p1.jpg" alt=""> --%>
<!--                               <span>Oct 12, 2019</span>  -->
<!--                               <h4>Journeys Are Best Measured In New Friends</h4>  -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-4"> -->
<!--                         <div class="blogcol"> -->
<%--                             <img src="${pageContext.request.contextPath }/resources/images/packages/p2.jpg" alt=""> --%>
<!--                               <span>Oct 12, 2019</span>  -->
<!--                               <h4>Morbi sollicitudin nisi id consequat bibendum</h4>  -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-4"> -->
<!--                         <div class="blogcol"> -->
<%--                             <img src="${pageContext.request.contextPath }/resources/images/packages/p3.jpg" alt=""> --%>
<!--                               <span>Oct 12, 2019</span>  -->
<!--                               <h4>Journeys Are Best Measured In New Friends</h4>  -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
 	<!-- 카운트 -->


       <!--  ************************* Footer Start Here ************************** --> 
     <%@ include file="../footer.jsp" %>


    </body>

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
</html>
