<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link rel="stylesheet" type="text/css" href="css/memberJoin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/joinCheck.js"></script>
<script>
	function openAddressSearch() {
	  new daum.Postcode({
	    oncomplete: function(data) {
	      document.getElementById('juso').value = data.address;
	      document.getElementById('sjuso').focus();
	    }
	  }).open();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<section>
		<article>
			<h2>일반 회원가입</h2>
			<form name="memberJoin" action="memberJoin.do" method="post" onsubmit="return allCheckForm()">
			<div class="box">
				<div id="iBox">
					<div class="hClear">이름</div>
						<input type="text" name="name" placeholder="실명 입력"><br>
								<div class="hTagBox">생년월일</div>
									<input type="date" id="birthday" name="birthday" placeholder="xxxx-xx-xx ('-'없이 입력)"><br>
								<div class="hClear">성별</div>
									<input type="radio" name="gender" value="남">남
									<input type="radio" name="gender" value="여">여<br>
								<div class="hTagBox">닉네임</div>
									<input type="text" id="nick" name="nick" placeholder="중복확인 진행">&nbsp;&nbsp;
									<input type="button" value="중복확인" id="nickcb" class="cc"><br>
									<div id="nickCheck" class="sc"></div>
								<div class="hClear">아이디</div> 
									<input type="text" id="id" name="id" placeholder="중복확인 진행">&nbsp;&nbsp;
									<input type="button" value="중복확인" id="idcb" class="cc"><br>
									<div id="idCheck" class="sc"></div>
								<div class="hTagBox">비밀번호</div>
									<input type="password" id="pwd" name="pwd" placeholder="8자 이상(대소문자 및 특수문자 포함)" onchange="checkPwd()"><br>
										<div id="pwdMsg" class="sc"></div>
								<div class="hClear">비밀번호 확인</div>
									<input type="password" id="reCheckPwd" placeholder="설정한 비밀번호 재입력" onchange="checkPwd()">
										<div id="rePwdMsg" class="sc"></div>
					<div class="hTagBox">전화번호</div>
						<input type="text" name="tel" placeholder="xxx-xxxx-xxxx('-'없이 입력)"><br>
					<div class="hClear">주소</div>
						<input type="text" id="juso" name="juso" placeholder="주소검색을 통해 입력" readonly>&nbsp;&nbsp;
						<input type="button" value="주소 검색" class="cc" onclick="openAddressSearch()"><br>
					<div class="hTagBox">상세주소</div>
						<input type="text" id="sjuso" name="sjuso" placeholder="상세주소 입력"><br>
								<div class="hClear">추천인</div>
									<input type="text" id="gname" name="gname" placeholder="추천인 아이디 입력(선택)">&nbsp;&nbsp;
									<input type="button" value="추천인 확인" id="gnamecb" class="cc"><br>
									<div id="gnameCheck" class="sc"></div>
								<div class="hTagBox">예식날짜</div>
									<div id="datePut" style="display: inline;">
										<input type="date" id="marrydate" name="marrydate">
									</div>
									<input type="checkbox" id="toggleDate" name="toggleDate" onchange="togglePut()">미정<br>
					<div class="hClear">배우자</div>
						<input type="text" name="pname" placeholder="배우자 이름(선택)"><br>
				</div>
				<div class="tBox">
					<h3>이용약관(필수)</h3>
					<textarea class="ta" rows="15" cols="80" readonly>
						<jsp:include page="memberRule_1.jsp"></jsp:include>
					</textarea>
				</div>
				<div class="jcBox">
					<input type="checkbox" name="rule_1">&nbsp;약관에 동의합니다.
				</div>
				<div class="tBox">
					<h3>개인정보 취급방침(필수)</h3>
					<textarea class="ta" rows="15" cols="80" readonly>
						<jsp:include page="memberRule_2.jsp"></jsp:include>
					</textarea>
					</div>
				<div class="jcBox">
					<input type="checkbox" name="rule_2">&nbsp;개인정보 취급방침에 동의합니다.
				</div>
				<div class="tBox">
					<h3>이벤트 수신약관 동의(선택)</h3>
					<textarea class="ta" rows="15" cols="80" readonly>
						<jsp:include page="memberRule_3.jsp"></jsp:include>						
					</textarea>
				</div>
				<div class="jcBox">
					<input type="checkbox" name="e_check" value="1">&nbsp;이벤트 수신에 동의합니다.
				</div>
				<div id="jBox">
					<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
				</div>
			</div>
			</form>
		</article>
	</section>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>