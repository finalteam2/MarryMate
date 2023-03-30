<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
    background-color: #ddd;
}

.wrap .ch1 .textbox::before {
    left: -15px;
    content: "◀";
    color: #ddd;
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
</style>
<script>
function focus(){
	document.getElementById("tx").focus();
}

function press(f){
    if(f.keyCode == 13){
        chat.submit();
        document.getElementById('tx').value='';
    }
}
</script>
</head>
<body onload="focus();">
<form name="chat2" action="">
    <div class="wrap">
    	<table width="320" height="540" align="center" id="tb">
    		<tr id="tr">
    			<td>
			        <div class="chat ch1" id="st">
			            <div class="icon"><img src="/marrymate/img/chatbot_profile.png" alt="chatbot" width="40" height="40" onclick="showMenu();"></div>
			            <div class="textbox">무엇을 도와드릴까요?</div>
			        </div>
			        <!-- 
			        <div class="chat ch2">
			            <div class="textbox">안녕하세요. 친절한효자손입니다. 그동안 잘 지내셨어요?</div>
			        </div>
			         -->
			     </td>
			</tr>
			<tr id="tr3">
				<td><input type="text" id="tx" name="chatWindow" placeholder="메세지 보내기" onkeypress="press(this.form);"></td>
			</tr>
        </table>
    </div>
</form>
</body>
</html>