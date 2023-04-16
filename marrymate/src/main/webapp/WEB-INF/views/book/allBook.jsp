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
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="js/all-book.js"></script>
<script>
function cartCheck(){
	var hiddens=document.querySelectorAll('#bookFm input[type="hidden"]');
	var loginMidx='${sessionScope.loginMidx}';
	
	if(loginMidx==""){
		window.alert('로그인한 회원만 예약이 가능합니다.');
		return false;
	}
	
	if(hiddens==null || hiddens.length==0){
		window.alert('카트에 담긴 상품이 없습니다. 상품을 담아주세요.');
		return false;
	}else{
		return true;
	}
}
</script>
</head>
<body onload="cateList(1);">
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
		<form name="searchFm">
		<div class="top_box">
			<div class="search_box">
				<input class="search_input" type="text" name="filterText" placeholder="지역, 업체명을 입력해주세요">
			</div>
			<div class="calendar_box">
				<input type="text" id="datepicker" name="filterDate" placeholder="이용날짜 (당일기준 14일 후 부터 가능)" readonly>
			</div>
			<div class="local_box">
				<select id="filterSido" name="filterSido">
					<option id="defaultSido" value="" disabled selected>지역 (시/도)</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="부산">부산</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="제주">제주</option>
					<option value="강원">강원</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="전북">전북</option>
					<option value="전남">전남</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
				</select>
				<script>
					$(document).ready(function(){
						$('#filterSido').niceSelect();
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
						<input type="text" name="flterPrice" id="amount" readonly>
					</div>
				</div>
			</div>
			<div class="button_box">
				<input id="search_button" class="search_button" type="button" onclick="searchList()">
			</div>
		</div>
		</form>
	</article>
	<article>
		<div class="order_box">
			<input class="order_radio" name="filterOrder" id="order_one" type="radio" value="이름순" checked>
			<label class="order_tab" for="order_one" onclick="orderList(1)">이름순</label>
			<input class="order_radio" name="filterOrder" id="order_two" type="radio" value="조회순">
			<label class="order_tab" for="order_two" onclick="orderList(2)">조회순</label>
			<input class="order_radio" name="filterOrder" id="order_three" type="radio" value="낮은가격순">
			<label class="order_tab" for="order_three" onclick="orderList(3)">낮은가격순</label>
			<input class="order_radio" name="filterOrder" id="order_four" type="radio" value="높은가격순">
			<label class="order_tab" for="order_four" onclick="orderList(4)">높은가격순</label>
		</div>
		<div class="left_box">
			<div>
			<h2 id="cate_title" class="cate_title">
			
			</h2>
			<h3 id="item_count">
			
			</h3>
			<hr style="width:93%;border:1px solid #6c6c6c;">
			<div id="list_container">
			
			</div>
			<hr style="width:93%;border:1px solid #6c6c6c;">
			</div>
		</div>
	</article>
	<article>
		<div class="right_box">
			<div>
				<h2 class="category">카 테 고 리</h2>
			</div>
			<div class="cate_menubox">
				<form name="cateFm">
					<input class="cate_radio" name="filterCate" id="cate_one" type="radio" value="스튜디오" checked>
					<label class="cate_menu" for="cate_one" onclick="cateList(1)">스튜디오</label>
					<div id="cate_menu1"></div>
					<input class="cate_radio" name="filterCate" id="cate_two" type="radio" value="드레스">
					<label class="cate_menu" for="cate_two" onclick="cateList(2)">드레스</label>
					<div id="cate_menu2"></div>
					<input class="cate_radio" name="filterCate" id="cate_three" type="radio" value="헤어메이크업">
					<label class="cate_menu" for="cate_three" onclick="cateList(3)">헤어메이크업</label>
					<div id="cate_menu3"></div>
					<input class="cate_radio" name="filterCate" id="cate_four" type="radio" value="스냅DVD">
					<label class="cate_menu" for="cate_four" onclick="cateList(4)">스냅DVD</label>
					<div id="cate_menu4"></div>
					<input class="cate_radio" name="filterCate" id="cate_five" type="radio" value="주례">
					<label class="cate_menu" for="cate_five" onclick="cateList(5)">주례</label>
					<div id="cate_menu5"></div>
					<input class="cate_radio" name="filterCate" id="cate_six" type="radio" value="사회">
					<label class="cate_menu" for="cate_six" onclick="cateList(6)">사회</label>
					<div id="cate_menu6"></div>
					<input class="cate_radio" name="filterCate" id="cate_seven" type="radio" value="축가">
					<label class="cate_menu" for="cate_seven" onclick="cateList(7)">축가</label>
					<div id="cate_menu7"></div>
				</form>
			</div>
			<div class="allClear_box">
				<input class="allClear_button" type="button" value="전체삭제" onclick="allDelCart()">
			</div>
			<h3 class="sumPay_text1">총 금액</h3>
			<h3 id="sumPay_text2" class="sumPay_text2">0 원</h3>
			<form onsubmit="return cartCheck()" id="bookFm" name="bookFm" action="notHallSubmit.do" method="post">
				<div class="book_box">
					<input class="book_button" type="submit" value="예 약 하 기">
				</div>
			</form>
		</div>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
</body>
</html>