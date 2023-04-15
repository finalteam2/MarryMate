<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
    background: #fbf4ff;
}

.label{
   font-size:18px;
}
#logout{
   width:110px;
   height:45px;
   font-size:16px;
   font-weight:bold;
   background-color:lightgray;
   border:0px;
   border-radius:5px;
}
#homepage{
   width:150px;
   height:45px;
   font-size:18px;
   font-weight:bold;
   color:white;
   background-color:gray;
   border:0px;
   border-radius:5px;
   position: fixed;
   bottom: 150px;
   right: 280px;
   margin: 0px auto;
}
#menu{
   text-align:center;
   position: fixed;
   top: 150px;
   left: 250px;
   margin: 0px auto;
}
.tb {
   margin-left: 500px;
}
#hr{
   margin-left: 450px;
}
.tb2 {
   text-align: center;
   margin-left: 520px;
}
#hr2 {
   margin-left: 515px;
}
.tb3 {
   text-align: center;
   margin-left: 560px;
}

#select {
   margin-left: 700px;
   width:100px;
   height:30px;
   font-size:15px;
}

#text{
   width:220px;
   height:25px;
   font-size:16px;
}

#search {
   width:60px;
   height:30px;
   font-size:15px;
   font-weight:bold;
   color:white;
   background-color:#0a95f1;
   border:0px;
   border-radius:5px;
}

#pg {
   position: fixed;
   bottom: 240px;
   left:55%;
   transform:translateX(-50%);
}

#butt {
   width:65px;
   height:25px;
   font-size:13px;
   font-weight:bold;
   color:white;
   background-color:#078b18;
   border:0px;
   border-radius:5px;
}

#butt1 {
   width:110px;
   height:40px;
   font-size:16px;
   font-weight:bold;
   color:white;
   background-color:#28A4F6;
   border:0px;
   border-radius:5px;
}

#butt2 {
   width:110px;
   height:40px;
   font-size:16px;
   font-weight:bold;
   color:white;
   background-color:#D53834;
   border:0px;
   border-radius:5px;
}

#but {
   width:110px;
   height:40px;
   font-size:16px;
   font-weight:bold;
   color:white;
   background-color:#b8b8b8;
   border:0px;
   border-radius:5px;
}
</style>
</head>
<body width="1200">
<c:if test="${empty sessionScope.name}">
<script>
   window.alert('로그인 후 이용가능합니다.');
   location.href='login.do';
</script>
</c:if>
<c:if test="${!empty sessionScope.name}">
<table width="1100" align="center">
   <tr>
      <td align="left">
         <a href="index.do"><img src="/admin_marrymate/img/logo.png" alt="logo" width="200" height="97"></a>
      </td>
      <td align="right">
         <table height="65">
            <tr>
               <th align="left"><label class="label">이름: ${sessionScope.name}님</label></th>
               <td rowspan="2" width="160" align="right">
                  <a href='logout.do'><input type="button" value="로그아웃" id="logout" onclick=""></a>
               </td>
            </tr>
            <tr>
               <th align="left"><label class="label">부서: ${sessionScope.dept}</label></th>
            </tr>
         </table>
      </td>
   </tr>
</table>
<hr width="1200">
<table height="455" width="160" border="1" cellspacing="0" id="menu">
   <tr>
      <th><a href="collectionList.do?kind=예식장">웨딩컬렉션 관리</a></th>
   </tr>
   <tr>
      <th><a href="bookList.do?kind=예식장">예약관리</a></th>
   </tr>
   <tr>
      <th><a href="bbsList.do?kind=공지사항">커뮤니티 관리</a></th>
   </tr>
   <tr>
      <th><a href="pointMinusList.do">포인트관리</a></th>
   </tr>
   <tr>
      <th><a href="cs_a_m.do">문의관리</a></th>
   </tr>
   <tr>
      <th><a href="memberList.do">회원관리</a></th>
   </tr>
   <tr>
      <th><a href="traffic.do">Analytics</a></th>
   </tr>
</table>
<br><br>
<table height="50" class="tb">
   <tr>
      <th width="90"><a href="bookList.do?kind=예식장">예식장</a></th>
		<th width="100"><a href="bookList.do?kind=스튜디오">스튜디오</a></th>
		<th width="90"><a href="bookList.do?kind=드레스">드레스</a></th>
		<th width="120"><a href="bookList.do?kind=헤어메이크업">헤어/메이크업</a></th>
		<th width="100"><a href="bookList.do?kind=스냅DVD">스냅DVD</a></th>
		<th width="70"><a href="bookList.do?kind=주례">주례</a></th>
		<th width="70"><a href="bookList.do?kind=사회">사회</a></th>
		<th width="70"><a href="bookList.do?kind=축가">축가</a></th>
		<th width="100"><a href="bookList_b.do">취소관리</a></th>
   </tr>
