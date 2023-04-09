<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta name="charset" content="UTF-8">
<title>웨딩캘린더</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="예식장, 스드메, 사진DVD, 주례, 사회, 축가 결혼준비 정보">
<meta
  name="viewport"
  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
/>

<link rel="stylesheet" href="/marrymate/css/calendar.css">
<link rel="stylesheet" href="/marrymate/css/style.css">
<link rel="stylesheet" href="/marrymate/css/date-picker.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="/marrymate/js/jquery-1.12.4.js"></script>
<script src="/marrymate/js/jquery-ui.js"></script>
<script src="/marrymate/js/CalendarJS.js"></script>
<script src="/marrymate/js/swiper.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<script>
var dday = new Date("${sessionScope.loginMD}").getTime();

setInterval(function() {
  var today = new Date().getTime();
  var gap = dday - today;
  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
  var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
  var sec = Math.ceil((gap % (1000 * 60)) / 1000);

  document.getElementById("count").innerHTML = "예식 D-DAY까지 " + day + "일 " + hour + "시간 " + min + "분 " + sec + "초 남았습니다.";
}, 1000);
 
 
var date = new Date("${sessionScope.loginMD}").getTime();

setInterval(function() {
  var today = new Date().getTime();
  var gap = date - today;
  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));

document.getElementById("dDay").innerHTML = "D-" + day + "일 ♥";
}, 1000);

var dateonly = new Date("${sessionScope.loginMD}").getTime();

setInterval(function() {
  var today = new Date().getTime();
  var gap = dateonly - today;
  var day = Math.ceil(gap / (1000 * 60 * 60 * 24));

document.getElementById("dDayOnly").innerHTML = "D-" + day;
}, 1000);

var dayinfo = new Date("${sessionScope.loginMD}");

setInterval(function() {
    var dayOfWeek = dayinfo.getDay();
    var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var dayName = dayNames[dayOfWeek]; // get the day name as a string

    document.getElementById("day").innerHTML = dayName;
});


</script>


</head>
<body background="/marrymate/img/background.png">
	<%@include file="../header.jsp"%>
	
	
	
	<div class="contentsArea full" id="goContent">
		
		<div class="contentsTop">
			







<!--checkListTopWrap : s-->
<div class="checkListTopWrap">
	<div class="inner">
		<h2 class="sTit01 onlyPc">체크 리스트</h2>
		<div class="profileWrap">
			<!--profileArea : s-->
			<div class="profileBox">
				<div class="imgArea">
					
						
						
							<img src="/img/site/common/no_img_user.png" alt=""> 
						
					
				</div>
				<div class="txtArea">
					<div class="nameArea">
						<span>신은지 (는징는징)</span>님 결혼예정일
					</div>
					<div class="weddingDay">
						
							
								
									
										
											
												<span class="date">2023년 10월 14일</span>
												<span class="d-day">
													D-188
												</span>
											
											
										
									
									
								
							
							
						
					</div>
				</div>
			</div>
			<!--profileArea : e-->
			<!--tagBox : s-->
			<div class="tagConBox">
				<div class="tagListWrap">
					<div class="tagList">
						<div class="inner">
							
								
							
								
							
								
							
								
							
								
									<a href="javascript:void(0);" class="tagBox moveScroll" data-target="chkid" data-chkid="7">#신혼집</a>
								
							
								
							
								
									<a href="javascript:void(0);" class="tagBox moveScroll" data-target="chkid" data-chkid="5">#한복/예복</a>
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						</div>
					</div>
					<a href="javascript:void(0);" class="btnOpenClose"><span>태그열기</span></a>
				</div>
				<div class="txt">준비는 되셨나요?</div>
				<div class="bottomTxt">※ 체크리스트 사용 선택은 <br class="onlyM"> 최소 5개를 유지해주셔야 합니다.</div>
			</div>
			<!--tagBox : s-->
		</div>
	</div>
	
	







