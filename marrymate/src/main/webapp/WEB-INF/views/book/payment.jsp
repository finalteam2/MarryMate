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
   
   var bk_cidx = [];
	var bk_cidxElements = document.getElementsByName('bk_cidx');
	
	for (var i = 0; i < bk_cidxElements.length; i++) {
		bk_cidx.push(bk_cidxElements[i].value);
	}

	var bk_date = [];
	var bk_dateElements = document.getElementsByName('bk_date');
	
	for (var i = 0; i < bk_cidxElements.length; i++) {
		bk_date.push(bk_dateElements[i].value);
	}
	
	var bk_time = [];
	var bk_timeElements = document.getElementsByName('bk_time');
	
	for (var i = 0; i < bk_timeElements.length; i++) {
		bk_time.push(bk_timeElements[i].value);
	}
	
	var itemPrice = [];
	var itemPriceElements = document.getElementsByName('itemPrice');
	
	for (var i = 0; i < itemPriceElements.length; i++) {
		if(i==0){
			itemPrice.push(itemPriceElements[i].value*0.2-usePoint);
		}
		itemPrice.push(itemPriceElements[i].value*0.2);
	}
		$.ajax({
			  type: 'POST',
			  url: 'notHallPay.do',
			  traditional:true,
			  data: {
				  midx:midx,
				  cidx:bk_cidx,
				  bk_date:bk_date,
				  bk_time:bk_time,
				  usePoint:usePoint,
				  finalPrice:itemPrice
			  },
			  
			  dataType: 'json', 
			  success: function(data) {
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
			                url: "pointUpdate.do", 
			                method: "POST",
			                data: {
			                	midx:midx,
			                	usePoint:usePoint,
			                	pay_idx:pay_idx[0]
			                }
			              }).done(function (data) {
			                // 가맹점 서버 결제 API 성공시 로직
			                window.alert('ajax연동 성공!');
			              })
			              window.alert('결제에 성공하였습니다.\n\n업체가 예약을 승인하면 알림을 보내드립니다.');
		           			location.href='myBook.do';   
			        } else {
			           window.alert('결제에 실패하였습니다. 에러 내용: ' + rsp.error_msg);
			        }
			    });
			  },
			  error: function(xhr, status, error) {
				  window.alert(error); 
			  }
			});
	}
	

</script>
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
	            <input type="hidden" name="bk_cidx" id="bk_cidx" value="${dto.cidx }">
	            <input type="hidden" name="bk_date" id="bk_date" value="${dto.bk_date }">
	            <input type="hidden" name="bk_time" id="bk_time" value="${dto.bk_time }">
	            <input type="hidden" name="itemPrice" id="itemPrice" value="${dto.pay }">
	               <table class="itemInfo_table">
	                  <tr>
	                     <td rowspan="4">
	                        <img class="company_img" src="/marrymate/img/com_best/${dto.img }" alt="companyImg">
	                     </td>
	                     <td colspan="2" align="right">
	                        <span class="small_text">이용날짜</span>&nbsp;&nbsp;&nbsp;<span id="bk_date" class="bold_text">${dto.bk_date }</span>
	                     </td>
	                  </tr>
	                  <tr>
	                     <td colspan="2" align="right">
	                        <span class="small_text">이용시간</span>&nbsp;&nbsp;&nbsp;<span id="bk_time" class="bold_text">${dto.bk_time }</span>
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
	                     <td colspan="2"><span id="bk_cname" class="bold_text">${dto.cname }</span> (<span id="bk_kind">${dto.kind }</span>)</td>
	                     <td align="right">
	                     <span class="light_text">가격 = 예약금(20%) + 잔금(80%)</span>
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
         <h1 class="box_title">결제수단</h1>
         <div class="payInfo_box">
            <h3><input type="radio" checked> 카드 <span class="light_text">(결제는 카드만 가능합니다.)</span></h3>
         </div>
         <div class="payButton_box">
            <button onclick="requestPay()" id="payButton" class="payButton"></button>
         </div>
      </div>
   </article>
</section>

<%@include file="../chatbot.jsp" %>
</body>
</html>