function searchEtc(page){
	var param = '';
	var name = document.getElementById('name').value;
	param += 'name=' + name;
	var sido = document.getElementById('sido').value;
	param += '&sido=' + sido;
	var view = document.getElementById('view').value;
	param += '&view=' + view;
	var payMin = document.getElementById('payMin').value;
	param += '&payMin=' + payMin;
	var payMax = document.getElementById('payMax').value;
	param += '&payMax=' + payMax;
	var kind = document.getElementById('kind').value;
	param += '&kind=' + kind;
	var sorts = document.getElementsByName('sort');
	param += '&sort=';
	for(var i = 0; i < sorts.length; i++){
		if (sorts[i].checked){
			param += sorts[i].value;
		}
	}
	param += '&page=' + page;
	sendRequest('searchEtc.do',param,'POST',searchResult);
}
function searchResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			//window.alert(data);
			data = JSON.parse(data);
			var companylist = data.companylist;
			//window.alert(data);
			
			//검색된 수
			var cnt = data.cnt;
			var totalCntNode = document.getElementById('totalCnt');
			totalCntNode.innerHTML='<span>검색 결과 : 총' + cnt + ' 건</span>';
			
			
			var paging = data.paging;
			var pagingNode = document.getElementById('paging');
			pagingNode.innerHTML=paging;
			
			//컨테이너 비우기
			var containerNode = document.getElementById('container');
			var childNodes = containerNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  containerNode.removeChild(childNode);
			}
			
			for(var i = 0; i < companylist.length; i++){
				var company = companylist[i];
				//아이템 만들기
				var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','item');
				
					var newImgNode = document.createElement('img');
					newImgNode.setAttribute('class','img');
					newImgNode.setAttribute('alt','default_img');
					newImgNode.setAttribute('src','/marrymate/img/noimg.jpg');
					newItemNode.appendChild(newImgNode);
					
					var newInfoNode = document.createElement('div');
					newInfoNode.setAttribute('class','info');
						
						var newNameNode = document.createElement('span');
						newNameNode.setAttribute('class','name');
						var newNameTextNode = document.createTextNode(company.cname);
						newNameNode.appendChild(newNameTextNode);
						
						var newSidoNode = document.createElement('span');
						newSidoNode.setAttribute('class','sido');
						var newSidoTextNode = document.createTextNode(company.sido + ' / ');
						newSidoNode.appendChild(newSidoTextNode);
						
						var newKindNode = document.createElement('span');
						newKindNode.setAttribute('class','kind');
						var newKindTextNode = document.createTextNode(company.kind);
						newKindNode.appendChild(newKindTextNode);
						
						var newPayNode = document.createElement('span');
						newPayNode.setAttribute('class','pay');
						var newPayTextNode = document.createTextNode('비용 : ' + company.pay);
						newPayNode.appendChild(newPayTextNode);
						
					newInfoNode.appendChild(newNameNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newSidoNode);
					newInfoNode.appendChild(newKindNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newPayNode);
				
					newItemNode.appendChild(newInfoNode);
				containerNode.appendChild(newItemNode);
			}
			//window.alert(msg);
		}
	}
}