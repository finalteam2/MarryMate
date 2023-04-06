<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/searchStyle.css" rel="stylesheet">
<script src="/marrymate/js/httpRequest.js"></script>
<script>
function searchLike(){
	var param = '';
	param += 'midx=' + ${sessionScope.loginMidx};
	sendRequest('searchLike.do',param,'POST',searchResult);
}
function searchResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			data = JSON.parse(data);
			
			var hlist = data.harr;
			var slist = data.sarr;
			var elist = data.earr;
			
			
			var hNode = document.getElementById('halldiv');
			var sNode = document.getElementById('sdmdiv');
			var eNode = document.getElementById('etcdiv');
			
			var childNodes = hNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  hNode.removeChild(childNode);
			}
			childNodes = sNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  sNode.removeChild(childNode);
			}
			childNodes = eNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  eNode.removeChild(childNode);
			}
			
			
			//홀 검색결과
			for(var i = 0; i < hlist.length; i++){
				var company = hlist[i];
				//아이템 만들기
				var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','card');
				newItemNode.setAttribute('onclick','location.href=\'/marrymate/companyContent.do?cidx=' + company.cidx + '\'');
				
					var newImgNode = document.createElement('img');
					newImgNode.setAttribute('class','card-img-top');
					newImgNode.setAttribute('alt','default_img');
					newImgNode.setAttribute('src','/marrymate/img/com_best/' + company.img);
					newItemNode.appendChild(newImgNode);
					
					var newInfoNode = document.createElement('div');
					newInfoNode.setAttribute('class','card-body');
						
						var newNameNode = document.createElement('span');
						newNameNode.setAttribute('class','card-text');
						var newNameTextNode = document.createTextNode(company.cname);
						newNameNode.appendChild(newNameTextNode);
						
						var newSidoNode = document.createElement('span');
						newSidoNode.setAttribute('class','card-text');
						var newSidoTextNode = document.createTextNode(company.sido + company.sigungu + ' / ');
						newSidoNode.appendChild(newSidoTextNode);
						
						var newKindNode = document.createElement('span');
						newKindNode.setAttribute('class','card-text');
						var newKindTextNode = document.createTextNode(company.kind);
						newKindNode.appendChild(newKindTextNode);
						
						var newPayNode = document.createElement('span');
						newPayNode.setAttribute('class','card-text');
						var newPayTextNode = document.createTextNode('식대비용 : ' + company.pay);
						newPayNode.appendChild(newPayTextNode);
						
						var newGuestNode = document.createElement('span');
						newGuestNode.setAttribute('class','card-text');
						var newGuestTextNode = document.createTextNode('하객보증인원 : ' + company.guest_num);
						newGuestNode.appendChild(newGuestTextNode);
					
					newInfoNode.appendChild(newNameNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newSidoNode);
					newInfoNode.appendChild(newKindNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newPayNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newGuestNode);
				
					newItemNode.appendChild(newInfoNode);
				hNode.appendChild(newItemNode);
			}
			
			//스드메
			for(var i = 0; i < slist.length; i++){
				var company = slist[i];
				//아이템 만들기
				var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','card');
				newItemNode.setAttribute('onclick','location.href=\'/marrymate/companyContent.do?cidx=' + company.cidx + '\'');
				
				
					var newImgNode = document.createElement('img');
					newImgNode.setAttribute('class','card-img-top');
					newImgNode.setAttribute('alt','default_img');
					newImgNode.setAttribute('src','/marrymate/img/com_best/' + company.img);
					newItemNode.appendChild(newImgNode);
					
					var newInfoNode = document.createElement('div');
					newInfoNode.setAttribute('class','card-body');
						
						var newNameNode = document.createElement('span');
						newNameNode.setAttribute('class','card-text');
						var newNameTextNode = document.createTextNode(company.cname);
						newNameNode.appendChild(newNameTextNode);
						
						var newSidoNode = document.createElement('span');
						newSidoNode.setAttribute('class','card-text');
						var newSidoTextNode = document.createTextNode(company.sido + ' / ');
						newSidoNode.appendChild(newSidoTextNode);
						
						var newKindNode = document.createElement('span');
						newKindNode.setAttribute('class','card-text');
						var newKindTextNode = document.createTextNode(company.kind);
						newKindNode.appendChild(newKindTextNode);
						
						var newPayNode = document.createElement('span');
						newPayNode.setAttribute('class','card-text');
						var newPayTextNode = document.createTextNode('비용 : ' + company.pay);
						newPayNode.appendChild(newPayTextNode);
						
					newInfoNode.appendChild(newNameNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newSidoNode);
					newInfoNode.appendChild(newKindNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newPayNode);
				
					newItemNode.appendChild(newInfoNode);
				sNode.appendChild(newItemNode);
			}
			
			//나머지
			for(var i = 0; i < elist.length; i++){
				var company = elist[i];
				//아이템 만들기
				var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','card');
				newItemNode.setAttribute('onclick','location.href=\'/marrymate/companyContent.do?cidx=' + company.cidx + '\'');
				
				
					var newImgNode = document.createElement('img');
					newImgNode.setAttribute('class','card-img-top');
					newImgNode.setAttribute('alt','default_img');
					newImgNode.setAttribute('src','/marrymate/img/com_best/' + company.img);
					newItemNode.appendChild(newImgNode);
					
					var newInfoNode = document.createElement('div');
					newInfoNode.setAttribute('class','card-body');
						
						var newNameNode = document.createElement('span');
						newNameNode.setAttribute('class','card-text');
						var newNameTextNode = document.createTextNode(company.cname);
						newNameNode.appendChild(newNameTextNode);
						
						var newSidoNode = document.createElement('span');
						newSidoNode.setAttribute('class','card-text');
						var newSidoTextNode = document.createTextNode(company.sido + ' / ');
						newSidoNode.appendChild(newSidoTextNode);
						
						var newKindNode = document.createElement('span');
						newKindNode.setAttribute('class','card-text');
						var newKindTextNode = document.createTextNode(company.kind);
						newKindNode.appendChild(newKindTextNode);
						
						var newPayNode = document.createElement('span');
						newPayNode.setAttribute('class','card-text');
						var newPayTextNode = document.createTextNode('비용 : ' + company.pay);
						newPayNode.appendChild(newPayTextNode);
						
					newInfoNode.appendChild(newNameNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newSidoNode);
					newInfoNode.appendChild(newKindNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newPayNode);
				
					newItemNode.appendChild(newInfoNode);
				eNode.appendChild(newItemNode);
			}
		}
	}
}
</script>
</head>
<body onload="searchLike();">
<section>
	<h2 align="left">즐 겨 찾 기</h2>
	<article>
	<hr>
	<h3 align="left">예식장</h3>
	<div id="halldiv" class="condiv"></div>
	<hr>
	</article>
	<article>
	<hr>
	<h3 align="left">스드메</h3>
	<div id="sdmdiv" class="condiv"></div>
	<hr>
	</article>
	<article>
	<hr>
	<h3 align="left">기타</h3>
	<div id="etcdiv" class="condiv"></div>
	<hr>
	</article>
</section>
</body>
</html>