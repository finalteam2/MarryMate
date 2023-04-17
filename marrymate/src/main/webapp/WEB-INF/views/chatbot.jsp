<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/marrymate/css/chatbot.css">
<link rel="stylesheet" href="/marrymate/css/chat.css">
<script>
var XHR3 = null;

//변수들 선언
var strMidx='${sessionScope.loginMidx}';
var strCidx='${sessionScope.com_cidx}';
//midx:parseInt
var midx = 0;
var cidx = 0;

console.log('strMidx' + strMidx);
console.log('strCidx' + strCidx);

if(strMidx != ''){
	midx=parseInt(strMidx);
}
if(strCidx != ''){
	cidx=parseInt(strCidx);
}


console.log('midx' + midx);
console.log('cidx' + cidx);



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

function rn(){
	if(midx != 0){
		var param='midx='+midx;
		sendRequest3('readNum_m.do',param,'GET',rnResult);
	}else if(cidx != 0){
		var param='cidx='+cidx;
		sendRequest3('readNum_c.do',param,'GET',rnResult);
	}
}
function rnResult(){
	if(XHR3.readyState==4){
		if(XHR3.status==200){
			var data=XHR3.responseText;
			data=JSON.parse(data);
			
			var read=data.read;
			
			if(read!=0){
				
				var newDivNode=document.createElement('div');
				newDivNode.setAttribute('id','alr');
				var newLabelNode=document.createElement('label');
				newLabelNode.setAttribute('id','al');
				var newLabelTextNode=document.createTextNode(read);
				
				newLabelNode.appendChild(newLabelTextNode);
				newDivNode.appendChild(newLabelNode);
				
				var DivNode=document.getElementById('chatshow');
				DivNode.appendChild(newDivNode);
			}
		}
	}
}

function chatshow() {
    document.querySelector(".background").className = "background chatshow";
}

function qs(){
	document.getElementById('tx').focus();
	sendRequest3('questions.do',null,'GET',qsResult);
}
function qsResult(){
	if(XHR3.readyState==4){
		if(XHR3.status==200){
			var data=XHR3.responseText;
			data=JSON.parse(data);
			
			var dtos=data.dtos;
			
			var newTableNode=document.createElement('table');
			newTableNode.setAttribute('cellpadding','7');
			newTableNode.setAttribute('width','320');
			
			for(var i=0;i<dtos.length;i++){
				
				var newTrNode=document.createElement('tr');
				var newTdNode=document.createElement('td');
				newTdNode.setAttribute('align','right');
				var newInputNode=document.createElement('input');
				newInputNode.setAttribute('type','button');
				newInputNode.setAttribute('class','chatbt');
				newInputNode.setAttribute('value',dtos[i].question);
				newInputNode.setAttribute('onclick','an('+dtos[i].acsidx+');');
				
				newTdNode.appendChild(newInputNode);
				newTrNode.appendChild(newTdNode);
				newTableNode.appendChild(newTrNode);
			}
			var newTrNode=document.createElement('tr');
			var newTdNode=document.createElement('td');
			newTdNode.setAttribute('align','center');
			var newInputNode=document.createElement('input');
			newInputNode.setAttribute('type','button');
			newInputNode.setAttribute('value','1:1 채팅하기');
			newInputNode.setAttribute('onclick','chat_tx();');
			newInputNode.setAttribute('id','bt2');
			
			newTdNode.appendChild(newInputNode);
			newTrNode.appendChild(newTdNode);
			newTableNode.appendChild(newTrNode);
			
			var DivNode=document.getElementById('questions');
			DivNode.appendChild(newTableNode);
		}
	}
}