<!--mainMyweddingAnimation : s-->
<div class="mainMyweddingAnimationScroll">
	<div class="infoArea">
		<ul>
			<li>
				
					
						<a href="javascript:void(0);" class="moveScroll" data-target="chkst" data-chkst="01">
					
					
				
					<span class="tit">한번 더<br class="onlyM"> 체크</span>
					<span class="number">
						<strong id="checkListChkCnt">
							
								
									
										
											
												
													1
												
												
											
										
										
									
								
								
								
						</strong>
						<span class="txt">건</span>
					</span>
				</a>
			</li>
			<li>
				
					
						<a href="javascript:void(0);" class="moveScroll" data-target="chkst" data-chkst="04">
					
					
				
					<span class="tit">지금<br class="onlyM"> 해야해요!</span>
					<span class="number">
						<strong id="checkListDoingCnt">
							
								
									
										
											
												
													2
												
												
											
										
										
									
								
								
								
						</strong>
						<span class="txt">건</span>
					</span>
				</a>
			</li>
			<li>
				
					
						<a href="javascript:void(0);" class="moveScroll" data-target="chkst" data-chkst="03">
					
					
				
					<span class="tit">앞으로<br class="onlyM"> 할 것</span>
					<span class="number">
						<strong id="checkListReservCnt">
							
								
									
										
											
												
													6
												
												
											
										
										
									
								
								
								
						</strong>	
						<span class="txt">건</span>
					</span>
				</a>
			</li>
		</ul>
	</div>
	<div class="goal">
		
		<strong>
			
				
					
						
							
								
									D-188
								
								
							
						
						
					
				
				
					
		</strong>
		
	</div>
	<!-- <div class="mainMyweddingAnimation">
		<div class="bgObj cloud">
			<div class="obj cloud1"><img src="/img/site/main/cloud_01.png" alt=""></div>
			<div class="obj cloud2"><img src="/img/site/main/cloud_02.png" alt=""></div>
			<div class="obj cloud3"><img src="/img/site/main/cloud_03.png" alt=""></div>
			<div class="obj cloud4"><img src="/img/site/main/cloud_04.png" alt=""></div>
			<div class="obj cloud5"><img src="/img/site/main/cloud_05.png" alt=""></div>
		</div>
		<div class="bgObj sakuraLeft">
			<div class="obj sakura1"><img src="/img/site/main/sakura_left_01.png" alt=""></div>
			<div class="obj sakura2"><img src="/img/site/main/sakura_left_02.png" alt=""></div>
			<div class="obj sakura3"><img src="/img/site/main/sakura_left_03.png" alt=""></div>
			<div class="obj sakura4"><img src="/img/site/main/sakura_left_04.png" alt=""></div>
			<div class="obj sakura5"><img src="/img/site/main/sakura_left_05.png" alt=""></div>
			<div class="obj sakura6"><img src="/img/site/main/sakura_left_06.png" alt=""></div>
		</div>
		<div class="bgObj sakuraRight">
			<div class="obj sakura1"><img src="/img/site/main/sakura_right_01.png" alt=""></div>
			<div class="obj sakura2"><img src="/img/site/main/sakura_right_02.png" alt=""></div>
			<div class="obj sakura3"><img src="/img/site/main/sakura_right_03.png" alt=""></div>
			<div class="obj sakura4"><img src="/img/site/main/sakura_right_04.png" alt=""></div>
			<div class="obj sakura5"><img src="/img/site/main/sakura_right_05.png" alt=""></div>
		</div>
		<div class="inner">
			<div class="dDayStepWrap">
				<div class="motorcycle">
					<div class="set">
						<div class="obj body"><img src="/img/site/main/motorcycle_01.png" alt=""></div>
						<div class="obj b"><img src="/img/site/main/motorcycle_b.png" alt=""></div>
						<div class="obj w1"><img src="/img/site/main/motorcycle_w1.png" alt=""></div>
						<div class="obj w2"><img src="/img/site/main/motorcycle_w2.png" alt=""></div>
					</div>
				</div>
				<ul class="dDayStep">
					<li class="step0">d-300</li>
					<li class="step1">d-250</li>
					<li class="step2">d-200</li>
					<li class="step3">d-150</li>
					<li class="step4">d-100</li>
					<li class="step5">d-50</li>
					<li class="step6">d-0</li>
				</ul>
			</div>
		</div>
	</div> -->
	<div class="mainMyweddingAnimation" style="transform: translate(-179.82px, 0px);">
		<div class="bgObj sakuraLeft">
			<div class="obj sakura1"><img src="/img/site/main/paperFlower_02.png" alt=""></div>
			<div class="obj sakura2"><img src="/img/site/main/paperFlower_03.png" alt=""></div>
			<div class="obj sakura3"><img src="/img/site/main/paperFlower_04.png" alt=""></div>
			<div class="obj sakura4"><img src="/img/site/main/paperFlower_05.png" alt=""></div>
			<div class="obj sakura5"><img src="/img/site/main/paperFlower_06.png" alt=""></div>
			<div class="obj sakura6"><img src="/img/site/main/paperFlower_07.png" alt=""></div>
			<div class="obj sakura7"><img src="/img/site/main/paperFlower_08.png" alt=""></div>
			<div class="obj sakura8"><img src="/img/site/main/paperFlower_09.png" alt=""></div>
			<div class="obj sakura9"><img src="/img/site/main/paperFlower_10.png" alt=""></div>
			<div class="obj sakura10"><img src="/img/site/main/paperFlower_11.png" alt=""></div>
			<div class="obj sakura11"><img src="/img/site/main/paperFlower_12.png" alt=""></div>
			<div class="obj sakura12"><img src="/img/site/main/paperFlower_13.png" alt=""></div>
			<div class="obj sakura13"><img src="/img/site/main/paperFlower_14.png" alt=""></div>
			<div class="obj sakura14"><img src="/img/site/main/paperFlower_15.png" alt=""></div>
			<div class="obj sakura15"><img src="/img/site/main/paperFlower_15.png" alt=""></div>
		</div>
		<div class="inner">
			<div class="dDayStepWrap">
				<div class="motorcycle" style="left: 37%;">
					<div class="set">
						<div class="obj body"><img src="/img/site/main/2019_motorcycle_01.png" alt=""></div>
					</div>
				</div>
				<ul class="dDayStep">
					<li class="step5 on2 on">d-200</li>
					<li class="step4 on2 on">d-180</li>
					<li class="step3">d-150</li>
					<li class="step2">d-100</li>
					<li class="step1">d-50</li>
				</ul>
				<ul class="dDayStep dDayStep2">
					<li class="step5 on2 on">d-200</li>
					<li class="step4 on2 on">d-180</li>
					<li class="step3">d-150</li>
					<li class="step2">d-100</li>
					<li class="step1">d-50</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<!--mainMyweddingAnimation : e-->


