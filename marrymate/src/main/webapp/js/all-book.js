var totalPrice=0;
var filterPriceMin=1;
var filterPriceMax=295;

$( function() {
	$( "#datepicker" ).datepicker({
		showMonthAfterYear: true,
		yearSuffix: ",",
		monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		dateFormat: "yy-mm-dd",
		dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
		dayNames: [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ],
		minDate: "+1",
		maxDate: "+365",
		nextText: ">",
		prevText: "<"
	});
} );
$( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 1,
      max: 295,
      values: [ 1, 295 ],
      slide: function( event, ui ) {
        $( "#amount" ).val(ui.values[ 0 ]+"만원 ~ "+ui.values[ 1 ]+"만원");
        filterPriceMin=ui.values[ 0 ];
        filterPriceMax=ui.values[ 1 ];
      }
    });
    $( "#amount" ).val($( "#slider-range" ).slider( "values", 0 ) +
      "만원 ~ " + $( "#slider-range" ).slider( "values", 1 )+"만원" );
} );


function searchList(){
	document.getElementById('order_one').checked=true;
	var filterText=document.searchFm.filterText.value;
	var strFilterDate=document.searchFm.filterDate.value;
	var filterSido=document.searchFm.filterSido.value;
	var filterCate=document.cateFm.filterCate.value;
	
	var param = '';
	param+='filterText='+filterText;
	param+='&strFilterDate='+strFilterDate;
	param+='&filterSido='+filterSido;
	param+='&filterPriceMin='+(filterPriceMin*10000);
	param+='&filterPriceMax='+(filterPriceMax*10000);
	param+='&filterCate='+filterCate;
	
	sendRequest('searchList.do',param,'GET',showListResult);
}


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
	sendRequest('selectOrder.do',param,'GET',showListResult);
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
	document.getElementById('cate_title').innerHTML=filterCate;
	var param='filterCate='+filterCate;
	sendRequest('selectCate.do',param,'GET',showListResult);
}


