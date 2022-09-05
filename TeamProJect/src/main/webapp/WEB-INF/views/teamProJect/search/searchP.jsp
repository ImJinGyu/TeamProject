<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 	<style type="text/css">

	a.page-link {
	  color: #000; 
	  background-color: #ff4a52;
	  border: 1px solid #ff4a52; 
	}
	
	a.page-item.active .page-link {
	 z-index: 1;
	 color: #ff4a52;
	 font-weight:bold;
	 background-color: #ff4a52;
	 border-color: #ff4a52;
	 
	}
	
	a.page-link:focus, a.page-link:hover {
	  color: #ff4a52;
	  background-color: #ff4a52; 
	  border-color: #ff4a52;
	}
	</style> -->
	
    
</head>

<body>
<%@ include file="../header.jsp" %>
<!--헤더 -->

<div style="padding-bottom: 60px;"></div>

		<!-- 검색창 시작 -->
	<!-- <form class="form mt-1" action="/pension/list" name="filterFrm"> -->
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
						<button class="btn btn-primary w-100" type=submit id="btnSearchFilter"
						style="border: none; border-radius: 10px; height: 48px; font-size: 27px; font-family: 'Do Hyeon', sans-serif;" >검 색</button>
					</div>
				</div>
			</form> 
		</div>
	</div>
