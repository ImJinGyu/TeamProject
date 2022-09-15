<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/style.css" />
    <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet"> -->
</head>
<body>
<%@ include file="../header.jsp" %>
<!--헤더 -->

<div style="padding-bottom: 85px;"></div>

		<!-- 검색창 시작 -->
	<div class="search container-fluid" style="background-color: #e2e6e9;"><!-- gainsboro -->
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
		

				<!-- 숙소 리스트 불러오기 -->
				<div id="penlist123123">
  				   <c:forEach items="${pensionList }" var="PensionDTO">
					<div class="row form-detail  pensionlist">
						<div class="pensions" data-pensionid="${PensionDTO.pen_id}">
						  <div class="container">
							<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_id=${PensionDTO.pen_id}&rm_checkin=${rm_checkin }&rm_checkout=${rm_checkout }" >
								<img src="${pageContext.request.contextPath }/resources/upload/${PensionDTO.pen_image }" alt="Image" class="img-fluid">
							</a>
							<div class="pensionInfo">
							  <div class="infoBox1">
								<h2><a href="${pageContext.request.contextPath }/search/pensionDetail?&pen_id=${PensionDTO.pen_id}&rm_checkin=${rm_checkin }&rm_checkout=${rm_checkout }">${PensionDTO.pen_name }</a>
								</h2>
								<p>${PensionDTO.pen_address }</p>
							  </div>
							  
							  <div class="infoBox2">
								<p>가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="${PensionDTO.rm_price }" /> 원</p>
							  </div>
							  
							  <div class="infoBox3">
								<p>별점 ${PensionDTO.star }</p>
								<p>리뷰 ${PensionDTO.rv }개</p>
							  </div>
							</div>
						  </div>
						</div>
					</div>
					</c:forEach>
				</div>  
				<%@ include file="../footer.jsp" %>
