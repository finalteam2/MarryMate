<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta name="charset" content="UTF-8">
<title>웨딩캘린더</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="예식장, 스드메, 사진DVD, 주례, 사회, 축가 결혼준비 정보">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link href='/marrymate/css/fullcalendar.main.min.css' rel='stylesheet' />
<script src='/marrymate/js/ko.js'></script>
<script src='/marrymate/js/fullcalendar.main.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
<link rel="stylesheet" href="/marrymate/css/calendar.css">
<link rel="stylesheet" href="/marrymate/css/date-picker.css">
<link rel="stylesheet" href="/marrymate/css/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="/marrymate/js/jquery-1.12.4.js"></script>
<script src="/marrymate/js/jquery-ui.js"></script>
<script src="/marrymate/js/CalendarJS.js"></script>
<script src="/marrymate/js/swiper.min.js"></script>
<link href='fullcalendar.main.min.css' rel='stylesheet'>
<script src='ko.js'></script>
<script src='fullcalendar.main.min.js'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>

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

document.getElementById("dDayOnly").innerHTML = "현재 D-" + day +"일 입니다!";
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
	opener.parent.location.reload();
}

function checkadd(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("checklistAdd.do","checkadd", "width=400, height=400, left="+w+",top="+h);
}

function checkdel(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("checklistDel.do","checkdel", "width=400, height=400, left="+w+",top="+h);
}


function plandel(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("planlistDel.do","checkdel", "width=400, height=400, left="+w+",top="+h);
}


function checkuse(){
	window.open("checklistShow.do","checkuse");
}


function checkAlladd(){

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

<style type="text/css">
.schedulewrapper{
	text-align: center;
}
.myWeddingMenuWrap{
	text-align: center;
}
.checklistwrap{
	text-align: center;
}
.planlistwrap{
	text-align: center;
}
.ddaygoal{
	font-size: 28px;
	font-weight: bold;
	color: purple;
}
</style>
</head>
<body background="/marrymate/img/background.png">
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
		<input type="hidden" name="midx" value=${sessionScope.loginMidx }>
		<img id="Caltopmem" src="/marrymate/img/caltopmem.png"
			style="width: 100%">
		
		<!--checkListTopWrap : s-->
		<div class="checkListTopWrap">
			<div class="inner">
				
				<div class="profileWrap">
				
					<!--profileArea : s-->
	<div class="profileBox">
						<div class="imgArea">
							<c:forEach var="minfo" items="${myinfo}">
							<img class="mypicture" src="/marrymate/img/member/${minfo.img}">
						</c:forEach>
						
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




	<br>
	<br>
	<!--calendarShow-->

	<div class="schedulewrapper">
		<div class="schedulebox">
			<div class="scheduleall">
				<h3>전체 스케줄 보기</h3>

				<div>
					   <div style="display: flex;">
        <div style="flex: 1;">
            <div class="scheduletotal">
                <h4>모든 일정</h4>
                <div class="stats">${ptotal}</div>
                <div class="statsletter">건</div>
            </div>
        </div>
        <div style="flex: 1;">
            <div class="booklisttotal">
                <h4>모든 예약</h4>
                <div class="stats">
                    <a href=#checklistMove>${btotal}</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
        <div style="flex: 1;">
            <div class="checklisttotal">
                <h4>모든 체크리스트</h4>
                <div class="stats">${ctotal}</div>
                <div class="statsletter">건</div>
            </div>
        </div>
    </div>
				</div>
			</div>
			<input type="hidden" name="midx" value="${sessionScope.loginMidx}">

<br><br>
			<div style="padding-left: 90%">
				<button type="button" id="planadd" onclick="addplan();">일정등록</button>
			</div>
			<br>

			<!-- 캘린더 시작  -->
			<div id='calendar'></div>
			<div id='popup'
				style="width: 500px; height: 600px; display: none; background-color: white; padding: 20px; border-radius: 14px; border: 2px solid #eeeeee">
				<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
			</div>
		</div>
	</div>


	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			  locale: "ko",
			  initialView: 'dayGridMonth',
			  headerToolbar: {
				left: 'prev,next today',
				center: 'title',
				right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			  },
			  titleFormat : function(date) {
	                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
	            },
	            selectable : true,
	            droppable : true,
	            editable : true,
	            nowIndicator : true,
	            locale : 'ko',
			  googleCalendarApiKey: 'AIzaSyAMOTvZ3EfZYlrlAY7kNu6Qpu9OGZ3lxOc',
			  events: {
			  googleCalendarId: 'bb5c88acec84ea534aeacba7d764371e7a104dd14994c27fabbf3eb5700a929f@group.calendar.google.com',
			  className: 'gcal-event' 
			  },
			  eventSources : [
	                {
	                    backgroundColor : '#FF6D6D',
	                    textColor : '#FFFFFF'
	                },
	                {
	                    events: ${svcJson3}
	                },
	                {
	                    events: ${svcJson4}
	                }
	            ],
	            
			  eventClick: function(info) {
				  let start_year = info.event.start.getUTCFullYear();
				  let start_month = info.event.start.getMonth() + 1;
				  let start_date = info.event.start.getUTCDate();
				  let start_hour = info.event.start.getHours();
				  let start_minute = info.event.start.getMinutes();
				  let start_second = info.event.start.getSeconds();
				  let end_hour = info.event.end.getHours();

				  let start = start_year + "-" + start_month + "-" + start_date + " " + start_hour + "시 ~ " + end_hour + "시";

				  let attends = "";
				  info.event.extendedProps.attachments.forEach(function(item) {
					  attends += "<div><a href='"+item.fileUrl+"' target='_blank'>[첨부파일]</a></div>"
				  });

				  if(!info.event.extendedProps.description) {
					  info.event.extendedProps.description = "";
				  }
				  let contents = `
					<div style='font-weight:bold; font-size:20px; margin-bottom:30px; text-align:center'>
						${start}
					</div>
					<div style='font-size:18px; margin-bottom:20px'>
						제목: ${info.event.title}
					</div>
					<div style='width:500px'>
						${info.event.extendedProps.description}
						${attends}
					</div>
				  `;
				  
				  $("#popup").html(contents);
				  $("#popup").bPopup({
					speed: 650,
					transition: 'slideIn',
					transitionClose: 'slideBack',
					position: [($(document).width()-500)/2, 30] //x, y
				  });
				  info.jsEvent.stopPropagation();
				  info.jsEvent.preventDefault();
				  
			  }
			 
		});
		calendar.render();
	});