</table>
<hr width="850" class="tb">
<br><br>
<table cellspacing="0" border="1" width="700" class="tb3">
   <tr>
      <th>예약번호</th>
      <td>${dto.bk_idx}</td>
      <th>[회원번호] 회원명</th>
      <td>[${dto.midx}] ${dto.name}</td>
   </tr>
   <tr>
      <th>[업체번호] 업체명</th>
      <td>[${dto.cidx}] ${dto.cname}</td>
      <th>예약날짜/시간</th>
      <td>${dto.bk_date_time}</td>
   </tr>
</table>

<c:if test="${dto.kind=='예식장'}">
<br><br>
<table cellspacing="0" border="1" width="700" class="tb3">
   <tr style="height:30px;">
      <th>홀이름 (홀 사용료)</th>
      <td>${dto.hname} (${dto.pay})</td>
      <th>인원수</th>
      <td>${dto.guest_num}</td>
   </tr>
   <tr style="height:30px;">
      <th>식대</th>
      <td>${dto.fpay}</td>
      <th>총액</th>
      <td>${dto.total_money}</td>
   </tr>
</table>
</c:if>
<br><br>
<table cellspacing="0" border="1" width="700" class="tb3">
   <tr style="height:30px;">
      <th>금액</th>
      <td>${dto.total_money}</td>
      <th>상태</th>
      <td>
        <c:if test="${dto.bk_state==0}">결제전</c:if>
		<c:if test="${dto.bk_state==1}"><label style="color:#feb916;">예약대기</label></c:if>
		<c:if test="${dto.bk_state==2}"><label style="color:#feb916;">잔금대기</label></c:if>
		<c:if test="${dto.bk_state==3}"><label style="color:#28A4F6;">잔금 결제완료</label></c:if>
		<c:if test="${dto.bk_state==4}"><label style="color:#e34331;">예약취소</label></c:if>
		<c:if test="${dto.bk_state==5}"><label style="color:#feb916;">취소대기</label></c:if>
		<c:if test="${dto.bk_state==7}">이용완료</c:if>
      </td>
   </tr>
   <c:if test="${dto.bk_state==0}">
   <tr style="height:30px;">
      <td colspan="4" align="center">결제전입니다.</td>
   </tr>
   </c:if>
   <c:if test="${dto.bk_state==1}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금</th>
      <td>${dto.money2}</td>
      <th>결제예정일</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>
   <c:if test="${dto.bk_state==2}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금</th>
      <td>${dto.money2}</td>
      <th>결제예정일</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>
   <c:if test="${dto.bk_state==3}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금 (포인트 사용금액)</th>
      <td>${dto.money2}</td>
      <th>결제날짜/시간</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>s
   <c:if test="${dto.bk_state==4 && cb==1}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금</th>
      <td>${dto.money2}</td>
      <th>결제예정일</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>
   <c:if test="${dto.bk_state==4 && cb==2}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금 (포인트 사용금액)</th>
      <td>${dto.money2}</td>
      <th>결제날짜/시간</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>
   <c:if test="${dto.bk_state==5 && cb==1}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금</th>
      <td>${dto.money2}</td>
      <th>결제예정일</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>
   <c:if test="${dto.bk_state==5 && cb==2}">
   <tr style="height:30px;">
      <th>예약금 (포인트 사용금액)</th>
      <td>${dto.money1}</td>
      <th>결제날짜/시간</th>
      <td>${dto.bookdate}</td>
   </tr>
   <tr style="height:30px;">
      <th>잔금 (포인트 사용금액)</th>
      <td>${dto.money2}</td>
      <th>결제날짜/시간</th>
      <td>${pay_date}</td>
   </tr>
   </c:if>
</table>

<br><br><br>
<table cellspacing="0" width="700" class="tb3">
   <tr>
    <c:if test="${dto.bk_state!=5}">
      <td>
         <input type="button" value="돌아가기" id="but" onclick="history.back();"></a>
      </td>
    </c:if>
	<c:if test="${dto.bk_state==5}">
        <td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="cancle.do?bk_idx=${dto.bk_idx}"><input type="button" value="취소확정" id="butt2"></a>
			
		</td>
		<td width="120">
			<input type="button" value="돌아가기" id="but" onclick="history.back();">
		</td>
	</c:if>
   </tr>
</table>
<br><br><br>
<hr width="1200">
<br><br>
</c:if>
</body>
</html>