</body>
<script type="text/javascript">
var index = 2;
var check = true;
window.addEventListener('scroll', () => {
	var scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	var windowHeight = window.innerHeight; // 스크린 창
	var fullHeight = document.body.scrollHeight;
	//var isFetching = false;
	if(scrollLocation + windowHeight >= fullHeight) {
		var count = ${page.amount};
	    if(!check){
	    	return;
	    }
	    check = false;
	    $.ajax({
	        url : 'searchPajax?pen_name="${param.pen_name}"&pen_address="${param.pen_address}"',
	        type : "get",
	        data : {'count': count, 'index2' : index},
	   		success:(data) => {
				if(data.length == 0){
					index--;
					return;
				} 
				
	   			$.each(data, function (index, PensionDTO) {
	   //				isFetching = true;
	   				
		   			$('#penlist123123').append('<div class="col-lg-8 pensionlist">' + 
									'<div class="pensions" data-pensionid='+PensionDTO.pen_id+'">'+
									'<div class="container">'+
									'<a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name='+PensionDTO.pen_name+'&rm_checkin='+PensionDTO.rm_checkin+'&rm_checkout='+PensionDTO.rm_checkout+'">'+
										'<img src="${pageContext.request.contextPath }/resources/upload/'+PensionDTO.pen_image+'" alt="Image" class="img-fluid">'+
									'</a>'+
									'<div class="pensionInfo">'+
									'<div class="infoBox1">'+
									'<h2><a href="${pageContext.request.contextPath }/search/pensionDetail?pen_name='+PensionDTO.pen_name+'&rm_checkin='+PensionDTO.rm_checkin+'&rm_checkout='+PensionDTO.rm_checkout+'">'+PensionDTO.pen_name+'</a>'+
										'</h2>'+
										'<p>'+PensionDTO.pen_address+'</p>'+
										'</div>'+
										'<div class="infoBox2">'+
										'<p>가격 '+PensionDTO.rm_price+'원</p>'+
										'</div>'+
										'<div class="infoBox3">'+
										'<p>별점 '+PensionDTO.star+'</p>'+
										'<p>리뷰 '+PensionDTO.rv+'개</p>'+
										'</div>'+
									'</div>'+
								  '</div>'+
								'</div>'+ 
							'</div>');
	   			})
	   			check = true;
	   			index++;
			}
	    });
	}

// 	   $(function() {
// 	 	  $("#btnSearchFilter").click(function() {
// 	 		  event.preventDefault();
// 	 		  $(".pensionlist").html("")
// 	 		  options = $(this).closest("form").serializeObject();
// 	 		showList(lastPensionid, amount, options);
// 	 	  })	  
			  
//	 	function getPensionStr(pension) {
	/* 		var path = '';
			var uuid = '';
			var price = pension.price != null ? pension.price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') : 0;
			for(var i in pension.attachs) {
				path = pension.attachs[i].path.trim();
				uuid = pension.attachs[i].uuid;
				break;
			} */
/* 	 		str = "";
	 		str += '<div class="blog-entry d-flex blog-entry-search-item pensions" data-pensionid ="' + pension.pen_id + '">'
	 		str += '	<button class="img-link me-4">'
	 		str += '		<img src="/resources/upload/' + pension.pen_image + '" alt="Image" class="img-fluid">'
	 		str += '	</button>'
	 		str += '	<div>'
	 		str += '		<h2><a href="/search/pensionDetail?pensionid=' + pension.pen_id + ('${rm_checkin}' != "" ? "&rm_checkin=" + '${rm_checkin}' : "") + ('${rm_checkout}' != "" ? "&rm_checkout=" + '${rm_checkout}' : "") + '" class="bg-white border-0">' + pension.pen_name + '</a></h2>'
	 		str += '		<p>' + pension.pen_address + '</p>'
	 		str += '		<p>가격 ' + pension_rm_price + ' 원</p>'
	 		str += '		<p>별점 </p>'
	 		str += '		<p>리뷰 ' + pension.rv +  '</p>'
	 		str += '	</div>'
	 		str += '</div>'
	 		return str;
	 	} */
// 			var lastPensionid = $(".pensions").last().data("pen_id")
// 			showList(lastPensionid, amount, options);
})
</script>
<!-- //   jQuery.fn.serializeObject = function() { -->
<!-- // 	    var obj = null; -->
<!-- // 	    try { -->
<!-- // 	        if (this[0].tagName && this[0].tagName.toLowerCase() == "form") { -->
<!-- // 	            var arr = this.serializeArray(); -->
<!-- // 	            if (arr) { -->
<!-- // 	                obj = {}; -->
<!-- // 	                jQuery.each(arr, function() { -->
<!-- // 	                	if(this.name.indexOf('.') != -1) { -->
<!-- // 	                		var key = this.name.substring(0, this.name.indexOf(".")); -->
<!-- // 	                		console.log(key); -->
<!-- // 	                		if(!(key in obj)) { -->
<!-- // 	                			obj[key] = []; -->
<!-- // 	                		} -->
<!-- // 	                		var subkey = this.name.substring(this.name.indexOf(".")+1); -->
<!-- // 	                		var subvalue = this.value; -->
<!-- // 	                		var o = {}; -->
<!-- // 	                		o[subkey] = subvalue; -->
<!-- // 	                		obj[key].push(o); -->
<!-- // 	                	}else { -->
<!-- // 		                    obj[this.name] = this.value; -->
<!-- // 	                	} -->
<!-- // 	                }); -->
<!-- // 	            } -->
<!-- // 	        } -->
<!-- // 	    } catch (e) { -->
<!-- // 	        alert(e.message); -->
<!-- // 	    } finally { -->
<!-- // 	    } -->
	 
<!-- // 	    return obj; -->
<!-- // 	}; -->
	
<!-- // 	var options;   -->

	  
<!-- // 	  /* console.log(getPensionStr(pension)) */ -->
	
<!-- // 		var lastPensionid; -->
<!-- // 		var amount;  -->
<!-- // 		function showList(lastPensionid, amount, option) { -->
<!-- // 			var param = {lastPensionid : lastPensionid, amount : amount, option : option} -->
<!-- // 			pensionService.getList(param, function(result) { -->
<!-- //       		/* console.log(result) */ -->
<!-- // 				var str = ''; -->
<!-- // 				for (var i in result) { -->
<!-- // 					str += getPensionStr(result[i]); -->
<!-- // 				} -->
<!-- // 				/* console.log(str); */ -->
<!-- // 				$(".pensionlist").append(str); -->
<!-- //       		}) -->
<!-- // 		}   -->
<!-- // 		showList(lastPensionid, amount); -->


     <script src="${pageContext.request.contextPath }/resources/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/plugins/slider/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/script.js"></script>
    </html>