function showListResult(){
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
			if(comListLength==0){
				var h3Node=document.createElement('h3');
				h3Node.setAttribute('class','alt_text');
				var h3TextNode = document.createTextNode('예약가능한 업체가 없습니다.');
				h3Node.appendChild(h3TextNode);
				containerNode.appendChild(h3Node);
			}else{
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
					imgNode.setAttribute('src','/marrymate/img/com_best/'+com.img);
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
					var dateNode=document.createElement('input');
					dateNode.setAttribute('type','date');
					dateNode.setAttribute('id','bk_date'+com.cidx);
					td3Node.appendChild(dateNode);
									
					var td4Node=document.createElement('td');
					td4Node.setAttribute('class','bk_sido');
					var td4TextNode = document.createTextNode(com.sido+' - '+com.sigungu);
					td4Node.appendChild(td4TextNode);
					td4Node.appendChild(document.createElement('br'));
					td4Node.appendChild(document.createElement('br'));
					td4Node.appendChild(document.createElement('br'));
								
					var td5Node=document.createElement('td');
					td5Node.setAttribute('align','right');
					var selectNode=document.createElement('select');
					selectNode.setAttribute('id','bk_time'+com.cidx);
					var option1Node=document.createElement('option');
					option1Node.setAttribute('value','12:00');
					var option1TextNode = document.createTextNode('12:00');
					option1Node.appendChild(option1TextNode);
					var option2Node=document.createElement('option');
					option2Node.setAttribute('value','14:00');
					var option2TextNode = document.createTextNode('14:00');
					option2Node.appendChild(option2TextNode);
					selectNode.appendChild(option1Node);
					selectNode.appendChild(option2Node);
					td5Node.appendChild(selectNode);
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
					inputNode.setAttribute('onclick','addCart('+com.cidx+')');
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
}


function addCart(cidx){
	var param='cidx='+cidx;
	sendRequest('addCart.do',param,'GET',showCartResult);
}


function showCartResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			var addItem=data.dto;
			
			//이용날짜와 이용시간 가져오기
			var bk_date=document.getElementById('bk_date'+addItem.cidx).value;
			var bk_time=document.getElementById('bk_time'+addItem.cidx).value;

			//부모노드 가져오기
			var menu1Node=document.getElementById('cate_menu1');
			var menu2Node=document.getElementById('cate_menu2');
			var menu3Node=document.getElementById('cate_menu3');
			var menu4Node=document.getElementById('cate_menu4');
			var menu5Node=document.getElementById('cate_menu5');
			var menu6Node=document.getElementById('cate_menu6');
			var menu7Node=document.getElementById('cate_menu7');
			
			//table 노드 생성
			var tableNode=document.createElement('table');
			tableNode.setAttribute('id','cart_table'+addItem.cidx);
			tableNode.setAttribute('class','cart_table');
			
			//tr 노드 생성
			var tr1Node=document.createElement('tr');
			var tr2Node=document.createElement('tr');
			var tr3Node=document.createElement('tr');
			var tr4Node=document.createElement('tr');
			var tr5Node=document.createElement('tr');
			
			//td 노드 생성
			var td1Node=document.createElement('td');
			td1Node.setAttribute('rowspan','4');
			var imgNode=document.createElement('img');
			imgNode.setAttribute('class','cartCompany_img');
			imgNode.setAttribute('src','/marrymate/img/com_best/'+addItem.img);
			imgNode.setAttribute('alt','companyImg');
			td1Node.appendChild(imgNode);
			
			var td2Node=document.createElement('td');
			td2Node.setAttribute('colspan','2');
			td2Node.setAttribute('align','right');
			var td2TextNode = document.createTextNode(bk_date);
			td2Node.appendChild(td2TextNode);
			
			var td3Node=document.createElement('td');
			td3Node.setAttribute('colspan','2');
			td3Node.setAttribute('align','right');
			var td3TextNode = document.createTextNode(bk_time);
			td3Node.appendChild(td3TextNode);
			
			var td4Node=document.createElement('td');
			td4Node.setAttribute('colspan','2');
			td4Node.appendChild(document.createElement('br'));
			
			var td5Node=document.createElement('td');
			
			var td6Node=document.createElement('td');
			td6Node.setAttribute('id','payTd'+addItem.cidx);
			td6Node.setAttribute('align','right');
			td6Node.setAttribute('style','font-weight:bold;font-size:15px;color:#2e2e2e;');
			var td6TextNode = document.createTextNode(addItem.pay+'원');
			td6Node.appendChild(td6TextNode);
			
			var td7Node=document.createElement('td');
			td7Node.setAttribute('colspan','2');
			td7Node.setAttribute('width','60%');
			td7Node.setAttribute('style','font-weight:bold;font-size:15px;color:#2e2e2e;');
			var td7TextNode = document.createTextNode(addItem.cname);
			td7Node.appendChild(td7TextNode);
			
			var td8Node=document.createElement('td');
			td8Node.setAttribute('align','right');
			var img2Node=document.createElement('img');
			img2Node.setAttribute('class','cancel_img');
			img2Node.setAttribute('src','/marrymate/img/item_cancel.png');
			img2Node.setAttribute('alt','cancelImg');
			img2Node.setAttribute('style','vertical-align:middle;');
			img2Node.setAttribute('onclick','delCart('+addItem.cidx+')');
			td8Node.appendChild(img2Node);
			
			
			tr1Node.appendChild(td1Node);
			tr1Node.appendChild(td2Node);
			tr2Node.appendChild(td3Node);
			tr3Node.appendChild(td4Node);
			tr4Node.appendChild(td5Node);
			tr4Node.appendChild(td6Node);
			tr5Node.appendChild(td7Node);
			tr5Node.appendChild(td8Node);
			tableNode.appendChild(tr1Node);
			tableNode.appendChild(tr2Node);
			tableNode.appendChild(tr3Node);
			tableNode.appendChild(tr4Node);
			tableNode.appendChild(tr5Node);
			
			switch(addItem.kind){
			case '스튜디오':menu1Node.appendChild(tableNode);
			break;
			case '드레스':menu2Node.appendChild(tableNode);
			break;
			case '헤어메이크업':menu3Node.appendChild(tableNode);
			break;
			case '스냅DVD':menu4Node.appendChild(tableNode);
			break;
			case '주례':menu5Node.appendChild(tableNode);
			break;
			case '사회':menu6Node.appendChild(tableNode);
			break;
			case '축가':menu7Node.appendChild(tableNode);
			}
			
			//총금액 구하기
			totalPrice+=addItem.pay;
			
			document.getElementById('sumPay_text2').innerHTML=totalPrice+' 원';
			
		}
	}
}


function delCart(cidx){
	//선택한 상품가격 총금액에서 빼기
	var strDelItemPay=document.getElementById('payTd'+cidx).firstChild.nodeValue.slice(0,-1);
	var delItemPay=parseInt(strDelItemPay);
	
	totalPrice-=delItemPay;
	
	document.getElementById('sumPay_text2').innerHTML=totalPrice+' 원';

	//카트에서 선택한 상품만 삭제
	var delTableNode = document.getElementById('cart_table'+cidx);
	delTableNode.remove();
}


function allDelCart(){
	//부모노드 가져오기
	var menu1Node=document.getElementById('cate_menu1');
	var menu2Node=document.getElementById('cate_menu2');
	var menu3Node=document.getElementById('cate_menu3');
	var menu4Node=document.getElementById('cate_menu4');
	var menu5Node=document.getElementById('cate_menu5');
	var menu6Node=document.getElementById('cate_menu6');
	var menu7Node=document.getElementById('cate_menu7');
	
	//카트에 담은 모든 상품 삭제
	while(menu1Node.firstChild){
		menu1Node.firstChild.remove()
	}
	while(menu2Node.firstChild){
		menu2Node.firstChild.remove()
	}
	while(menu3Node.firstChild){
		menu3Node.firstChild.remove()
	}
	while(menu4Node.firstChild){
		menu4Node.firstChild.remove()
	}
	while(menu5Node.firstChild){
		menu5Node.firstChild.remove()
	}
	while(menu6Node.firstChild){
		menu6Node.firstChild.remove()
	}
	while(menu7Node.firstChild){
		menu7Node.firstChild.remove()
	}
	
	document.getElementById('sumPay_text2').innerHTML='0 원';
}