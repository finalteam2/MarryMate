var sum=0;

function showLoad(){
	var itemsPrice=document.getElementsByClassName('itemPrice');
	
	for(var i=0;i<itemsPrice.length;i++){
		var itemPrice=parseInt(itemsPrice[i].firstChild.nodeValue);
		sum+=itemPrice;
	}
	
	var allItemsPrice=document.getElementsByClassName('allItemPrice');
	
	for(var i=0;i<allItemsPrice.length;i++){
		allItemsPrice[i].innerHTML=sum;
	}
	//예약금(총 금액의 20%)
	document.getElementById('bookPrice').innerHTML=sum*0.2;
	//최종 예약금
	document.getElementById('finalPrice').innerHTML=sum*0.2;
	
	document.getElementById('payButton').value=sum*0.2+' 원 결제하기';
}
function allUsePoint(){
	var havePointNode=document.getElementById('havePoint');
	var strHavePoint=havePointNode.firstChild.nodeValue;
	//포인트 int형으로 바꿔주기
	var havePoint=parseInt(strHavePoint);
	document.getElementById('usePoint_input').value=havePoint;
	
	var afterPointNode=document.getElementById('afterPoint');
	afterPointNode.innerHTML=0;
	
	var usePointNode=document.getElementById('usePoint');
	usePointNode.innerHTML=havePoint;
	
	var bookPrice=parseInt(document.getElementById('bookPrice').firstChild.nodeValue);
	document.getElementById('finalPrice').innerHTML=bookPrice-havePoint;
	
	document.getElementById('payButton').value=bookPrice-havePoint+' 원 결제하기';
}
function usePoint(){
	var havePointNode=document.getElementById('havePoint');
	var strHavePoint=havePointNode.firstChild.nodeValue;
	//포인트 int형으로 바꿔주기
	var havePoint=parseInt(strHavePoint);
	
	//사용자가 입력한 포인트 가져오기
	var usePoint=document.getElementById('usePoint_input').value;
	//사용 후 잔여포인트 노드 가져오기
	var afterPointNode=document.getElementById('afterPoint');
	
	var usePointNode=document.getElementById('usePoint');
	
	var bookPrice=parseInt(document.getElementById('bookPrice').firstChild.nodeValue);
	
	if(havePoint>=usePoint){
		afterPointNode.innerHTML=havePoint-usePoint;
		usePointNode.innerHTML=usePoint;
		document.getElementById('finalPrice').innerHTML=bookPrice-usePoint;
		document.getElementById('payButton').value=bookPrice-usePoint+' 원 결제하기';
	}else{
		document.getElementById('usePoint_input').value=havePoint;
		afterPointNode.innerHTML=0;
		usePointNode.innerHTML=havePoint;
		document.getElementById('finalPrice').innerHTML=bookPrice-havePoint;
		document.getElementById('payButton').value=bookPrice-havePoint+' 원 결제하기';
	}
}