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
	padding: 0;
	margin: 0;
}

.up {
	position: fixed;
	bottom: 150px;
	right: 65px;
}

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
	
	position: fixed;
	bottom: 60px;
	right: 60px;
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

#alr{
	position: fixed;
	bottom: 113px;
	right: 65px;
}
.al{
	font-size: 15px;
	text-align: center;
	color: white;
	background-color: #D53834;
	width: 20px;
	height: 20px;
	border-radius:5px;
	display: inline-block;
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
	border-collapse: collapse;
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
</style>
<script>
var XHR3 = null;

//변수들 선언
var strMidx='${midx}';
var strCidx='${cidx}';
//midx:parseInt
var midx = 0;
var cidx = 0;

if(strMidx != ''){
	midx=parseInt(strMidx);
}
if(strCidx != ''){
	cidx=parseInt(strCidx);
}




function getXHR3(){
	if(window.ActiveXObject){
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else {
		return null;
	}
}

function sendRequest3(url, param, method, callback){
	XHR3 = getXHR3();
	
	var newMethod = method?method:'GET';
	if (newMethod != 'GET' && newMethod != 'POST'){
		newMethod = 'GET';
	}
	
	var newParam = (param == null || param == '')?null:param;
	
	var newUrl = url;
	
	if(newMethod == 'GET' && newParam != null){
		newUrl = newUrl + '?' + newParam;
	
	}
	
	XHR3.onreadystatechange=callback;
	XHR3.open(newMethod,newUrl,true);
	XHR3.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR3.send(newMethod=='POST'?newParam:null);

}

function chat_tx(){
	
	document.getElementById('tx').focus();

	document.getElementById('chat_p').scrollTo(0,document.getElementById('chat_p').scrollHeight);
}

function press(e){
    if(e.keyCode == 13 && document.getElementById('tx').value!=''){
    	
    	if(midx != 0){
	    	var param='';
	    	param+='midx='+midx;
			param+='&content='+document.getElementById('tx').value;
			sendRequest3('content_m.do',param,'GET',ctResult);
	    	
	        document.getElementById('tx').value='';
    	}else{
    		
    		var param='';
	    	param+='cidx='+cidx;
			param+='&content='+document.getElementById('tx').value;
			sendRequest3('content_c.do',param,'GET',ctResult);
	    	
	        document.getElementById('tx').value='';
    	}
    }
}
function ctResult(){
	if(XHR3.readyState==4){
		if(XHR3.status==200){
			
			var DivNode=document.getElementById('user_chat');
			var DivChildNodes=DivNode.childNodes;
			for(var i=DivChildNodes.length-1;i>=0;i--) {
				var DivChildNode=DivChildNodes[i];
				DivNode.removeChild(DivChildNode);
			}
			
			var data=XHR3.responseText;
			data=JSON.parse(data);
			
			var dtos=data.dtos;
			
			for(var i=0;i<dtos.length;i++){
				
				if(dtos[i].type==1){
					
					var newDivNode=document.createElement('div');
					newDivNode.setAttribute('class','chat ch1');
					var newDivNode_in=document.createElement('div');
					newDivNode_in.setAttribute('class','textbox');
					var newDivTextNode=document.createTextNode(dtos[i].content);
					
					newDivNode_in.appendChild(newDivTextNode);
					newDivNode.appendChild(newDivNode_in);
					
					var DivNode=document.getElementById('user_chat');
					DivNode.appendChild(newDivNode);
					
				}else{
					
					var newDivNode=document.createElement('div');
					newDivNode.setAttribute('class','chat ch2');
					var newDivNode_in=document.createElement('div');
					newDivNode_in.setAttribute('class','textbox');
					var newDivTextNode=document.createTextNode(dtos[i].content);
					
					newDivNode_in.appendChild(newDivTextNode);
					newDivNode.appendChild(newDivNode_in);
					
					var DivNode=document.getElementById('user_chat');
					DivNode.appendChild(newDivNode);
				}
			}
			document.getElementById('chat_p').scrollTo(0,document.getElementById('chat_p').scrollHeight);
		}
	}
}
</script>
</head>
<body onload="chat_tx();">
<div class="wrap">
	<table width="300" height="540" align="center" id="tb">
		<tr align="left" height="70">
			<c:if test="${!empty mdto}">
			<th width="70">&nbsp;&nbsp;<img src="/marrymate/img/member/${mdto.img}" width="50" height="50"></th>
			<td>${mdto.name}</td>
			</c:if>
			<c:if test="${!empty cdto}">
			<th width="70">&nbsp;&nbsp;<img src="/marrymate/img/com_best/${cdto.img}" width="50" height="50"></th>
			<td>${cdto.cname}</div>
			
			</c:if>
		</tr>
		<tr id="tr">
			<td colspan="2">
				<div id="chat_p" style="width:320px;height:420px;overflow:auto;">
					<div id="user_chat">
						<c:forEach var="dto" items="${dtos}">
							<c:if test="${dto.type==1}">
							<div class="chat ch1"><div class="textbox">${dto.content}</div></div>
							</c:if>
							<c:if test="${dto.type==2}">
							<div class="chat ch2"><div class="textbox">${dto.content}</div></div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</td>
		</tr>
		<tr id="tr3">
			<td colspan="2"><input type="text" id="tx" name="chatWindow" placeholder="메세지 보내기" onkeypress="press(event);"></td>
		</tr>
	</table>
</div>
</body>
</html>