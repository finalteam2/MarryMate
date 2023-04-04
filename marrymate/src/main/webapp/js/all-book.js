function orderList(num){
	var filterOrder='이름순';
	var filterCate=document.cateFm.filterCate.value;
	switch(num){
	case 1:filterOrder='이름순';
	break;
	case 2:filterOrder='조회순';
	break;
	case 3:filterOrder='낮은가격순';
	break;
	case 4:filterOrder='높은가격순';
	}
	var param = '';
	param+='filterOrder='+filterOrder;
	param+='&filterCate='+filterCate;
	sendRequest('selectOrder.do',param,'GET',showResult);
}
function cateList(num){
	document.getElementById('order_one').checked=true;
	var filterCate='스튜디오';
	switch(num){
	case 1:filterCate='스튜디오';
	break;
	case 2:filterCate='드레스';
	break;
	case 3:filterCate='헤어메이크업';
	break;
	case 4:filterCate='스냅DVD';
	break;
	case 5:filterCate='주례';
	break;
	case 6:filterCate='사회';
	break;
	case 7:filterCate='축가';
	}
	var param='filterCate='+filterCate;
	sendRequest('selectCate.do',param,'GET',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;			
			data=JSON.parse(data);			
			
			var comList=data.comList;		
			
			//총 업체수
			var comListLength=comList.length;
			
			//기존 리스트 삭제
			var containerNode=document.getElementById('list_container');
			var containerChildNodes=containerNode.childNodes;
			for(var i=containerChildNodes.length-1;i>=0;i--) {
			  var containerChildNode=containerChildNodes[i];
			  containerNode.removeChild(containerChildNode);
			}
			
			//새로운 리스트 생성
			for(var i=0;i<comList.length;i++){
				var com=comList[i];
				
				var tableNode=document.createElement('table');
				tableNode.setAttribute('class','list_table');
				
				var tr1Node=document.createElement('tr');
				var tr2Node=document.createElement('tr');
				var tr3Node=document.createElement('tr');
						
				var td1Node=document.createElement('td');
				td1Node.setAttribute('rowspan','3');
				td1Node.setAttribute('width','28%');
				td1Node.setAttribute('align','center');
				var imgNode=document.createElement('img');
				imgNode.setAttribute('class','company_img');
				imgNode.setAttribute('src','/marrymate/img/company/'+com.img);
				imgNode.setAttribute('alt','companyImg');
				td1Node.appendChild(imgNode);
				
				var td2Node=document.createElement('td');
				td2Node.setAttribute('class','bk_cname');
				td2Node.setAttribute('width','52%');
				var td2TextNode = document.createTextNode(com.cname);
				td2Node.appendChild(td2TextNode);
				
				var td3Node=document.createElement('td');
				td3Node.setAttribute('width','20%');
				td3Node.setAttribute('align','right');
				var td3TextNode = document.createTextNode('날짜선택');
				td3Node.appendChild(td3TextNode);
								
				var td4Node=document.createElement('td');
				td4Node.setAttribute('class','bk_sido');
				var td4TextNode = document.createTextNode(com.sido+' - '+com.sigungu);
				td4Node.appendChild(td4TextNode);
				td4Node.appendChild(document.createElement('br'));
				td4Node.appendChild(document.createElement('br'));
				td4Node.appendChild(document.createElement('br'));
							
				var td5Node=document.createElement('td');
				td5Node.setAttribute('align','right');
				var td5TextNode = document.createTextNode('시간선택');
				td5Node.appendChild(td5TextNode);
				td5Node.appendChild(document.createElement('br'));
				td5Node.appendChild(document.createElement('br'));
				td5Node.appendChild(document.createElement('br'));
							
				var td6Node=document.createElement('td');
				td6Node.setAttribute('class','bk_pay');
				var td6TextNode = document.createTextNode('가격 : '+com.pay+' 원');
				td6Node.appendChild(td6TextNode);
							
				var td7Node=document.createElement('td');
				td7Node.setAttribute('align','right');
				var inputNode=document.createElement('input');
				inputNode.setAttribute('class','add_button');
				inputNode.setAttribute('type','button');
				inputNode.setAttribute('value','담기');
				td7Node.appendChild(inputNode);
				
				tr1Node.appendChild(td1Node);
				tr1Node.appendChild(td2Node);
				tr1Node.appendChild(td3Node);
				tr2Node.appendChild(td4Node);
				tr2Node.appendChild(td5Node);
				tr3Node.appendChild(td6Node);
				tr3Node.appendChild(td7Node);
				tableNode.appendChild(tr1Node);
				tableNode.appendChild(tr2Node);
				tableNode.appendChild(tr3Node);
				containerNode.appendChild(tableNode);
			}
			
		}
	}
}