<script>
	$(function(){
		//스크롤이동
		$(".moveScroll").click(function(e) {
			var scrollY = 0;
			if($(this).data('target') == 'chkid') {
				var chkid = $(this).data('chkid')+'';
				var findEl = $(".checkListArea .item").find("[data-chkid='"+chkid+"']");
				if(findEl.length > 0) {
					scrollY = $(findEl[0]).closest(".item").offset().top;
				} else {
					scrollY = $(".checkListArea").offset().top;
				}
			} else if($(this).data('target') == 'chkst') {
				var chkst = $(this).data('chkst')+'';
				var findEl = $(".checkListArea .item").find("[data-chkst='"+chkst+"']");
				if(findEl.length > 0) {
					scrollY = $(findEl[0]).closest(".item").offset().top;
				} else {
					scrollY = $(".checkListArea").offset().top;
				}
			} else {
				scrollY = $(".checkListArea").offset().top;
			}
			//
			$( 'html, body' ).animate( { scrollTop : scrollY-50 }, 400 );
		});
		//
		//오토바이 움직임
		var leftPos = "37"*1;
		
		// D+0 이상일경우 일정거리에서 멈추도록 수정
		if(leftPos > 99) {
			leftPos = 97;
			var browserWidth = $(window).width();
			if (browserWidth > 0 && browserWidth < 950) {
				leftPos = 110;
			}
		}
		
		function motorcycleAni(){
			var speed = 10000;
			var leftSc = ($(".mainMyweddingAnimation").width()-$(window).width())*(leftPos/100);
			$(".mainMyweddingAnimation").css({transform: "translate(0px,0px)"})
			$(".motorcycle").css({left: "0%"});
			$(".motorcycle").stop().delay(0).animate({left: leftPos+"%"}, {
				duration: speed*(leftPos/30),
				easing: "linear",
				step: function() {
					var deviceType = 0;
					if($(window).innerWidth() > 767 && $(window).innerWidth() < 1025){
						deviceType = -100;
					}
					var objLeft = Number($(".motorcycle").css("left").split("px")[0]);
					var areaLeft = objLeft+deviceType;
					if(leftSc <= areaLeft){
						areaLeft = leftSc;
					}
					$(".mainMyweddingAnimation").css({transform: "translate(-"+areaLeft+"px,0)"})
					
					var browserWidth = $(window).width();
					if (browserWidth > 0 && browserWidth < 950) {
						// 모바일 or 테블릿
						$(".dDayStep li").each(function(){
							if($(this).position().left < objLeft - 80){
								$(this).addClass("on2");
							}
							if($(this).position().left < objLeft - 100){
								$(this).addClass("on");
							}
						});
					} else {
						// PC
						$(".dDayStep li").each(function(){
							if($(this).position().left < objLeft - 180){
								$(this).addClass("on2");
							}
							if($(this).position().left < objLeft - 200){
								$(this).addClass("on");
							}
						});
					}
					
					if (objLeft > 1350) {
						$(".motorcycle .body").css('animation', 'motorcycle 0.5s linear')
					}
				}
			});
		}
		//
		$(window).on("orientationchange",function(){
			motorcycleAni()
		});
		//
		motorcycleAni()
		
		
		// 20200805 수정
		
		//mainTopBanner 있을시
 		if($(".mainTopBanner").length > 0){
			$(".mainTopBanner").slideDown(500);
			$(".mainTopBanner .btnClose").click(function(e){
				e.preventDefault();
				$(".mainTopBanner").slideUp(500,function(){
					// $(".rouletteFixed").css("top",55);
				});

			})
		}
		
		cookiedata = document.cookie;
    	if(cookiedata.indexOf("close=Y") < 0){
			startFloatingBanner();
    	} else {
    		var divObj = document.getElementById("roul");
    		divObj.style.visibility = "hidden";
    	}
	});
