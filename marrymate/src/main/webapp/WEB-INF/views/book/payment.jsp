<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예 약 결 제</title>
<link rel="stylesheet" href="/marrymate/css/payment.css">
</head>
<body>
<section>
	<article>
		<div class="bg_box">
			<video muted autoplay loop>
				<source src="/marrymate/video/bg_book.mp4" type="video/mp4">
			</video>
			<div class="bg_text">
				<p class="title">예 약 결 제</p>
				<p class="sub_title">Reservation / Payment</p>
			</div>
		</div>
	</article>
	<article>
		<form name="payFm" action="">
		<div class="pay_box">
			<h1 class="box_title">예약자 정보</h1>
			<div class="bookerInfo_box">
				<table class="bookerInfo_table">
					<tr>
						<td>이름</td>
						<td>세션.이름</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>세션.전화번호</td>
					</tr>
				</table>
			</div>
			<h1 class="box_title">상품 정보</h1>
			<div class="itemInfo_box">
				<table class="itemInfo_table">
					<tr>
						<td rowspan="4">
							업체사진(이미지)
						</td>
						<td colspan="2" align="right">
							이용날짜
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							이용시간
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<br>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="right">상품가격</td>
					</tr>
					<tr>
						<td colspan="2">업체이름(카테고리)</td>
						<td align="right">
						삭제버튼
						</td>
					</tr>
				</table>
				<table class="itemInfo_table">
					<tr>
						<td rowspan="4">
							업체사진(이미지)
						</td>
						<td colspan="2" align="right">
							이용날짜
						</td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							이용시간
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<br>
						</td>
					</tr>
					<tr>
						<td></td>
						<td align="right">상품가격</td>
					</tr>
					<tr>
						<td colspan="2">업체이름(카테고리)</td>
						<td align="right">
						삭제버튼
						</td>
					</tr>
				</table>
			</div>
			<h1 class="box_title">포인트 사용/할인</h1>
			<div class="point_box">
				<div class="usePoint_box">
					<table class="usePoint_table">
						<tr>
							<td class="bold_text">총 금액</td>
							<td class="bold_text">240000 원</td>
						</tr>
						<tr>
							<td>보유포인트</td>
							<td>19000 P</td>
						</tr>
						<tr>
							<td>포인트사용</td>
							<td><input class="usePoint_input" type="text" name="use_point" maxlength="6" placeholder="ex. 10000"></td>
						</tr>
					</table>
					<div class="allUsePoint_box">
						<input class="allUsePoint_button" type="button" value="전액사용">
					</div>
					<h2 class="afterPoint_h2">사용 후 잔여포인트 : 4000 P</h2>
				</div>
				<div class="calPrice_box">
					<table class="calPrice_table">
						<tr>
							<td class="bold_text2">240000 원</td>
						</tr>
						<tr>
							<td class="light_text">(총 금액)</td>
						</tr>
						<tr>
							<td class="bold_text2">48000 원</td>
						</tr>
						<tr>
							<td class="light_text">(예약금 : 총 금액의 20%)</td>
						</tr>
						<tr>
							<td class="bold_text2">- 15000 P</td>
						</tr>
						<tr>
							<td class="light_text">(포인트사용)</td>
						</tr>
					</table>
					<hr style="width:90%;">
					<h2 class="finalPrice_text">최종결제금액 : 33000 원</h2>
				</div>
			</div>
			<h1 class="box_title">결제 정보</h1>
			<div class="payInfo_box">
				결제 API (카드, 계좌이체, 카카오페이 등등)
			</div>
			<h1 class="box_title">예약자 동의</h1>
			<div class="agree_box">
				<h2><input type="checkbox">&nbsp;전체 동의하기</h2>
				<ul>
					<li>
					<input type="checkbox" required>&nbsp;[필수] 개인정보 수집 및 이용 동의
					</li>
					<li>
					<input type="checkbox" required>&nbsp;[필수] 개인정보 제3자 제공 동의
					</li>
					<li>
					<input type="checkbox" required>&nbsp;[필수] 전자결제대행 이용 동의
					</li>
				</ul>
			</div>
			<div class="payButton_box">
				<input class="payButton" type="submit" value="_원 결제하기">
			</div>
		</div>
		</form>
	</article>
</section>

<h3>${test}</h3>

<%@include file="../chatbot.jsp" %>
</body>
</html>