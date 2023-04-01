<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통 합 예 약</title>
<link rel="stylesheet" href="/marrymate/css/all-book.css">
<link rel="stylesheet" href="/marrymate/css/price-range.css">
<link rel="stylesheet" href="/marrymate/css/date-picker.css">
<link rel="stylesheet" href="/marrymate/css/nice-select.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/jquery.nice-select.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$( function() {
	$( "#datepicker" ).datepicker({
		showMonthAfterYear: true,
		yearSuffix: ",",
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		dayNames: [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
		minDate: "+1",
		maxDate: "+365",
		nextText: ">",
		prevText: "<"
	});
} );
$( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 1,
      max: 295,
      values: [ 1, 295 ],
      slide: function( event, ui ) {
        $( "#amount" ).val(ui.values[ 0 ]+"만원 ~ "+ui.values[ 1 ]+"만원");
      }
    });
    $( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) +
      "만원 ~ " + $( "#slider-range" ).slider( "values", 1 )+"만원" );
} );
</script>
</head>
<body>
<section>
	<article>
		<div class="bg_box">
			<video muted autoplay loop>
				<source src="/marrymate/video/bg_book.mp4" type="video/mp4">
			</video>
			<div class="bg_text">
				<p class="title">통 합 예 약</p>
				<p class="sub_title">홀을 제외한 모든 예약을 한번에 하세요!</p>
			</div>
		</div>
	</article>
	<article>
		<div class="top_box">
			<div class="search_box">
				<input class="search_input" type="text" name="search_text" placeholder="지역, 업체명을 입력해주세요.">
			</div>
			<div class="calendar_box">
				<input type="text" id="datepicker" placeholder="이용날짜를 선택해주세요." readonly>
			</div>
			<div class="local_box">
				<select name="local_select">
					<option data-display="지역을 선택해주세요." value="">시/도</option>
					<option value="1">서울</option>
					<option value="2">경기</option>
					<option value="3">인천</option>
					<option value="4">부산</option>
					<option value="5">대전</option>
					<option value="6">대구</option>
					<option value="7">광주</option>
					<option value="8">울산</option>
					<option value="9">제주</option>
					<option value="10">강원</option>
					<option value="11">경북</option>
					<option value="12">경남</option>
					<option value="13">전북</option>
					<option value="14">전남</option>
					<option value="15">충북</option>
					<option value="16">충남</option>
				</select>
				<script>
					$(document).ready(function(){
						$('select').niceSelect();
					});
				</script>
			</div>
			<div class="price_box">
				<div class="price_box2">
					<div class="price_textbox">
						<label class="price_text">가격범위</label>
					</div>
					<div class="price_barbox">
						<div id="slider-range"></div>
					</div>
					<div class="price_rangebox">
						<input type="text" id="amount" readonly>
					</div>
				</div>
			</div>
			<div class="button_box">
				<input class="search_button" type="button" value="검색하기">
			</div>
		</div>
	</article>
	<article>
		<div class="order_box">
			<input class="order_button" type="button" value="이름순">
			<input class="order_button" type="button" value="조회수순">
			<input class="order_button" type="button" value="낮은가격순">
			<input class="order_button" type="button" value="높은가격순">
		</div>
		<div class="left_box">
			<div>
				<h2 class="cate_title">스튜디오</h2>
				<hr style="width:93%;border:1px solid #6c6c6c;">
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<hr style="width:93%;border:1px solid #6c6c6c;">
			</div>
		</div>
	</article>
	<article>
		<div class="right_box">
			<div>
				<h2 class="category">카 테 고 리</h2>
			</div>
			<h3 class="cate_menu">
			<label>스튜디오</label>
			</h3>
			<h3 class="cate_menu">
			<label>드레스</label>
			</h3>
			<h3 class="cate_menu">
			<label>헤어메이크업</label>
			</h3>
			<h3 class="cate_menu">
			<label>스냅DVD</label>
			</h3>
			<h3 class="cate_menu">
			<label>주례</label>
			</h3>
			<h3 class="cate_menu">
			<label>사회</label>
			</h3>
			<h3 class="cate_menu">
			<label>축가</label>
			</h3>
			<div class="allClear_box">
				<input class="allClear_button" type="button" value="전체삭제">
			</div>
			<h3 class="sumPay_text1">총 금액</h3>
			<h3 class="sumPay_text2">150,000 원</h3>
			<div class="book_box">
				<input class="book_button" type="submit" value="예 약 하 기">
			</div>
		</div>
	</article>
</section>
</body>
</html>