</script>

	
</div>
<!--checkListTopWrap : e-->
		</div>
		
		
		<div class="contestList">
			







<!--checkListArea : s-->
<div class="checkListArea">
	<div class="listRow" id="checkList300">
		
		<div class="d-day_tit ">
			<div>
				<span>D-DAY</span>
				<strong>300</strong>
			</div>
		</div>
		<ul class="itemArea">
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="270">D-270</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="1" class="jsSWO01Ev tit ">#상견례</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.04.02</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist0" checked="">
									<label for="checklist0">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="240">D-240</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="2" class="jsSWO01Ev tit ">#웨딩홀</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.04.02</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist1" checked="">
									<label for="checklist1">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="210">D-210</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="3" class="jsSWO01Ev tit ">#신혼여행</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.04.06</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist2" checked="">
									<label for="checklist2">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
		</ul>
	</div>
	<div class="listRow" id="checkList200">
		
		<div class="d-day_tit on">
			<div>
				<span>D-DAY</span>
				<strong>200</strong>
			</div>
		</div>
		<ul class="itemArea">
			
				
			
				
			
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="200">D-200</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="4" class="jsSWO01Ev tit ">#스/드/메</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="02">
								
									
									
										
										
									
									
								
								<div class="stat quickly">급해요</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist3">
									<label for="checklist3">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="7" class="jsSWO01Ev tit ">#신혼집</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="04">
								
									
										
										
									
									
									
								
								<div class="stat now">지금해야해요</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist4">
									<label for="checklist4">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item " data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="6" class="jsSWO01Ev tit ">#예물</a>
							<a href="javascript:void(0);" class="checkToggle "><span class="txt">미사용</span></a>
							<div class="bottom" data-chkst="00">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist5" disabled="">
									<label for="checklist5">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="5" class="jsSWO01Ev tit ">#한복/예복</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="04">
								
									
										
										
									
									
									
								
								<div class="stat now">지금해야해요</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist6">
									<label for="checklist6">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
		</ul>
	</div>
	<div class="listRow" id="checkList100">
		
		<div class="d-day_tit ">
			<div>
				<span>D-DAY</span>
				<strong>100</strong>
			</div>
		</div>
		<ul class="itemArea">
			
				
			
				
			
				
			
				
			
				
			
				
			
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="11" class="jsSWO01Ev tit ">#예단</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.03.23</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist7" checked="">
									<label for="checklist7">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="10" class="jsSWO01Ev tit ">#혼수</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.04.04</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist8" checked="">
									<label for="checklist8">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="8" class="jsSWO01Ev tit ">#뷰티케어</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist9">
									<label for="checklist9">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="13" class="jsSWO01Ev tit ">#웨딩카</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.04.06</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist10" checked="">
									<label for="checklist10">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="12" class="jsSWO01Ev tit ">#폐백/이바지</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">
								
									
									
									
										
										
									
								
								<div class="stat ">2023.04.07</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist11" checked="">
									<label for="checklist11">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="9" class="jsSWO01Ev tit ">#청첩장</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist12">
									<label for="checklist12">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="30">D-30</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="15" class="jsSWO01Ev tit ">#입주청소</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist13">
									<label for="checklist13">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="30">D-30</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="14" class="jsSWO01Ev tit ">#부케</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist14">
									<label for="checklist14">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="20">D-20</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="16" class="jsSWO01Ev tit ">#답례품</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist15">
									<label for="checklist15">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
				
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="0">D-0</div>
							<a href="javascript:void(0);" data-id="viewCheckList" data-chkid="17" class="jsSWO01Ev tit ">#웨딩</a>
							<a href="javascript:void(0);" class="checkToggle on"><span class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">
								
									
									
									
										
										
									
								
								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist16">
									<label for="checklist16">완료</label>
								</div>
							</div>
						</div>
					</li>
				
			
		</ul>
	</div>
