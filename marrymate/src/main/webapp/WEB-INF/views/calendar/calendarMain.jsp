<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="charset" content="UTF-8">
<title>웨딩캘린더</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="예식장, 스드메, 사진DVD, 주례, 사회, 축가 결혼준비 정보">
<meta property="og:title" content="메리메이트">
<meta property="og:url" content="https://localhost:9090/marrymate/">
<meta property="og:image" content="/marrymate/img/logo1.png">
<meta property="og:description"
	content="예식장, 스드메, 사진DVD, 주례, 사회, 축가 결혼준비 정보">
<script src="/marrymate/js/CalendarJS.js"></script>
<link rel="stylesheet" href="/marrymate/css/calendar.css">
<link rel="stylesheet" href="/marrymate/css/style.css">
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
									<span class="date"> 
										<c:if test="${!empty sessionScope.loginId}">
											<div >${sessionScope.loginMD.substring(0, 10)} &nbsp;<span id="day"></span></div>
										</c:if>
									</span> 
									<span class="d-day" id="dDay"></span><br>
								</div>
								<div id="count"></div>
							</div>
						</div>
					</div>
					<!--profileArea : e-->
				</div>
			</div>
			<br><br>
			<!--mainMyweddingAnimation : s-->
			<div class="mainMyweddingAnimationScroll">
				<div class="infoArea">
					<ul>
						<li><a href="javascript:void(0);" class="moveScroll"
							data-target="chkst" data-chkst="01"> <span class="tit">
									PAST<br class="onlyM">
							</span> <span class="number"> <strong id="checkListChkCnt">

										2 </strong> <span class="txt">건</span>
							</span>
						</a></li>
						<li><a href="javascript:void(0);" class="moveScroll"
							data-target="chkst" data-chkst="04"> <span class="tit">PRESENT<br
									class="onlyM"></span> <span class="number"> <strong
									id="checkListDoingCnt"> 1 </strong> <span class="txt">건</span>
							</span>
						</a></li>
						<li><a href="javascript:void(0);" class="moveScroll"
							data-target="chkst" data-chkst="03"> <span class="tit">FUTURE<br
									class="onlyM"></span> <span class="number"> <strong
									id="checkListReservCnt"> 12 </strong> <span class="txt">건</span>
							</span>
						</a></li>
					</ul>
				</div>
				<div class="goal">

					<strong> D-205 </strong>

				</div>
			</div>
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