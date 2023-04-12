var sort = 1;

function goSort(num){
	sort = num;
	var sort1Node = document.getElementById('sort1');
	var sort2Node = document.getElementById('sort2');
	var sort3Node = document.getElementById('sort3');
	var sort4Node = document.getElementById('sort4');
	sort1Node.setAttribute('class','nav-link');
	sort2Node.setAttribute('class','nav-link');
	sort3Node.setAttribute('class','nav-link');
	sort4Node.setAttribute('class','nav-link');
	if(sort == 1){
		sort1Node.setAttribute('class','nav-link active');
	}else if(sort == 2){
		sort2Node.setAttribute('class','nav-link active');
	}else if(sort == 3){
		sort3Node.setAttribute('class','nav-link active');
	}else if(sort == 4){
		sort4Node.setAttribute('class','nav-link active');
	}
	searchHall('1');
}

function searchHall(page){
	var param = '';
	var name = document.getElementById('name').value;
	param += 'name=' + name;
	var sido = document.getElementById('jusoKindH').value;
	param += '&sido=' + sido;
	var sigungu = document.getElementById('jusoKindS').value;
	param += '&sigungu=' + sigungu;
	var view = document.getElementById('view').value;
	param += '&view=' + view;
	var payMin = document.getElementById('payMin').value;
	param += '&payMin=' + payMin;
	var payMax = document.getElementById('payMax').value;
	param += '&payMax=' + payMax;
	var guestMin = document.getElementById('guestMin').value;
	param += '&guestMin=' + guestMin;
	var guestMax = document.getElementById('guestMax').value;
	param += '&guestMax=' + guestMax;
	var kind = document.getElementById('kind').value;
	param += '&kind=' + kind;
	param += '&sort=' + sort;
	param += '&page=' + page;
	sendRequest('searchHall.do',param,'POST',searchResult);
}


function searchResult(){
	if(XHR.readyState==2){
		if(XHR.status==200){
			//컨테이너 비우기
			var containerNode = document.getElementById('container1');
			var childNodes = containerNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  containerNode.removeChild(childNode);
			}
			//아이템 만들기
			var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','spinner-border m-5');
				newItemNode.setAttribute('role','status');
			
				var newSpanNode = document.createElement('span');
				newSpanNode.setAttribute('class','visually-hidden');
				var newSpanTextNode = document.createTextNode('Loading...');
				newSpanNode.appendChild(newSpanTextNode);
			
			newItemNode.appendChild(newSpanNode);
			containerNode.appendChild(newItemNode);
		}
	}
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
			totalCntNode.innerHTML='<span>[' + cnt + '개의 예식장이 검색되었습니다]</span>';
			
			
			var paging = data.paging;
			var pagingNode = document.getElementById('paging');
			pagingNode.innerHTML=paging;
			
			//컨테이너 비우기
			var containerNode = document.getElementById('container1');
			var childNodes = containerNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  containerNode.removeChild(childNode);
			}
			
			for(var i = 0; i < companylist.length; i++){
				var company = companylist[i];
				//아이템 만들기
				var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','card');
				newItemNode.setAttribute('onclick','location.href=\'/marrymate/companyContent.do?cidx=' + company.cidx + '\'');
				
					var newImgNode = document.createElement('img');
					newImgNode.setAttribute('class','card-img-top');
					newImgNode.setAttribute('alt','default_img');
					//널일때 노말 이미지로 교체
					//if(company.img != null){
					newImgNode.setAttribute('src','/marrymate/img/com_best/' + company.img);
					//}else {	
					//newImgNode.setAttribute('src','/marrymate/img/nomal.png');
					//}
					newItemNode.appendChild(newImgNode);
					
					var newInfoNode = document.createElement('div');
					newInfoNode.setAttribute('class','card-body');
						
						var newNameNode = document.createElement('span');
						newNameNode.setAttribute('class','card-text');
						var newNameTextNode = document.createTextNode(company.cname + ' ');
						newNameNode.appendChild(newNameTextNode);
						if(company.topfix == 1){
						newNameNode.innerHTML += '<span class="badge rounded-pill text-bg-secondary">제휴</span>';
						}						
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
				containerNode.appendChild(newItemNode);
			}
			//window.alert(msg);
		}
	}
}

