<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBook</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/revboot.css" rel="stylesheet">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        var IMP = window.IMP; 
        IMP.init("imp63477006"); // 가맹점 식별코드
      
        var today = new Date();   
        var hours = today.getHours(); // 시
        var minutes = today.getMinutes();  // 분
        var seconds = today.getSeconds();  // 초
        var milliseconds = today.getMilliseconds();
        var makeMerchantUid = hours +  minutes + seconds + milliseconds;
        

        function requestPay() {
            IMP.request_pay({
                pg : 'kcp.A52CY', // PG사 코드표에서 선택
                pay_method : 'card', // 결제 방식
                merchant_uid: "IMP"+makeMerchantUid, // 결제 고유 번호
                name : '뭐시기냐 잔금 가격', // 제품명
                amount : 100, // 가격
                buyer_email : 'kjh153426@gmail.com',
                buyer_name : '김진혁',
                buyer_tel : '010-2747-6036',
                buyer_addr : '서울특별시 동대문구 전농동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                	alert('결제 성공');
                    console.log(rsp);
                } else {
                	alert('결제 실패');
                    console.log(rsp);
                }
            });
        }
    </script>
<style>
body{
	background:#fbf4ff;
}
div.allpage{
	background: #ffffff;
	padding: 20px 20px 20px 20px;
	border-radius: 25px 25px 25px 25px;
	width: 1280px;
	margin: 50px auto;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="allpage">
      <h1>${mname } 님의 예약 내역입니다.</h1>
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">예약 번호</th>
	      <th scope="col">업체명</th>
	      <th scope="col">업체종류</th>
	      <th scope="col">예약일/시간</th>
	      <th scope="col">all pay</th>
	      <th scope="col">예약 상태</th>
	      <th scope="col">결제/취소</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:if test="${empty arr }">
	  	<tr>
	  		<td colspan="6">
	  		에약 내역이 없습니다.
	  		</td>
	  	</tr>
	  	</c:if>
	    <c:forEach varStatus="status" var="dto" items="${arr }">
	    <tr>
	      <th scope="row">${status.count }</th>
	      <td>${dto.bk_idx }</td>
	      <td>${dto.cname }</td>
	      <td>${dto.ckind }</td>
	      <td>${dto.bk_date } ${dto.bk_time }</td>
	      <td>${dto.allpay }</td>
		  <td>
			  <c:if test="${dto.bk_state eq 0}">결제전</c:if>
			  <c:if test="${dto.bk_state eq 1}">예약대기</c:if>
			  <c:if test="${dto.bk_state eq 2}">예약확정</c:if>
			  <c:if test="${dto.bk_state eq 3}">결제완료</c:if>
			  <c:if test="${dto.bk_state eq 4}">예약취소</c:if>
	  		  <c:if test="${dto.bk_state eq 5}">이용완료</c:if>
		  </td>
		  <td>
		  <div class="btn-group" role="group" aria-label="Basic example">
	  	  	<form action="#" method="post">
		  	  <input type="hidden" name="bk_idx" value="${dto.bk_idx }">
			  <button type="button" onclick="requestPay()" class="btn btn-outline-primary" <c:if test="${not (dto.bk_state eq 2)}">disabled</c:if>>결제</button>
		  	</form>
	  	  	<form action="#" method="post">
		  	  <input type="hidden" name="bk_idx" value="${dto.bk_idx }">
			  <button type="submit" class="btn btn-outline-danger" <c:if test="${dto.bk_state eq 5 || dto.bk_state eq 4}">disabled</c:if>>취소</button>
		  	</form>
		  </div>
		  </td>
	    </tr>
	    </c:forEach>
	  </tbody>
	</table>
</div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>