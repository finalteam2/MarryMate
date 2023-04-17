var XHR2 =null;

function getXHR2(){
	if(window.ActiveXObject){
		return new ActiveXObject('Msxml2.XMLHTTP');
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else {
		return null;
	}
}

function sendRequest2(url, param, method, callback){
	XHR2 = getXHR2();
	
	var newMethod = method?method:'GET';
	if (newMethod != 'GET' && newMethod != 'POST'){
		newMethod = 'GET';
	}
	
	var newParam = (param == null || param == '')?null:param;
	
	var newUrl = url;
	
	if(newMethod == 'GET' && newParam != null){
		newUrl = newUrl + '?' + newParam;
	
	}
	
	XHR2.onreadystatechange=callback;
	XHR2.open(newMethod,newUrl,true);
	XHR2.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	XHR2.send(newMethod=='POST'?newParam:null);

}

function checkNoti(){
	var param = '';
	sendRequest2('checkNoti.do',param,'POST',notiResult);
}
function notiResult(){
	if(XHR2.readyState==4){
		if(XHR2.status==200){
			var data = XHR2.responseText;
			data = JSON.parse(data);
			var notiArr = data.notiArr;
			var notiCnt = data.notiCnt;
			
			var notiNode = document.getElementById('notigroup');
			
			//새 알람
			var htmlStr = ''
			htmlStr += '<p id="notiimg">';
			htmlStr += '<img class="notiimg" src="/marrymate/img/notification.png" style="width: 28px;">';
			htmlStr += '</p>';
			if (notiArr != null){
				htmlStr += '<ul class="notibar">';
				for(var i = 0; i < notiArr.length; i++){
					var noti = notiArr[i];
					//알람 하나씩 추가
						if(noti.checked == 1){
							htmlStr += '<li><a href="goNoti.do?nidx=' + noti.nidx + '&page=' + noti.page + '"><span style="color:gray;">' + noti.title + '</span></a></li>';
						}else if(noti.checked == 0){
							htmlStr += '<li><a href="goNoti.do?nidx=' + noti.nidx + '&page=' + noti.page + '"><span style="color:red;">' + noti.title + '</span></a></li>';
						}		
				}
				htmlStr += '</ul>';
			}
			notiNode.innerHTML = htmlStr;
		}
	}
}