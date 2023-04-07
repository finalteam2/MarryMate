<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1000;

	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.chatshow {
	opacity: 1;
	z-index: 1000;
}

.window {
	position: fixed;
	width: 100%;
	height: 100%;
}

.popup {
	position: fixed;
	bottom: 40px;
	right: 40px;
	background-color: #f2f2f2;
	box-shadow: 0px 0px 30px lightgray;
	width: 360px;
	height: 660px;
	border-radius:20px;
}

.wrap .chat {
    display: flex;
    padding: 5px;
    padding-left: 10px;
    padding-right: 15px;
}

.wrap .chat .icon {
    position: relative;
    width: 50px;
    height: 50px;
}

.wrap .chat .icon i {
    position: absolute;
    top: 10px;
    left: 50%;
    font-size: 2.5rem;
    color: #aaa;
    transform: translateX(-50%);
}

.wrap .chat .textbox {
    position: relative;
    display: inline-block;
    max-width: calc(100% - 70px);
    padding: 10px;
    margin-top: 7px;
    font-size: 14px;
    border-radius: 10px;
}

.wrap .chat .textbox::before {
    position: absolute;
    display: block;
    top: 0;
    font-size: 1.5rem;
}

.wrap .ch1 .textbox {
    margin-left: 10px;
    background-color: white;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: white;
}

.wrap .ch2 {
    flex-direction: row-reverse;
}

.wrap .ch2 .textbox {
    margin-right: 5px;
    background-color: #F9EB54;
}

.wrap .ch2 .textbox::before {
    right: -15px;
    content: "▶";
    color: #F9EB54;
}

#st {
	padding-top: 20px;
}
#tb {
	background-color: #DFE6F7;
}
#tr {
	vertical-align : top;
}
#tr2 {
	vertical-align : bottom;
	height: 30px;
}
.chatbt {
	font-size: 14px;
	background-color:#DFE6F7;
	border:solid 1px;
	border-radius:20px;
	height:25px;
}
#bt2 {
	width:220px;
	height:45px;
	font-size:18px;
	font-weight:bold;
	color:white;
	background-color:#2F92FE;
	border:0px;
	border-radius:10px;
}

#tr3 {
	width:320px;
	height:38px;
	background-color:white;
	text-align:center;
}
#tx {
	width:300px;
	height:35px;
	font-size:16px;
	border:0px;
}
#tx:focus {
	outline: none;
}

#chat_p::-webkit-scrollbar {
  display: none;
}
#chat_p {
  -ms-overflow-style: none;
  scrollbar-width: none;
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
#tab {
	margin-left: 760px;
}
#hr{
	margin-left: 450px;
}
#tb2 {
	text-align: center;
	margin-left: 520px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}
.td{
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
</head>
<body width="1200">
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
		<th><a href="collection_a.do">웨딩컬렉션 관리</a></th>
	</tr>
	<tr>
		<th><a href="book_a.do">예약관리</a></th>
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
<table width="1100" align="center">
	<tr>
		<td align="right"><a href="/marrymate/index.do"><input type="button" value="홈페이지" id="homepage"></a></td>
	</tr>
</table>
<br><br>
<table height="50" id="tab">
	<tr>
		<th width="150"><a href="cs_a_m.do">일반회원</a></th>
		<th width="150"><a href="cs_a_c.do">기업회원</a></th>
	</tr>
</table>
<hr width="950" id="hr">
<br><br>
<c:if test="${mc=='m'}">
<form name="m_a_cs_List">
<table width="800" id="tb2">
	<tbody>
	<c:forEach var="dto" items="${m_a_cs_List}">
	<input type="hidden" name="midx" value="${dto.midx}">
		<tr>
			<td width="60" class="td"><div id="chatshow" class="chatshow"><img src="/marrymate/img/member/${dto.img}" width="50" height="50"></div></td>
			<td width="150" class="td">${dto.name}</td>
			<td align="left" class="td">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.content}</td>
			<td width="150" class="td">${dto.time}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</c:if>
<c:if test="${mc=='c'}">
<form name="c_a_cs_List">
<table width="800" id="tb2">
	<tbody>
	<c:forEach var="dto" items="${c_a_cs_List}">
	<input type="hidden" name="cidx" value="${dto.cidx}">
		<tr>
			<td width="60" class="td"><img src="/marrymate/img/com_best/${dto.img}" width="50" height="50"></td>
			<td width="150" class="td">${dto.cname}</td>
			<td align="left" class="td">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.content}</td>
			<td width="150" class="td">${dto.time}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</c:if>
<br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>

<div class="background">
	<div class="window">
    	<div class="popup">
			<div id="close">
				<table align="right">
					<tr height="65">
						<th width="260" align="left">상담챗</th>
						<td width="50">
							<img src="/admin_marrymate/img/x_button.png" alt="x_button" width="30" height="30">
						</td>
					</tr>
				</table>
			</div>
			<div class="wrap">
			    <table width="300" height="540" align="center" id="tb">
			    	<tr id="tr">
			    		<td>
			    		<div id="chat_p" style="width:320px;height:360px;overflow:auto;">
							<div class="chat ch1" id="st">
						    	<div class="icon"><img src="/marrymate/img/chatbot_profile.png" alt="chatbot" width="40" height="40"></div>
						    	<div class="textbox">무엇을 도와드릴까요?</div>
							</div>
							<div id="user_chat"></div>
						</div>
						</td>
					</tr>
					<tr id="tr3">
						<td><input type="text" id="tx" name="chatWindow" placeholder="메세지 보내기" onkeypress="press(this.form);"></td>
					</tr>
			    </table>
			</div>
        </div>
	</div>
</div>

<script>
function chatshow() {
    document.querySelector(".background").className = "background chatshow";
}
function close() {
	document.querySelector(".background").className = "background";
}

document.querySelector("#chatshow").addEventListener("click", chatshow);
document.querySelector("#close").addEventListener("click", close);
</script>
<hr width="1200">
</body>
</html>