</div>


	
		
			
				
					
						<script>
							$(function(){
								//사용/미사용
								$(".checkListArea .item .checkToggle").click(function(e){
									e.preventDefault();
									var $this = $(this);
									var $target = $this.closest(".item");
									if(!$target.hasClass("on")){
										ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
											seq_no: $target.data('seqno'),
											chk_id: $target.find('.jsSWO01Ev').data('chkid'),
											use_yn: 'Y'
										})), "", "", function(result){
											if(result.status == 0) {
												//refresh
												//location.reload();
												/*
												if(result.item) {
													MP05.redrawCount(result.item);
												}
												//
												$target.addClass("on");
												$target.find(".checkToggle").addClass("on");
												$target.find(".checkToggle .txt").text("사용");
												$target.find(".checkBox input").prop("disabled",false);
												//
												var secdt = "150";
												var daydt = $target.find('.d-day').data('daydt');
												if(secdt == daydt) {
													$target.find('.stat').addClass('now');
													$target.find('.stat').removeClass('quickly');
													$target.find('.stat').text('지금해야해요');
												} else if(secdt < daydt) {
													$target.find('.stat').removeClass('now');
													$target.find('.stat').addClass('quickly');
													$target.find('.stat').text('급해요');
												} else {
													$target.find('.stat').removeClass('now');
													$target.find('.stat').removeClass('quickly');
													$target.find('.stat').text('');
												}
												*/
												MP05.redrawScreen();
												
											} else {
												_alert({
													message:'체크리스트 사용 설정에 실패했습니다.',
													btnTxt : '닫기'
												});
											}
										});
									}else{
										if($target.find(".checkBox input").is(":checked")){
											_alert({
												message:'완료된 항목은 미사용을 할 수 없습니다.',
												btnTxt : '닫기'
											});
										}else{
											//최소 5개는 사용으로 유지
											if($(".checkListArea .item .on").length <= 5) {
												_alert({
													message:'체크리스트 사용 선택은 최소 5개를 유지해주셔야 합니다.',
													btnTxt : '닫기'
												});
											} else {
												ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
													seq_no: $target.data('seqno'),
													chk_id: $target.find('.jsSWO01Ev').data('chkid'),
													use_yn: 'N'
												})), "", "", function(result){
													if(result.status == 0) {
														//refresh
														//location.reload();
														/*
														if(result.item) {
															MP05.redrawCount(result.item);
														}
														//
														$target.removeClass("on");
														$target.find(".checkToggle").removeClass("on");
														$target.find(".checkToggle .txt").text("미사용");
														$target.find(".checkBox input").prop("disabled",true);
														*/
														MP05.redrawScreen();
														
													} else {
														_alert({
															message:'체크리스트 사용 설정에 실패했습니다.',
															btnTxt : '닫기'
														});
													}
												});
											}
										}
									}
								});
								//완료
								$(".checkListArea .item .bottom .checkBox input[type=checkbox]").click(function(e) {
									var $this = $(this);
									var $target = $this.closest(".item");
									if($target.hasClass('on')) {
										if($this.is(":checked")) {
											ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
												seq_no: $target.data('seqno'),
												chk_id: $target.find('.jsSWO01Ev').data('chkid'),
												done_yn: 'Y'
											})), "", "", function(result){
												if(result.status == 0) {
													//refresh
													//location.reload();
													/*
													if(result.item) {
														MP05.redrawCount(result.item);
													}
													//완료일자 표시
													if(result.done_dt && result.done_dt.length > 0) {
														$target.find('.stat').removeClass('now');
														$target.find('.stat').removeClass('quickly');
														$target.find('.stat').text(result.done_dt);
													}
													*/
													MP05.redrawScreen();
													
												} else {
													_alert({
														message:'체크리스트 완료 설정에 실패했습니다.',
														btnTxt : '닫기'
													});
												}
											});
										} else {
											ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
												seq_no: $target.data('seqno'),
												chk_id: $target.find('.jsSWO01Ev').data('chkid'),
												done_yn: 'N'
											})), "", "", function(result){
												if(result.status == 0) {
													//refresh
													//location.reload();
													/*
													if(result.item) {
														MP05.redrawCount(result.item);
													}
													//
													var secdt = "150";
													var daydt = $target.find('.d-day').data('daydt');
													if(secdt == daydt) {
														$target.find('.stat').addClass('now');
														$target.find('.stat').removeClass('quickly');
														$target.find('.stat').text('지금해야해요');
													} else if(secdt < daydt) {
														$target.find('.stat').removeClass('now');
														$target.find('.stat').addClass('quickly');
														$target.find('.stat').text('급해요');
													} else {
														$target.find('.stat').removeClass('now');
														$target.find('.stat').removeClass('quickly');
														$target.find('.stat').text('');
													}
													*/
													MP05.redrawScreen();
													
												} else {
													_alert({
														message:'체크리스트 완료 설정에 실패했습니다.',
														btnTxt : '닫기'
													});
												}
											});
										}
									} else {
										_alert({
											message:'미사용 항목은 완료 할 수 없습니다.',
											btnTxt : '닫기'
										});
									}
								});
							
							});
						</script>
					
					
				
				
			
			
		
	
	



		</div>
		
	</div>
	
	
	<div class="mainMyweddingAnimation" style="transform: translate(-179.82px, 0px);">
		<div class="bgObj sakuraLeft">
			<div class="obj sakura1"><img src="/img/site/main/paperFlower_02.png" alt=""></div>
			<div class="obj sakura2"><img src="/img/site/main/paperFlower_03.png" alt=""></div>
			<div class="obj sakura3"><img src="/img/site/main/paperFlower_04.png" alt=""></div>
			<div class="obj sakura4"><img src="/img/site/main/paperFlower_05.png" alt=""></div>
			<div class="obj sakura5"><img src="/img/site/main/paperFlower_06.png" alt=""></div>
			<div class="obj sakura6"><img src="/img/site/main/paperFlower_07.png" alt=""></div>
			<div class="obj sakura7"><img src="/img/site/main/paperFlower_08.png" alt=""></div>
			<div class="obj sakura8"><img src="/img/site/main/paperFlower_09.png" alt=""></div>
			<div class="obj sakura9"><img src="/img/site/main/paperFlower_10.png" alt=""></div>
			<div class="obj sakura10"><img src="/img/site/main/paperFlower_11.png" alt=""></div>
			<div class="obj sakura11"><img src="/img/site/main/paperFlower_12.png" alt=""></div>
			<div class="obj sakura12"><img src="/img/site/main/paperFlower_13.png" alt=""></div>
			<div class="obj sakura13"><img src="/img/site/main/paperFlower_14.png" alt=""></div>
			<div class="obj sakura14"><img src="/img/site/main/paperFlower_15.png" alt=""></div>
			<div class="obj sakura15"><img src="/img/site/main/paperFlower_15.png" alt=""></div>
		</div>
		<div class="inner">
			<div class="dDayStepWrap">
				<div class="motorcycle" style="left: 37%;">
					<div class="set">
						<div class="obj body"><img src="/img/site/main/2019_motorcycle_01.png" alt=""></div>
					</div>
				</div>
				<ul class="dDayStep">
					<li class="step5 on2 on">d-200</li>
					<li class="step4 on2 on">d-180</li>
					<li class="step3">d-150</li>
					<li class="step2">d-100</li>
					<li class="step1">d-50</li>
				</ul>
				<ul class="dDayStep dDayStep2">
					<li class="step5 on2 on">d-200</li>
					<li class="step4 on2 on">d-180</li>
					<li class="step3">d-150</li>
					<li class="step2">d-100</li>
					<li class="step1">d-50</li>
				</ul>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	<div class="contentsArea full" id="goContent">

		<div class="contentsTop"></div>

		<img id="Caltopmem" src="/marrymate/img/caltopmem.png"
			style="width: 100%">
		<!--checkListTopWrap : s-->
		<div class="checkListTopWrap">
			<div class="inner">
				<div class="profileWrap">
					<!--profileArea : s-->
					<div class="profileBox">
						<div class="imgArea">
							<c:if test="${!empty sessionScope.loginId}">
								<div>${sessionScope.img}</div>
							</c:if>
						</div>
						<div class="txtArea">
							<div class="nameArea">
								<c:if test="${!empty sessionScope.loginId}">
									<div>
										<strong> ${sessionScope.loginName}</strong>(${sessionScope.loginNick})
										님 & <strong>${sessionScope.loginPname}</strong> 업체 예약 일정
									</div>
								</c:if>
							</div>
							<div id="count"></div>
						</div>
					</div>
				</div>
				<!--profileArea : e-->
			</div>
		</div>
		</div>