function jusoKindChange(e) {
		var seoul = [ "종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구",
				"강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구",
				"금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구" ];
		var busan = [ "중구", "서구", "동구", "영도구", "부산진구", "동래구", "남구", "북구",
				"강서구", "해운대구", "사하구", "금정구", "연제구", "수영구", "사상구", "기장군" ];
		var daegu = [ "중구", "동구", "서구", "남구", "북구", "수성구", "달서구", "달성군" ];
		var incheon = [ "중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구",
				"강화군", "옹진군" ];
		var gwangju = [ "동구", "서구", "남구", "북구", "광산구" ];
		var daejeon = [ "동구", "중구", "서구", "유성구", "대덕구" ];
		var ulsan = [ "중구", "남구", "동구", "북구", "울주군" ];
		var sejong = [ "없음" ];
		var gyeonggi = [ "수원시", "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구",
				"성남시", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시",
				"안양시 만안구", "안양시 동안구", "부천시", "광명시", "동두천시", "평택시", "안산시",
				"안산시 상록구", "안산시 단원구", "고양시", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구",
				"과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시",
				"용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시", "김포시",
				"화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군" ];
		var gangwon = [ "춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군",
				"횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군",
				"양양군" ];
		var chungbuk = [ "청주시", "청주시 상당구", "청주시 흥덕구", "청주시 서원구", "청주시 청원구",
				"충주시", "제천시", "보은군", "옥천군", "영동군", "증평군", "진천군", "괴산군", "음성군",
				"단양군" ];
		var chungnam = [ "천안시", "천안시 동남구", "천안시 서북구", "공주시", "보령시", "아산시",
				"서산시", "논산시", "계룡시", "당진시", "금산군", "부여군", "서천군", "청양군", "홍성군",
				"예산군", "태안군" ];
		var jeonbuk = [ "전주시", "전주시 완산구", "전주시 덕진구", "군산시", "익산시", "정읍시",
				"남원시", "김제시", "완주군", "진안군", "무주군", "장수군", "임실군", "순창군", "고창군",
				"부안군", ];
		var jeonnam = [ "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군",
				"고흥군", "보성군", "화순군", "장흥군", "강진군", "해남군", "영암군", "무안군", "함평군",
				"영광군", "장성군", "완도군", "진도군", "신안군" ];
		var gyeongbuk = [ "포항시", "포항시 남구", "포항시 북구", "경주시", "김천시", "안동시",
				"구미시", "영주시", "영천시", "상주시", "문경시", "경산시", "군위군", "의성군", "청송군",
				"영양군", "영덕군", "청도군", "고령군", "성주군", "칠곡군", "예천군", "봉화군", "울진군",
				"울릉군" ];
		var gyeongnam = [ "창원시", "창원시 의창구", "창원시 성산구", "창원시 마산합포구",
				"창원시 마산회원구", "창원시 진해구", "진주시", "통영시", "사천시", "김해시", "밀양시",
				"거제시", "양산시", "의령군", "함안군", "창녕군", "고성군", "남해군", "하동군", "산청군",
				"함양군", "거창군", "합천군" ];
		var jeju = [ "제주시", "서귀포시" ];

		var target = document.getElementById("jusoKindS");

		if (e.value == "서울")
			var d = seoul;
		else if (e.value == "부산")
			var d = busan;
		else if (e.value == "대구")
			var d = daegu;
		else if (e.value == "인천")
			var d = incheon;
		else if (e.value == "광주")
			var d = gwangju;
		else if (e.value == "대전")
			var d = daejeon;
		else if (e.value == "울산")
			var d = ulsan;
		else if (e.value == "세종")
			var d = sejong;
		else if (e.value == "경기")
			var d = gyeonggi;
		else if (e.value == "강원")
			var d = gangwon;
		else if (e.value == "충북")
			var d = chungbuk;
		else if (e.value == "충남")
			var d = chungnam;
		else if (e.value == "전북")
			var d = jeonbuk;
		else if (e.value == "전남")
			var d = jeonnam;
		else if (e.value == "경북")
			var d = gyeongbuk;
		else if (e.value == "경남")
			var d = gyeonnam;
		else if (e.value == "제주")
			var d = jeju;
		else if (e.value == "")
			var d = '';

		target.options.length = 1;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}