</script>


	<div class="planlistwrap">
	<h3>
		<a>Myplan</a>
	</h3>
	<form action="planlistDel.do" method="post">
		<input type="hidden" name="myp_idx" value="${dto.myp_idx}">
		<table style="margin-left:auto; margin-right:auto;" border="1" width="900" cellspacing="0">
			<thead>
				<tr>
					<th>제목</th>
					<th>일자</th>
					<th>내용</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty planlists}">
					<tr>
						<td colspan="4" align="center">등록된 일정이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="pdto" items="${planlists}">
					<tr>
						<td>${pdto.title}</td>
						<td>${pdto.pdate}</td>
						<td>${pdto.content}</td>
						<td><input type="submit" value="삭제">
							<button type="button" id="checkdel" onclick="checkdel();">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	</div>
	<br>
	<!-- checklist add/select -->
	<div class="checklistwrap">
	<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
	<h3 id="checklistitems">
		<a id="checklistMove">모든 체크리스트</a>
	</h3>
	<div style="padding-left: 65%">
		<button type="button" id="checkadd" onclick="checkadd();">새
			체크리스트 등록</button>
	</div>
	<form action="checklistDel.do" method="post">
		<input type="hidden" name="ch_idx" value="${dto.ch_idx}">
		<table style="margin-left:auto; margin-right:auto;" border="1" width="900" cellspacing="0">
			<thead>
				<tr>
					<th>제목</th>
					<th>일자</th>
					<th>내용</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty checklistItems}">
					<tr>
						<td colspan="4" align="center">등록된 체크리스트가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${checklistItems}">
					<tr>
						<td>${dto.title}</td>
						<td>${dto.dueday}</td>
						<td>${dto.content}</td>
						<td><input type="submit" value="삭제">
							<button type="button" id="plandel" onclick="plandel();">삭제</button></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	</div>
	<br><br>
	<hr>
	<br><br>
	<div class="myWeddingMenuWrap">
		<div class="ddaygoal">
		<div class="goal">
			<strong><span class="d-day" id="dDayOnly"></span></strong>
		</div>
	</div>
		<h2>아래 예시를 참고하여 나만의 체크리스트를 추가해보세요!</h2>
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
							<div class="d-day" data-daydt="290">D-290</div>
							<a href="#checklistitems" data-id="viewCheckList" data-chkid="1"
								class="jsSWO01Ev tit " id="checklistitems">#양가인사</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="270">D-270</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="1" class="jsSWO01Ev tit " id="checklistitems">#상견례</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="240">D-240</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="2" class="jsSWO01Ev tit " id="checklistitems">#결혼예산작성</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="230">D-230</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="3" class="jsSWO01Ev tit " id="checklistitems">#웨딩홀</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="220">D-220</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="3" class="jsSWO01Ev tit " id="checklistitems">#신혼여행</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="210">D-210</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="3" class="jsSWO01Ev tit " id="checklistitems">#스튜디오
								예약</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="210">D-210</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="3" class="jsSWO01Ev tit " id="checklistitems">#드레스샵
								예약</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="210">D-210</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="3" class="jsSWO01Ev tit " id="checklistitems">#메이크업샵
								예약</a>
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
								data-chkid="4" class="jsSWO01Ev tit " id="checklistitems">#DVD
								예약</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="200">D-200</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="4" class="jsSWO01Ev tit " id="checklistitems">스냅사진
								예약</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="180">D-180</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="6" class="jsSWO01Ev tit " id="checklistitems">#청첩장</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="170">D-170</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="4" class="jsSWO01Ev tit " id="checklistitems">#드레스투어</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="160">D-160</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="7" class="jsSWO01Ev tit " id="checklistitems">#신혼집</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="150">D-150</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="6" class="jsSWO01Ev tit " id="checklistitems">#청첩장모임</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="140">D-140</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="6" class="jsSWO01Ev tit " id="checklistitems">#예물</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="120">D-120</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="5" class="jsSWO01Ev tit " id="checklistitems">#한복/예복</a>
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
							<div class="d-day" data-daydt="90">D-90</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="11" class="jsSWO01Ev tit " id="checklistitems">#본식가봉
								예약</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="11" class="jsSWO01Ev tit " id="checklistitems">#예단</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="10" class="jsSWO01Ev tit " id="checklistitems">#혼수</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="8" class="jsSWO01Ev tit " id="checklistitems">#뷰티케어</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="13" class="jsSWO01Ev tit " id="checklistitems">#웨딩카</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="60">D-60</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="12" class="jsSWO01Ev tit " id="checklistitems">#폐백/이바지</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="50">D-50</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="12" class="jsSWO01Ev tit " id="checklistitems">#건강검진</a>
						</div>
					</li>
					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="40">D-40</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="9" class="jsSWO01Ev tit " id="checklistitems">#모바일청첩장</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="30">D-30</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="15" class="jsSWO01Ev tit " id="checklistitems">#입주청소</a>
						</div>
					</li>



					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="30">D-30</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="14" class="jsSWO01Ev tit " id="checklistitems">#부케</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="20">D-20</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="16" class="jsSWO01Ev tit " id="checklistitems">#답례품</a>
						</div>
					</li>

					<li>
						<div class="item on" data-seqno="1">
							<div class="d-day" data-daydt="0">D-0</div>
							<a href="javascript:void(0);" data-id="viewCheckList"
								data-chkid="17" class="jsSWO01Ev tit " id="checklistitems">#웨딩</a>
						</div>
					</li>


				</ul>
			</div>
		</div>

	</div>


	<jsp:include page="/WEB-INF/views/chatbot.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>