<%
String yy=request.getParameter("year");
String mm=request.getParameter("month");

Calendar cal=Calendar.getInstance();

int y=cal.get(Calendar.YEAR);
int m=cal.get(Calendar.MONTH);

if(yy != null && mm != null && !yy.equals("") && !mm.equals("")){
	y=Integer.parseInt(yy);
	m=Integer.parseInt(mm)-1;
}
cal.set(y,m,1);
int dayOfweek=cal.get(Calendar.DAY_OF_WEEK);
int lastday=cal.getActualMaximum(Calendar.DATE);
%>
		<br><br>
		<!--calendarShow-->
		<div class="calendarshow" align="center">
				<div class="todaydate" align="center"><%=y %>년 &nbsp;&nbsp; <%=m+1 %>월</div>
					<table class="caldate">
						<tr class="trth">
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
						<tr>
						<%
						int count=0;
						for(int s=1;s<dayOfweek;s++){
							out.print("<td></td>");
							count++;
						}
						for(int d=1;d<lastday;d++){
							count++;
							String color="#555555";
							if(count==7){
								color="blue";
							}else if(count==1){
								color="red";
							}
						%>
							<td style="color: <%=color%>"><%=d %></td>
						<%
							if(count==7){
								out.print("</tr><tr>");
								count=0;
							}	
						}
						while(count<7){
							out.print("<td></td>");
							count++;
						}
						 %>
						</tr>
				</table>
		</div>

		<!--mainMyweddingAnimation : s-->
		<div class="mainMyweddingAnimationScroll">
			<div class="infoArea">
				<ul>
					<li><a href="javascript:void(0);" class="moveScroll"
						data-target="chkst" data-chkst="01"> <span class="tit">
								-PAST-<br class="onlyM">
						</span> <span class="number"> <strong id="checkListChkCnt">
								</strong> <span class="txt">건</span>
						</span>
					</a></li>
					<li><a href="javascript:void(0);" class="moveScroll"
						data-target="chkst" data-chkst="04"> <span class="tit">-PRESENT-<br
								class="onlyM"></span> <span class="number"> <strong
								id="checkListDoingCnt"> </strong> <span class="txt">건</span>
						</span>
					</a></li>
					<li><a href="javascript:void(0);" class="moveScroll"
						data-target="chkst" data-chkst="03"> <span class="tit">-FUTURE-<br
								class="onlyM"></span> <span class="number"> <strong
								id="checkListReservCnt"> </strong> <span class="txt">건</span>
						</span>
					</a></li>
				</ul>
			</div>
			<div class="goal">

				<strong><span class="d-day" id="dDayOnly"></span></strong>

			</div>
		</div>



	<div class="contestList">
		<div class="checkListArea">
			<div class="listRow" id="checkList300">

				<div class="d-day_tit on">
					<div>
						<span>D-DAY</span> <strong>300</strong>
					</div>
				</div>
				<ul class="itemArea">


					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="270">D-270</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="1" class="jsSWO01Ev tit ">#상견례</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="02">

								<div class="stat quickly">급해요</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist0"> <label
										for="checklist0">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="240">D-240</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="2" class="jsSWO01Ev tit ">#웨딩홀</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="02">


								<div class="stat quickly">급해요</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist1"> <label
										for="checklist1">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item " data-seqno="1">
							<div class="d-day" data-daydt="210">D-210</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="3" class="jsSWO01Ev tit ">#신혼여행</a> <a
								href="javascript:void(0);" class="checkToggle "><span
								class="txt">미사용</span></a>
							<div class="bottom" data-chkst="00">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist2" disabled=""> <label
										for="checklist2">완료</label>
								</div>
							</div>
						</div>
					</li>

				</ul>
			</div>
			<div class="listRow" id="checkList200">

				<div class="d-day_tit ">
					<div>
						<span>D-DAY</span> <strong>200</strong>
					</div>
				</div>
				<ul class="itemArea">
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="200">D-200</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="4" class="jsSWO01Ev tit ">#스/드/메</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="04">

								<div class="stat now">지금해야해요</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist3"> <label
										for="checklist3">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="7" class="jsSWO01Ev tit ">#신혼집</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist4"> <label
										for="checklist4">완료</label>
								</div>
							</div>
						</div>
					</li>



					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="6" class="jsSWO01Ev tit ">#예물</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist5"> <label
										for="checklist5">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="5" class="jsSWO01Ev tit ">#한복/예복</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist6"> <label
										for="checklist6">완료</label>
								</div>
							</div>
						</div>
					</li>

				</ul>
			</div>
			<div class="listRow" id="checkList100">

				<div class="d-day_tit ">
					<div>
						<span>D-DAY</span> <strong>100</strong>
					</div>
				</div>
				<ul class="itemArea">

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="11" class="jsSWO01Ev tit ">#예단</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="01">

								<div class="stat ">2023.03.23</div>
								<div class="checkBox">
									<input type="checkbox" id="checklist7" checked=""> <label
										for="checklist7">완료</label>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="10" class="jsSWO01Ev tit ">#혼수</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist8"> <label
										for="checklist8">완료</label>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="8" class="jsSWO01Ev tit ">#뷰티케어</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist9"> <label
										for="checklist9">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="13" class="jsSWO01Ev tit ">#웨딩카</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist10"> <label
										for="checklist10">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="12" class="jsSWO01Ev tit ">#폐백/이바지</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">


								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist11"> <label
										for="checklist11">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="9" class="jsSWO01Ev tit ">#청첩장</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist12"> <label
										for="checklist12">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="30">D-30</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="15" class="jsSWO01Ev tit ">#입주청소</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist13"> <label
										for="checklist13">완료</label>
								</div>
							</div>
						</div>
					</li>



					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="30">D-30</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="14" class="jsSWO01Ev tit ">#부케</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist14"> <label
										for="checklist14">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="20">D-20</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="16" class="jsSWO01Ev tit ">#답례품</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist15"> <label
										for="checklist15">완료</label>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="0">D-0</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="17" class="jsSWO01Ev tit ">#웨딩</a> <a
								href="javascript:void(0);" class="checkToggle on"><span
								class="txt">사용</span></a>
							<div class="bottom" data-chkst="03">

								<div class="stat "></div>
								<div class="checkBox">
									<input type="checkbox" id="checklist16"> <label
										for="checklist16">완료</label>
								</div>
							</div>
						</div>
					</li>


				</ul>
			</div>
		</div>

		<script>
				$(function() {
					//사용/미사용
					$(".checkListArea .item .checkToggle")
							.click(
									function(e) {
										e.preventDefault();
										var $this = $(this);
										var $target = $this.closest(".item");
										if (!$target.hasClass("on")) {
											ajaxCall(
													'/mywedding/checklist/edit',
													encodeURIComponent(JSON
															.stringify({
																seq_no : $target
																		.data('seqno'),
																chk_id : $target
																		.find(
																				'.jsSWO01Ev')
																		.data(
																				'chkid'),
																use_yn : 'Y'
															})),
													"",
													"",
													function(result) {
														if (result.status == 0) {

															MP05.redrawScreen();

														} else {
															_alert({
																message : '체크리스트 사용 설정에 실패했습니다.',
																btnTxt : '닫기'
															});
														}
													});
										} else {
											if ($target.find(".checkBox input")
													.is(":checked")) {
												_alert({
													message : '완료된 항목은 미사용을 할 수 없습니다.',
													btnTxt : '닫기'
												});
											} else {
												//최소 5개는 사용으로 유지
												if ($(".checkListArea .item .on").length <= 5) {
													_alert({
														message : '체크리스트 사용 선택은 최소 5개를 유지해주셔야 합니다.',
														btnTxt : '닫기'
													});
												} else {
													ajaxCall(
															'/marrymate/calendar/checklist',
															encodeURIComponent(JSON
																	.stringify({
																		seq_no : $target
																				.data('seqno'),
																		chk_id : $target
																				.find(
																						'.jsSWO01Ev')
																				.data(
																						'chkid'),
																		use_yn : 'N'
																	})),
															"",
															"",
															function(result) {
																if (result.status == 0) {

																	MP05
																			.redrawScreen();

																} else {
																	_alert({
																		message : '체크리스트 사용 설정에 실패했습니다.',
																		btnTxt : '닫기'
																	});
																}
															});
												}
											}
										}
									});
					$(
							".checkListArea .item .bottom .checkBox input[type=checkbox]")
							.click(
									function(e) {
										var $this = $(this);
										var $target = $this.closest(".item");
										if ($target.hasClass('on')) {
											if ($this.is(":checked")) {
												ajaxCall(
														'/marrymate/calendar/checklist',
														encodeURIComponent(JSON
																.stringify({
																	seq_no : $target
																			.data('seqno'),
																	chk_id : $target
																			.find(
																					'.jsSWO01Ev')
																			.data(
																					'chkid'),
																	done_yn : 'Y'
																})),
														"",
														"",
														function(result) {
															if (result.status == 0) {

																MP05
																		.redrawScreen();

															} else {
																_alert({
																	message : '체크리스트 완료 설정에 실패했습니다.',
																	btnTxt : '닫기'
																});
															}
														});
											} else {
												ajaxCall(
														'/marrymate/calendar/checklist',
														encodeURIComponent(JSON
																.stringify({
																	seq_no : $target
																			.data('seqno'),
																	chk_id : $target
																			.find(
																					'.jsSWO01Ev')
																			.data(
																					'chkid'),
																	done_yn : 'N'
																})),
														"",
														"",
														function(result) {
															if (result.status == 0) {

																MP05
																		.redrawScreen();

															} else {
																_alert({
																	message : '체크리스트 완료 설정에 실패했습니다.',
																	btnTxt : '닫기'
																});
															}
														});
											}
										} else {
											_alert({
												message : '미사용 항목은 완료 할 수 없습니다.',
												btnTxt : '닫기'
											});
										}
									});

				});
			</script>


	</div>



	<section>


		<div class="mwBtmMenu">
			<ul>
				<li class="menu01"><a href="javascript:void(0);"
					data-id="mileage" class="jsSWO01Ev item icon1"><span>내
							정보</span></a></li>
				<li class="menu02"><a href="javascript:void(0);"
					data-id="coupon" class="jsSWO01Ev item icon7"><span>내 쿠폰</span></a></li>
				<li class="menu03"><a href="javascript:void(0);" data-id="calc"
					class="jsSWO01Ev item icon8"><span>내 문의내역</span></a></li>
				<li class="menu04"><a href="javascript:void(0);"
					data-id="counseling" class="jsSWO01Ev item icon9"><span>예산
							계산기</span></a></li>
			</ul>
		</div>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>