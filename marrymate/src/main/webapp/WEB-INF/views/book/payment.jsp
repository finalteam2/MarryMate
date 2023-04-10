<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예 약 결 제</title>
<link rel="stylesheet" href="/marrymate/css/payment.css">
<script type="text/javascript" src="js/payment.js"></script>
</head>
<body onload="showLoad()">
<section>
	<article>
		<div class="bg_box">
			<video muted autoplay loop>
				<source src="/marrymate/video/bg_pay.mp4" type="video/mp4">
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
						<td style="width:85px;">이름</td>
						<td>${sessionScope.loginName }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${sessionScope.loginTel }</td>
					</tr>
				</table>
			</div>
			<h1 class="box_title">상품 정보</h1>
			<div class="itemInfo_box">
				
				<c:forEach items="${cartList}" var="dto">
					<table class="itemInfo_table">
						<tr>
							<td rowspan="4">
								<img class="company_img" src="/marrymate/img/com_best/${dto.img }" alt="companyImg">
							</td>
							<td colspan="2" align="right">
								<span class="small_text">이용날짜</span>&nbsp;&nbsp;&nbsp;<span class="bold_text">${dto.bk_date }</span>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<span class="small_text">이용시간</span>&nbsp;&nbsp;&nbsp;<span class="bold_text">${dto.bk_time }</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<br>
							</td>
						</tr>
						<tr>
							<td></td>
							<td align="right"><span class="small_text">가격</span>&nbsp;&nbsp;&nbsp;<span class="itemPrice">${dto.pay }</span> 원</td>
						</tr>
						<tr>
							<td colspan="2"><span id="bk_cname" class="bold_text">${dto.cname }</span> (${dto.kind })</td>
							<td align="right">
							<img class="cancel_img" style="vertical-align:middle;" src="/marrymate/img/item_cancel.png" alt="cancelImg">
							</td>
						</tr>
					</table>
				</c:forEach>
				
			</div>
			<h1 class="box_title">포인트 사용/할인</h1>
			<div class="point_box">
				<div class="usePoint_box">
					<table class="usePoint_table">
						<tr>
							<td class="bold_text">총 금액</td>
							<td class="bold_text"><span class="allItemPrice"></span> 원</td>
						</tr>
						<tr>
							<td>보유포인트</td>
							<td><span id="havePoint">${sessionScope.loginPoint }</span> P</td>
						</tr>
						<tr>
							<td>포인트사용</td>
							<td>
							<input id="usePoint_input" class="usePoint_input" type="text" name="use_point" maxlength="6" placeholder="ex. 10000" onchange="usePoint()">
							</td>
						</tr>
					</table>
					<div class="allUsePoint_box">
						<input class="allUsePoint_button" type="button" value="전액사용" onclick="allUsePoint()">
					</div>
					<h2 class="afterPoint_h2">사용 후 잔여포인트 : <span id="afterPoint">${sessionScope.loginPoint }</span> P</h2>
				</div>
				<div class="calPrice_box">
					<table class="calPrice_table">
						<tr>
							<td class="bold_text2"><span class="allItemPrice"></span> 원</td>
						</tr>
						<tr>
							<td class="light_text">(총 금액 : 예약금 + 잔금)</td>
						</tr>
						<tr>
							<td class="bold_text2"><span id="bookPrice"></span> 원</td>
						</tr>
						<tr>
							<td class="light_text">(예약금 : 총 금액의 20%)</td>
						</tr>
						<tr>
							<td class="bold_text2">- <span id="usePoint">0</span> P</td>
						</tr>
						<tr>
							<td class="light_text">(포인트사용)</td>
						</tr>
					</table>
					<hr style="width:90%;">
					<h2 class="finalPrice_text">최종 예약금 : <span id="finalPrice"></span> 원</h2>
				</div>
			</div>
			<h1 class="box_title">결제 정보</h1>
			<div class="payInfo_box">
				결제 API (포트원)
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
				<input id="payButton" class="payButton" type="submit">
			</div>
		</div>
		</form>
	</article>
</section>

<%@include file="../chatbot.jsp" %>
</body>
</html>