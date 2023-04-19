<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>잔 금 결 제</title>
<link rel="stylesheet" href="/marrymate/css/jan-payment.css">
<script type="text/javascript" src="js/jan-payment.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
var IMP = window.IMP;
IMP.init('imp36428388');

function requestPay() {   
	   //변수들 선언
	   var strMidx='${sessionScope.loginMidx}';
	   //midx:parseInt
	   var midx=parseInt(strMidx);
	   
	   var strUsePoint=document.getElementById('usePoint').firstChild.nodeValue;
	   //usePoint:parseInt
	   var usePoint=parseInt(strUsePoint);
	   
		var bk_cidx = document.getElementById('bk_cidx').value;
		var bk_idx = document.getElementById('bk_idx').value;
		var bk_date = document.getElementById('bk_date').firstChild.nodeValue;
		var bk_time = document.getElementById('bk_time').firstChild.nodeValue;
		var finalPrice = document.getElementById('finalPrice').firstChild.nodeValue;
		var bk_hidx = document.getElementById('bk_hidx').value;
		var bk_fidx = document.getElementById('bk_fidx').value;
		
		param='';
		param+='midx='+midx;
		param+='&cidx='+bk_cidx;
		param+='&bk_date='+bk_date;
		param+='&bk_time='+bk_time;
		param+='&usePoint='+usePoint;
		param+='&finalPrice='+finalPrice;
		param+='&hidx='+bk_hidx;
		param+='&fidx='+bk_fidx;
		param+='&bk_idx='+bk_idx;
		
		sendRequest('hallJanPayment.do',param,'POST',payResult);
		
}
		
function payResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
				//변수들 선언
			   var loginName='${sessionScope.loginName}';
			   var loginTel='${sessionScope.loginTel}';
			   var loginJuso='${sessionScope.loginJuso}';   
			   var strMidx='${sessionScope.loginMidx}';
			   //midx:parseInt
			   var midx=parseInt(strMidx);
			   

			   var bk_cname=document.getElementById('bk_cname').firstChild.nodeValue;
			   
			   var strFinalPrice=document.getElementById('finalPrice').firstChild.nodeValue;
			   //finalPrice:parseInt
			   var finalPrice=parseInt(strFinalPrice);
			   var strUsePoint=document.getElementById('usePoint').firstChild.nodeValue;
			   //usePoint:parseInt
			   var usePoint=parseInt(strUsePoint);
			
				var pay_idx=data.pay_idx;
				
					IMP.request_pay({
				        pg : 'kcp.T0000',
				        pay_method : 'card',
				        merchant_uid: 'merchant_uid'+new Date().getTime(),
				        name : bk_cname,
				        amount : finalPrice,
				        buyer_name : loginName,
				        buyer_tel : loginTel,
				        buyer_addr : loginJuso,
				        company : '㈜ 메리메이트'
				    }, function (rsp) {
				        if (rsp.success) {
				        	
				           jQuery.ajax({
				                url: "janPointUpdate.do", 
				                method: "POST",
				                data: {
				                	midx:midx,
				                	usePoint:usePoint,
				                	pay_idx:pay_idx
				                }
				              }).done(function (data) {
				                // 가맹점 서버 결제 API 성공시 로직
				                window.alert('ajax연동 성공!');
				              })
				              window.alert('결제에 성공하였습니다.\n\n예약시간을 확인하고 업체에 방문해주세요.');
				           		location.href='myBook.do';
				        } else {
				           window.alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
				        }
				    });
								
			}
		  }
}
</script>
</head>
<body>
<section>
	<article>
		<div class="bg_box">
         <video muted autoplay loop>
            <source src="/marrymate/video/bg_pay.mp4" type="video/mp4">
         </video>
         <div class="bg_text">
            <p class="title">잔 금 결 제</p>
            <p class="sub_title">남은 잔금을 결제하세요!</p>
         </div>
		</div>
	</article>
	<article>
		<div class="janPay_container">
			<h1 class="box_title">예약 정보</h1>
			<div class="janItem_box">
			
				<c:set var="comDto" value="${comDto }"></c:set>
				<c:set var="bookPayDto" value="${bookPayDto }"></c:set>
				<c:set var="hallDto" value="${hallDto }"></c:set>
				<c:set var="foodDto" value="${foodDto }"></c:set>
				
				<input type="hidden" name="bk_cidx" id="bk_cidx" value="${comDto.cidx }">
				<input type="hidden" name="bk_hidx" id="bk_hidx" value="${hallDto.hidx }">
				<input type="hidden" name="bk_fidx" id="bk_fidx" value="${foodDto.fidx }">
				<input type="hidden" name="bk_idx" id="bk_idx" value="${bk_idx }">
				
				<table class="janItem_table">
					<tr>
						<td rowspan="3">
							<img class="company_img" src="/marrymate/img/com_best/${comDto.img }" alt="companyImg">
						</td>
						<td align="right">
							<span class="small_text">이용날짜</span>&nbsp;&nbsp;&nbsp;<span id="bk_date" class="bold_text">${bk_date }</span>
						</td>
					</tr>
					<tr>
						<td align="right">
							<span class="small_text">이용시간</span>&nbsp;&nbsp;&nbsp;<span id="bk_time" class="bold_text">${bookPayDto.bk_time }</span>
						</td>
					</tr>
					<tr>
						<td>
						<br>
						</td>
					</tr>
					<tr>
						<td>
							<span id="bk_cname" class="bold_text">${comDto.cname }</span> (<span id="bk_kind">예식장</span>)
						</td>
						<td>
						<br>
						</td>
					</tr>
					<tr>
						<td>${hallDto.name } (대관료 : <span class="bold_text" style="font-size:18px;">${hallDto.pay }</span> 원 / 최소보증인원 : <span class="bold_text" style="font-size:18px;">${hallDto.guest_num }</span> 명)</td>
						<td align="right">
							<span class="small_text">가격</span>&nbsp;&nbsp;&nbsp;<span class="itemPrice">${allpay }</span> 원
						</td>
					</tr>
					<tr>
						<td>${foodDto.name } (식대 : <span class="bold_text" style="font-size:18px;">${foodDto.pay }</span> 원)</td>
						<td align="right">
							<span style="font-size:15px;">가격 =</span> <span class="bold_text" style="font-size:16px;"><mark>대관료</mark> + (<mark>최소보증인원</mark> * <mark>식대</mark>)</span>
						</td>
					</tr>
	             </table>
	             
	             
			</div>
			<h1 class="box_title">포인트 사용/할인</h1>
			<div class="janPay_box">
				<div class="usePoint_box">
	               <table class="usePoint_table">
	                  <tr>
	                     <td class="bold_text">총 금액</td>
	                     <td class="bold_text"><span class="allItemPrice">${allpay }</span> 원</td>
	                  </tr>
	                  <tr>
	                     <td>보유포인트</td>
	                     <td><span id="havePoint">${point }</span> P</td>
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
	               <h2 class="afterPoint_h2">사용 후 잔여포인트 : <span id="afterPoint">${point }</span> P</h2>
	            </div>
	            <div class="calPrice_box">
	               <table class="calPrice_table">
	                  <tr>
	                     <td class="bold_text2"><span class="bookPrice">${bookPrice }</span> 원</td>
	                  </tr>
	                  <tr>
	                     <td class="light_text">(결제한 예약금)</td>
	                  </tr>
	                  <tr>
	                     <td class="bold_text2"><span id="janPrice">${janPrice }</span> 원</td>
	                  </tr>
	                  <tr>
	                     <td class="light_text">(잔금 : 총 금액 - 예약금)</td>
	                  </tr>
	                  <tr>
	                     <td class="bold_text2">- <span id="usePoint">0</span> P</td>
	                  </tr>
	                  <tr>
	                     <td class="light_text">(포인트사용)</td>
	                  </tr>
	               </table>
	               <hr style="width:90%;">
	               <h2 class="finalPrice_text">최종 잔금 : <span id="finalPrice">${janPrice }</span> 원</h2>
	            </div>
			</div>
			<h1 class="box_title">결제수단</h1>
	         <div class="payInfo_box">
	            <h3><input type="radio" checked> 카드 <span class="light_text">(결제는 카드만 가능합니다.)</span></h3>
	         </div>
	         <div class="payButton_box">
	            <button onclick="requestPay()" id="payButton" class="payButton">${janPrice } 원 결제하기</button>
	         </div>
		</div>
	</article>
	<article>
		<div class="leftMenu_container">
			<div class="goMain_box">
				<a href="index.do"><img class="goMain_img" src="/marrymate/img/logo2.png" alt="Logo"></a>
			</div>
			<hr style="border:1px solid #dedede;">
			<div class="menuLogin_box">
				<c:if test="${!empty sessionScope.loginNick}">
					<span class="menuLogin_nick">${sessionScope.loginNick }</span>&nbsp;&nbsp;<span style="font-size:14.5px;">님</span>
				</c:if>
				<c:if test="${empty sessionScope.loginNick}">
					<button class="goLogin_button" onclick="goLogin()">로그인</button>
				</c:if>
			</div>
			<div class="leftMenu_box">
				<a href="allBook.do"><label class="leftMenu_title">통합예약</label></a>
			</div>
			<div class="leftMenu_box">
				<a href="searchHall.do"><label class="leftMenu_title">웨딩홀</label></a>
			</div>
			<div class="leftMenu_box">
				<a href="searchEtc.do"><label class="leftMenu_title">웨딩컬렉션</label></a>
			</div>
			<div class="leftMenu_box">
				<c:if test="${!empty sessionScope.loginNick}">
					<a href="calendarMain.do"><label class="leftMenu_title">웨딩캘린더</label></a>
				</c:if>
				<c:if test="${empty sessionScope.loginNick}">
					<a href="calendarInfo.do"><label class="leftMenu_title">웨딩캘린더</label></a>
				</c:if>
			</div>
			<div class="leftMenu_box">
				<a href="allCommunity.do"><label class="leftMenu_title">커뮤니티</label></a>
			</div>
			<div class="go_box">
				<img class="go_img" src="/marrymate/img/goHome.png" alt="Home" onclick="javascript:location.href='index.do';">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img class="go_img" src="/marrymate/img/goBack.png" alt="Back" onclick="javascript:history.back()">
			</div>
		</div>
	</article>
</section>

<%@include file="../chatbot.jsp" %>
</body>
</html>