<!-- 검색창 끝 -->
		

			<!-- 여수어때 스크롤 방식 적용 테스트 -->
	<%-- <div class="section search-result-wrap mt-4">
		<div class="container">
			<div class="row posts-entry">
				<div class="col-lg-8 pensionlist">
					<div class="row text-start pt-5 border-top mb-4">
					
					</div>
				</div>
				
				<div class="col-lg-4 sidebar">
					
					<!--  END sidebar-box-->
					<div class="sidebar-box">
						<h3 class="heading">Popular Posts</h3>
						<div class="post-entry-sidebar">
							<ul>
							<c:forEach items="${pensions}" var="p" begin="0" end="3">
								<li>
									<a href="/pension/detail?pensionid=${p.pensionid}">
										<img src="/display?path=${p.attachs[0].path}&uuid=${p.attachs[0].uuid}" alt="Image placeholder" class="me-4 rounded">
										<div class="text">
											<h4>${p.name}</h4>
											<div class="post-meta">
												<span class="mr-2"><fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}" /> 원</span>
											</div>
										</div>
									</a>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					
					<!--  END sidebar-box-->

					<div class="sidebar-box">
						<form>
							<h3 class="heading">Categories</h3>
							<div class="filter" >
								<div class="px-3">
									<p class="mb-3 font-weight-bold">펜션 유형</p>
									<div class="px-3">
										<input type="checkbox" name="category" id="category1" value="1"  class="mr-1"><label for="category1">펜션</label>
										<input type="checkbox" name="category" id="category2" value="2"  class="ml-2 mr-1"><label for="category2">풀빌라</label>
									</div>
								</div>
								<hr>
								<div class="public px-3">
									<p class="mb-3 font-weight-bold">공용 시설</p>
									<div class="px-3">
										<input type="checkbox" id="footVolleyballCourt" name="footVolleyballCourt" class="mr-1"><label for="footVolleyballCourt">족구장</label>
										<input type="checkbox" id="karaoke" name="karaoke" class="ml-2 mr-1"><label for="karaoke">노래방</label>
										<input type="checkbox" id="restaurant" name="restaurant" class="ml-2 mr-1"><label for="restaurant">식당</label>
										<input type="checkbox" id="convenienceStore" name="convenienceStore" class="ml-2 mr-1"><label for="convenienceStore">편의점</label><br>
										<input type="checkbox" id="parkingLot" name="parkingLot" class="mr-1"><label for="parkingLot">주차장</label>
										<input type="checkbox" id="bbq" name="bbq" class="ml-2 mr-1"><label for="bbq">바베큐</label>
										<input type="checkbox" id="seminarRoom" name="seminarRoom" class="ml-2 mr-1"><label for="seminarRoom">세미나실</label>
									</div>
								</div>
								<hr>
								<div class="internal px-3">
									<p class="mb-3 font-weight-bold">내부 시설</p>
									<div class="px-3">
										<input type="checkbox"  id="airConditioner" name="airConditioner" class="mr-1"><label for="airConditioner">에어컨</label>
										<input type="checkbox"  id="miniBar" name="miniBar" class="ml-2 mr-1"><label for="miniBar">미니바</label>
										<input type="checkbox"  id="bathTub" name="bathTub" class="ml-2 mr-1"><label for="bathTub">욕조</label>
										<input type="checkbox"  id="tv" name="tv" class="ml-2 mr-1"><label for="tv">TV</label><br>
										<input type="checkbox"  id="refrigerator" name="refrigerator" class="mr-1"><label for="refrigerator">냉장고</label>
										<input type="checkbox"  id="wifi" name="wifi" class="ml-2 mr-1"><label for="wifi">와이파이</label>
									</div>
								</div>
								<hr>
								<div class="other px-3">
									<p class="mb-3 font-weight-bold">기타</p>
									<div class="px-3">
										<input type="checkbox" id="breakfast" name="breakfast" class="mr-1"><label for="breakfast">조식</label>
										<input type="checkbox" id="pickup" name="pickup" class="ml-1 mr-1"><label for="pickup">픽업</label>
										<input type="checkbox" id="cooking" name="cooking" class="ml-1 mr-1"><label for="cooking">취사가능</label>
										<input type="checkbox" id="freeParking" name="freeParking" class="ml-1 mr-1"><label for="freeParking">무료주차</label><br>
										<input type="checkbox" id="campfire" name="campfire" class="mr-1"><label for="campfire">캠프파이어</label>
									</div>
								</div>
								<hr>
								<input type="submit" class="btn btn-primary btn-block btnSearch" value="적용" id="btnSearchFilter">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
 --%>

		
				<!-- 숙소 리스트 기존 방식 -->
				   <c:forEach items="${pensionList }" var="PensionDTO" varStatus="status">
					<div class="col-lg-8 pensionlist">
						<div class="row text-start pt-5 border-top mb-4"></div>
						<div class="blog-entry d-flex blog-entry-search-item pensions"
							data-pensionid="6867">
							<button class="img-link me-4">
							<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name=${PensionDTO.pen_name}&rm_checkin=${rm_checkin }&rm_checkout=${rm_checkout }"class="bg-white border-0">
								<img src="${pageContext.request.contextPath }/resources/upload/${PensionDTO.pen_image }" alt="Image" class="img-fluid">
							</a>
							</button>
							<div class="pensionInfo">
								<h2><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name=${PensionDTO.pen_name}&rm_checkin=${rm_checkin }&rm_checkout=${rm_checkout }"class="bg-white border-0">${PensionDTO.pen_name }</a>
								</h2>
								<p>${PensionDTO.pen_address }</p>
								<p>가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="${PensionDTO.rm_price }" /> 원</p>
								<p>별점 4.1<p>
								<p>리뷰 ${PensionDTO.rv }개</p>
							</div>
						</div>
					</div>
					</c:forEach>
	            <ul class="pagination justify-content-center" >
				<c:if test="${page.prev}">
					<li class="page-item"><a class="page-link" href="searchP?pageNum=${page.startPage-1}" >이전</a></li>
				</c:if>
				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
					<li class="page-item ${page.pageNum == p ? 'active' : ''}"><a class="page-link" href="searchP?pageNum=${p}">${p}</a></li>
				</c:forEach>
				<c:if test="${page.next}">
					<li class="page-item"><a class="page-link" href="searchP?&pageNum=${page.endPage+1}">다음</a></li>
				</c:if>
			</ul>
<!--  <nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link prevPage" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link nextPage" href="#">Next</a></li>
  </ul>
</nav>
 -->

	 

    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
</html>

