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
.bt {
	font-size: 14px;
	background-color:#DFE6F7;
	border:solid 1px;
	border-radius:10px;
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
</style>
</head>
<body>
<form name="chat" action="goChatting.do">
    <div class="wrap">
    	<table width="320" height="540" align="center" id="tb">
    		<tr id="tr">
    			<td>
			        <div class="chat ch1" id="st">
			            <div class="icon"><img src="/marrymate/img/chatbot_profile.png" alt="chatbot" width="40" height="40"></div>
			            <div class="textbox">무엇을 도와드릴까요?</div>
			        </div>
			     </td>
			</tr>
			<tr id="tr2">
				<td>
					<table cellpadding="5" width="320">
						<tr>
							<td align="right"><input type="button" value="질문1" class="bt"></td>
						</tr>
						<tr>
							<td align="right"><input type="button" value="질문2" class="bt"></td>
						</tr>
						<tr>
							<td align="right"><input type="button" value="질문3" class="bt"></td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="1:1 채팅하기" id="bt2"></td>
						</tr>
					</table>
        		</td>
        	</tr>
        </table>
    </div>
</form>
</body>
</html>