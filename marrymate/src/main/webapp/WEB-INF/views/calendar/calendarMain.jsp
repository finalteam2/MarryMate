<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="/marrymate/css/date-picker.css">
<link rel="stylesheet" href="/marrymate/css/jquery-ui.css">
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


function addplan(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("planWrite.do","addplan", "width=400, height=400, left="+w+",top="+h);
}

</script>
<script type="text/javascript">

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
	

	
	cookiedata = document.cookie;
	if(cookiedata.indexOf("close=Y") < 0){
		startFloatingBanner();
	} else {
		var divObj = document.getElementById("roul");
		divObj.style.visibility = "hidden";
	}
});
</script>

</head>
<body background="/marrymate/img/background.png">
	<%@include file="../header.jsp"%>
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
										님 & <strong>${sessionScope.loginPname}</strong> 님 결혼예정일
									</div>
								</c:if>
							</div>

							<div class="weddingDay">
								<span class="date"> <c:if
										test="${!empty sessionScope.loginId}">
										<div>${sessionScope.loginMD.substring(0, 10)}
											&nbsp;<span id="day"></span>
										</div>
									</c:if>
								</span> <span class="d-day" id="dDay"></span><br>
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

<script type="text/javascript">

$(function(){
	//사용/미사용
	$(".checkListArea .item .checkToggle").click(function(e){
		e.preventDefault();
		var $this = $(this);
		var $target = $this.closest(".item");
		if(!$target.hasClass("on")){
			ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
				seq_no: $target.data('seqno'),
				chk_id: $target.find('.jsSWO01Ev').data('chkid'),
				use_yn: 'Y'
			})), "", "", function(result){
				if(result.status == 0) {

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
					ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
						seq_no: $target.data('seqno'),
						chk_id: $target.find('.jsSWO01Ev').data('chkid'),
						use_yn: 'N'
					})), "", "", function(result){
						if(result.status == 0) {
			
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
				ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
					seq_no: $target.data('seqno'),
					chk_id: $target.find('.jsSWO01Ev').data('chkid'),
					done_yn: 'Y'
				})), "", "", function(result){
					if(result.status == 0) {
						MP05.redrawScreen();
						
					} else {
						_alert({
							message:'체크리스트 완료 설정에 실패했습니다.',
							btnTxt : '닫기'
						});
					}
				});
			} else {
				ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
					seq_no: $target.data('seqno'),
					chk_id: $target.find('.jsSWO01Ev').data('chkid'),
					done_yn: 'N'
				})), "", "", function(result){
					if(result.status == 0) {
				
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

		<br><br>
		<!--calendarShow-->
		<div class="calendarshow" align="center">
				<div class="todaydate" align="center"><%=y %>년 &nbsp;&nbsp; <%=m+1 %>월</div>
				<div style="padding-left: 65%"><button type="button" onclick="addplan();">일정등록</button></div>
				
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
								</strong> <span class="txt">${chk_cnt}건</span>
						</span>
					</a></li>
					<li><a href="javascript:void(0);" class="moveScroll"
						data-target="chkst" data-chkst="04"> <span class="tit">-PRESENT-<br
								class="onlyM"></span> <span class="number"> <strong
								id="checkListDoingCnt"> </strong> <span class="txt">0건</span>
						</span>
					</a></li>
					<li><a href="javascript:void(0);" class="moveScroll"
						data-target="chkst" data-chkst="03"> <span class="tit">-FUTURE-<br
								class="onlyM"></span> <span class="number"> <strong
								id="checkListReservCnt"> </strong> <span class="txt">17건</span>
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
								data-chkid="1" class="jsSWO01Ev tit " id="checklistitems">#상견례</a> <a
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
								data-chkid="2" class="jsSWO01Ev tit " id="checklistitems">#웨딩홀</a> <a
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
								data-chkid="3" class="jsSWO01Ev tit " id="checklistitems">#신혼여행</a> <a
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
								data-chkid="4" class="jsSWO01Ev tit " id="checklistitems">#스/드/메</a> <a
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
								data-chkid="7" class="jsSWO01Ev tit " id="checklistitems">#신혼집</a> <a
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
								data-chkid="6" class="jsSWO01Ev tit " id="checklistitems">#예물</a> <a
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
								data-chkid="5" class="jsSWO01Ev tit " id="checklistitems">#한복/예복</a> <a
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
								data-chkid="11" class="jsSWO01Ev tit " id="checklistitems">#예단</a> <a
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
								data-chkid="10" class="jsSWO01Ev tit " id="checklistitems">#혼수</a> <a
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
								data-chkid="8" class="jsSWO01Ev tit " id="checklistitems">#뷰티케어</a> <a
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
								data-chkid="13" class="jsSWO01Ev tit " id="checklistitems">#웨딩카</a> <a
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
								data-chkid="12" class="jsSWO01Ev tit " id="checklistitems">#폐백/이바지</a> <a
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
								data-chkid="9" class="jsSWO01Ev tit " id="checklistitems">#청첩장</a> <a
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
								data-chkid="15" class="jsSWO01Ev tit " id="checklistitems">#입주청소</a> <a
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
								data-chkid="14" class="jsSWO01Ev tit " id="checklistitems">#부케</a> <a
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
								data-chkid="16" class="jsSWO01Ev tit " id="checklistitems">#답례품</a> <a
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
								data-chkid="17" class="jsSWO01Ev tit " id="checklistitems">#웨딩</a> <a
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

	</div>
	<script type="text/javascript">
	(function(SWO01, $, undefined) {
		
		'use strict';
		
		
		function initialize() {
			$(function(){
				gnb('gnb07','gnb0701',"myWedding");
				var mymenunum = $("#mymenunum").val()||"";
				var idx = Number(mymenunum);
				

				console.log(idx);
				
				switch(mymenunum) {
				// 체크리스트 
				case "1":
					myWeddingMenu(idx);
					break;
				default:
					myWeddingMenu();
					break;
				}
			});
			$('#updateAProof').bind('click', false);
		}

		
		function profile(/*회원id*/) {
			location.href = "/marrymate/mypage/myinfo_c.jsp";
		}

		
		function doneWithdraw() {
			//location.href = "/";
			GNB.logout();
		}
		
		function checklist() {
			location.href = "/marrymate/calendar/calendarMain.jsp";
		}

		
		
		function getCheckList(type) {
			var checkList = [];
			switch(type) {
			case 'profile':
			break;
			}
			return checkList;
		}
		
		function getCheckList(type) {
			var checkList = [];
			switch(type) {
			case 'withdraw':
				checkList = checkList.concat(checkWithdraw);
				break;
			case 'attach':
				checkList = checkList.concat(checkAttach);
				break;			
			}
			return checkList;
		}
		
		(function(MP05, $, undefined) {
			
			'use strict';
			
			var item = {};

			function clear() {
			}

			function reset() {
				clear();
			}
			
			function open(options) {
				ajaxCall('/marrymate/calendar/calendarMain.jsp', encodeURIComponent(JSON.stringify({
					seq_no: options.seq_no,
					chk_id: options.chk_id
				})), "", "", function(result){
					if(result.status == 0) {
						item = result.item;
						//
						layerPop({type : "open", target : 'chkst' ,close : function(){
						}});
						//
						redraw(result.item);
						//
					} else {
						_alert({
							message:'체크리스트 항목 상세 조회에 실패했습니다.',
							btnTxt : '닫기'
						});
					}
				});
			}
			
			function close() {
				layerPop({type : "close", target : "myPop181" ,close : function(){
				}});
			}
			
			function confirm(){
				//update
				ajaxCall('/marrymate/calendar/calendarMain.jsp', encodeURIComponent(JSON.stringify({
					seq_no: item.seq_no,
					chk_id: item.chk_id,
					use_yn: $("#myPop181UseToggle").hasClass('on') ? 'Y' : 'N',
					day_dt: $("#myPop181Dday").val(),
					done_yn: $("#myPop181Doneyn").is(":checked") ? 'Y' : 'N',
					etc_tx: $("#myPop181Etctx").val()
				})), "", "", function(result){
					if(result.status == 0) {
						close();

						if(result.item) {
							redrawCount(result.item);
						}
						ajaxHtml(
								'/marrymate/calendar/calendarMain.jsp'
							, JSON.stringify({})
							, ""
							, ""
							, function(result){
								$('div.contentsArea > .contestList').html(result);
							}
							, function(){
								_alert({title:"알림", message: "시스템 에러 입니다. 동일한 증상이 계속 발생시 담당자에게 문의 부탁드립니다.", close:function(){}});
							}
						);
						
						
						redrawScreen();
						
					} else {
						_alert({
							message:'체크리스트 항목 수정에 실패했습니다.',
							btnTxt : '닫기'
						})
					}
				});
			}
			
			function redraw(item) {
				//항목명
				$("#checklistitems").text("#" + item.chk_nm);
				//사용여부
				if(item.use_yn == 'Y') {
					$("#checklistitems").text('사용');
					$("#checklistitems").parent().addClass('on');
					//
					$("#checklistitems").prop("disabled", false);
				} else {
					$("#checklistitems").text('미사용');
					$("#checklistitems").parent().removeClass('on');
					//
					$("#checklistitems").prop("disabled", true);
				}
				//D-day
				${sessionScope.loginPname}.val(item.day_dt);
				//완료일자/완료여부
				if(item.done_yn == 'Y') {
					$("#checklistitems").text(item.done_dt || '');
					$("#checklistitems").prop("checked", true);
				} else {
					$("#checklistitems").text('');
					$("#checklistitems").prop("checked", false);
				}
			
			}
			
			function redrawCount(item) {
				
				chk_cnk
				//한번더 체크
				$("#checkListChkCnt").text(item.chk_cnt + '' || '0');
				//지금해야해요
				$("#checkListDoingCnt").text(item.doing_cnt + '' || '0');
				//앞으로할것
				$("#checkListReservCnt").text(item.reserv_cnt + '' || '17');
			}
			
			function redrawScreen() {
				//top
				redrawTop(function() {
					//list
					redrawList();
				});
			}
			
			function redrawTop(callback) {
				ajaxHtml(
					'/marrymate/calendar/calendarMain.jsp'
					, JSON.stringify({
						type: 'top'
					})
					, ""
					, ""
					, function(result){
						$('div.contentsArea > .contentsTop').html(result);
						//
						callback && callback();
					}
					, function(){
						_alert({title:"알림", message: "시스템 에러 입니다. 동일한 증상이 계속 발생시 담당자에게 문의 부탁드립니다.", close:function(){}});
					}
				);
			}
			
			function redrawList(callback) {
				//list
				ajaxHtml(
					'/marrymate/calendar/calendarMain.jsp'
					, JSON.stringify({
						type: 'list'
					})
					, ""
					, ""
					, function(result){
						$('div.contentsArea > .contestList').html(result);
						//
						callback && callback();
					}
					, function(){
						_alert({title:"알림", message: "시스템 에러 입니다. 동일한 증상이 계속 발생시 담당자에게 문의 부탁드립니다.", close:function(){}});
					}
				);
			}
			
			// 익스포트
			MP05.open = open;
			MP05.close = close;
			MP05.clear = clear;
			MP05.reset = reset;
			MP05.confirm = confirm;
			MP05.redraw = redraw;
			MP05.redrawCount = redrawCount;
			MP05.redrawScreen = redrawScreen;
			MP05.redrawTop = redrawTop;
			MP05.redrawList = redrawList;
			
		})(window.MP05 = window.MP05 || {}, jQuery);

		
		// 익스포트
		
		SWO01.checklist = checklist;

	})(window.SWO01 = window.SWO01 || {}, jQuery);
	</script>
			
	<%@include file="../chatbot.jsp"%>
	<%@include file="../footer.jsp"%>
</body>
</html>