</body>
  <script src="/resources/js/pension.js" ></script>
  <script>
  jQuery.fn.serializeObject = function() {
	    var obj = null;
	    try {
	        if (this[0].tagName && this[0].tagName.toLowerCase() == "form") {
	            var arr = this.serializeArray();
	            if (arr) {
	                obj = {};
	                jQuery.each(arr, function() {
	                	if(this.name.indexOf('.') != -1) {
	                		var key = this.name.substring(0, this.name.indexOf("."));
	                		console.log(key);
	                		if(!(key in obj)) {
	                			obj[key] = [];
	                		}
	                		var subkey = this.name.substring(this.name.indexOf(".")+1);
	                		var subvalue = this.value;
	                		var o = {};
	                		o[subkey] = subvalue;
	                		obj[key].push(o);
	                	}else {
		                    obj[this.name] = this.value;
	                	}
	                });
	            }
	        }
	    } catch (e) {
	        alert(e.message);
	    } finally {
	    }
	 
	    return obj;
	};
	
	var options;  
  $(function() {
	  $("#btnSearchFilter").click(function() {
		  event.preventDefault();
		  $(".pensionlist").html("")
		  options = $(this).closest("form").serializeObject();
		showList(lastPensionid, amount, options);
	  })	  
		  
	function getPensionStr(pension) {
		var path = '';
		var uuid = '';
		var price = pension.price != null ? pension.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') : 0;
		for(var i in pension.attachs) {
			path = pension.attachs[i].path.trim();
			uuid = pension.attachs[i].uuid;
			break;
		}
		str = "";
		str += '<div class="blog-entry d-flex blog-entry-search-item pensions" data-pensionid ="' + pension.pensionid + '">'
		str += '	<button class="img-link me-4">'
		str += '		<img src="/display?path=' + path + '&uuid=' + uuid + '" alt="Image" class="img-fluid">'
		str += '	</button>'
		str += '	<div>'
		str += '		<h2><a href="/pension/detail?pensionid=' + pension.pensionid + ('${startDate}' != "" ? "&startDate=" + '${startDate}' : "") + ('${endDate}' != "" ? "&endDate=" + '${endDate}' : "") + '" class="bg-white border-0">' + pension.name + '</a></h2>'
		str += '		<p>' + pension.address + '</p>'
		str += '		<p>가격 ' + price + ' 원</p>'
		str += '		<p>별점 ' + pension.starRate +  '</p>'
		str += '		<p>리뷰 ' + pension.replyCnt +  '</p>'
		str += '	</div>'
		str += '</div>'
		return str;
	}
	  
	  /* console.log(getPensionStr(pension)) */
	
		var lastPensionid;
		var amount; 
		function showList(lastPensionid, amount, option) {
			var param = {lastPensionid : lastPensionid, amount : amount, option : option}
			pensionService.getList(param, function(result) {
      		/* console.log(result) */
				var str = '';
				for (var i in result) {
					str += getPensionStr(result[i]);
				}
				/* console.log(str); */
				$(".pensionlist").append(str);
      		})
		}  
		showList(lastPensionid, amount);

	$(document).scroll(function () {
		var dh = $(document).height();
		var wh = $(window).height();
		var wst = $(window).scrollTop();
		
		if(dh == wh + wst) {
			var lastPensionid = $(".pensions").last().data("pensionid")
			showList(lastPensionid, amount, options);
		}
	})
  })
    </script>
