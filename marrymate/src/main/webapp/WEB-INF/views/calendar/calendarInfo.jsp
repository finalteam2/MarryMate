<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta name="charset" content="UTF-8">
<title>Calendar Information</title>
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
.titlecss{
	color: #5706b0;
	font-family: 'SUIT-Regular';
	font-size: 30px;
}
.bigtitle{
	color: #5706b0;
	font-family: 'SUIT-Regular';
	font-size: 38px;
}
.titlecss{
	color: #5706b0;
	font-family: 'SUIT-Regular';
	font-size: 30px;
}
.scheduleall h4{
	color: #5706b0;
	font-family: 'SUIT-Regular';
	font-size: 28px;
	font-weight: bold;
}
</style>
</head>
<body background="/marrymate/img/background.png">
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
		<img id="Caltopmem" src="/marrymate/img/caltopmem.png"
			style="width: 100%">
		
		<!--checkListTopWrap : s-->
		<div class="checkListTopWrap">
			<div class="inner">
				
				<div class="profileWrap">
				
					<!--profileArea : s-->
	<div class="profileBox">
						<div class="imgArea">
							<div style="position: relative;">
								 <img class="photoframe" src="/marrymate/img/imgbox.png">
							</div>
						
						</div>
						<div class="txtArea">
							<div class="nameArea">
									<div>
										<strong>김철수</strong>
										님 & <strong>이영희</strong> 님 결혼예정일
									</div>
							</div>

							<div class="weddingDay">
										<div>2024년 3월 20일
											&nbsp;<span id="day"></span>
										</div>
<span class="d-day" id="dDay"></span><br>
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
				<div class="bigtitle">전체 스케줄 보기</div>
				<div>
					   <div style="display: flex;">
        <div style="flex: 1;">
            <div class="scheduletotal">
                <h4>모든 일정</h4>
                <div class="stats">
                <a href=#planlistMove>3</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
        <div style="flex: 1;">
            <div class="booklisttotal">
                <h4>모든 예약</h4>
                <div class="stats">
                    <a href="myBook.do">4</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
        <div style="flex: 1;">
            <div class="checklisttotal">
                <h4>모든 체크리스트</h4>
                 <div class="stats">
                <a href=#planlistMove>7</a>
                </div>
                <div class="statsletter">건</div>
            </div>
        </div>
    </div>
				</div>
			</div>
			<input type="hidden" name="midx" value="${sessionScope.loginMidx}">

<br><br><br><br><br><br>
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
	<br><br>
	<div class="planlistwrap">
	<div class="titlecss">
		<a id="planlistMove">Myplan</a>
	</div>
	<form>
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
					<tr>
					<tr>
						<td>드레스샵 찾아보기</td>
						<td>2023-11-02</td>
						<td>드레스샵 5개 찾아보기</td>
						<td><input type="submit" value="삭제">
							<button type="button">삭제</button></td>
					</tr>
			</tbody>
		</table>
	</form>
	</div>
	<br><br><br>
	
	<!-- checklist add/select -->
	<div class="checklistwrap">
	<input type="hidden" name="midx">
	<div class="titlecss" id="checklistitems">
		<a id="checklistMove">모든 체크리스트</a>
	</div>
	<div style="padding-left: 65%">
		<button type="button">새 체크리스트 등록</button>
	</div>
	<form>
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
					<tr>
						<td>상견례</td>
						<td>2023-10-22</td>
						<td>광화문 경복궁 18:00</td>
						<td><input type="submit" value="삭제">
							<button type="button">삭제</button></td>
					</tr>
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
		<h2>나만의 체크리스트를 추가할 수 있어요!</h2>
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