function an(acsidx){
	var param='acsidx='+acsidx;
	sendRequest3('answer.do',param,'GET',anResult);
}
function anResult(){
	if(XHR3.readyState==4){
		if(XHR3.status==200){
			var data=XHR3.responseText;
			data=JSON.parse(data);
			
			var dto=data.dto;
			
        	var newDivNode1=document.createElement('div');
			newDivNode1.setAttribute('class','chat ch2');
			var newDivNode1_in1=document.createElement('div');
			newDivNode1_in1.setAttribute('class','textbox');
			var newDivTextNode1=document.createTextNode(dto.question);
			
			var newDivNode2=document.createElement('div');
			newDivNode2.setAttribute('class','chat ch1');
			var newDivNode2_in1=document.createElement('div');
			newDivNode2_in1.setAttribute('class','icon');
			var newImgNode=document.createElement('img');
			newImgNode.setAttribute('src','/marrymate/img/chatbot_profile.png');
			newImgNode.setAttribute('alt','chatbot');
			newImgNode.setAttribute('width','40');
			newImgNode.setAttribute('height','40');
			var newDivNode2_in2=document.createElement('div');
			newDivNode2_in2.setAttribute('class','textbox');
			var newDivTextNode2=document.createTextNode(dto.answer);
			
			newDivNode1_in1.appendChild(newDivTextNode1);
			newDivNode1.appendChild(newDivNode1_in1);
			
			newDivNode2_in1.appendChild(newImgNode);
			newDivNode2_in2.appendChild(newDivTextNode2);
			newDivNode2.appendChild(newDivNode2_in1);
			newDivNode2.appendChild(newDivNode2_in2);
			
			var DivNode=document.getElementById('user_chat');
			DivNode.appendChild(newDivNode1);
			DivNode.appendChild(newDivNode2);
			
			document.getElementById('chat_p').scrollTo(0,document.getElementById('chat_p').scrollHeight);
		}
	}
}

function chat_tx(){
	if(midx == 0 && cidx == 0){
		window.alert('로그인 후 이용가능합니다.');
		location.href='index.do';
	}else{
		
		if(midx != 0){
			var DivNode=document.getElementById('user_chat');
			var DivChildNodes=DivNode.childNodes;
			for(var i=DivChildNodes.length-1;i>=0;i--) {
				var DivChildNode=DivChildNodes[i];
				DivNode.removeChild(DivChildNode);
			}
			
			var DivNode2=document.getElementById('chat_p');
			DivNode2.setAttribute('style','width:320px;height:490px;overflow:auto;');
			
			document.getElementById('tx').remove();
			document.getElementById('tr2').remove();
			
			var newTrNode=document.createElement('tr');
			newTrNode.setAttribute('id','tr3');
			var newTdNode=document.createElement('td');
			var newInputNode=document.createElement('input');
			newInputNode.setAttribute('type','text');
			newInputNode.setAttribute('id','tx');
			newInputNode.setAttribute('name','chatWindow');
			newInputNode.setAttribute('placeholder','메세지 보내기');
			newInputNode.setAttribute('onkeypress','press(event);');
			
			newTdNode.appendChild(newInputNode);
			newTrNode.appendChild(newTdNode);
			var TableNode=document.getElementById('tb');
			TableNode.appendChild(newTrNode);
			
			var TrNode=document.getElementById('tr');
			TrNode.setAttribute('height','500');
			
			document.getElementById('tx').focus();
			
			var param='midx=' + midx;
			sendRequest3('load_m.do',param,'GET',ctResult);
		}else{
			
			var DivNode=document.getElementById('user_chat');
			var DivChildNodes=DivNode.childNodes;
			for(var i=DivChildNodes.length-1;i>=0;i--) {
				var DivChildNode=DivChildNodes[i];
				DivNode.removeChild(DivChildNode);
			}
			
			var DivNode2=document.getElementById('chat_p');
			DivNode2.setAttribute('style','width:320px;height:490px;overflow:auto;');
			
			document.getElementById('tx').remove();
			document.getElementById('tr2').remove();
			
			var newTrNode=document.createElement('tr');
			newTrNode.setAttribute('id','tr3');
			var newTdNode=document.createElement('td');
			var newInputNode=document.createElement('input');
			newInputNode.setAttribute('type','text');
			newInputNode.setAttribute('id','tx');
			newInputNode.setAttribute('name','chatWindow');
			newInputNode.setAttribute('placeholder','메세지 보내기');
			newInputNode.setAttribute('onkeypress','press(event);');
			
			newTdNode.appendChild(newInputNode);
			newTrNode.appendChild(newTdNode);
			var TableNode=document.getElementById('tb');
			TableNode.appendChild(newTrNode);
			
			var TrNode=document.getElementById('tr');
			TrNode.setAttribute('height','500');
			
			document.getElementById('tx').focus();
			
			var param='cidx='+ cidx;
			sendRequest3('load_c.do',param,'GET',ctResult);
		}
	}
}