<!-- 	<script type="text/javascript">
	
	
	
 	$(document).ready(function(){
	    start.init();
	});
	var start = {
	        param : {
	        	pageNum : 1,
	        	amount : 3,
	        },
	        
	        init : function() {
	           this.testData();
	           this.testEvent();
	        },
	       testData : function() {
	            this.setListItems("${firstData}"); // 첫 진입시 데이터 셋팅
	        },
	       testEvent : function() {
	            // 무한 스크롤
	            $(window).scroll(function() {
	                // 맨 밑으로 스크롤이 갔을경우 if문을 탑니다.
	                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
	                    start.param.curPage++; // 현재 페이지에서 +1 처리.
	                    
	                    start.testAjax(); //ajax 호출
	                } 
	            }); 
	        },
	        // 무한 스크롤 ajax 요청
	        testAjax : function() {
	            $.ajax({
	                type     : 'POST',
	                url      : '${pageContext.request.contextPath }/search/searchP',
	                data     : JSON.stringify(start.param), // 다음 페이지 번호와 페이지 사이즈를 가지고 갑니다.
	                dataType : 'json',
	                contentType: "application/json",
	                success : successCallback,
	                error : errorCallback
	            });
	            // 성공
	            function successCallback(data) {
	                if(data.testList.totListSize == 0 ){
	                    $(".gridList").append('<div class="noList"><span>표시할 항목이 없습니다.</span></div>');
	                } 
	                if(JSON.parse(data.testList).length != 0){
	                    testLoading.show(); //로딩 on(로딩바가 있을경우만 넣습니다. 없을경우 빼셔도 상관 없습니다.)
	                    start.setListItems(JSON.parse(data.testList));  //테스트 데이터 리스트 입니다.
	                    testLoading.hide(); //로딩 off(로딩바가 있을경우만 넣습니다. 없을경우 빼셔도 상관 없습니다.)
	                }    
	            }
	            
	            // 실패
	            function errorCallback() {
	                alert("실패");
	            }
	        },
	        
	        // 테스트 데이터 setting
	        setListItems : function (list) {
	            $.each(list, function(i, testData) {
	                
	                // 부모 엘리먼트에 append 할 데이터를 셋팅한다.
	                var $li = $('<li>')
	                                .append($('<div>').text(testData.name))
	                                .append($('<div>').text(testData.phoneNm))
	                                .append($('<div>')
	                                .append($('<span>').text(testData.birth));
	                                                    
	                
	                // 부모 엘리먼트에 append
	                $('#test_list').append($li);
	            })
	        }
	}
	
	
	 
	 -->
	
	
<%-- 	
/* 	//1. 스크롤 이벤트 최초 발생
	$(window).scroll(function() {
		//2. 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
		if ($(window).scrollTop() >= $ (document).height () - $(window).height()) {
			
			//3. ajax로 서버에 게시물 데이터 요청
				//4. DOM 핸들리 
		}
		
	});
		
	
		var lastScrollTop = 0;
		
		$(window).scroll(function()) {
			
			//현재 스크롤 좌표
			var currentScrollTop = $(window).scrollTop();
			//다운 스크롤
			if( currentScrollTop - lastScrollTop > 0) {
				lastScrollTop = currentScrollTop;
			}
			// 업스크롤
			else {
				//현재 스크롤 좌표를 이전 스크롤 좌표로 할당
				lastScrollTop = currentScrollTop;
			}
			
		});
		
		var lastbno = $(".scrolling:last").attr("data-bno");
		
		//4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내며 그 다음 20개의 게시물 데이터를 받아온다.
		$.ajax({
			type : 'get',	//요청 method 방식
			url : '${pageContext.request.contextPath }/search/searchP' //요청할 서버의 url
			header : {
				"content-Type" : "application/json",
				"X-HTTP-Method-Override" : "GET"
			},
			dataType : 'json',	// 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
			data : JSON.stringify({ // 서보로 보낼 데이터 명시
				bno : lastbno
			}),
			// ajax 가 성공했을시에 수행 될 function이다.
			//이 function의 파라미터는 서버로부터 return받은 데이터이다.
			success : function(data) {
				var str="";
				
				// 5. 받아온 데이터가 ""이거나 null이 아닌 경우에 DOM handling을 해준다.
				if(data != "") {
					//6. 서버로부터 받아오 data가 list이므로 이 각각의 원소에 접근하려면 each문을 사용한다.
					$(data).each(
						// 7. 새로운 데이터 갖고 html코드형태의 문자열을 만들어준다.
						function(){
							console.log(this);
							str += ""
								+
								+
								+
						}
					)
				}
			}
		})
 */

	< --%><!-- /script> -->
