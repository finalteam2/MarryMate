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
	
	var janPrice=parseInt(document.getElementById('janPrice').firstChild.nodeValue);
	document.getElementById('finalPrice').innerHTML=janPrice-havePoint;
	
	document.getElementById('payButton').innerHTML=janPrice-havePoint+' 원 결제하기';
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
	
	var janPrice=parseInt(document.getElementById('janPrice').firstChild.nodeValue);
	
	if(havePoint>=usePoint){
		afterPointNode.innerHTML=havePoint-usePoint;
		usePointNode.innerHTML=usePoint;
		document.getElementById('finalPrice').innerHTML=janPrice-usePoint;
		document.getElementById('payButton').innerHTML=janPrice-usePoint+' 원 결제하기';
	}else{
		document.getElementById('usePoint_input').value=havePoint;
		afterPointNode.innerHTML=0;
		usePointNode.innerHTML=havePoint;
		document.getElementById('finalPrice').innerHTML=janPrice-havePoint;
		document.getElementById('payButton').innerHTML=janPrice-havePoint+' 원 결제하기';
	}
}