function press(e){
    if(e.keyCode == 13){
    	
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
					newDivNode.setAttribute('class','chat ch2');
					var newDivNode_in=document.createElement('div');
					newDivNode_in.setAttribute('class','textbox');
					var newDivTextNode=document.createTextNode(dtos[i].content);
					
					newDivNode_in.appendChild(newDivTextNode);
					newDivNode.appendChild(newDivNode_in);
					
					var DivNode=document.getElementById('user_chat');
					DivNode.appendChild(newDivNode);
					
				}else{
					
					var newDivNode=document.createElement('div');
					newDivNode.setAttribute('class','chat ch1');
					var newDivNode_in1=document.createElement('div');
					newDivNode_in1.setAttribute('class','icon');
					var newImgNode=document.createElement('img');
					newImgNode.setAttribute('src','/marrymate/img/chatbot_profile.png');
					newImgNode.setAttribute('alt','chatbot');
					newImgNode.setAttribute('width','40');
					newImgNode.setAttribute('height','40');
					var newDivNode_in2=document.createElement('div');
					newDivNode_in2.setAttribute('class','textbox');
					var newDivTextNode=document.createTextNode(dtos[i].content);
					
					newDivNode_in1.appendChild(newImgNode);
					newDivNode_in2.appendChild(newDivTextNode);
					newDivNode.appendChild(newDivNode_in1);
					newDivNode.appendChild(newDivNode_in2);
					
					var DivNode=document.getElementById('user_chat');
					DivNode.appendChild(newDivNode);
				}
			}
			document.getElementById('chat_p').scrollTo(0,document.getElementById('chat_p').scrollHeight);
		}
	}
}

function close() {
	document.querySelector(".background").className = "background";
}

function rs(){
	
	var DivNode=document.getElementById('questions');
	var DivChildNodes=DivNode.childNodes;
	for(var i=DivChildNodes.length-1;i>=0;i--) {
		var DivChildNode=DivChildNodes[i];
		DivNode.removeChild(DivChildNode);
	}
}
</script>
</head>
<body>
<div class="up"><a href="#header"><img src="/marrymate/img/up.png" alt="up" width="60" height="60"></a></div>
<div id="chatshow" class="chatshow"><img src="/marrymate/img/chatbot.png" alt="chatbot" width="70" height="70" onclick="qs();"></div>

<div class="background">
	<div class="window">
    	<div class="popup">
			<div id="close">
				<table align="right">
					<tr height="65">
						<th width="260" align="left">상담챗</th>
						<td width="50">
							<img src="/admin_marrymate/img/x_button.png" alt="x_button" width="30" height="30" onclick="rs();">
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
					<tr id="tr2">
						<td>
							<div id="questions"></div>
				        </td>
				     </tr>
				     <input type="hidden" id="tx">
			    </table>
			</div>
        </div>
	</div>
</div>
<script>
document.querySelector("#chatshow").addEventListener("click", chatshow);
document.querySelector("#close").addEventListener("click", close);
rn();
</script>
</body>
</html>