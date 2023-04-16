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
function addplan(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("planWriteCom.do","addplan", "width=400, height=400, left="+w+",top="+h);
	opener.parent.location.reload();
}

function checkadd(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("checklistAddCom.do","checkadd", "width=400, height=400, left="+w+",top="+h);
}

function checkdel(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("checklistDelCom.do","checkdel", "width=400, height=400, left="+w+",top="+h);
}


function plandel(){
	var w = (window.screen.width/2)-200;
	var h = (window.screen.height/2)-200;
	window.open("planlistDelCom.do","checkdel", "width=400, height=400, left="+w+",top="+h);
}


function checkuse(){
	window.open("checklistShow.do","checkuse");
}


function checkAlladd(){

}

</script>
<script type="text/javascript">
	
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
		<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
		<img id="Caltopmem" src="/marrymate/img/caltop.png"
			style="width: 100%">
		
		<!--checkListTopWrap : s-->
		<div class="checkListTopWrap">
			<div class="inner">
				
				<div class="profileWrap">
				
					<!--profileArea : s-->
	<div class="profileBox">
						<div class="imgArea">
							<c:forEach var="cinfo" items="${cominfo}">
							<img class="mypicture" src="/marrymate/img/member/${cinfo.img}">
						</c:forEach>
						
						</div>
						<div class="txtArea">
							<div class="nameArea">
								<c:if test="${!empty sessionScope.com_id}">
									<div>
										<strong> ${sessionScope.com_cname}</strong>
										님 환영합니다.<br> 메리메이트와 똑똑한 일정 관리하세요!
									</div>
								</c:if>
							</div>
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
                <div class="stats">
                <a href="planlistMove">${ptotalcom}</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
        <div style="flex: 1;">
            <div class="booklisttotal">
                <h4>모든 예약</h4>
                <div class="stats">
                    <a href="">${btotalcom}</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
        <div style="flex: 1;">
            <div class="checklisttotal">
                <h4>모든 체크리스트</h4>
                <div class="stats">
                <a href="checklistMove">${ctotalcom}</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
    </div>
				</div>
			</div>
			<input type="hidden" name="cidx" value="${sessionScope.com_cidx}">

<br><br>
			<div style="padding-left: 90%">
				<button type="button" id="planadd" onclick="addplan();">일정등록</button>
			</div>
			<br>

			<!-- 캘린더 시작  -->
			<div id='calendar'></div>
				<input type="hidden" name="cidx" value="${sessionScope.com_cidx}">
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
			  googleCalendarApiKey: 'AIzaSyA3tB9fPFzCBAcmTdPXfM9Da4bOnJ6GE8Q',
			  events: {
			  googleCalendarId: '92c453036d926d54844360967e3143b0a9bbe21313f9d012acb49008e843afc2@group.calendar.google.com',
			  className: 'gcal-event' 
			  },
			  eventSources : [
	                {
	                    backgroundColor : '#FF6D6D',
	                    textColor : '#FFFFFF'
	                },
	                {
	                    events: ${svcJson}
	                },
	                {
	                    events: ${svcJson2}
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
		<a id="planlistMove">Company Plan</a>
	</h3>
	<form action="planlistDelCom.do" method="post">
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
				<c:if test="${empty planlistscom}">
					<tr>
						<td colspan="4" align="center">등록된 일정이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="pdto" items="${planlistscom}">
					<tr>
						<td>${pdto.title}</td>
						<td>${pdto.pdate}</td>
						<td>${pdto.content}</td>
						<td><input type="submit" value="삭제">
							<button type="button" id="plandel" onclick="plandel();">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	</div>
	<br>
	<!-- checklist add/select -->
	<div class="checklistwrap">
	<input type="hidden" name="cidx" value="${sessionScope.com_cidx}">
	<h3 id="checklistitems">
		<a id="checklistMove">Company Checklist</a>
	</h3>
	<div style="padding-left: 65%">
		<button type="button" id="checkadd" onclick="checkadd();">새
			체크리스트 등록</button>
	</div>
	<form action="checklistDelCom.do" method="post">
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
				<c:if test="${empty checklistItemscom}">
					<tr>
						<td colspan="4" align="center">등록된 체크리스트가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${checklistItemscom}">
					<tr>
						<td>${dto.title}</td>
						<td>${dto.dueday}</td>
						<td>${dto.content}</td>
						<td><input type="submit" value="삭제">
							<button type="button" id="checkdel" onclick="checkdel();">삭제</button></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	</div>
	<br><br>


	<jsp:include page="/WEB-INF/views/chatbot.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

</body>
</html>