/**
 * 
 */

 var tagListResizeTime;
function tagListToggle() {
    //태그 토글
    $(".tagListWrap.toggle .btnOpenClose").click(function(e) {
        e.preventDefault();
        var target = $(this).closest(".tagListWrap");
        if (!target.hasClass("open")) {
            target.addClass("open");
            var tagHeight = target.find(".tagList .inner").height();
            target.find(".tagList").animate({
                height: tagHeight
            }, 300)
        } else {
            target.removeClass("open");
            target.find(".tagList").animate({
                height: 42
            }, 300);
        }
    })
    $(window).resize(function() {
        clearTimeout(tagListResizeTime);
        tagListResizeTime = setTimeout(function() {
            $(".tagListWrap.open").each(function() {
                var target = $(this);
                var tagHeight = target.find(".tagList .inner").height();
                target.find(".tagList").css({
                    height: tagHeight
                })
            })
        }, 100)
    })
}

(function(MP05, $, undefined) {
	
	'use strict';
	
	var item = {};

	function clear() {
	}

	function reset() {
		clear();
	}
	
	function open(options) {
		ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
			seq_no: options.seq_no,
			chk_id: options.chk_id
		})), "", "", function(result){
			if(result.status == 0) {
				item = result.item;
				//
				layerPop({type : "open", target : 'myPop181' ,close : function(){
				}});
				//
				redraw(result.item);
				//
			} else {
				_alert({
					message:'체크리스트 항목 상세 조회에 실패했습니다.',
					btnTxt : '닫기'
				});
			}
		});
	}
	
	function close() {
		layerPop({type : "close", target : "myPop181" ,close : function(){
		}});
	}
	
	function confirm(){
		//update
		ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
			seq_no: item.seq_no,
			chk_id: item.chk_id,
			use_yn: $("#myPop181UseToggle").hasClass('on') ? 'Y' : 'N',
			day_dt: $("#myPop181Dday").val(),
			done_yn: $("#myPop181Doneyn").is(":checked") ? 'Y' : 'N',
			etc_tx: $("#myPop181Etctx").val()
		})), "", "", function(result){
			if(result.status == 0) {
				close();
				//refresh
				//location.reload();
				/*
				if(result.item) {
					redrawCount(result.item);
				}
				ajaxHtml(
					'/Marrymate/calendar/calendarMain'
					, JSON.stringify({})
					, ""
					, ""
					, function(result){
						$('div.contentsArea > .contestList').html(result);
					}
					, function(){
						_alert({title:"알림", message: "시스템 에러 입니다. 동일한 증상이 계속 발생시 담당자에게 문의 부탁드립니다.", close:function(){}});
					}
				);
				*/
				//
				redrawScreen();
				//
			} else {
				_alert({
					message:'체크리스트 항목 수정에 실패했습니다.',
					btnTxt : '닫기'
				})
			}
		});
	}
	
	function redraw(item) {
		//항목명
		$("#myPop181Chknm").text("#" + item.chk_nm);
		//사용여부
		if(item.use_yn == 'Y') {
			$("#myPop181Useyn").text('사용');
			$("#myPop181Useyn").parent().addClass('on');
			//
			$("#myPop181Doneyn").prop("disabled", false);
		} else {
			$("#myPop181Useyn").text('미사용');
			$("#myPop181Useyn").parent().removeClass('on');
			//
			$("#myPop181Doneyn").prop("disabled", true);
		}
		//D-day
		$("#myPop181Dday").val(item.day_dt);
		//완료일자/완료여부
		if(item.done_yn == 'Y') {
			$("#myPop181Donedt").text(item.done_dt || '');
			$("#myPop181Doneyn").prop("checked", true);
		} else {
			$("#myPop181Donedt").text('');
			$("#myPop181Doneyn").prop("checked", false);
		}
		//메모
		$("#myPop181Etctx").val(item.etc_tx || '');
	}
	
	function redrawCount(item) {
		//한번더 체크
		$("#checkListChkCnt").text(item.chk_cnt + '' || '0');
		//지금해야해요
		$("#checkListDoingCnt").text(item.doing_cnt + '' || '0');
		//앞으로할것
		$("#checkListReservCnt").text(item.reserv_cnt + '' || '17');
	}
	
	function redrawScreen() {
		//top
		redrawTop(function() {
			//list
			redrawList();
		});
	}
	
	function redrawTop(callback) {
		ajaxHtml(
			'/marrymate/calendar/calendarMain'
			, JSON.stringify({
				type: 'top'
			})
			, ""
			, ""
			, function(result){
				$('div.contentsArea > .contentsTop').html(result);
				//
				callback && callback();
			}
			, function(){
				_alert({title:"알림", message: "시스템 에러 입니다. 동일한 증상이 계속 발생시 담당자에게 문의 부탁드립니다.", close:function(){}});
			}
		);
	}
	
	function redrawList(callback) {
		//list
		ajaxHtml(
			'/marrymate/calendar/calendarMain'
			, JSON.stringify({
				type: 'list'
			})
			, ""
			, ""
			, function(result){
				$('div.contentsArea > .contestList').html(result);
				//
				callback && callback();
			}
			, function(){
				_alert({title:"알림", message: "시스템 에러 입니다. 동일한 증상이 계속 발생시 담당자에게 문의 부탁드립니다.", close:function(){}});
			}
		);
	}
	
	// 익스포트
	MP05.open = open;
	MP05.close = close;
	MP05.clear = clear;
	MP05.reset = reset;
	MP05.confirm = confirm;
	MP05.redraw = redraw;
	MP05.redrawCount = redrawCount;
	MP05.redrawScreen = redrawScreen;
	MP05.redrawTop = redrawTop;
	MP05.redrawList = redrawList;
	
})(window.MP05 = window.MP05 || {}, jQuery);


/**
 * 
 */
 




	$(function(){
		//스크롤이동
		$(".moveScroll").click(function(e) {
			var scrollY = 0;
			if($(this).data('target') == 'chkid') {
				var chkid = $(this).data('chkid')+'';
				var findEl = $(".checkListArea .item").find("[data-chkid='"+chkid+"']");
				if(findEl.length > 0) {
					scrollY = $(findEl[0]).closest(".item").offset().top;
				} else {
					scrollY = $(".checkListArea").offset().top;
				}
			} else if($(this).data('target') == 'chkst') {
				var chkst = $(this).data('chkst')+'';
				var findEl = $(".checkListArea .item").find("[data-chkst='"+chkst+"']");
				if(findEl.length > 0) {
					scrollY = $(findEl[0]).closest(".item").offset().top;
				} else {
					scrollY = $(".checkListArea").offset().top;
				}
			} else {
				scrollY = $(".checkListArea").offset().top;
			}
			//
			$( 'html, body' ).animate( { scrollTop : scrollY-50 }, 400 );
		});
		//
		
	});


	function viewCheckList(){
		$(".checkListArea .item .checkToggle").click(function(e){
			e.preventDefault();
			var $this = $(this);
			var $target = $this.closest(".item");
			if(!$target.hasClass("on")){
				ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
					seq_no: $target.data('seqno'),
					chk_id: $target.find('.jsSWO01Ev').data('chkid'),
					use_yn: 'Y'
				})), "", "", function(result){
					if(result.status == 0) {
						//refresh
						//location.reload();
						/*
						if(result.item) {
							MP05.redrawCount(result.item);
						}
						//
						$target.addClass("on");
						$target.find(".checkToggle").addClass("on");
						$target.find(".checkToggle .txt").text("사용");
						$target.find(".checkBox input").prop("disabled",false);
						//
						var secdt = "150";
						var daydt = $target.find('.d-day').data('daydt');
						if(secdt == daydt) {
							$target.find('.stat').addClass('now');
							$target.find('.stat').removeClass('quickly');
							$target.find('.stat').text('지금해야해요');
						} else if(secdt < daydt) {
							$target.find('.stat').removeClass('now');
							$target.find('.stat').addClass('quickly');
							$target.find('.stat').text('급해요');
						} else {
							$target.find('.stat').removeClass('now');
							$target.find('.stat').removeClass('quickly');
							$target.find('.stat').text('');
						}
						*/
						MP05.redrawScreen();
						
					} else {
						_alert({
							message:'체크리스트 사용 설정에 실패했습니다.',
							btnTxt : '닫기'
						});
					}
				});
			}else{
				if($target.find(".checkBox input").is(":checked")){
					_alert({
						message:'완료된 항목은 미사용을 할 수 없습니다.',
						btnTxt : '닫기'
					});
				}else{
					//최소 5개는 사용으로 유지
					if($(".checkListArea .item .on").length <= 5) {
						_alert({
							message:'체크리스트 사용 선택은 최소 5개를 유지해주셔야 합니다.',
							btnTxt : '닫기'
						});
					} else {
						ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
							seq_no: $target.data('seqno'),
							chk_id: $target.find('.jsSWO01Ev').data('chkid'),
							use_yn: 'N'
						})), "", "", function(result){
							if(result.status == 0) {
								//refresh
								//location.reload();
								/*
								if(result.item) {
									MP05.redrawCount(result.item);
								}
								//
								$target.removeClass("on");
								$target.find(".checkToggle").removeClass("on");
								$target.find(".checkToggle .txt").text("미사용");
								$target.find(".checkBox input").prop("disabled",true);
								*/
								MP05.redrawScreen();
								
							} else {
								_alert({
									message:'체크리스트 사용 설정에 실패했습니다.',
									btnTxt : '닫기'
								});
							}
						});
					}
				}
			}
		});
		//완료
		$(".checkListArea .item .bottom .checkBox input[type=checkbox]").click(function(e) {
			var $this = $(this);
			var $target = $this.closest(".item");
			if($target.hasClass('on')) {
				if($this.is(":checked")) {
					ajaxCall('/marrymate/calendar/calendarMain', encodeURIComponent(JSON.stringify({
						seq_no: $target.data('seqno'),
						chk_id: $target.find('.jsSWO01Ev').data('chkid'),
						done_yn: 'Y'
					})), "", "", function(result){
						if(result.status == 0) {
							//refresh
							//location.reload();
							/*
							if(result.item) {
								MP05.redrawCount(result.item);
							}
							//완료일자 표시
							if(result.done_dt && result.done_dt.length > 0) {
								$target.find('.stat').removeClass('now');
								$target.find('.stat').removeClass('quickly');
								$target.find('.stat').text(result.done_dt);
							}
							*/
							MP05.redrawScreen();
							
						} else {
							_alert({
								message:'체크리스트 완료 설정에 실패했습니다.',
								btnTxt : '닫기'
							});
						}
					});
				} else {
					ajaxCall('/marrymate/calendar/calendarMain.do', encodeURIComponent(JSON.stringify({
						seq_no: $target.data('seqno'),
						chk_id: $target.find('.jsSWO01Ev').data('chkid'),
						done_yn: 'N'
					})), "", "", function(result){
						if(result.status == 0) {
							//refresh
							//location.reload();
							/*
							if(result.item) {
								MP05.redrawCount(result.item);
							}
							//
							var secdt = "150";
							var daydt = $target.find('.d-day').data('daydt');
							if(secdt == daydt) {
								$target.find('.stat').addClass('now');
								$target.find('.stat').removeClass('quickly');
								$target.find('.stat').text('지금해야해요');
							} else if(secdt < daydt) {
								$target.find('.stat').removeClass('now');
								$target.find('.stat').addClass('quickly');
								$target.find('.stat').text('급해요');
							} else {
								$target.find('.stat').removeClass('now');
								$target.find('.stat').removeClass('quickly');
								$target.find('.stat').text('');
							}
							*/
							MP05.redrawScreen();
							
						} else {
							_alert({
								message:'체크리스트 완료 설정에 실패했습니다.',
								btnTxt : '닫기'
							});
						}
					});
				}
			} else {
				_alert({
					message:'미사용 항목은 완료 할 수 없습니다.',
					btnTxt : '닫기'
				});
			}
		});


function checkList(list) {
	for(var i = 0; i < list.length; i++) {
		if(typeof list[i].checkValue === 'function') {
			if(!list[i].checkValue()) {
				if(typeof list[i].process === 'function' ){
					list[i].process(list[i]);
				}else{
					_alert({
						title: list[i].title
						, message : list[i].message
						, close : function(){
							if(null != list[i].selector) {
								switch(list[i].type) {
								case 'text': 
									$(list[i].selector).focus(); 
									break;
								}
							}
							if(list[i].close) list[i].close();
						}
						,focus : function(){
							if(list[i].focus) list[i].focus();
						}
					});
					if(list[i].clear) list[i].clear();
				}
				return false;
			}	
		} else {
			if(list[i].checkValue == null || list[i].checkValue == '') {
				if(typeof list[i].process === 'function' ){
					list[i].process(list[i]);
				}else{
					_alert({
						title: list[i].title
						, message: list[i].title + '은(는) 필수항목 입니다.'
						, close : function(){
							if(null != list[i].selector) {
								switch(list[i].type) {
								case 'text': 
									$(list[i].selector).focus(); 
									break;
								case 'file':
									$(list[i].selector).click(); 
									break;
								}
							}
							if(list[i].close) list[i].close();
						}
					});
					if(list[i].clear) list[i].clear();
				}
				return false;
			}	
		}
	}
	return true;
}


//일정레이어
function schLayer() {
    var el = $('.calendarWrap');

    if (el.length <= 0) {
        return;
    }

    el.find('.list > li').on('mouseenter', function() {
        if ($("body").hasClass("pc")) {
            $(this).find('.layer').show().stop().animate({
                'left': '23px',
                'opacity': '1'
            }, 300)
        }
    });
    el.find('.list > li').on('mouseleave', function() {
        if ($("body").hasClass("pc")) {
            $(this).find('.layer').stop().animate({
                'left': '50px',
                'opacity': '0'
            }, 300, function() {
                $(this).hide();
            });
        }
    });

}

//예산계산기
function inputToggle() {
    var el = $('.budgetWrap');

    if (el.length <= 0) {
        return;
    }

    //input 열림
    $(".modify a").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".titArea");
        target.addClass("open");
        target.find(".tit").hide();
        target.find(".save").show();
    });

    //input 닫힘
    $(".save a").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".titArea");
        target.removeClass("open");
        target.find(".tit").show();
        target.find(".save").hide();
    });
}

}





function ajaxCall(url, sendData, csrfHeader, csrfData, callback) {
	$.ajax({
		type: "POST"
		, url : url
		, data: sendData
		, dataType: "json"
		/*, contentType:"application/x-www-form-urlencoded;charset=UTF-8"*/
		, contentType:"application/json; charset=UTF-8"
		, async: true
		, beforeSend: function(xhr) {
			if(null != csrfHeader && 0 < csrfHeader.length) 
				xhr.setRequestHeader(csrfHeader, csrfData);
			//xhr.setRequestHeader(csrfHeader, csrfData);
			xhr.setRequestHeader("AjaxCall", "true");
		}
		, success : function(data, status, xhr) {
			/* 로그인 필요 */
			if(!!data && data.status == -1000) {
				top.location.href = config.login; // + ?rtn_url=location.href
				return;
			}
			callback(data)	
		}
		, error: function(xhr, textStatus, errorThrown) {
			console.log(xhr)
			console.log(textStatus)
			console.log(errorThrown)
			callback({status:-1, message:xhr.responseText});
		}
	});
}

function ajaxCallByOption(request) {
	
	// url, sendData, csrfHeader, csrfData, callback
	
	$.ajax({
		type: "POST"
		, url : request.url
		, data: request.sendData
		, dataType: request.dataType
		/*, contentType:"application/x-www-form-urlencoded;charset=UTF-8"*/
		, contentType:"application/json; charset=UTF-8"
		, async: true
		, beforeSend: function(xhr) {
			if(null != request.csrfHeader && 0 < request.csrfHeader.length) 
				xhr.setRequestHeader(request.csrfHeader, request.csrfData);
			//xhr.setRequestHeader(request.csrfHeader, request.csrfData);
			xhr.setRequestHeader("AjaxCall", "true");
		}
		, success : function(data, status, xhr) {
			if(!!data && data.status == -1000) {
				top.location.href = config.login; // + ?rtn_url=location.href
				return;
			}
			request.callback(data);
		}
		, error: function(xhr, textStatus, errorThrown) {
			request.callback({status:-1, message:xhr.responseText});
		}
	});
}

function ajaxHtml(url, sendData, csrfHeader, csrfData, callback, error) {
	$.ajax({
		type: "POST"
		, url : url
		, data: sendData
		, dataType: "html"
		/*, contentType:"application/x-www-form-urlencoded;charset=UTF-8"*/
		, contentType:"application/json; charset=UTF-8"
		, async: true
		, beforeSend: function(xhr) {
			if(null != csrfHeader && 0 < csrfHeader.length) 
				xhr.setRequestHeader(csrfHeader, csrfData);
			//xhr.setRequestHeader(csrfHeader, csrfData);
			xhr.setRequestHeader("AjaxCall", "true");
			xhr.setRequestHeader("AjaxHtml", "true");
		}
		, success : function(data, status, xhr) {
			callback(data)	
		}
		, error: function(xhr, textStatus, errorThrown) {
			error();
		}
	});
}

function ajaxSync(url, sendData, csrfHeader, csrfData, callback) {
	$.ajax({
		type: "POST"
		, url : url
		, data: sendData
		, dataType: "json"
		/*, contentType:"application/x-www-form-urlencoded;charset=UTF-8"*/
		, contentType:"application/json; charset=UTF-8"
		, async: false
		, beforeSend: function(xhr) {
			if(null != csrfHeader && 0 < csrfHeader.length) 
				xhr.setRequestHeader(csrfHeader, csrfData);
			//xhr.setRequestHeader(csrfHeader, csrfData);
			xhr.setRequestHeader("AjaxCall", "true");
		}
		, success : function(data, status, xhr) {
			if(!!data && data.status == -1000) {
				top.location.href = config.login; // + ?rtn_url=location.href
				return;
			}
			callback(data);	
		}
		, error: function(xhr, textStatus, errorThrown) {
			callback({status:-1, message:xhr.responseText});
		}
	});
}

function toJSONStr(form) {
	var obj = {};
	var elements = form.querySelectorAll( "input, select, textarea" );
	for( var i = 0; i < elements.length; ++i ) {
		var element = elements[i];
		var name = element.name;
		var value = element.value;
		if( name ) {
			if( "radio" == element.type ) {
				 if( true == element.checked) {
					 obj[ name ] = value;
				 }
			}else if("hash" == name && value.length > 0){ // 태그 그룹
				obj[ name ] = JSON.parse(value);
			}else if("visit" == name && value.length > 0){ // 박람회 강의그룹
				obj[ name ] = JSON.parse(value);
			}else if("raffles" == name && value.length > 0){ // 래플 이벤트 그룹
				obj[ name ] = JSON.parse(value);
			}else if("stamps" == name && value.length > 0){ // 스템프 이벤트 그룹
				obj[ name ] = JSON.parse(value);
			} else {
				if(typeof(obj[name]) == "undefined") obj[ name ] = value;
				else {
					if (obj[name] instanceof Array) {
						obj[name].push(value);
					} else {
						obj[name] = [obj[name], value];
					}
				}
			}
		}
	}
	/*return obj;*/
	return encodeURIComponent(JSON.stringify(obj));
}

function toObject(form) {
	var obj = {};
	var elements = form.querySelectorAll( "input, select, textarea" );
	for( var i = 0; i < elements.length; ++i ) {
		var element = elements[i];
		var name = element.name;
		var value = element.value;
		if( name ) {
			if( "radio" == element.type ) {
				 if( true == element.checked) {
					 obj[ name ] = value;
				 }
			}else if("hash" == name){
				obj[ name ] = JSON.parse(value);
			}else if("visit" == name){
				obj[ name ] = JSON.parse(value);
			} else {
				if(typeof(obj[name]) == "undefined") obj[ name ] = value;
				else {
					if (obj[name] instanceof Array) {
						obj[name].push(value);
					} else {
						obj[name] = [obj[name], value];
					}
				}
			}
		}
	}
	return obj;
}

Date.prototype.format = function(f) {
	if (!this.valueOf()) return " ";

	var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	var d = this;
	 
	return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		switch ($1) {
			case "yyyy": return d.getFullYear();
			case "yy": return (d.getFullYear() % 1000).zf(2);
			case "MM": return (d.getMonth() + 1).zf(2);
			case "dd": return d.getDate().zf(2);
			case "E": return weekName[d.getDay()];
			case "HH": return d.getHours().zf(2);
			case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
			case "mm": return d.getMinutes().zf(2);
			case "ss": return d.getSeconds().zf(2);
			case "a/p": return d.getHours() < 12 ? "오전" : "오후";
			default: return $1;
		}
	});
};

Date.prototype.addDays = function(days) {
	var date = new Date(this.valueOf());
	date.setDate(date.getDate() + days);
	return date;
}

String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
String.prototype.replaceAll = function(org, dest) {return this.split(org).join(dest);}
Number.prototype.zf = function(len){return this.toString().zf(len);};


function checkList(list) {
	for(var i = 0; i < list.length; i++) {
		if(typeof list[i].checkValue === 'function') {
			if(!list[i].checkValue()) {
				if(typeof list[i].process === 'function' ){
					list[i].process(list[i]);
				}else{
					_alert({
						title: list[i].title
						, message : list[i].message
						, close : function(){
							if(null != list[i].selector) {
								switch(list[i].type) {
								case 'text': 
									$(list[i].selector).focus(); 
									break;
								}
							}
							if(list[i].close) list[i].close();
						}
						,focus : function(){
							if(list[i].focus) list[i].focus();
						}
					});
					if(list[i].clear) list[i].clear();
				}
				return false;
			}	
		} else {
			if(list[i].checkValue == null || list[i].checkValue == '') {
				if(typeof list[i].process === 'function' ){
					list[i].process(list[i]);
				}else{
					_alert({
						title: list[i].title
						, message: list[i].title + '은(는) 필수항목 입니다.'
						, close : function(){
							if(null != list[i].selector) {
								switch(list[i].type) {
								case 'text': 
									$(list[i].selector).focus(); 
									break;
								case 'file':
									$(list[i].selector).click(); 
									break;
								}
							}
							if(list[i].close) list[i].close();
						}
					});
					if(list[i].clear) list[i].clear();
				}
				return false;
			}	
		}
	}
	return true;
}

function noImg(target) {
	var target = $(target).closest('div.imgArea')
	//target.empty();
	var img = $(target).find('img');
	img.remove();
	
	target.addClass("noImg");
}

function noImg2(target) {
	var target = $(target).closest('div.thumbInfo')
	//target.empty();
	var img = $(target).find('img');
	img.remove();
	
	target.addClass("noImg");
}

function noImgSmall(target) {
	var target = $(target).closest('div.imgArea')
	//target.empty();
	var img = $(target).find('img');
	img.remove();
	target.addClass("noImg small");
}
function noImgBig(target) {
	var target = $(target).closest('div.imgArea')
	//target.empty();
	var img = $(target).find('img');
	img.remove();
	target.addClass("noImg big");
}

var regExpRule = {
	"name" : /^[가-힣]{2,10}$/
	, "email" : /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
	, "phone" : /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/
	, "phone_noHypen" :/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/
	, "url" : /^((http(s?))\:\/\/)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/
	, "notchar" : /[^a-z|^A-Z|^가-힣|^0-9|^ㄱ-ㅎ|^ㅏ-ㅡ]/
	, "date" :  /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/
	, "number" : /^[0-9]+$/
	, "nickName": /^[가-힣]{3,10}$/
	, "amt" : /^[0-9,]*$/
};

function validate(word, type) {
	return (!word.match(new RegExp(regExpRule[type])))
		 ? false : true;
		
}


function getAllUrlParams(url) {

	  // get query string from url (optional) or window
	  var queryString = url ? url.split('?')[1] : window.location.search.slice(1);

	  // we'll store the parameters here
	  var obj = {};

	  // if query string exists
	  if (queryString) {

	    // stuff after # is not part of query string, so get rid of it
	    queryString = queryString.split('#')[0];

	    // split our query string into its component parts
	    var arr = queryString.split('&');

	    for (var i = 0; i < arr.length; i++) {
	      // separate the keys and the values
	      var a = arr[i].split('=');

	      // set parameter name and value (use 'true' if empty)
	      var paramName = a[0];
	      var paramValue = typeof (a[1]) === 'undefined' ? true : a[1];

	      // (optional) keep case consistent
	      paramName = paramName.toLowerCase();
	      if (typeof paramValue === 'string') paramValue = paramValue.toLowerCase();

	      // if the paramName ends with square brackets, e.g. colors[] or colors[2]
	      if (paramName.match(/\[(\d+)?\]$/)) {

	        // create key if it doesn't exist
	        var key = paramName.replace(/\[(\d+)?\]/, '');
	        if (!obj[key]) obj[key] = [];

	        // if it's an indexed array e.g. colors[2]
	        if (paramName.match(/\[\d+\]$/)) {
	          // get the index value and add the entry at the appropriate position
	          var index = /\[(\d+)\]/.exec(paramName)[1];
	          obj[key][index] = paramValue;
	        } else {
	          // otherwise add the value to the end of the array
	          obj[key].push(paramValue);
	        }
	      } else {
	        // we're dealing with a string
	        if (!obj[paramName]) {
	          // if it doesn't exist, create property
	          obj[paramName] = paramValue;
	        } else if (obj[paramName] && typeof obj[paramName] === 'string'){
	          // if property does exist and it's a string, convert it to an array
	          obj[paramName] = [obj[paramName]];
	          obj[paramName].push(paramValue);
	        } else {
	          // otherwise add the property
	          obj[paramName].push(paramValue);
	        }
	      }
	    }
	  }

	  return obj;
	}

// 모의해킹 XSS 취약점 (<,>, ', ") 치환 
function replaceXSS(val) {
	val = val.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
	val = val.replaceAll("'", "&quot;").replaceAll('"', '&#39;');
	
	return val;
}

// 월더하기
function AddMonths(date, months) {
    // date는 문자열로 받는다  ex)'20201015'
    var result = new Date(date.getFullYear(), date.getMonth()+months, date.getDate()-1)
    return result.format("yyyyMMdd");
}

// 날짜형식 변환 parseDate('20200808');
function parseDate(str) {
    var y = str.substr(0, 4);
    var m = str.substr(4, 2);
    var d = str.substr(6, 2);
    return new Date(y,m-1,d);
}

//날짜 일수 차이
function getDateDiff (d1, d2){
	const date1 = new Date(d1);
	const date2 = new Date(d2);
	const diffDate = date1.getTime() - date2.getTime();

	return Math.floor(Math.abs(diffDate / (1000 * 60 * 60 * 24))) + 1;
}

// 날짜비교
function dateCompare(today, lastDay) {
	var startDate = today; //2017-12-10
 	var startDateArr = startDate.split('-');
     
 	var endDate = lastDay; //2017-12-09
 	var endDateArr = endDate.split('-');
             
 	var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
 	var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
 
 	if(startDateCompare.getTime() > endDateCompare.getTime()) {
    	return "N";
	} else {
		return "Y";
	}
}

//날짜비교2
function dateCompare2(today, beginDay, lastDay) {
	var startDate = today; //2017-12-10
 	var startDateArr = startDate.split('-');
     
 	var stDate = beginDay; //2017-12-09
 	var stDateArr = stDate.split('-');

 	var endDate = lastDay; //2017-12-09
 	var endDateArr = endDate.split('-');
             
 	var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
 	var stDateCompare = new Date(stDateArr[0], parseInt(stDateArr[1])-1, stDateArr[2]);
 	var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
 	
 	if(stDateCompare.getTime() > startDateCompare.getTime()) { // 다운로드기간 이전
 		return "X";
 	} else {
     	if(startDateCompare.getTime() > endDateCompare.getTime()) {
        	return "N";
    	} else {
    		return "Y";
    	}
 	}
}

//숫자 3자리 마다 콤마 10000 -> 10,000
function numberFormatWon(data) {
	var str = data;
	if(typeof data == 'number') {
	   str = str+'';
	}
	var n = (str.replace(/[^\d]+/g, '')).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	return n;
}

//날짜 형변환 20100101 -> 2010.01.01
function YMDFormatter(num){
	if(!num) return "";
    var formatNum = '';

    // 공백제거
    num=num.replace(/\s/gi, "");
    try{
    	if(num.length == 8) {
    		formatNum = num.replace(/(\d{4})(\d{2})(\d{2})/, '$1.$2.$3');
        }
    } catch(e) {
    	formatNum = num;
    	console.log(e);
    }
    return formatNum;
}

// object 빈값 체크 (배열 [], 중괄호 {})  
function isEmpty(param) {
	return Object.keys(param).length === 0;
}


function getRelativePath(url) {
	
	var parser = document.createElement('a');
	parser.href = url;
	/*parser.protocol; // => "http:"
	parser.host;     // => "example.com:3000"
	parser.hostname; // => "example.com"
	parser.port;     // => "3000"
	*/
	; // => "/pathname/"
	/*parser.hash;     // => "#hash"
	parser.search;   // => "?search=test"
	parser.origin;   // => "http://example.com:3000"
*/	
	//console.log(parser.pathname);
	//parser.parentNode.removeChild(parser);
	return parser.pathname + parser.search;
}

// 사용자 접속포인트 체크
function checkUserConnect(){
    var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기
    var rtn = "others"; //아이폰, 안드로이드 외
    
    if ( varUA.indexOf('android') > -1) {
    	if( ( navigator.userAgent.indexOf('Android') > 0 && navigator.userAgent.indexOf('wv)') > 0 ) ) {
    		rtn = "android_app";
    	} else {
    		rtn = "android_web"
    	}
        //안드로이드
        return rtn;
    } else if ( varUA.indexOf("iphone") > -1||varUA.indexOf("ipad") > -1||varUA.indexOf("ipod") > -1 ) {
    	if( ( navigator.userAgent.indexOf('Mac OS') > 0 && navigator.userAgent.indexOf('Safari') <= 0 )){
            // 모바일 앱 웹뷰 
    		rtn = "ios_app";
   		 }else{
            // 모바일웹 
   			rtn = "ios_web";
   		 }
        //IOS
        return rtn;
    } else {
        //아이폰, 안드로이드 외
        return rtn;
    }
}




//커스텀 얼럿
function _alert(option) {

    layerPopCloseReturn = $(":focus");
    var cssFlag = option.cssFlag;
    var message = option.message;
    var close = option.close;
    var callback = option.callback;
    var length = $(".layerPop.alert").length + 1;
    var targetName = "alert" + ($(".layerPop.alert").length + 1);
    var btnTxt = "확인";

    if (option.btnTxt) {
        btnTxt = option.btnTxt;
    }
    var zindex = 0;

    // 20190325 cjh 특정팝업만 폰트 조절 요청건
    var cssClass = "";
    if (cssFlag == "other") {
        cssClass = "font-size:16px;"
    }

    var alertHtml = '';

    alertHtml += '<div class="layerPop alert" id="' + targetName + '">';
    alertHtml += '  <div class="popConts">';
    alertHtml += '      <div class="' + cssClass + '"><p class="alertTitle" "style="' + cssClass + '">' + message + '</p></div>';
    alertHtml += '      <div class="btnArea"><a href="#" class="btn btnBrown icoArr btnOk"><span>' + btnTxt + '</span></a></div>';
    alertHtml += '  </div>';
    alertHtml += ' 	<a href="#" class="close"><span>해당 팝업닫기</span></a>';
    alertHtml += '</div>';

    $("body").append(alertHtml);
    $(".layerPop").each(function() {
        if (zindex < Number($(this).css("z-index"))) {
            zindex = Number($(this).css("z-index"));
        }
    })

    var target = $("#" + targetName);
    target.css("z-index", zindex + 2).fadeIn(function() {
        target.find(".btnOk").focus();
    });
    $("body").append("<div class='dim' id='" + targetName + "_bg' style='z-index:" + (zindex + 1) + "'></div>")
    $("#" + targetName + "_bg").fadeIn();

    target.find(".close, .btnOk").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove();
            $("#" + targetName).remove();
        });
        if (typeof option.close === 'function') {
            option.close();
        }

        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

}

//커스텀 confirm
function _confirm(option) {
    layerPopCloseReturn = $(":focus");
    var message = option.message;
    var close = option.close;
    var callback = option.callback;
    var length = $(".layerPop.alert").length + 1;
    var targetName = "confirm" + ($(".layerPop.alert").length + 1);
    var zindex = 0;
    var confirmTxt = "확인";

    if (option.confirmTxt) {
        confirmTxt = option.confirmTxt;
    }

    var alertHtml = '';
    alertHtml += '<div class="layerPop alert confirm" id="' + targetName + '">';
    alertHtml += '  <div class="popConts">';
    // alertHtml += '      <div class="popTxtArea"><p class="alertTitle">'+message+'</p></div>';
    alertHtml += '      <p class="alertTitle">' + message + '</p>';
    alertHtml += '      <div class="btnArea"><a href="#" class="btn btnGray icoCancel btnCancel"><span>취소</span></a><a href="#" class="btn btnBrown icoArr btnOk"><span>' + confirmTxt + '</span></a></div>';
    alertHtml += '  </div>';
    alertHtml += ' 	<a href="#" class="close"><span>해당 팝업닫기</span></a>';
    alertHtml += '</div>';

    $("body").append(alertHtml);
    $(".layerPop").each(function() {
        if (zindex < Number($(this).css("z-index"))) {
            zindex = Number($(this).css("z-index"));
        }
    })

    var target = $("#" + targetName);
    target.css("z-index", zindex + 2).fadeIn().attr("tabindex", "0").focus();
    $("body").append("<div class='dim' id='" + targetName + "_bg' style='z-index:" + (zindex + 1) + "'></div>")
    $("#" + targetName + "_bg").fadeIn();
    target.find(".btnOk").focus();

    target.find(".close").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove();
            $("#" + targetName).remove();
        });
        if (typeof option.close === 'function') {
            option.close();
        }
        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

    target.find(".btnOk").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove();
            $("#" + targetName).remove();
        });
        if (typeof option.confirm === 'function') {
            option.confirm();
        }

        if (typeof option.close === 'function') {
            option.close(true);
        }

        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

    target.find(".btnCancel").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove()
            $("#" + targetName).remove();
        });
        if (typeof option.cancel === 'function') {
            option.cancel();
        }

        if (typeof option.close === 'function') {
            option.close();
        }

        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

}
var tagListResizeTime;
function tagListToggle() {
    //태그 토글
    $(".tagListWrap.toggle .btnOpenClose").click(function(e) {
        e.preventDefault();
        var target = $(this).closest(".tagListWrap");
        if (!target.hasClass("open")) {
            target.addClass("open");
            var tagHeight = target.find(".tagList .inner").height();
            target.find(".tagList").animate({
                height: tagHeight
            }, 300)
        } else {
            target.removeClass("open");
            target.find(".tagList").animate({
                height: 42
            }, 300);
        }
    })
    $(window).resize(function() {
        clearTimeout(tagListResizeTime);
        tagListResizeTime = setTimeout(function() {
            $(".tagListWrap.open").each(function() {
                var target = $(this);
                var tagHeight = target.find(".tagList .inner").height();
                target.find(".tagList").css({
                    height: tagHeight
                })
            })
        }, 100)
    })
}
function listTypeChg() {
    $(".btnListType a").click(function(e) {
        e.preventDefault();
        if ($(this).hasClass("btnList")) {
            $(".btnListType a").removeClass("on");
            $(this).addClass("on");
            $(this).closest(".communityList").attr("class", "communityList txtList");
        }
        if ($(this).hasClass("btnGallery")) {
            $(".btnListType a").removeClass("on");
            $(this).addClass("on");
            $(this).closest(".communityList").attr("class", "communityList");
        }
    })
}
var myWeddingMenuSlide;
function myWeddingMenu(idx) {
    myWeddingMenuSlide = new Swiper('.myWeddingMenuWrap .swiper-container',{
        slidesPerView: "auto",
        slidesPerGroup: 1,
        spaceBetween: 65,
        navigation: {
            nextEl: '.myWeddingMenuWrap .next',
            prevEl: '.myWeddingMenuWrap .prev',
        },
        breakpoints: {
            30000: {
                spaceBetween: 65,
            },
            1024: {
                spaceBetween: 40,
            }
        }
    });
    if (idx >= myWeddingMenuSlide.slides.length - 1) {
        idx = myWeddingMenuSlide.slides.length - 1
    }
    myWeddingMenuSlide.slideTo(idx);
    $(".myWeddingMenu .swiper-slide").eq(idx).addClass("on");
}


/*!
* jquery.counterup.js 1.0
*
* Copyright 2013, Benjamin Intal http://gambit.ph @bfintal
* Released under the GPL v2 License
*
* Date: Nov 26, 2013
*/
(function(e) {
    "use strict";
    e.fn.counterUp = function(t) {
        var n = e.extend({
            time: 400,
            delay: 10
        }, t);
        return this.each(function() {
            var t = e(this)
              , r = n
              , i = function() {
                var e = []
                  , n = r.time / r.delay
                  , i = t.text()
                  , s = /[0-9]+,[0-9]+/.test(i);
                i = i.replace(/,/g, "");
                var o = /^[0-9]+$/.test(i)
                  , u = /^[0-9]+\.[0-9]+$/.test(i)
                  , a = u ? (i.split(".")[1] || []).length : 0;
                for (var f = n; f >= 1; f--) {
                    var l = parseInt(i / n * f);
                    u && (l = parseFloat(i / n * f).toFixed(a));
                    if (s)
                        while (/(\d+)(\d{3})/.test(l.toString()))
                            l = l.toString().replace(/(\d+)(\d{3})/, "$1,$2");
                    e.unshift(l)
                }
                t.data("counterup-nums", e);
                t.text("0");
                var c = function() {
                    t.text(t.data("counterup-nums").shift());
                    if (t.data("counterup-nums").length)
                        setTimeout(t.data("counterup-func"), r.delay);
                    else {
                        delete t.data("counterup-nums");
                        t.data("counterup-nums", null);
                        t.data("counterup-func", null)
                    }
                };
                t.data("counterup-func", c);
                setTimeout(t.data("counterup-func"), r.delay)
            };
            t.waypoint(i, {
                offset: "100%",
                triggerOnce: !0
            })
        })
    }
}
)(jQuery);

$.browser = {};
(function() {
    jQuery.browser.msie = false;
    $.browser.version = 0;
    if (navigator.userAgent.match(/MSIE/) || navigator.userAgent.match(/Trident/)) {
        $.browser.msie = true;
    }
}
)();

var pcOnly = false;
var isDevice = "pc";
function gnb(dep1, dep2, type, myWedding) {
    var gnbWrap = $(".gnbWrap");
    var gnbSet = gnbWrap.find(".gnb");
    var dep1Li = gnbWrap.find(".dep1 > li");
    var dep1A = gnbWrap.find(".dep1 > li > a");
    var dep2Li = gnbWrap.find(".dep2 > li");
    var dep2A = gnbWrap.find(".dep2 > li > a");
    var subMenuArea = $(".subMenu");
    var btnMobileMenu = $(".mobileMenu");
    var btnMobileMenuClose = $(".btnMobileClose, .gnb_dim_bg");
    var gnbTime;
    var utilTime;
    //gnb관련 resize 이벤트
    $(window).resize(function() {
        var mobileWidth = 1025;
        var tableWidth = 768;
        if (!pcOnly) {
            if (window.innerWidth < mobileWidth && !$("body").hasClass("mobile")) {
                isDevice = "mobile";
                $("body").removeClass("pc");
                $("body").addClass("mobile");
                gnbSet.css("height", $(window).height() - 55);
                $(".gnbSet").hide();
                if (type == "myWedding") {
                    // if(type == "detail" || type == "myWedding"){ // 모바일 메뉴버튼 없는 헤더
                    var subTitle = $(".wrap h2").eq(0).text();

                    $("body").addClass("titleType");
                    $("h1").append("<div class='mobileTitle'>" + subTitle + "</div>")
                } else {
                    $("body").addClass("overviewType");
                }
            }
            if (window.innerWidth > mobileWidth && !$("body").hasClass("pc")) {
                isDevice = "pc";
                $("body").addClass("pc");
                $("body").removeClass("mobile");
                $("body").removeClass("mobileGnbOpen");
                $(".gnb_dim_bg").hide();
                $(".gnbSet").show();
                gnbSet.css("height", "auto");
                subMenuArea.removeAttr("style")

                if (type == "detail" || type == "myWedding") {
                    $("body").removeClass("titleType");
                    if ($("h1 .mobileTitle").length > 0) {
                        $("h1 .mobileTitle").remove();
                    }
                }
                //마이페이지 메뉴있을시 이벤트
                setTimeout(function() {
                    if ($(".myWeddingMenuWrap").length > 0) {
                        var onIdx = $(".myWeddingMenu .swiper-slide.on").index();
                        myWeddingMenuSlide.slideTo(onIdx);
                    }
                }, 100)

            }
            if ($(".myWeddingMenuWrap").length > 0 && window.innerWidth < tableWidth && !$("body").hasClass("mobile2") && !$("body").hasClass("mobile")) {
                isDevice = "mobile2";
                $("body").addClass("mobile2");
                if ($(".swiper-container").hasClass("swiper-container-horizontal")) {
                    myWeddingMenuSlide.destroy();
                }
            }

            if ($(".myWeddingMenuWrap").length > 0 && window.innerWidth > tableWidth && $("body").hasClass("mobile2")) {
                isDevice = "pc";
                $("body").removeClass("mobile2");
                var onIdx = $(".myWeddingMenu .swiper-slide.on").index();
                myWeddingMenu(onIdx);
                myWeddingMenuSlide.slideTo(onIdx);
            }
        } else {
            isDevice = "pc";
            $("body").addClass("pc");
        }
        gnbReset();
        $(window).scroll();
    }).resize();
    function gnbReset() {
        dep1Li.removeClass("on");
        dep2Li.removeClass("on hover");
        $("[data-menucode=" + dep1 + "]").addClass("on");
        $("[data-menucode=" + dep2 + "]").addClass("on");
        subMenuArea.removeClass("open");
        if ($("body").hasClass("pc")) {
            gnbWrap.removeClass("open");
            gnbWrap.find(".gnbBottom").removeAttr("style");
        }
        if ($("body").hasClass("mobile")) {
            $("[data-menucode=" + dep1 + "] .subMenu").show();
        }
        $("header .btnSearch").removeClass("on");
        gnbWrap.removeClass("open");
        gnbWrap.find(".gnbBottom").height(0);
        $(".gnbSearchArea").slideUp(100);
    }
    gnbReset();
    if (type == "myWedding") {
        $("body").addClass("myWeddingType");
        setTimeout(function() {
            if ($(".contents.myWedding").hasClass("overView")) {
                $(".myWeddingMenuWrap").addClass("onlyMoblieShow")
            }
        }, 100)

    }
    //gnb 웹이벤트 : s
    gnbWrap.find(".moreMenuBtn").on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            gnbWrap.find(".moreMenuBtn").addClass("on");
            gnbWrap.find(".moreBox").addClass("on");
            clearTimeout(utilTime);
        }
    })
    gnbWrap.find(".moreMenuBtn").on("mouseleave blur", function() {
        if ($("body").hasClass("pc")) {
            utilTime = setTimeout(function() {
                gnbWrap.find(".moreMenuBtn").removeClass("on");
                gnbWrap.find(".moreBox").removeClass("on");
            }, 300)
        }
    })
    gnbWrap.find(".moreBox").on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            gnbWrap.find(".moreMenuBtn").addClass("on");
            gnbWrap.find(".fixedMoreMenuBtn").addClass("on");
            gnbWrap.find(".moreBox").addClass("on");
            clearTimeout(utilTime);
        }
    })
    gnbWrap.find(".moreBox").on("mouseleave blur", function() {
        if ($("body").hasClass("pc")) {
            utilTime = setTimeout(function() {
                gnbWrap.find(".moreMenuBtn").removeClass("on");
                gnbWrap.find(".fixedMoreMenuBtn").removeClass("on");
                gnbWrap.find(".moreBox").removeClass("on");
            }, 300)
        }
    })

    gnbWrap.find(".fixedMoreMenuBtn").on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            gnbWrap.find(".fixedBox .moreBox").addClass("on");
            clearTimeout(utilTime);
        }
    })
    gnbWrap.find(".fixedMoreMenuBtn").on("mouseleave blur", function() {
        if ($("body").hasClass("pc")) {
            utilTime = setTimeout(function() {
                gnbWrap.find(".fixedBox .moreBox").removeClass("on");
            }, 300)
        }
    })

    dep1A.on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            dep1Li.removeClass("on");
            $(".gnbSearchArea").hide();
            $(this).parent().addClass("on");
            subMenuArea.removeClass("open");
            $(this).parent().find("> .subMenu").addClass("open");
            var subHeight = $(this).parent().find("> .subMenu").outerHeight();
            gnbWrap.addClass("open");
            gnbWrap.find(".gnbBottom").height(subHeight);
        }
    })

    gnbSet.on("mouseenter focusin", function() {
        if ($("body").hasClass("pc")) {
            clearTimeout(gnbTime);
        }
    })
    gnbSet.on("mouseleave focusout", function() {
        if ($("body").hasClass("pc")) {
            clearTimeout(gnbTime);
            gnbTime = setTimeout(function() {
                gnbReset()
            }, 300)
        }
    })
    //gnb 웹이벤트 : e

    //gnb 모바일 이벤트 : s
    dep1A.on("click", function(e) {
        if ($("body").hasClass("mobile")) {
            e.preventDefault();
            if (!$(this).parent().hasClass("on")) {
                dep1Li.removeClass("on");
                $(this).parent().addClass("on");
                subMenuArea.slideUp();
                $(this).parent().find("> .subMenu").slideDown();
            } else {// 2020.03.06 모바일 > 이벤트 상세에서 메뉴슬라이드 닫힘 현상
            //dep1Li.removeClass("on");
            //subMenuArea.slideUp();
            }
        }
    })

    btnMobileMenu.off('click').on("click", function(e) {
        e.preventDefault();

        var scrollTop = $(window).scrollTop();
        if (!$("body").hasClass("mobileGnbOpen")) {
            // mainTopBanner 있을시
            if ($(".mainTopBanner").length > 0) {
                $(".mainTopBanner .btnClose").click();
            }
            $(".gnb_dim_bg").fadeIn();
            $(".mobile .gnbSet").show();
            setTimeout(function() {
                $("body").addClass("mobileGnbOpen").css("top", -scrollTop);
            }, 100);
        } else {
            btnMobileMenuClose.click();
        }
    })

    btnMobileMenuClose.on("click", function(e) {
        e.preventDefault();
        var scrollTop = Number($("body").css("top").split("px")[0]) * -1;
        $("body").removeClass("mobileGnbOpen").removeAttr("style");
        $(window).scrollTop(scrollTop);
        $(".gnb_dim_bg").fadeOut();
        setTimeout(function() {
            $(".mobile .gnbSet").hide();
            gnbReset();
        }, 400)
    })
    $(".mobileBack").click(function() {
        // 뒤로갈 히스토리가 있을 경우
        if (document.referrer) {
            history.back(-1);
        } else {
            location.href = "/";
        }
    })
    $(window).scroll(function() {
        if ($(".topVisual").length > 0) {
            var contentTop = $(".topVisual").offset().top + $(".topVisual").height();
            if ($(this).scrollTop() > contentTop) {
                $(".gnbWrap").addClass("fixed");
            } else {
                $(".gnbWrap").removeClass("fixed");
            }
        }
        if ($(".prodDetailArea").length > 0) {
            var tabWrapTop = $(".prodDetailArea").offset().top;
            if ($(this).scrollTop() > tabWrapTop) {
                $("body").addClass("tabWrapFixed");
            } else {
                $("body").removeClass("tabWrapFixed");
            }
        }

        //mainTopBanner 있을시
        if ($("body").hasClass("mobile") && $(".mainTopBanner").length > 0) {
            if ($(this).scrollTop() > $(".mainTopBanner .inner").height()) {
                gnbWrap.addClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55);
            } else {
                gnbWrap.removeClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55 + $(".mainTopBanner .inner").height());
            }

        }

    }).scroll();

    setTimeout(function() {
        //mainTopBanner 있을시
        if ($("body").hasClass("mobile") && $(".mainTopBanner").length > 0) {
            if ($(this).scrollTop() > $(".mainTopBanner .inner").height()) {
                gnbWrap.addClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55);
            } else {
                gnbWrap.removeClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55 + $(".mainTopBanner .inner").height());
            }
        }
    }, 100)
    
    $(document).on("click", ".myWeddingType .btnMobileClose, .myWedding_dim_bg", function(e) {
        e.preventDefault();
        var scrollTop = Number($("body").css("top").split("px")[0]) * -1;
        $("body").removeClass("myWeddingMenuOpen").removeAttr("style");
        $(window).scrollTop(scrollTop);
        $(".myWedding_dim_bg").fadeOut();
        setTimeout(function() {
            $(".myWeddingMenuWrap").hide();
        }, 400)
    })
    //btnSearch
    $("header .btnSearch").off('click').on("click", function(e) {
        e.preventDefault();
        if (!$(this).hasClass("on")) {
            $(this).addClass("on");
            gnbWrap.addClass("open");
            gnbWrap.find(".gnbBottom").height(148);
            $(".gnbSearchArea").slideDown(100);
        } else {
            $(this).removeClass("on");
            gnbWrap.removeClass("open");
            gnbWrap.find(".gnbBottom").height(0);
            $(".gnbSearchArea").slideUp(100);
        }
    })

    $("header .btnSearchClose").on("click", function(e) {
        e.preventDefault();
        $("header .btnSearch").removeClass("on");
        gnbWrap.removeClass("open");
        gnbWrap.find(".gnbBottom").height(0);
        $(".gnbSearchArea").slideUp(100);
    })

    //btnOpenFamily

    $(".btnOpenFamily").off('click').on("click", function(e) {
        e.preventDefault();
        if (!$(this).hasClass("on")) {
            $(this).addClass("on");
            $(".familySiteWrap").slideDown(200);
        } else {
            $(this).removeClass("on");
            $(".familySiteWrap").slideUp(200);
        }

    })

    $('#my-menu').WCircleMenu({
        width: '45px',
        height: '45px',
        angle_start: -Math.PI,
        delay: 60,
        distance: 90,
        angle_interval: Math.PI / 4,
        easingFuncShow: "easeOutBack",
        easingFuncHide: "easeInBack",
        step: 10,
        openCallback: false,
        closeCallback: false,
        itemRotation: 1080,
        iconRotation: 0,
    });
    $(".wcircle-icon").click(function(e) {
        e.preventDefault();
        if (!$("#my-menu").hasClass("wcircle-open")) {
            $(".quickMenuDimBg").fadeIn();
        } else {
            $(".quickMenuDimBg").fadeOut();
        }
    })
    $(".wcircle-menu-item").click(function(e) {
        $('#my-menu').WCircleMenu("close");
        $(".quickMenuDimBg").fadeOut();
    })
    $(".btnScrollTop").click(function(e) {
        e.preventDefault();
        $("html,body").animate({
            scrollTop: 0
        }, 500)

    })
}
//레이어 팝업 함수
var layerPopCloseReturn;
function layerPop(option) {
    layerPopCloseReturn = $(":focus");
    var target = $("#" + option.target);
    var zindex = 0;
    if (option.type == "open") {
        if (target.css("display") == "none") {
            $("body").addClass("layerPopOpen");
            $(".layerPop").each(function() {
                if (zindex < Number($(this).css("z-index"))) {
                    zindex = Number($(this).css("z-index"));
                }
            })
            var top = ($(window).scrollTop() + ($(window).height() - target.height()) / 2);
            // 팝업 높이가 윈도우 높이 보다 클경우
            if ($(window).outerHeight() - 100 <= target.outerHeight()) {
                target.css({
                    top: $(window).scrollTop()
                });
            } else {
                //가운데 정렬
                target.css({
                    top: top
                });
            }
            target.css("z-index", zindex + 2).fadeIn().attr("tabindex", "0").focus();
            $("body").append("<div class='dim' id='" + option.target + "_bg' style='z-index:" + (zindex + 1) + "'></div>")
            $("#" + option.target + "_bg").fadeIn();
        }
    } else {
        target.fadeOut();
        $("#" + option.target + "_bg").fadeOut(function() {
            $("#" + option.target + "_bg").remove()
        });
        layerPopCloseReturn.focus();
    }
    target.find(".close, .btnClose").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + option.target + "_bg").fadeOut(function() {
            $("#" + option.target + "_bg").remove();
            $("body").removeClass("layerPopOpen");
        });
        if (typeof option.close === 'function') {
            option.close();
        }
        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }
    })
}

//////////////////////////////////////////////////////////////////////
/// TweenMax 1.18.2
//////////////////////////////////////////////////////////////////////
/*!
 * VERSION: 1.18.2
 * DATE: 2015-12-22
 * UPDATES AND DOCS AT: http://greensock.com
 *
 * Includes all of the following: TweenLite, TweenMax, TimelineLite, TimelineMax, EasePack, CSSPlugin, RoundPropsPlugin, BezierPlugin, AttrPlugin, DirectionalRotationPlugin
 *
 * @license Copyright (c) 2008-2016, GreenSock. All rights reserved.
 * This work is subject to the terms at http://greensock.com/standard-license or for
 * Club GreenSock members, the software agreement that was issued with your membership.
 *
 * @author: Jack Doyle, jack@greensock.com
 **/
var _gsScope = "undefined" != typeof module && module.exports && "undefined" != typeof global ? global : this || window;
(_gsScope._gsQueue || (_gsScope._gsQueue = [])).push(function() {
    "use strict";
    _gsScope._gsDefine("TweenMax", ["core.Animation", "core.SimpleTimeline", "TweenLite"], function(a, b, c) {
        var d = function(a) {
            var b, c = [], d = a.length;
            for (b = 0; b !== d; c.push(a[b++]))
                ;
            return c
        }
          , e = function(a, b, c) {
            var d, e, f = a.cycle;
            for (d in f)
                e = f[d],
                a[d] = "function" == typeof e ? e.call(b[c], c) : e[c % e.length];
            delete a.cycle
        }
          , f = function(a, b, d) {
            c.call(this, a, b, d),
            this._cycle = 0,
            this._yoyo = this.vars.yoyo === !0,
            this._repeat = this.vars.repeat || 0,
            this._repeatDelay = this.vars.repeatDelay || 0,
            this._dirty = !0,
            this.render = f.prototype.render
        }
          , g = 1e-10
          , h = c._internals
          , i = h.isSelector
          , j = h.isArray
          , k = f.prototype = c.to({}, .1, {})
          , l = [];
        f.version = "1.18.2",
        k.constructor = f,
        k.kill()._gc = !1,
        f.killTweensOf = f.killDelayedCallsTo = c.killTweensOf,
        f.getTweensOf = c.getTweensOf,
        f.lagSmoothing = c.lagSmoothing,
        f.ticker = c.ticker,
        f.render = c.render,
        k.invalidate = function() {
            return this._yoyo = this.vars.yoyo === !0,
            this._repeat = this.vars.repeat || 0,
            this._repeatDelay = this.vars.repeatDelay || 0,
            this._uncache(!0),
            c.prototype.invalidate.call(this)
        }
        ,
        k.updateTo = function(a, b) {
            var d, e = this.ratio, f = this.vars.immediateRender || a.immediateRender;
            b && this._startTime < this._timeline._time && (this._startTime = this._timeline._time,
            this._uncache(!1),
            this._gc ? this._enabled(!0, !1) : this._timeline.insert(this, this._startTime - this._delay));
            for (d in a)
                this.vars[d] = a[d];
            if (this._initted || f)
                if (b)
                    this._initted = !1,
                    f && this.render(0, !0, !0);
                else if (this._gc && this._enabled(!0, !1),
                this._notifyPluginsOfEnabled && this._firstPT && c._onPluginEvent("_onDisable", this),
                this._time / this._duration > .998) {
                    var g = this._totalTime;
                    this.render(0, !0, !1),
                    this._initted = !1,
                    this.render(g, !0, !1)
                } else if (this._initted = !1,
                this._init(),
                this._time > 0 || f)
                    for (var h, i = 1 / (1 - e), j = this._firstPT; j; )
                        h = j.s + j.c,
                        j.c *= i,
                        j.s = h - j.c,
                        j = j._next;
            return this
        }
        ,
        k.render = function(a, b, c) {
            this._initted || 0 === this._duration && this.vars.repeat && this.invalidate();
            var d, e, f, i, j, k, l, m, n = this._dirty ? this.totalDuration() : this._totalDuration, o = this._time, p = this._totalTime, q = this._cycle, r = this._duration, s = this._rawPrevTime;
            if (a >= n - 1e-7 ? (this._totalTime = n,
            this._cycle = this._repeat,
            this._yoyo && 0 !== (1 & this._cycle) ? (this._time = 0,
            this.ratio = this._ease._calcEnd ? this._ease.getRatio(0) : 0) : (this._time = r,
            this.ratio = this._ease._calcEnd ? this._ease.getRatio(1) : 1),
            this._reversed || (d = !0,
            e = "onComplete",
            c = c || this._timeline.autoRemoveChildren),
            0 === r && (this._initted || !this.vars.lazy || c) && (this._startTime === this._timeline._duration && (a = 0),
            (0 > s || 0 >= a && a >= -1e-7 || s === g && "isPause" !== this.data) && s !== a && (c = !0,
            s > g && (e = "onReverseComplete")),
            this._rawPrevTime = m = !b || a || s === a ? a : g)) : 1e-7 > a ? (this._totalTime = this._time = this._cycle = 0,
            this.ratio = this._ease._calcEnd ? this._ease.getRatio(0) : 0,
            (0 !== p || 0 === r && s > 0) && (e = "onReverseComplete",
            d = this._reversed),
            0 > a && (this._active = !1,
            0 === r && (this._initted || !this.vars.lazy || c) && (s >= 0 && (c = !0),
            this._rawPrevTime = m = !b || a || s === a ? a : g)),
            this._initted || (c = !0)) : (this._totalTime = this._time = a,
            0 !== this._repeat && (i = r + this._repeatDelay,
            this._cycle = this._totalTime / i >> 0,
            0 !== this._cycle && this._cycle === this._totalTime / i && this._cycle--,
            this._time = this._totalTime - this._cycle * i,
            this._yoyo && 0 !== (1 & this._cycle) && (this._time = r - this._time),
            this._time > r ? this._time = r : this._time < 0 && (this._time = 0)),
            this._easeType ? (j = this._time / r,
            k = this._easeType,
            l = this._easePower,
            (1 === k || 3 === k && j >= .5) && (j = 1 - j),
            3 === k && (j *= 2),
            1 === l ? j *= j : 2 === l ? j *= j * j : 3 === l ? j *= j * j * j : 4 === l && (j *= j * j * j * j),
            1 === k ? this.ratio = 1 - j : 2 === k ? this.ratio = j : this._time / r < .5 ? this.ratio = j / 2 : this.ratio = 1 - j / 2) : this.ratio = this._ease.getRatio(this._time / r)),
            o === this._time && !c && q === this._cycle)
                return void (p !== this._totalTime && this._onUpdate && (b || this._callback("onUpdate")));
            if (!this._initted) {
                if (this._init(),
                !this._initted || this._gc)
                    return;
                if (!c && this._firstPT && (this.vars.lazy !== !1 && this._duration || this.vars.lazy && !this._duration))
                    return this._time = o,
                    this._totalTime = p,
                    this._rawPrevTime = s,
                    this._cycle = q,
                    h.lazyTweens.push(this),
                    void (this._lazy = [a, b]);
                this._time && !d ? this.ratio = this._ease.getRatio(this._time / r) : d && this._ease._calcEnd && (this.ratio = this._ease.getRatio(0 === this._time ? 0 : 1))
            }
            for (this._lazy !== !1 && (this._lazy = !1),
            this._active || !this._paused && this._time !== o && a >= 0 && (this._active = !0),
            0 === p && (2 === this._initted && a > 0 && this._init(),
            this._startAt && (a >= 0 ? this._startAt.render(a, b, c) : e || (e = "_dummyGS")),
            this.vars.onStart && (0 !== this._totalTime || 0 === r) && (b || this._callback("onStart"))),
            f = this._firstPT; f; )
                f.f ? f.t[f.p](f.c * this.ratio + f.s) : f.t[f.p] = f.c * this.ratio + f.s,
                f = f._next;
            this._onUpdate && (0 > a && this._startAt && this._startTime && this._startAt.render(a, b, c),
            b || (this._totalTime !== p || d) && this._callback("onUpdate")),
            this._cycle !== q && (b || this._gc || this.vars.onRepeat && this._callback("onRepeat")),
            e && (!this._gc || c) && (0 > a && this._startAt && !this._onUpdate && this._startTime && this._startAt.render(a, b, c),
            d && (this._timeline.autoRemoveChildren && this._enabled(!1, !1),
            this._active = !1),
            !b && this.vars[e] && this._callback(e),
            0 === r && this._rawPrevTime === g && m !== g && (this._rawPrevTime = 0))
        }
        ,
        f.to = function(a, b, c) {
            return new f(a,b,c)
        }
        ,
        f.from = function(a, b, c) {
            return c.runBackwards = !0,
            c.immediateRender = 0 != c.immediateRender,
            new f(a,b,c)
        }
        ,
        f.fromTo = function(a, b, c, d) {
            return d.startAt = c,
            d.immediateRender = 0 != d.immediateRender && 0 != c.immediateRender,
            new f(a,b,d)
        }
        ,
        f.staggerTo = f.allTo = function(a, b, g, h, k, m, n) {
            h = h || 0;
            var o, p, q, r, s = 0, t = [], u = function() {
                g.onComplete && g.onComplete.apply(g.onCompleteScope || this, arguments),
                k.apply(n || g.callbackScope || this, m || l)
            }, v = g.cycle, w = g.startAt && g.startAt.cycle;
            for (j(a) || ("string" == typeof a && (a = c.selector(a) || a),
            i(a) && (a = d(a))),
            a = a || [],
            0 > h && (a = d(a),
            a.reverse(),
            h *= -1),
            o = a.length - 1,
            q = 0; o >= q; q++) {
                p = {};
                for (r in g)
                    p[r] = g[r];
                if (v && e(p, a, q),
                w) {
                    w = p.startAt = {};
                    for (r in g.startAt)
                        w[r] = g.startAt[r];
                    e(p.startAt, a, q)
                }
                p.delay = s + (p.delay || 0),
                q === o && k && (p.onComplete = u),
                t[q] = new f(a[q],b,p),
                s += h
            }
            return t
        }
        ,
        f.staggerFrom = f.allFrom = function(a, b, c, d, e, g, h) {
            return c.runBackwards = !0,
            c.immediateRender = 0 != c.immediateRender,
            f.staggerTo(a, b, c, d, e, g, h)
        }
        ,
        f.staggerFromTo = f.allFromTo = function(a, b, c, d, e, g, h, i) {
            return d.startAt = c,
            d.immediateRender = 0 != d.immediateRender && 0 != c.immediateRender,
            f.staggerTo(a, b, d, e, g, h, i)
        }
        ,
        f.delayedCall = function(a, b, c, d, e) {
            return new f(b,0,{
                delay: a,
                onComplete: b,
                onCompleteParams: c,
                callbackScope: d,
                onReverseComplete: b,
                onReverseCompleteParams: c,
                immediateRender: !1,
                useFrames: e,
                overwrite: 0
            })
        }
        ,
        f.set = function(a, b) {
            return new f(a,0,b)
        }
        ,
        f.isTweening = function(a) {
            return c.getTweensOf(a, !0).length > 0
        }
        ;
        var m = function(a, b) {
            for (var d = [], e = 0, f = a._first; f; )
                f instanceof c ? d[e++] = f : (b && (d[e++] = f),
                d = d.concat(m(f, b)),
                e = d.length),
                f = f._next;
            return d
        }
          , n = f.getAllTweens = function(b) {
            return m(a._rootTimeline, b).concat(m(a._rootFramesTimeline, b))
        }
        ;
        f.killAll = function(a, c, d, e) {
            null == c && (c = !0),
            null == d && (d = !0);
            var f, g, h, i = n(0 != e), j = i.length, k = c && d && e;
            for (h = 0; j > h; h++)
                g = i[h],
                (k || g instanceof b || (f = g.target === g.vars.onComplete) && d || c && !f) && (a ? g.totalTime(g._reversed ? 0 : g.totalDuration()) : g._enabled(!1, !1))
        }
        ,
        f.killChildTweensOf = function(a, b) {
            if (null != a) {
                var e, g, k, l, m, n = h.tweenLookup;
                if ("string" == typeof a && (a = c.selector(a) || a),
                i(a) && (a = d(a)),
                j(a))
                    for (l = a.length; --l > -1; )
                        f.killChildTweensOf(a[l], b);
                else {
                    e = [];
                    for (k in n)
                        for (g = n[k].target.parentNode; g; )
                            g === a && (e = e.concat(n[k].tweens)),
                            g = g.parentNode;
                    for (m = e.length,
                    l = 0; m > l; l++)
                        b && e[l].totalTime(e[l].totalDuration()),
                        e[l]._enabled(!1, !1)
                }
            }
        }
        ;
        var o = function(a, c, d, e) {
            c = c !== !1,
            d = d !== !1,
            e = e !== !1;
            for (var f, g, h = n(e), i = c && d && e, j = h.length; --j > -1; )
                g = h[j],
                (i || g instanceof b || (f = g.target === g.vars.onComplete) && d || c && !f) && g.paused(a)
        };
        return f.pauseAll = function(a, b, c) {
            o(!0, a, b, c)
        }
        ,
        f.resumeAll = function(a, b, c) {
            o(!1, a, b, c)
        }
        ,
        f.globalTimeScale = function(b) {
            var d = a._rootTimeline
              , e = c.ticker.time;
            return arguments.length ? (b = b || g,
            d._startTime = e - (e - d._startTime) * d._timeScale / b,
            d = a._rootFramesTimeline,
            e = c.ticker.frame,
            d._startTime = e - (e - d._startTime) * d._timeScale / b,
            d._timeScale = a._rootTimeline._timeScale = b,
            b) : d._timeScale
        }
        ,
        k.progress = function(a) {
            return arguments.length ? this.totalTime(this.duration() * (this._yoyo && 0 !== (1 & this._cycle) ? 1 - a : a) + this._cycle * (this._duration + this._repeatDelay), !1) : this._time / this.duration()
        }
        ,
        k.totalProgress = function(a) {
            return arguments.length ? this.totalTime(this.totalDuration() * a, !1) : this._totalTime / this.totalDuration()
        }
        ,
        k.time = function(a, b) {
            return arguments.length ? (this._dirty && this.totalDuration(),
            a > this._duration && (a = this._duration),
            this._yoyo && 0 !== (1 & this._cycle) ? a = this._duration - a + this._cycle * (this._duration + this._repeatDelay) : 0 !== this._repeat && (a += this._cycle * (this._duration + this._repeatDelay)),
            this.totalTime(a, b)) : this._time
        }
        ,
        k.duration = function(b) {
            return arguments.length ? a.prototype.duration.call(this, b) : this._duration
        }
        ,
        k.totalDuration = function(a) {
            return arguments.length ? -1 === this._repeat ? this : this.duration((a - this._repeat * this._repeatDelay) / (this._repeat + 1)) : (this._dirty && (this._totalDuration = -1 === this._repeat ? 999999999999 : this._duration * (this._repeat + 1) + this._repeatDelay * this._repeat,
            this._dirty = !1),
            this._totalDuration)
        }
        ,
        k.repeat = function(a) {
            return arguments.length ? (this._repeat = a,
            this._uncache(!0)) : this._repeat
        }
        ,
        k.repeatDelay = function(a) {
            return arguments.length ? (this._repeatDelay = a,
            this._uncache(!0)) : this._repeatDelay
        }
        ,
        k.yoyo = function(a) {
            return arguments.length ? (this._yoyo = a,
            this) : this._yoyo
        }
        ,
        f
    }, !0),
    _gsScope._gsDefine("TimelineLite", ["core.Animation", "core.SimpleTimeline", "TweenLite"], function(a, b, c) {
        var d = function(a) {
            b.call(this, a),
            this._labels = {},
            this.autoRemoveChildren = this.vars.autoRemoveChildren === !0,
            this.smoothChildTiming = this.vars.smoothChildTiming === !0,
            this._sortChildren = !0,
            this._onUpdate = this.vars.onUpdate;
            var c, d, e = this.vars;
            for (d in e)
                c = e[d],
                i(c) && -1 !== c.join("").indexOf("{self}") && (e[d] = this._swapSelfInParams(c));
            i(e.tweens) && this.add(e.tweens, 0, e.align, e.stagger)
        }
          , e = 1e-10
          , f = c._internals
          , g = d._internals = {}
          , h = f.isSelector
          , i = f.isArray
          , j = f.lazyTweens
          , k = f.lazyRender
          , l = _gsScope._gsDefine.globals
          , m = function(a) {
            var b, c = {};
            for (b in a)
                c[b] = a[b];
            return c
        }
          , n = function(a, b, c) {
            var d, e, f = a.cycle;
            for (d in f)
                e = f[d],
                a[d] = "function" == typeof e ? e.call(b[c], c) : e[c % e.length];
            delete a.cycle
        }
          , o = g.pauseCallback = function() {}
          , p = function(a) {
            var b, c = [], d = a.length;
            for (b = 0; b !== d; c.push(a[b++]))
                ;
            return c
        }
          , q = d.prototype = new b;
        return d.version = "1.18.2",
        q.constructor = d,
        q.kill()._gc = q._forcingPlayhead = q._hasPause = !1,
        q.to = function(a, b, d, e) {
            var f = d.repeat && l.TweenMax || c;
            return b ? this.add(new f(a,b,d), e) : this.set(a, d, e)
        }
        ,
        q.from = function(a, b, d, e) {
            return this.add((d.repeat && l.TweenMax || c).from(a, b, d), e)
        }
        ,
        q.fromTo = function(a, b, d, e, f) {
            var g = e.repeat && l.TweenMax || c;
            return b ? this.add(g.fromTo(a, b, d, e), f) : this.set(a, e, f)
        }
        ,
        q.staggerTo = function(a, b, e, f, g, i, j, k) {
            var l, o, q = new d({
                onComplete: i,
                onCompleteParams: j,
                callbackScope: k,
                smoothChildTiming: this.smoothChildTiming
            }), r = e.cycle;
            for ("string" == typeof a && (a = c.selector(a) || a),
            a = a || [],
            h(a) && (a = p(a)),
            f = f || 0,
            0 > f && (a = p(a),
            a.reverse(),
            f *= -1),
            o = 0; o < a.length; o++)
                l = m(e),
                l.startAt && (l.startAt = m(l.startAt),
                l.startAt.cycle && n(l.startAt, a, o)),
                r && n(l, a, o),
                q.to(a[o], b, l, o * f);
            return this.add(q, g)
        }
        ,
        q.staggerFrom = function(a, b, c, d, e, f, g, h) {
            return c.immediateRender = 0 != c.immediateRender,
            c.runBackwards = !0,
            this.staggerTo(a, b, c, d, e, f, g, h)
        }
        ,
        q.staggerFromTo = function(a, b, c, d, e, f, g, h, i) {
            return d.startAt = c,
            d.immediateRender = 0 != d.immediateRender && 0 != c.immediateRender,
            this.staggerTo(a, b, d, e, f, g, h, i)
        }
        ,
        q.call = function(a, b, d, e) {
            return this.add(c.delayedCall(0, a, b, d), e)
        }
        ,
        q.set = function(a, b, d) {
            return d = this._parseTimeOrLabel(d, 0, !0),
            null == b.immediateRender && (b.immediateRender = d === this._time && !this._paused),
            this.add(new c(a,0,b), d)
        }
        ,
        d.exportRoot = function(a, b) {
            a = a || {},
            null == a.smoothChildTiming && (a.smoothChildTiming = !0);
            var e, f, g = new d(a), h = g._timeline;
            for (null == b && (b = !0),
            h._remove(g, !0),
            g._startTime = 0,
            g._rawPrevTime = g._time = g._totalTime = h._time,
            e = h._first; e; )
                f = e._next,
                b && e instanceof c && e.target === e.vars.onComplete || g.add(e, e._startTime - e._delay),
                e = f;
            return h.add(g, 0),
            g
        }
        ,
        q.add = function(e, f, g, h) {
            var j, k, l, m, n, o;
            if ("number" != typeof f && (f = this._parseTimeOrLabel(f, 0, !0, e)),
            !(e instanceof a)) {
                if (e instanceof Array || e && e.push && i(e)) {
                    for (g = g || "normal",
                    h = h || 0,
                    j = f,
                    k = e.length,
                    l = 0; k > l; l++)
                        i(m = e[l]) && (m = new d({
                            tweens: m
                        })),
                        this.add(m, j),
                        "string" != typeof m && "function" != typeof m && ("sequence" === g ? j = m._startTime + m.totalDuration() / m._timeScale : "start" === g && (m._startTime -= m.delay())),
                        j += h;
                    return this._uncache(!0)
                }
                if ("string" == typeof e)
                    return this.addLabel(e, f);
                if ("function" != typeof e)
                    throw "Cannot add " + e + " into the timeline; it is not a tween, timeline, function, or string.";
                e = c.delayedCall(0, e)
            }
            if (b.prototype.add.call(this, e, f),
            (this._gc || this._time === this._duration) && !this._paused && this._duration < this.duration())
                for (n = this,
                o = n.rawTime() > e._startTime; n._timeline; )
                    o && n._timeline.smoothChildTiming ? n.totalTime(n._totalTime, !0) : n._gc && n._enabled(!0, !1),
                    n = n._timeline;
            return this
        }
        ,
        q.remove = function(b) {
            if (b instanceof a) {
                this._remove(b, !1);
                var c = b._timeline = b.vars.useFrames ? a._rootFramesTimeline : a._rootTimeline;
                return b._startTime = (b._paused ? b._pauseTime : c._time) - (b._reversed ? b.totalDuration() - b._totalTime : b._totalTime) / b._timeScale,
                this
            }
            if (b instanceof Array || b && b.push && i(b)) {
                for (var d = b.length; --d > -1; )
                    this.remove(b[d]);
                return this
            }
            return "string" == typeof b ? this.removeLabel(b) : this.kill(null, b)
        }
        ,
        q._remove = function(a, c) {
            b.prototype._remove.call(this, a, c);
            var d = this._last;
            return d ? this._time > d._startTime + d._totalDuration / d._timeScale && (this._time = this.duration(),
            this._totalTime = this._totalDuration) : this._time = this._totalTime = this._duration = this._totalDuration = 0,
            this
        }
        ,
        q.append = function(a, b) {
            return this.add(a, this._parseTimeOrLabel(null, b, !0, a))
        }
        ,
        q.insert = q.insertMultiple = function(a, b, c, d) {
            return this.add(a, b || 0, c, d)
        }
        ,
        q.appendMultiple = function(a, b, c, d) {
            return this.add(a, this._parseTimeOrLabel(null, b, !0, a), c, d)
        }
        ,
        q.addLabel = function(a, b) {
            return this._labels[a] = this._parseTimeOrLabel(b),
            this
        }
        ,
        q.addPause = function(a, b, d, e) {
            var f = c.delayedCall(0, o, d, e || this);
            return f.vars.onComplete = f.vars.onReverseComplete = b,
            f.data = "isPause",
            this._hasPause = !0,
            this.add(f, a)
        }
        ,
        q.removeLabel = function(a) {
            return delete this._labels[a],
            this
        }
        ,
        q.getLabelTime = function(a) {
            return null != this._labels[a] ? this._labels[a] : -1
        }
        ,
        q._parseTimeOrLabel = function(b, c, d, e) {
            var f;
            if (e instanceof a && e.timeline === this)
                this.remove(e);
            else if (e && (e instanceof Array || e.push && i(e)))
                for (f = e.length; --f > -1; )
                    e[f]instanceof a && e[f].timeline === this && this.remove(e[f]);
            if ("string" == typeof c)
                return this._parseTimeOrLabel(c, d && "number" == typeof b && null == this._labels[c] ? b - this.duration() : 0, d);
            if (c = c || 0,
            "string" != typeof b || !isNaN(b) && null == this._labels[b])
                null == b && (b = this.duration());
            else {
                if (f = b.indexOf("="),
                -1 === f)
                    return null == this._labels[b] ? d ? this._labels[b] = this.duration() + c : c : this._labels[b] + c;
                c = parseInt(b.charAt(f - 1) + "1", 10) * Number(b.substr(f + 1)),
                b = f > 1 ? this._parseTimeOrLabel(b.substr(0, f - 1), 0, d) : this.duration()
            }
            return Number(b) + c
        }
        ,
        q.seek = function(a, b) {
            return this.totalTime("number" == typeof a ? a : this._parseTimeOrLabel(a), b !== !1)
        }
        ,
        q.stop = function() {
            return this.paused(!0)
        }
        ,
        q.gotoAndPlay = function(a, b) {
            return this.play(a, b)
        }
        ,
        q.gotoAndStop = function(a, b) {
            return this.pause(a, b)
        }
        ,
        q.render = function(a, b, c) {
            this._gc && this._enabled(!0, !1);
            var d, f, g, h, i, l, m, n = this._dirty ? this.totalDuration() : this._totalDuration, o = this._time, p = this._startTime, q = this._timeScale, r = this._paused;
            if (a >= n - 1e-7)
                this._totalTime = this._time = n,
                this._reversed || this._hasPausedChild() || (f = !0,
                h = "onComplete",
                i = !!this._timeline.autoRemoveChildren,
                0 === this._duration && (0 >= a && a >= -1e-7 || this._rawPrevTime < 0 || this._rawPrevTime === e) && this._rawPrevTime !== a && this._first && (i = !0,
                this._rawPrevTime > e && (h = "onReverseComplete"))),
                this._rawPrevTime = this._duration || !b || a || this._rawPrevTime === a ? a : e,
                a = n + 1e-4;
            else if (1e-7 > a)
                if (this._totalTime = this._time = 0,
                (0 !== o || 0 === this._duration && this._rawPrevTime !== e && (this._rawPrevTime > 0 || 0 > a && this._rawPrevTime >= 0)) && (h = "onReverseComplete",
                f = this._reversed),
                0 > a)
                    this._active = !1,
                    this._timeline.autoRemoveChildren && this._reversed ? (i = f = !0,
                    h = "onReverseComplete") : this._rawPrevTime >= 0 && this._first && (i = !0),
                    this._rawPrevTime = a;
                else {
                    if (this._rawPrevTime = this._duration || !b || a || this._rawPrevTime === a ? a : e,
                    0 === a && f)
                        for (d = this._first; d && 0 === d._startTime; )
                            d._duration || (f = !1),
                            d = d._next;
                    a = 0,
                    this._initted || (i = !0)
                }
            else {
                if (this._hasPause && !this._forcingPlayhead && !b) {
                    if (a >= o)
                        for (d = this._first; d && d._startTime <= a && !l; )
                            d._duration || "isPause" !== d.data || d.ratio || 0 === d._startTime && 0 === this._rawPrevTime || (l = d),
                            d = d._next;
                    else
                        for (d = this._last; d && d._startTime >= a && !l; )
                            d._duration || "isPause" === d.data && d._rawPrevTime > 0 && (l = d),
                            d = d._prev;
                    l && (this._time = a = l._startTime,
                    this._totalTime = a + this._cycle * (this._totalDuration + this._repeatDelay))
                }
                this._totalTime = this._time = this._rawPrevTime = a
            }
            if (this._time !== o && this._first || c || i || l) {
                if (this._initted || (this._initted = !0),
                this._active || !this._paused && this._time !== o && a > 0 && (this._active = !0),
                0 === o && this.vars.onStart && 0 !== this._time && (b || this._callback("onStart")),
                m = this._time,
                m >= o)
                    for (d = this._first; d && (g = d._next,
                    m === this._time && (!this._paused || r)); )
                        (d._active || d._startTime <= m && !d._paused && !d._gc) && (l === d && this.pause(),
                        d._reversed ? d.render((d._dirty ? d.totalDuration() : d._totalDuration) - (a - d._startTime) * d._timeScale, b, c) : d.render((a - d._startTime) * d._timeScale, b, c)),
                        d = g;
                else
                    for (d = this._last; d && (g = d._prev,
                    m === this._time && (!this._paused || r)); ) {
                        if (d._active || d._startTime <= o && !d._paused && !d._gc) {
                            if (l === d) {
                                for (l = d._prev; l && l.endTime() > this._time; )
                                    l.render(l._reversed ? l.totalDuration() - (a - l._startTime) * l._timeScale : (a - l._startTime) * l._timeScale, b, c),
                                    l = l._prev;
                                l = null,
                                this.pause()
                            }
                            d._reversed ? d.render((d._dirty ? d.totalDuration() : d._totalDuration) - (a - d._startTime) * d._timeScale, b, c) : d.render((a - d._startTime) * d._timeScale, b, c)
                        }
                        d = g
                    }
                this._onUpdate && (b || (j.length && k(),
                this._callback("onUpdate"))),
                h && (this._gc || (p === this._startTime || q !== this._timeScale) && (0 === this._time || n >= this.totalDuration()) && (f && (j.length && k(),
                this._timeline.autoRemoveChildren && this._enabled(!1, !1),
                this._active = !1),
                !b && this.vars[h] && this._callback(h)))
            }
        }
        ,
        q._hasPausedChild = function() {
            for (var a = this._first; a; ) {
                if (a._paused || a instanceof d && a._hasPausedChild())
                    return !0;
                a = a._next
            }
            return !1
        }
        ,
        q.getChildren = function(a, b, d, e) {
            e = e || -9999999999;
            for (var f = [], g = this._first, h = 0; g; )
                g._startTime < e || (g instanceof c ? b !== !1 && (f[h++] = g) : (d !== !1 && (f[h++] = g),
                a !== !1 && (f = f.concat(g.getChildren(!0, b, d)),
                h = f.length))),
                g = g._next;
            return f
        }
        ,
        q.getTweensOf = function(a, b) {
            var d, e, f = this._gc, g = [], h = 0;
            for (f && this._enabled(!0, !0),
            d = c.getTweensOf(a),
            e = d.length; --e > -1; )
                (d[e].timeline === this || b && this._contains(d[e])) && (g[h++] = d[e]);
            return f && this._enabled(!1, !0),
            g
        }
        ,
        q.recent = function() {
            return this._recent
        }
        ,
        q._contains = function(a) {
            for (var b = a.timeline; b; ) {
                if (b === this)
                    return !0;
                b = b.timeline
            }
            return !1
        }
        ,
        q.shiftChildren = function(a, b, c) {
            c = c || 0;
            for (var d, e = this._first, f = this._labels; e; )
                e._startTime >= c && (e._startTime += a),
                e = e._next;
            if (b)
                for (d in f)
                    f[d] >= c && (f[d] += a);
            return this._uncache(!0)
        }
        ,
        q._kill = function(a, b) {
            if (!a && !b)
                return this._enabled(!1, !1);
            for (var c = b ? this.getTweensOf(b) : this.getChildren(!0, !0, !1), d = c.length, e = !1; --d > -1; )
                c[d]._kill(a, b) && (e = !0);
            return e
        }
        ,
        q.clear = function(a) {
            var b = this.getChildren(!1, !0, !0)
              , c = b.length;
            for (this._time = this._totalTime = 0; --c > -1; )
                b[c]._enabled(!1, !1);
            return a !== !1 && (this._labels = {}),
            this._uncache(!0)
        }
        ,
        q.invalidate = function() {
            for (var b = this._first; b; )
                b.invalidate(),
                b = b._next;
            return a.prototype.invalidate.call(this)
        }
        ,
        q._enabled = function(a, c) {
            if (a === this._gc)
                for (var d = this._first; d; )
                    d._enabled(a, !0),
                    d = d._next;
            return b.prototype._enabled.call(this, a, c)
        }
        ,
        q.totalTime = function(b, c, d) {
            this._forcingPlayhead = !0;
            var e = a.prototype.totalTime.apply(this, arguments);
            return this._forcingPlayhead = !1,
            e
        }
        ,
        q.duration = function(a) {
            return arguments.length ? (0 !== this.duration() && 0 !== a && this.timeScale(this._duration / a),
            this) : (this._dirty && this.totalDuration(),
            this._duration)
        }
        ,
        q.totalDuration = function(a) {
            if (!arguments.length) {
                if (this._dirty) {
                    for (var b, c, d = 0, e = this._last, f = 999999999999; e; )
                        b = e._prev,
                        e._dirty && e.totalDuration(),
                        e._startTime > f && this._sortChildren && !e._paused ? this.add(e, e._startTime - e._delay) : f = e._startTime,
                        e._startTime < 0 && !e._paused && (d -= e._startTime,
                        this._timeline.smoothChildTiming && (this._startTime += e._startTime / this._timeScale),
                        this.shiftChildren(-e._startTime, !1, -9999999999),
                        f = 0),
                        c = e._startTime + e._totalDuration / e._timeScale,
                        c > d && (d = c),
                        e = b;
                    this._duration = this._totalDuration = d,
                    this._dirty = !1
                }
                return this._totalDuration
            }
            return a && this.totalDuration() ? this.timeScale(this._totalDuration / a) : this
        }
        ,
        q.paused = function(b) {
            if (!b)
                for (var c = this._first, d = this._time; c; )
                    c._startTime === d && "isPause" === c.data && (c._rawPrevTime = 0),
                    c = c._next;
            return a.prototype.paused.apply(this, arguments)
        }
        ,
        q.usesFrames = function() {
            for (var b = this._timeline; b._timeline; )
                b = b._timeline;
            return b === a._rootFramesTimeline
        }
        ,
        q.rawTime = function() {
            return this._paused ? this._totalTime : (this._timeline.rawTime() - this._startTime) * this._timeScale
        }
        ,
        d
    }, !0),
    _gsScope._gsDefine("TimelineMax", ["TimelineLite", "TweenLite", "easing.Ease"], function(a, b, c) {
        var d = function(b) {
            a.call(this, b),
            this._repeat = this.vars.repeat || 0,
            this._repeatDelay = this.vars.repeatDelay || 0,
            this._cycle = 0,
            this._yoyo = this.vars.yoyo === !0,
            this._dirty = !0
        }
          , e = 1e-10
          , f = b._internals
          , g = f.lazyTweens
          , h = f.lazyRender
          , i = new c(null,null,1,0)
          , j = d.prototype = new a;
        return j.constructor = d,
        j.kill()._gc = !1,
        d.version = "1.18.2",
        j.invalidate = function() {
            return this._yoyo = this.vars.yoyo === !0,
            this._repeat = this.vars.repeat || 0,
            this._repeatDelay = this.vars.repeatDelay || 0,
            this._uncache(!0),
            a.prototype.invalidate.call(this)
        }
        ,
        j.addCallback = function(a, c, d, e) {
            return this.add(b.delayedCall(0, a, d, e), c)
        }
        ,
        j.removeCallback = function(a, b) {
            if (a)
                if (null == b)
                    this._kill(null, a);
                else
                    for (var c = this.getTweensOf(a, !1), d = c.length, e = this._parseTimeOrLabel(b); --d > -1; )
                        c[d]._startTime === e && c[d]._enabled(!1, !1);
            return this
        }
        ,
        j.removePause = function(b) {
            return this.removeCallback(a._internals.pauseCallback, b)
        }
        ,
        j.tweenTo = function(a, c) {
            c = c || {};
            var d, e, f, g = {
                ease: i,
                useFrames: this.usesFrames(),
                immediateRender: !1
            };
            for (e in c)
                g[e] = c[e];
            return g.time = this._parseTimeOrLabel(a),
            d = Math.abs(Number(g.time) - this._time) / this._timeScale || .001,
            f = new b(this,d,g),
            g.onStart = function() {
                f.target.paused(!0),
                f.vars.time !== f.target.time() && d === f.duration() && f.duration(Math.abs(f.vars.time - f.target.time()) / f.target._timeScale),
                c.onStart && f._callback("onStart")
            }
            ,
            f
        }
        ,
        j.tweenFromTo = function(a, b, c) {
            c = c || {},
            a = this._parseTimeOrLabel(a),
            c.startAt = {
                onComplete: this.seek,
                onCompleteParams: [a],
                callbackScope: this
            },
            c.immediateRender = c.immediateRender !== !1;
            var d = this.tweenTo(b, c);
            return d.duration(Math.abs(d.vars.time - a) / this._timeScale || .001)
        }
        ,
        j.render = function(a, b, c) {
            this._gc && this._enabled(!0, !1);
            var d, f, i, j, k, l, m, n, o = this._dirty ? this.totalDuration() : this._totalDuration, p = this._duration, q = this._time, r = this._totalTime, s = this._startTime, t = this._timeScale, u = this._rawPrevTime, v = this._paused, w = this._cycle;
            if (a >= o - 1e-7)
                this._locked || (this._totalTime = o,
                this._cycle = this._repeat),
                this._reversed || this._hasPausedChild() || (f = !0,
                j = "onComplete",
                k = !!this._timeline.autoRemoveChildren,
                0 === this._duration && (0 >= a && a >= -1e-7 || 0 > u || u === e) && u !== a && this._first && (k = !0,
                u > e && (j = "onReverseComplete"))),
                this._rawPrevTime = this._duration || !b || a || this._rawPrevTime === a ? a : e,
                this._yoyo && 0 !== (1 & this._cycle) ? this._time = a = 0 : (this._time = p,
                a = p + 1e-4);
            else if (1e-7 > a)
                if (this._locked || (this._totalTime = this._cycle = 0),
                this._time = 0,
                (0 !== q || 0 === p && u !== e && (u > 0 || 0 > a && u >= 0) && !this._locked) && (j = "onReverseComplete",
                f = this._reversed),
                0 > a)
                    this._active = !1,
                    this._timeline.autoRemoveChildren && this._reversed ? (k = f = !0,
                    j = "onReverseComplete") : u >= 0 && this._first && (k = !0),
                    this._rawPrevTime = a;
                else {
                    if (this._rawPrevTime = p || !b || a || this._rawPrevTime === a ? a : e,
                    0 === a && f)
                        for (d = this._first; d && 0 === d._startTime; )
                            d._duration || (f = !1),
                            d = d._next;
                    a = 0,
                    this._initted || (k = !0)
                }
            else if (0 === p && 0 > u && (k = !0),
            this._time = this._rawPrevTime = a,
            this._locked || (this._totalTime = a,
            0 !== this._repeat && (l = p + this._repeatDelay,
            this._cycle = this._totalTime / l >> 0,
            0 !== this._cycle && this._cycle === this._totalTime / l && this._cycle--,
            this._time = this._totalTime - this._cycle * l,
            this._yoyo && 0 !== (1 & this._cycle) && (this._time = p - this._time),
            this._time > p ? (this._time = p,
            a = p + 1e-4) : this._time < 0 ? this._time = a = 0 : a = this._time)),
            this._hasPause && !this._forcingPlayhead && !b) {
                if (a = this._time,
                a >= q)
                    for (d = this._first; d && d._startTime <= a && !m; )
                        d._duration || "isPause" !== d.data || d.ratio || 0 === d._startTime && 0 === this._rawPrevTime || (m = d),
                        d = d._next;
                else
                    for (d = this._last; d && d._startTime >= a && !m; )
                        d._duration || "isPause" === d.data && d._rawPrevTime > 0 && (m = d),
                        d = d._prev;
                m && (this._time = a = m._startTime,
                this._totalTime = a + this._cycle * (this._totalDuration + this._repeatDelay))
            }
            if (this._cycle !== w && !this._locked) {
                var x = this._yoyo && 0 !== (1 & w)
                  , y = x === (this._yoyo && 0 !== (1 & this._cycle))
                  , z = this._totalTime
                  , A = this._cycle
                  , B = this._rawPrevTime
                  , C = this._time;
                if (this._totalTime = w * p,
                this._cycle < w ? x = !x : this._totalTime += p,
                this._time = q,
                this._rawPrevTime = 0 === p ? u - 1e-4 : u,
                this._cycle = w,
                this._locked = !0,
                q = x ? 0 : p,
                this.render(q, b, 0 === p),
                b || this._gc || this.vars.onRepeat && this._callback("onRepeat"),
                q !== this._time)
                    return;
                if (y && (q = x ? p + 1e-4 : -1e-4,
                this.render(q, !0, !1)),
                this._locked = !1,
                this._paused && !v)
                    return;
                this._time = C,
                this._totalTime = z,
                this._cycle = A,
                this._rawPrevTime = B
            }
            if (!(this._time !== q && this._first || c || k || m))
                return void (r !== this._totalTime && this._onUpdate && (b || this._callback("onUpdate")));
            if (this._initted || (this._initted = !0),
            this._active || !this._paused && this._totalTime !== r && a > 0 && (this._active = !0),
            0 === r && this.vars.onStart && 0 !== this._totalTime && (b || this._callback("onStart")),
            n = this._time,
            n >= q)
                for (d = this._first; d && (i = d._next,
                n === this._time && (!this._paused || v)); )
                    (d._active || d._startTime <= this._time && !d._paused && !d._gc) && (m === d && this.pause(),
                    d._reversed ? d.render((d._dirty ? d.totalDuration() : d._totalDuration) - (a - d._startTime) * d._timeScale, b, c) : d.render((a - d._startTime) * d._timeScale, b, c)),
                    d = i;
            else
                for (d = this._last; d && (i = d._prev,
                n === this._time && (!this._paused || v)); ) {
                    if (d._active || d._startTime <= q && !d._paused && !d._gc) {
                        if (m === d) {
                            for (m = d._prev; m && m.endTime() > this._time; )
                                m.render(m._reversed ? m.totalDuration() - (a - m._startTime) * m._timeScale : (a - m._startTime) * m._timeScale, b, c),
                                m = m._prev;
                            m = null,
                            this.pause()
                        }
                        d._reversed ? d.render((d._dirty ? d.totalDuration() : d._totalDuration) - (a - d._startTime) * d._timeScale, b, c) : d.render((a - d._startTime) * d._timeScale, b, c)
                    }
                    d = i
                }
            this._onUpdate && (b || (g.length && h(),
            this._callback("onUpdate"))),
            j && (this._locked || this._gc || (s === this._startTime || t !== this._timeScale) && (0 === this._time || o >= this.totalDuration()) && (f && (g.length && h(),
            this._timeline.autoRemoveChildren && this._enabled(!1, !1),
            this._active = !1),
            !b && this.vars[j] && this._callback(j)))
        }
        ,
        j.getActive = function(a, b, c) {
            null == a && (a = !0),
            null == b && (b = !0),
            null == c && (c = !1);
            var d, e, f = [], g = this.getChildren(a, b, c), h = 0, i = g.length;
            for (d = 0; i > d; d++)
                e = g[d],
                e.isActive() && (f[h++] = e);
            return f
        }
        ,
        j.getLabelAfter = function(a) {
            a || 0 !== a && (a = this._time);
            var b, c = this.getLabelsArray(), d = c.length;
            for (b = 0; d > b; b++)
                if (c[b].time > a)
                    return c[b].name;
            return null
        }
        ,
        j.getLabelBefore = function(a) {
            null == a && (a = this._time);
            for (var b = this.getLabelsArray(), c = b.length; --c > -1; )
                if (b[c].time < a)
                    return b[c].name;
            return null
        }
        ,
        j.getLabelsArray = function() {
            var a, b = [], c = 0;
            for (a in this._labels)
                b[c++] = {
                    time: this._labels[a],
                    name: a
                };
            return b.sort(function(a, b) {
                return a.time - b.time
            }),
            b
        }
        ,
        j.progress = function(a, b) {
            return arguments.length ? this.totalTime(this.duration() * (this._yoyo && 0 !== (1 & this._cycle) ? 1 - a : a) + this._cycle * (this._duration + this._repeatDelay), b) : this._time / this.duration()
        }
        ,
        j.totalProgress = function(a, b) {
            return arguments.length ? this.totalTime(this.totalDuration() * a, b) : this._totalTime / this.totalDuration()
        }
        ,
        j.totalDuration = function(b) {
            return arguments.length ? -1 !== this._repeat && b ? this.timeScale(this.totalDuration() / b) : this : (this._dirty && (a.prototype.totalDuration.call(this),
            this._totalDuration = -1 === this._repeat ? 999999999999 : this._duration * (this._repeat + 1) + this._repeatDelay * this._repeat),
            this._totalDuration)
        }
        ,
        j.time = function(a, b) {
            return arguments.length ? (this._dirty && this.totalDuration(),
            a > this._duration && (a = this._duration),
            this._yoyo && 0 !== (1 & this._cycle) ? a = this._duration - a + this._cycle * (this._duration + this._repeatDelay) : 0 !== this._repeat && (a += this._cycle * (this._duration + this._repeatDelay)),
            this.totalTime(a, b)) : this._time
        }
        ,
        j.repeat = function(a) {
            return arguments.length ? (this._repeat = a,
            this._uncache(!0)) : this._repeat
        }
        ,
        j.repeatDelay = function(a) {
            return arguments.length ? (this._repeatDelay = a,
            this._uncache(!0)) : this._repeatDelay
        }
        ,
        j.yoyo = function(a) {
            return arguments.length ? (this._yoyo = a,
            this) : this._yoyo
        }
        ,
        j.currentLabel = function(a) {
            return arguments.length ? this.seek(a, !0) : this.getLabelBefore(this._time + 1e-8)
        }
        ,
        d
    }, !0),
    function() {
        var a = 180 / Math.PI
          , b = []
          , c = []
          , d = []
          , e = {}
          , f = _gsScope._gsDefine.globals
          , g = function(a, b, c, d) {
            this.a = a,
            this.b = b,
            this.c = c,
            this.d = d,
            this.da = d - a,
            this.ca = c - a,
            this.ba = b - a
        }
          , h = ",x,y,z,left,top,right,bottom,marginTop,marginLeft,marginRight,marginBottom,paddingLeft,paddingTop,paddingRight,paddingBottom,backgroundPosition,backgroundPosition_y,"
          , i = function(a, b, c, d) {
            var e = {
                a: a
            }
              , f = {}
              , g = {}
              , h = {
                c: d
            }
              , i = (a + b) / 2
              , j = (b + c) / 2
              , k = (c + d) / 2
              , l = (i + j) / 2
              , m = (j + k) / 2
              , n = (m - l) / 8;
            return e.b = i + (a - i) / 4,
            f.b = l + n,
            e.c = f.a = (e.b + f.b) / 2,
            f.c = g.a = (l + m) / 2,
            g.b = m - n,
            h.b = k + (d - k) / 4,
            g.c = h.a = (g.b + h.b) / 2,
            [e, f, g, h]
        }
          , j = function(a, e, f, g, h) {
            var j, k, l, m, n, o, p, q, r, s, t, u, v, w = a.length - 1, x = 0, y = a[0].a;
            for (j = 0; w > j; j++)
                n = a[x],
                k = n.a,
                l = n.d,
                m = a[x + 1].d,
                h ? (t = b[j],
                u = c[j],
                v = (u + t) * e * .25 / (g ? .5 : d[j] || .5),
                o = l - (l - k) * (g ? .5 * e : 0 !== t ? v / t : 0),
                p = l + (m - l) * (g ? .5 * e : 0 !== u ? v / u : 0),
                q = l - (o + ((p - o) * (3 * t / (t + u) + .5) / 4 || 0))) : (o = l - (l - k) * e * .5,
                p = l + (m - l) * e * .5,
                q = l - (o + p) / 2),
                o += q,
                p += q,
                n.c = r = o,
                0 !== j ? n.b = y : n.b = y = n.a + .6 * (n.c - n.a),
                n.da = l - k,
                n.ca = r - k,
                n.ba = y - k,
                f ? (s = i(k, y, r, l),
                a.splice(x, 1, s[0], s[1], s[2], s[3]),
                x += 4) : x++,
                y = p;
            n = a[x],
            n.b = y,
            n.c = y + .4 * (n.d - y),
            n.da = n.d - n.a,
            n.ca = n.c - n.a,
            n.ba = y - n.a,
            f && (s = i(n.a, y, n.c, n.d),
            a.splice(x, 1, s[0], s[1], s[2], s[3]))
        }
          , k = function(a, d, e, f) {
            var h, i, j, k, l, m, n = [];
            if (f)
                for (a = [f].concat(a),
                i = a.length; --i > -1; )
                    "string" == typeof (m = a[i][d]) && "=" === m.charAt(1) && (a[i][d] = f[d] + Number(m.charAt(0) + m.substr(2)));
            if (h = a.length - 2,
            0 > h)
                return n[0] = new g(a[0][d],0,0,a[-1 > h ? 0 : 1][d]),
                n;
            for (i = 0; h > i; i++)
                j = a[i][d],
                k = a[i + 1][d],
                n[i] = new g(j,0,0,k),
                e && (l = a[i + 2][d],
                b[i] = (b[i] || 0) + (k - j) * (k - j),
                c[i] = (c[i] || 0) + (l - k) * (l - k));
            return n[i] = new g(a[i][d],0,0,a[i + 1][d]),
            n
        }
          , l = function(a, f, g, i, l, m) {
            var n, o, p, q, r, s, t, u, v = {}, w = [], x = m || a[0];
            l = "string" == typeof l ? "," + l + "," : h,
            null == f && (f = 1);
            for (o in a[0])
                w.push(o);
            if (a.length > 1) {
                for (u = a[a.length - 1],
                t = !0,
                n = w.length; --n > -1; )
                    if (o = w[n],
                    Math.abs(x[o] - u[o]) > .05) {
                        t = !1;
                        break
                    }
                t && (a = a.concat(),
                m && a.unshift(m),
                a.push(a[1]),
                m = a[a.length - 3])
            }
            for (b.length = c.length = d.length = 0,
            n = w.length; --n > -1; )
                o = w[n],
                e[o] = -1 !== l.indexOf("," + o + ","),
                v[o] = k(a, o, e[o], m);
            for (n = b.length; --n > -1; )
                b[n] = Math.sqrt(b[n]),
                c[n] = Math.sqrt(c[n]);
            if (!i) {
                for (n = w.length; --n > -1; )
                    if (e[o])
                        for (p = v[w[n]],
                        s = p.length - 1,
                        q = 0; s > q; q++)
                            r = p[q + 1].da / c[q] + p[q].da / b[q],
                            d[q] = (d[q] || 0) + r * r;
                for (n = d.length; --n > -1; )
                    d[n] = Math.sqrt(d[n])
            }
            for (n = w.length,
            q = g ? 4 : 1; --n > -1; )
                o = w[n],
                p = v[o],
                j(p, f, g, i, e[o]),
                t && (p.splice(0, q),
                p.splice(p.length - q, q));
            return v
        }
          , m = function(a, b, c) {
            b = b || "soft";
            var d, e, f, h, i, j, k, l, m, n, o, p = {}, q = "cubic" === b ? 3 : 2, r = "soft" === b, s = [];
            if (r && c && (a = [c].concat(a)),
            null == a || a.length < q + 1)
                throw "invalid Bezier data";
            for (m in a[0])
                s.push(m);
            for (j = s.length; --j > -1; ) {
                for (m = s[j],
                p[m] = i = [],
                n = 0,
                l = a.length,
                k = 0; l > k; k++)
                    d = null == c ? a[k][m] : "string" == typeof (o = a[k][m]) && "=" === o.charAt(1) ? c[m] + Number(o.charAt(0) + o.substr(2)) : Number(o),
                    r && k > 1 && l - 1 > k && (i[n++] = (d + i[n - 2]) / 2),
                    i[n++] = d;
                for (l = n - q + 1,
                n = 0,
                k = 0; l > k; k += q)
                    d = i[k],
                    e = i[k + 1],
                    f = i[k + 2],
                    h = 2 === q ? 0 : i[k + 3],
                    i[n++] = o = 3 === q ? new g(d,e,f,h) : new g(d,(2 * e + d) / 3,(2 * e + f) / 3,f);
                i.length = n
            }
            return p
        }
          , n = function(a, b, c) {
            for (var d, e, f, g, h, i, j, k, l, m, n, o = 1 / c, p = a.length; --p > -1; )
                for (m = a[p],
                f = m.a,
                g = m.d - f,
                h = m.c - f,
                i = m.b - f,
                d = e = 0,
                k = 1; c >= k; k++)
                    j = o * k,
                    l = 1 - j,
                    d = e - (e = (j * j * g + 3 * l * (j * h + l * i)) * j),
                    n = p * c + k - 1,
                    b[n] = (b[n] || 0) + d * d
        }
          , o = function(a, b) {
            b = b >> 0 || 6;
            var c, d, e, f, g = [], h = [], i = 0, j = 0, k = b - 1, l = [], m = [];
            for (c in a)
                n(a[c], g, b);
            for (e = g.length,
            d = 0; e > d; d++)
                i += Math.sqrt(g[d]),
                f = d % b,
                m[f] = i,
                f === k && (j += i,
                f = d / b >> 0,
                l[f] = m,
                h[f] = j,
                i = 0,
                m = []);
            return {
                length: j,
                lengths: h,
                segments: l
            }
        }
          , p = _gsScope._gsDefine.plugin({
            propName: "bezier",
            priority: -1,
            version: "1.3.4",
            API: 2,
            global: !0,
            init: function(a, b, c) {
                this._target = a,
                b instanceof Array && (b = {
                    values: b
                }),
                this._func = {},
                this._round = {},
                this._props = [],
                this._timeRes = null == b.timeResolution ? 6 : parseInt(b.timeResolution, 10);
                var d, e, f, g, h, i = b.values || [], j = {}, k = i[0], n = b.autoRotate || c.vars.orientToBezier;
                this._autoRotate = n ? n instanceof Array ? n : [["x", "y", "rotation", n === !0 ? 0 : Number(n) || 0]] : null;
                for (d in k)
                    this._props.push(d);
                for (f = this._props.length; --f > -1; )
                    d = this._props[f],
                    this._overwriteProps.push(d),
                    e = this._func[d] = "function" == typeof a[d],
                    j[d] = e ? a[d.indexOf("set") || "function" != typeof a["get" + d.substr(3)] ? d : "get" + d.substr(3)]() : parseFloat(a[d]),
                    h || j[d] !== i[0][d] && (h = j);
                if (this._beziers = "cubic" !== b.type && "quadratic" !== b.type && "soft" !== b.type ? l(i, isNaN(b.curviness) ? 1 : b.curviness, !1, "thruBasic" === b.type, b.correlate, h) : m(i, b.type, j),
                this._segCount = this._beziers[d].length,
                this._timeRes) {
                    var p = o(this._beziers, this._timeRes);
                    this._length = p.length,
                    this._lengths = p.lengths,
                    this._segments = p.segments,
                    this._l1 = this._li = this._s1 = this._si = 0,
                    this._l2 = this._lengths[0],
                    this._curSeg = this._segments[0],
                    this._s2 = this._curSeg[0],
                    this._prec = 1 / this._curSeg.length
                }
                if (n = this._autoRotate)
                    for (this._initialRotations = [],
                    n[0]instanceof Array || (this._autoRotate = n = [n]),
                    f = n.length; --f > -1; ) {
                        for (g = 0; 3 > g; g++)
                            d = n[f][g],
                            this._func[d] = "function" == typeof a[d] ? a[d.indexOf("set") || "function" != typeof a["get" + d.substr(3)] ? d : "get" + d.substr(3)] : !1;
                        d = n[f][2],
                        this._initialRotations[f] = this._func[d] ? this._func[d].call(this._target) : this._target[d]
                    }
                return this._startRatio = c.vars.runBackwards ? 1 : 0,
                !0
            },
            set: function(b) {
                var c, d, e, f, g, h, i, j, k, l, m = this._segCount, n = this._func, o = this._target, p = b !== this._startRatio;
                if (this._timeRes) {
                    if (k = this._lengths,
                    l = this._curSeg,
                    b *= this._length,
                    e = this._li,
                    b > this._l2 && m - 1 > e) {
                        for (j = m - 1; j > e && (this._l2 = k[++e]) <= b; )
                            ;
                        this._l1 = k[e - 1],
                        this._li = e,
                        this._curSeg = l = this._segments[e],
                        this._s2 = l[this._s1 = this._si = 0]
                    } else if (b < this._l1 && e > 0) {
                        for (; e > 0 && (this._l1 = k[--e]) >= b; )
                            ;
                        0 === e && b < this._l1 ? this._l1 = 0 : e++,
                        this._l2 = k[e],
                        this._li = e,
                        this._curSeg = l = this._segments[e],
                        this._s1 = l[(this._si = l.length - 1) - 1] || 0,
                        this._s2 = l[this._si]
                    }
                    if (c = e,
                    b -= this._l1,
                    e = this._si,
                    b > this._s2 && e < l.length - 1) {
                        for (j = l.length - 1; j > e && (this._s2 = l[++e]) <= b; )
                            ;
                        this._s1 = l[e - 1],
                        this._si = e
                    } else if (b < this._s1 && e > 0) {
                        for (; e > 0 && (this._s1 = l[--e]) >= b; )
                            ;
                        0 === e && b < this._s1 ? this._s1 = 0 : e++,
                        this._s2 = l[e],
                        this._si = e
                    }
                    h = (e + (b - this._s1) / (this._s2 - this._s1)) * this._prec
                } else
                    c = 0 > b ? 0 : b >= 1 ? m - 1 : m * b >> 0,
                    h = (b - c * (1 / m)) * m;
                for (d = 1 - h,
                e = this._props.length; --e > -1; )
                    f = this._props[e],
                    g = this._beziers[f][c],
                    i = (h * h * g.da + 3 * d * (h * g.ca + d * g.ba)) * h + g.a,
                    this._round[f] && (i = Math.round(i)),
                    n[f] ? o[f](i) : o[f] = i;
                if (this._autoRotate) {
                    var q, r, s, t, u, v, w, x = this._autoRotate;
                    for (e = x.length; --e > -1; )
                        f = x[e][2],
                        v = x[e][3] || 0,
                        w = x[e][4] === !0 ? 1 : a,
                        g = this._beziers[x[e][0]],
                        q = this._beziers[x[e][1]],
                        g && q && (g = g[c],
                        q = q[c],
                        r = g.a + (g.b - g.a) * h,
                        t = g.b + (g.c - g.b) * h,
                        r += (t - r) * h,
                        t += (g.c + (g.d - g.c) * h - t) * h,
                        s = q.a + (q.b - q.a) * h,
                        u = q.b + (q.c - q.b) * h,
                        s += (u - s) * h,
                        u += (q.c + (q.d - q.c) * h - u) * h,
                        i = p ? Math.atan2(u - s, t - r) * w + v : this._initialRotations[e],
                        n[f] ? o[f](i) : o[f] = i)
                }
            }
        })
          , q = p.prototype;
        p.bezierThrough = l,
        p.cubicToQuadratic = i,
        p._autoCSS = !0,
        p.quadraticToCubic = function(a, b, c) {
            return new g(a,(2 * b + a) / 3,(2 * b + c) / 3,c)
        }
        ,
        p._cssRegister = function() {
            var a = f.CSSPlugin;
            if (a) {
                var b = a._internals
                  , c = b._parseToProxy
                  , d = b._setPluginRatio
                  , e = b.CSSPropTween;
                b._registerComplexSpecialProp("bezier", {
                    parser: function(a, b, f, g, h, i) {
                        b instanceof Array && (b = {
                            values: b
                        }),
                        i = new p;
                        var j, k, l, m = b.values, n = m.length - 1, o = [], q = {};
                        if (0 > n)
                            return h;
                        for (j = 0; n >= j; j++)
                            l = c(a, m[j], g, h, i, n !== j),
                            o[j] = l.end;
                        for (k in b)
                            q[k] = b[k];
                        return q.values = o,
                        h = new e(a,"bezier",0,0,l.pt,2),
                        h.data = l,
                        h.plugin = i,
                        h.setRatio = d,
                        0 === q.autoRotate && (q.autoRotate = !0),
                        !q.autoRotate || q.autoRotate instanceof Array || (j = q.autoRotate === !0 ? 0 : Number(q.autoRotate),
                        q.autoRotate = null != l.end.left ? [["left", "top", "rotation", j, !1]] : null != l.end.x ? [["x", "y", "rotation", j, !1]] : !1),
                        q.autoRotate && (g._transform || g._enableTransforms(!1),
                        l.autoRotate = g._target._gsTransform),
                        i._onInitTween(l.proxy, q, g._tween),
                        h
                    }
                })
            }
        }
        ,
        q._roundProps = function(a, b) {
            for (var c = this._overwriteProps, d = c.length; --d > -1; )
                (a[c[d]] || a.bezier || a.bezierThrough) && (this._round[c[d]] = b)
        }
        ,
        q._kill = function(a) {
            var b, c, d = this._props;
            for (b in this._beziers)
                if (b in a)
                    for (delete this._beziers[b],
                    delete this._func[b],
                    c = d.length; --c > -1; )
                        d[c] === b && d.splice(c, 1);
            return this._super._kill.call(this, a)
        }
    }(),
    _gsScope._gsDefine("plugins.CSSPlugin", ["plugins.TweenPlugin", "TweenLite"], function(a, b) {
        var c, d, e, f, g = function() {
            a.call(this, "css"),
            this._overwriteProps.length = 0,
            this.setRatio = g.prototype.setRatio
        }, h = _gsScope._gsDefine.globals, i = {}, j = g.prototype = new a("css");
        j.constructor = g,
        g.version = "1.18.2",
        g.API = 2,
        g.defaultTransformPerspective = 0,
        g.defaultSkewType = "compensated",
        g.defaultSmoothOrigin = !0,
        j = "px",
        g.suffixMap = {
            top: j,
            right: j,
            bottom: j,
            left: j,
            width: j,
            height: j,
            fontSize: j,
            padding: j,
            margin: j,
            perspective: j,
            lineHeight: ""
        };
        var k, l, m, n, o, p, q = /(?:\d|\-\d|\.\d|\-\.\d)+/g, r = /(?:\d|\-\d|\.\d|\-\.\d|\+=\d|\-=\d|\+=.\d|\-=\.\d)+/g, s = /(?:\+=|\-=|\-|\b)[\d\-\.]+[a-zA-Z0-9]*(?:%|\b)/gi, t = /(?![+-]?\d*\.?\d+|[+-]|e[+-]\d+)[^0-9]/g, u = /(?:\d|\-|\+|=|#|\.)*/g, v = /opacity *= *([^)]*)/i, w = /opacity:([^;]*)/i, x = /alpha\(opacity *=.+?\)/i, y = /^(rgb|hsl)/, z = /([A-Z])/g, A = /-([a-z])/gi, B = /(^(?:url\(\"|url\())|(?:(\"\))$|\)$)/gi, C = function(a, b) {
            return b.toUpperCase()
        }, D = /(?:Left|Right|Width)/i, E = /(M11|M12|M21|M22)=[\d\-\.e]+/gi, F = /progid\:DXImageTransform\.Microsoft\.Matrix\(.+?\)/i, G = /,(?=[^\)]*(?:\(|$))/gi, H = Math.PI / 180, I = 180 / Math.PI, J = {}, K = document, L = function(a) {
            return K.createElementNS ? K.createElementNS("http://www.w3.org/1999/xhtml", a) : K.createElement(a)
        }, M = L("div"), N = L("img"), O = g._internals = {
            _specialProps: i
        }, P = navigator.userAgent, Q = function() {
            var a = P.indexOf("Android")
              , b = L("a");
            return m = -1 !== P.indexOf("Safari") && -1 === P.indexOf("Chrome") && (-1 === a || Number(P.substr(a + 8, 1)) > 3),
            o = m && Number(P.substr(P.indexOf("Version/") + 8, 1)) < 6,
            n = -1 !== P.indexOf("Firefox"),
            (/MSIE ([0-9]{1,}[\.0-9]{0,})/.exec(P) || /Trident\/.*rv:([0-9]{1,}[\.0-9]{0,})/.exec(P)) && (p = parseFloat(RegExp.$1)),
            b ? (b.style.cssText = "top:1px;opacity:.55;",
            /^0.55/.test(b.style.opacity)) : !1
        }(), R = function(a) {
            return v.test("string" == typeof a ? a : (a.currentStyle ? a.currentStyle.filter : a.style.filter) || "") ? parseFloat(RegExp.$1) / 100 : 1
        }, S = function(a) {
            window.console && console.log(a)
        }, T = "", U = "", V = function(a, b) {
            b = b || M;
            var c, d, e = b.style;
            if (void 0 !== e[a])
                return a;
            for (a = a.charAt(0).toUpperCase() + a.substr(1),
            c = ["O", "Moz", "ms", "Ms", "Webkit"],
            d = 5; --d > -1 && void 0 === e[c[d] + a]; )
                ;
            return d >= 0 ? (U = 3 === d ? "ms" : c[d],
            T = "-" + U.toLowerCase() + "-",
            U + a) : null
        }, W = K.defaultView ? K.defaultView.getComputedStyle : function() {}
        , X = g.getStyle = function(a, b, c, d, e) {
            var f;
            return Q || "opacity" !== b ? (!d && a.style[b] ? f = a.style[b] : (c = c || W(a)) ? f = c[b] || c.getPropertyValue(b) || c.getPropertyValue(b.replace(z, "-$1").toLowerCase()) : a.currentStyle && (f = a.currentStyle[b]),
            null == e || f && "none" !== f && "auto" !== f && "auto auto" !== f ? f : e) : R(a)
        }
        , Y = O.convertToPixels = function(a, c, d, e, f) {
            if ("px" === e || !e)
                return d;
            if ("auto" === e || !d)
                return 0;
            var h, i, j, k = D.test(c), l = a, m = M.style, n = 0 > d;
            if (n && (d = -d),
            "%" === e && -1 !== c.indexOf("border"))
                h = d / 100 * (k ? a.clientWidth : a.clientHeight);
            else {
                if (m.cssText = "border:0 solid red;position:" + X(a, "position") + ";line-height:0;",
                "%" !== e && l.appendChild && "v" !== e.charAt(0) && "rem" !== e)
                    m[k ? "borderLeftWidth" : "borderTopWidth"] = d + e;
                else {
                    if (l = a.parentNode || K.body,
                    i = l._gsCache,
                    j = b.ticker.frame,
                    i && k && i.time === j)
                        return i.width * d / 100;
                    m[k ? "width" : "height"] = d + e
                }
                l.appendChild(M),
                h = parseFloat(M[k ? "offsetWidth" : "offsetHeight"]),
                l.removeChild(M),
                k && "%" === e && g.cacheWidths !== !1 && (i = l._gsCache = l._gsCache || {},
                i.time = j,
                i.width = h / d * 100),
                0 !== h || f || (h = Y(a, c, d, e, !0))
            }
            return n ? -h : h
        }
        , Z = O.calculateOffset = function(a, b, c) {
            if ("absolute" !== X(a, "position", c))
                return 0;
            var d = "left" === b ? "Left" : "Top"
              , e = X(a, "margin" + d, c);
            return a["offset" + d] - (Y(a, b, parseFloat(e), e.replace(u, "")) || 0)
        }
        , $ = function(a, b) {
            var c, d, e, f = {};
            if (b = b || W(a, null))
                if (c = b.length)
                    for (; --c > -1; )
                        e = b[c],
                        (-1 === e.indexOf("-transform") || za === e) && (f[e.replace(A, C)] = b.getPropertyValue(e));
                else
                    for (c in b)
                        (-1 === c.indexOf("Transform") || ya === c) && (f[c] = b[c]);
            else if (b = a.currentStyle || a.style)
                for (c in b)
                    "string" == typeof c && void 0 === f[c] && (f[c.replace(A, C)] = b[c]);
            return Q || (f.opacity = R(a)),
            d = La(a, b, !1),
            f.rotation = d.rotation,
            f.skewX = d.skewX,
            f.scaleX = d.scaleX,
            f.scaleY = d.scaleY,
            f.x = d.x,
            f.y = d.y,
            Ba && (f.z = d.z,
            f.rotationX = d.rotationX,
            f.rotationY = d.rotationY,
            f.scaleZ = d.scaleZ),
            f.filters && delete f.filters,
            f
        }, _ = function(a, b, c, d, e) {
            var f, g, h, i = {}, j = a.style;
            for (g in c)
                "cssText" !== g && "length" !== g && isNaN(g) && (b[g] !== (f = c[g]) || e && e[g]) && -1 === g.indexOf("Origin") && ("number" == typeof f || "string" == typeof f) && (i[g] = "auto" !== f || "left" !== g && "top" !== g ? "" !== f && "auto" !== f && "none" !== f || "string" != typeof b[g] || "" === b[g].replace(t, "") ? f : 0 : Z(a, g),
                void 0 !== j[g] && (h = new oa(j,g,j[g],h)));
            if (d)
                for (g in d)
                    "className" !== g && (i[g] = d[g]);
            return {
                difs: i,
                firstMPT: h
            }
        }, aa = {
            width: ["Left", "Right"],
            height: ["Top", "Bottom"]
        }, ba = ["marginLeft", "marginRight", "marginTop", "marginBottom"], ca = function(a, b, c) {
            var d = parseFloat("width" === b ? a.offsetWidth : a.offsetHeight)
              , e = aa[b]
              , f = e.length;
            for (c = c || W(a, null); --f > -1; )
                d -= parseFloat(X(a, "padding" + e[f], c, !0)) || 0,
                d -= parseFloat(X(a, "border" + e[f] + "Width", c, !0)) || 0;
            return d
        }, da = function(a, b) {
            if ("contain" === a || "auto" === a || "auto auto" === a)
                return a + " ";
            (null == a || "" === a) && (a = "0 0");
            var c = a.split(" ")
              , d = -1 !== a.indexOf("left") ? "0%" : -1 !== a.indexOf("right") ? "100%" : c[0]
              , e = -1 !== a.indexOf("top") ? "0%" : -1 !== a.indexOf("bottom") ? "100%" : c[1];
            return null == e ? e = "center" === d ? "50%" : "0" : "center" === e && (e = "50%"),
            ("center" === d || isNaN(parseFloat(d)) && -1 === (d + "").indexOf("=")) && (d = "50%"),
            a = d + " " + e + (c.length > 2 ? " " + c[2] : ""),
            b && (b.oxp = -1 !== d.indexOf("%"),
            b.oyp = -1 !== e.indexOf("%"),
            b.oxr = "=" === d.charAt(1),
            b.oyr = "=" === e.charAt(1),
            b.ox = parseFloat(d.replace(t, "")),
            b.oy = parseFloat(e.replace(t, "")),
            b.v = a),
            b || a
        }, ea = function(a, b) {
            return "string" == typeof a && "=" === a.charAt(1) ? parseInt(a.charAt(0) + "1", 10) * parseFloat(a.substr(2)) : parseFloat(a) - parseFloat(b)
        }, fa = function(a, b) {
            return null == a ? b : "string" == typeof a && "=" === a.charAt(1) ? parseInt(a.charAt(0) + "1", 10) * parseFloat(a.substr(2)) + b : parseFloat(a)
        }, ga = function(a, b, c, d) {
            var e, f, g, h, i, j = 1e-6;
            return null == a ? h = b : "number" == typeof a ? h = a : (e = 360,
            f = a.split("_"),
            i = "=" === a.charAt(1),
            g = (i ? parseInt(a.charAt(0) + "1", 10) * parseFloat(f[0].substr(2)) : parseFloat(f[0])) * (-1 === a.indexOf("rad") ? 1 : I) - (i ? 0 : b),
            f.length && (d && (d[c] = b + g),
            -1 !== a.indexOf("short") && (g %= e,
            g !== g % (e / 2) && (g = 0 > g ? g + e : g - e)),
            -1 !== a.indexOf("_cw") && 0 > g ? g = (g + 9999999999 * e) % e - (g / e | 0) * e : -1 !== a.indexOf("ccw") && g > 0 && (g = (g - 9999999999 * e) % e - (g / e | 0) * e)),
            h = b + g),
            j > h && h > -j && (h = 0),
            h
        }, ha = {
            aqua: [0, 255, 255],
            lime: [0, 255, 0],
            silver: [192, 192, 192],
            black: [0, 0, 0],
            maroon: [128, 0, 0],
            teal: [0, 128, 128],
            blue: [0, 0, 255],
            navy: [0, 0, 128],
            white: [255, 255, 255],
            fuchsia: [255, 0, 255],
            olive: [128, 128, 0],
            yellow: [255, 255, 0],
            orange: [255, 165, 0],
            gray: [128, 128, 128],
            purple: [128, 0, 128],
            green: [0, 128, 0],
            red: [255, 0, 0],
            pink: [255, 192, 203],
            cyan: [0, 255, 255],
            transparent: [255, 255, 255, 0]
        }, ia = function(a, b, c) {
            return a = 0 > a ? a + 1 : a > 1 ? a - 1 : a,
            255 * (1 > 6 * a ? b + (c - b) * a * 6 : .5 > a ? c : 2 > 3 * a ? b + (c - b) * (2 / 3 - a) * 6 : b) + .5 | 0
        }, ja = g.parseColor = function(a, b) {
            var c, d, e, f, g, h, i, j, k, l, m;
            if (a)
                if ("number" == typeof a)
                    c = [a >> 16, a >> 8 & 255, 255 & a];
                else {
                    if ("," === a.charAt(a.length - 1) && (a = a.substr(0, a.length - 1)),
                    ha[a])
                        c = ha[a];
                    else if ("#" === a.charAt(0))
                        4 === a.length && (d = a.charAt(1),
                        e = a.charAt(2),
                        f = a.charAt(3),
                        a = "#" + d + d + e + e + f + f),
                        a = parseInt(a.substr(1), 16),
                        c = [a >> 16, a >> 8 & 255, 255 & a];
                    else if ("hsl" === a.substr(0, 3))
                        if (c = m = a.match(q),
                        b) {
                            if (-1 !== a.indexOf("="))
                                return a.match(r)
                        } else
                            g = Number(c[0]) % 360 / 360,
                            h = Number(c[1]) / 100,
                            i = Number(c[2]) / 100,
                            e = .5 >= i ? i * (h + 1) : i + h - i * h,
                            d = 2 * i - e,
                            c.length > 3 && (c[3] = Number(a[3])),
                            c[0] = ia(g + 1 / 3, d, e),
                            c[1] = ia(g, d, e),
                            c[2] = ia(g - 1 / 3, d, e);
                    else
                        c = a.match(q) || ha.transparent;
                    c[0] = Number(c[0]),
                    c[1] = Number(c[1]),
                    c[2] = Number(c[2]),
                    c.length > 3 && (c[3] = Number(c[3]))
                }
            else
                c = ha.black;
            return b && !m && (d = c[0] / 255,
            e = c[1] / 255,
            f = c[2] / 255,
            j = Math.max(d, e, f),
            k = Math.min(d, e, f),
            i = (j + k) / 2,
            j === k ? g = h = 0 : (l = j - k,
            h = i > .5 ? l / (2 - j - k) : l / (j + k),
            g = j === d ? (e - f) / l + (f > e ? 6 : 0) : j === e ? (f - d) / l + 2 : (d - e) / l + 4,
            g *= 60),
            c[0] = g + .5 | 0,
            c[1] = 100 * h + .5 | 0,
            c[2] = 100 * i + .5 | 0),
            c
        }
        , ka = function(a, b) {
            var c, d, e, f = a.match(la) || [], g = 0, h = f.length ? "" : a;
            for (c = 0; c < f.length; c++)
                d = f[c],
                e = a.substr(g, a.indexOf(d, g) - g),
                g += e.length + d.length,
                d = ja(d, b),
                3 === d.length && d.push(1),
                h += e + (b ? "hsla(" + d[0] + "," + d[1] + "%," + d[2] + "%," + d[3] : "rgba(" + d.join(",")) + ")";
            return h
        }, la = "(?:\\b(?:(?:rgb|rgba|hsl|hsla)\\(.+?\\))|\\B#(?:[0-9a-f]{3}){1,2}\\b";
        for (j in ha)
            la += "|" + j + "\\b";
        la = new RegExp(la + ")","gi"),
        g.colorStringFilter = function(a) {
            var b, c = a[0] + a[1];
            la.lastIndex = 0,
            la.test(c) && (b = -1 !== c.indexOf("hsl(") || -1 !== c.indexOf("hsla("),
            a[0] = ka(a[0], b),
            a[1] = ka(a[1], b))
        }
        ,
        b.defaultStringFilter || (b.defaultStringFilter = g.colorStringFilter);
        var ma = function(a, b, c, d) {
            if (null == a)
                return function(a) {
                    return a
                }
                ;
            var e, f = b ? (a.match(la) || [""])[0] : "", g = a.split(f).join("").match(s) || [], h = a.substr(0, a.indexOf(g[0])), i = ")" === a.charAt(a.length - 1) ? ")" : "", j = -1 !== a.indexOf(" ") ? " " : ",", k = g.length, l = k > 0 ? g[0].replace(q, "") : "";
            return k ? e = b ? function(a) {
                var b, m, n, o;
                if ("number" == typeof a)
                    a += l;
                else if (d && G.test(a)) {
                    for (o = a.replace(G, "|").split("|"),
                    n = 0; n < o.length; n++)
                        o[n] = e(o[n]);
                    return o.join(",")
                }
                if (b = (a.match(la) || [f])[0],
                m = a.split(b).join("").match(s) || [],
                n = m.length,
                k > n--)
                    for (; ++n < k; )
                        m[n] = c ? m[(n - 1) / 2 | 0] : g[n];
                return h + m.join(j) + j + b + i + (-1 !== a.indexOf("inset") ? " inset" : "")
            }
            : function(a) {
                var b, f, m;
                if ("number" == typeof a)
                    a += l;
                else if (d && G.test(a)) {
                    for (f = a.replace(G, "|").split("|"),
                    m = 0; m < f.length; m++)
                        f[m] = e(f[m]);
                    return f.join(",")
                }
                if (b = a.match(s) || [],
                m = b.length,
                k > m--)
                    for (; ++m < k; )
                        b[m] = c ? b[(m - 1) / 2 | 0] : g[m];
                return h + b.join(j) + i
            }
            : function(a) {
                return a
            }
        }
          , na = function(a) {
            return a = a.split(","),
            function(b, c, d, e, f, g, h) {
                var i, j = (c + "").split(" ");
                for (h = {},
                i = 0; 4 > i; i++)
                    h[a[i]] = j[i] = j[i] || j[(i - 1) / 2 >> 0];
                return e.parse(b, h, f, g)
            }
        }
          , oa = (O._setPluginRatio = function(a) {
            this.plugin.setRatio(a);
            for (var b, c, d, e, f, g = this.data, h = g.proxy, i = g.firstMPT, j = 1e-6; i; )
                b = h[i.v],
                i.r ? b = Math.round(b) : j > b && b > -j && (b = 0),
                i.t[i.p] = b,
                i = i._next;
            if (g.autoRotate && (g.autoRotate.rotation = h.rotation),
            1 === a || 0 === a)
                for (i = g.firstMPT,
                f = 1 === a ? "e" : "b"; i; ) {
                    if (c = i.t,
                    c.type) {
                        if (1 === c.type) {
                            for (e = c.xs0 + c.s + c.xs1,
                            d = 1; d < c.l; d++)
                                e += c["xn" + d] + c["xs" + (d + 1)];
                            c[f] = e
                        }
                    } else
                        c[f] = c.s + c.xs0;
                    i = i._next
                }
        }
        ,
        function(a, b, c, d, e) {
            this.t = a,
            this.p = b,
            this.v = c,
            this.r = e,
            d && (d._prev = this,
            this._next = d)
        }
        )
          , pa = (O._parseToProxy = function(a, b, c, d, e, f) {
            var g, h, i, j, k, l = d, m = {}, n = {}, o = c._transform, p = J;
            for (c._transform = null,
            J = b,
            d = k = c.parse(a, b, d, e),
            J = p,
            f && (c._transform = o,
            l && (l._prev = null,
            l._prev && (l._prev._next = null))); d && d !== l; ) {
                if (d.type <= 1 && (h = d.p,
                n[h] = d.s + d.c,
                m[h] = d.s,
                f || (j = new oa(d,"s",h,j,d.r),
                d.c = 0),
                1 === d.type))
                    for (g = d.l; --g > 0; )
                        i = "xn" + g,
                        h = d.p + "_" + i,
                        n[h] = d.data[i],
                        m[h] = d[i],
                        f || (j = new oa(d,i,h,j,d.rxp[i]));
                d = d._next
            }
            return {
                proxy: m,
                end: n,
                firstMPT: j,
                pt: k
            }
        }
        ,
        O.CSSPropTween = function(a, b, d, e, g, h, i, j, k, l, m) {
            this.t = a,
            this.p = b,
            this.s = d,
            this.c = e,
            this.n = i || b,
            a instanceof pa || f.push(this.n),
            this.r = j,
            this.type = h || 0,
            k && (this.pr = k,
            c = !0),
            this.b = void 0 === l ? d : l,
            this.e = void 0 === m ? d + e : m,
            g && (this._next = g,
            g._prev = this)
        }
        )
          , qa = function(a, b, c, d, e, f) {
            var g = new pa(a,b,c,d - c,e,-1,f);
            return g.b = c,
            g.e = g.xs0 = d,
            g
        }
          , ra = g.parseComplex = function(a, b, c, d, e, f, g, h, i, j) {
            c = c || f || "",
            g = new pa(a,b,0,0,g,j ? 2 : 1,null,!1,h,c,d),
            d += "";
            var l, m, n, o, p, s, t, u, v, w, x, y, z, A = c.split(", ").join(",").split(" "), B = d.split(", ").join(",").split(" "), C = A.length, D = k !== !1;
            for ((-1 !== d.indexOf(",") || -1 !== c.indexOf(",")) && (A = A.join(" ").replace(G, ", ").split(" "),
            B = B.join(" ").replace(G, ", ").split(" "),
            C = A.length),
            C !== B.length && (A = (f || "").split(" "),
            C = A.length),
            g.plugin = i,
            g.setRatio = j,
            la.lastIndex = 0,
            l = 0; C > l; l++)
                if (o = A[l],
                p = B[l],
                u = parseFloat(o),
                u || 0 === u)
                    g.appendXtra("", u, ea(p, u), p.replace(r, ""), D && -1 !== p.indexOf("px"), !0);
                else if (e && la.test(o))
                    y = "," === p.charAt(p.length - 1) ? ")," : ")",
                    z = -1 !== p.indexOf("hsl") && Q,
                    o = ja(o, z),
                    p = ja(p, z),
                    v = o.length + p.length > 6,
                    v && !Q && 0 === p[3] ? (g["xs" + g.l] += g.l ? " transparent" : "transparent",
                    g.e = g.e.split(B[l]).join("transparent")) : (Q || (v = !1),
                    z ? g.appendXtra(v ? "hsla(" : "hsl(", o[0], ea(p[0], o[0]), ",", !1, !0).appendXtra("", o[1], ea(p[1], o[1]), "%,", !1).appendXtra("", o[2], ea(p[2], o[2]), v ? "%," : "%" + y, !1) : g.appendXtra(v ? "rgba(" : "rgb(", o[0], p[0] - o[0], ",", !0, !0).appendXtra("", o[1], p[1] - o[1], ",", !0).appendXtra("", o[2], p[2] - o[2], v ? "," : y, !0),
                    v && (o = o.length < 4 ? 1 : o[3],
                    g.appendXtra("", o, (p.length < 4 ? 1 : p[3]) - o, y, !1))),
                    la.lastIndex = 0;
                else if (s = o.match(q)) {
                    if (t = p.match(r),
                    !t || t.length !== s.length)
                        return g;
                    for (n = 0,
                    m = 0; m < s.length; m++)
                        x = s[m],
                        w = o.indexOf(x, n),
                        g.appendXtra(o.substr(n, w - n), Number(x), ea(t[m], x), "", D && "px" === o.substr(w + x.length, 2), 0 === m),
                        n = w + x.length;
                    g["xs" + g.l] += o.substr(n)
                } else
                    g["xs" + g.l] += g.l ? " " + p : p;
            if (-1 !== d.indexOf("=") && g.data) {
                for (y = g.xs0 + g.data.s,
                l = 1; l < g.l; l++)
                    y += g["xs" + l] + g.data["xn" + l];
                g.e = y + g["xs" + l]
            }
            return g.l || (g.type = -1,
            g.xs0 = g.e),
            g.xfirst || g
        }
          , sa = 9;
        for (j = pa.prototype,
        j.l = j.pr = 0; --sa > 0; )
            j["xn" + sa] = 0,
            j["xs" + sa] = "";
        j.xs0 = "",
        j._next = j._prev = j.xfirst = j.data = j.plugin = j.setRatio = j.rxp = null,
        j.appendXtra = function(a, b, c, d, e, f) {
            var g = this
              , h = g.l;
            return g["xs" + h] += f && h ? " " + a : a || "",
            c || 0 === h || g.plugin ? (g.l++,
            g.type = g.setRatio ? 2 : 1,
            g["xs" + g.l] = d || "",
            h > 0 ? (g.data["xn" + h] = b + c,
            g.rxp["xn" + h] = e,
            g["xn" + h] = b,
            g.plugin || (g.xfirst = new pa(g,"xn" + h,b,c,g.xfirst || g,0,g.n,e,g.pr),
            g.xfirst.xs0 = 0),
            g) : (g.data = {
                s: b + c
            },
            g.rxp = {},
            g.s = b,
            g.c = c,
            g.r = e,
            g)) : (g["xs" + h] += b + (d || ""),
            g)
        }
        ;
        var ta = function(a, b) {
            b = b || {},
            this.p = b.prefix ? V(a) || a : a,
            i[a] = i[this.p] = this,
            this.format = b.formatter || ma(b.defaultValue, b.color, b.collapsible, b.multi),
            b.parser && (this.parse = b.parser),
            this.clrs = b.color,
            this.multi = b.multi,
            this.keyword = b.keyword,
            this.dflt = b.defaultValue,
            this.pr = b.priority || 0
        }
          , ua = O._registerComplexSpecialProp = function(a, b, c) {
            "object" != typeof b && (b = {
                parser: c
            });
            var d, e, f = a.split(","), g = b.defaultValue;
            for (c = c || [g],
            d = 0; d < f.length; d++)
                b.prefix = 0 === d && b.prefix,
                b.defaultValue = c[d] || g,
                e = new ta(f[d],b)
        }
          , va = function(a) {
            if (!i[a]) {
                var b = a.charAt(0).toUpperCase() + a.substr(1) + "Plugin";
                ua(a, {
                    parser: function(a, c, d, e, f, g, j) {
                        var k = h.com.greensock.plugins[b];
                        return k ? (k._cssRegister(),
                        i[d].parse(a, c, d, e, f, g, j)) : (S("Error: " + b + " js file not loaded."),
                        f)
                    }
                })
            }
        };
        j = ta.prototype,
        j.parseComplex = function(a, b, c, d, e, f) {
            var g, h, i, j, k, l, m = this.keyword;
            if (this.multi && (G.test(c) || G.test(b) ? (h = b.replace(G, "|").split("|"),
            i = c.replace(G, "|").split("|")) : m && (h = [b],
            i = [c])),
            i) {
                for (j = i.length > h.length ? i.length : h.length,
                g = 0; j > g; g++)
                    b = h[g] = h[g] || this.dflt,
                    c = i[g] = i[g] || this.dflt,
                    m && (k = b.indexOf(m),
                    l = c.indexOf(m),
                    k !== l && (-1 === l ? h[g] = h[g].split(m).join("") : -1 === k && (h[g] += " " + m)));
                b = h.join(", "),
                c = i.join(", ")
            }
            return ra(a, this.p, b, c, this.clrs, this.dflt, d, this.pr, e, f)
        }
        ,
        j.parse = function(a, b, c, d, f, g, h) {
            return this.parseComplex(a.style, this.format(X(a, this.p, e, !1, this.dflt)), this.format(b), f, g)
        }
        ,
        g.registerSpecialProp = function(a, b, c) {
            ua(a, {
                parser: function(a, d, e, f, g, h, i) {
                    var j = new pa(a,e,0,0,g,2,e,!1,c);
                    return j.plugin = h,
                    j.setRatio = b(a, d, f._tween, e),
                    j
                },
                priority: c
            })
        }
        ,
        g.useSVGTransformAttr = m || n;
        var wa, xa = "scaleX,scaleY,scaleZ,x,y,z,skewX,skewY,rotation,rotationX,rotationY,perspective,xPercent,yPercent".split(","), ya = V("transform"), za = T + "transform", Aa = V("transformOrigin"), Ba = null !== V("perspective"), Ca = O.Transform = function() {
            this.perspective = parseFloat(g.defaultTransformPerspective) || 0,
            this.force3D = g.defaultForce3D !== !1 && Ba ? g.defaultForce3D || "auto" : !1
        }
        , Da = window.SVGElement, Ea = function(a, b, c) {
            var d, e = K.createElementNS("http://www.w3.org/2000/svg", a), f = /([a-z])([A-Z])/g;
            for (d in c)
                e.setAttributeNS(null, d.replace(f, "$1-$2").toLowerCase(), c[d]);
            return b.appendChild(e),
            e
        }, Fa = K.documentElement, Ga = function() {
            var a, b, c, d = p || /Android/i.test(P) && !window.chrome;
            return K.createElementNS && !d && (a = Ea("svg", Fa),
            b = Ea("rect", a, {
                width: 100,
                height: 50,
                x: 100
            }),
            c = b.getBoundingClientRect().width,
            b.style[Aa] = "50% 50%",
            b.style[ya] = "scaleX(0.5)",
            d = c === b.getBoundingClientRect().width && !(n && Ba),
            Fa.removeChild(a)),
            d
        }(), Ha = function(a, b, c, d, e) {
            var f, h, i, j, k, l, m, n, o, p, q, r, s, t, u = a._gsTransform, v = Ka(a, !0);
            u && (s = u.xOrigin,
            t = u.yOrigin),
            (!d || (f = d.split(" ")).length < 2) && (m = a.getBBox(),
            b = da(b).split(" "),
            f = [(-1 !== b[0].indexOf("%") ? parseFloat(b[0]) / 100 * m.width : parseFloat(b[0])) + m.x, (-1 !== b[1].indexOf("%") ? parseFloat(b[1]) / 100 * m.height : parseFloat(b[1])) + m.y]),
            c.xOrigin = j = parseFloat(f[0]),
            c.yOrigin = k = parseFloat(f[1]),
            d && v !== Ja && (l = v[0],
            m = v[1],
            n = v[2],
            o = v[3],
            p = v[4],
            q = v[5],
            r = l * o - m * n,
            h = j * (o / r) + k * (-n / r) + (n * q - o * p) / r,
            i = j * (-m / r) + k * (l / r) - (l * q - m * p) / r,
            j = c.xOrigin = f[0] = h,
            k = c.yOrigin = f[1] = i),
            u && (e || e !== !1 && g.defaultSmoothOrigin !== !1 ? (h = j - s,
            i = k - t,
            u.xOffset += h * v[0] + i * v[2] - h,
            u.yOffset += h * v[1] + i * v[3] - i) : u.xOffset = u.yOffset = 0),
            a.setAttribute("data-svg-origin", f.join(" "))
        }, Ia = function(a) {
            return !!(Da && "function" == typeof a.getBBox && a.getCTM && (!a.parentNode || a.parentNode.getBBox && a.parentNode.getCTM))
        }, Ja = [1, 0, 0, 1, 0, 0], Ka = function(a, b) {
            var c, d, e, f, g, h = a._gsTransform || new Ca, i = 1e5;
            if (ya ? d = X(a, za, null, !0) : a.currentStyle && (d = a.currentStyle.filter.match(E),
            d = d && 4 === d.length ? [d[0].substr(4), Number(d[2].substr(4)), Number(d[1].substr(4)), d[3].substr(4), h.x || 0, h.y || 0].join(",") : ""),
            c = !d || "none" === d || "matrix(1, 0, 0, 1, 0, 0)" === d,
            (h.svg || a.getBBox && Ia(a)) && (c && -1 !== (a.style[ya] + "").indexOf("matrix") && (d = a.style[ya],
            c = 0),
            e = a.getAttribute("transform"),
            c && e && (-1 !== e.indexOf("matrix") ? (d = e,
            c = 0) : -1 !== e.indexOf("translate") && (d = "matrix(1,0,0,1," + e.match(/(?:\-|\b)[\d\-\.e]+\b/gi).join(",") + ")",
            c = 0))),
            c)
                return Ja;
            for (e = (d || "").match(/(?:\-|\b)[\d\-\.e]+\b/gi) || [],
            sa = e.length; --sa > -1; )
                f = Number(e[sa]),
                e[sa] = (g = f - (f |= 0)) ? (g * i + (0 > g ? -.5 : .5) | 0) / i + f : f;
            return b && e.length > 6 ? [e[0], e[1], e[4], e[5], e[12], e[13]] : e
        }, La = O.getTransform = function(a, c, d, f) {
            if (a._gsTransform && d && !f)
                return a._gsTransform;
            var h, i, j, k, l, m, n = d ? a._gsTransform || new Ca : new Ca, o = n.scaleX < 0, p = 2e-5, q = 1e5, r = Ba ? parseFloat(X(a, Aa, c, !1, "0 0 0").split(" ")[2]) || n.zOrigin || 0 : 0, s = parseFloat(g.defaultTransformPerspective) || 0;
            if (n.svg = !(!a.getBBox || !Ia(a)),
            n.svg && (Ha(a, X(a, Aa, e, !1, "50% 50%") + "", n, a.getAttribute("data-svg-origin")),
            wa = g.useSVGTransformAttr || Ga),
            h = Ka(a),
            h !== Ja) {
                if (16 === h.length) {
                    var t, u, v, w, x, y = h[0], z = h[1], A = h[2], B = h[3], C = h[4], D = h[5], E = h[6], F = h[7], G = h[8], H = h[9], J = h[10], K = h[12], L = h[13], M = h[14], N = h[11], O = Math.atan2(E, J);
                    n.zOrigin && (M = -n.zOrigin,
                    K = G * M - h[12],
                    L = H * M - h[13],
                    M = J * M + n.zOrigin - h[14]),
                    n.rotationX = O * I,
                    O && (w = Math.cos(-O),
                    x = Math.sin(-O),
                    t = C * w + G * x,
                    u = D * w + H * x,
                    v = E * w + J * x,
                    G = C * -x + G * w,
                    H = D * -x + H * w,
                    J = E * -x + J * w,
                    N = F * -x + N * w,
                    C = t,
                    D = u,
                    E = v),
                    O = Math.atan2(-A, J),
                    n.rotationY = O * I,
                    O && (w = Math.cos(-O),
                    x = Math.sin(-O),
                    t = y * w - G * x,
                    u = z * w - H * x,
                    v = A * w - J * x,
                    H = z * x + H * w,
                    J = A * x + J * w,
                    N = B * x + N * w,
                    y = t,
                    z = u,
                    A = v),
                    O = Math.atan2(z, y),
                    n.rotation = O * I,
                    O && (w = Math.cos(-O),
                    x = Math.sin(-O),
                    y = y * w + C * x,
                    u = z * w + D * x,
                    D = z * -x + D * w,
                    E = A * -x + E * w,
                    z = u),
                    n.rotationX && Math.abs(n.rotationX) + Math.abs(n.rotation) > 359.9 && (n.rotationX = n.rotation = 0,
                    n.rotationY = 180 - n.rotationY),
                    n.scaleX = (Math.sqrt(y * y + z * z) * q + .5 | 0) / q,
                    n.scaleY = (Math.sqrt(D * D + H * H) * q + .5 | 0) / q,
                    n.scaleZ = (Math.sqrt(E * E + J * J) * q + .5 | 0) / q,
                    n.skewX = 0,
                    n.perspective = N ? 1 / (0 > N ? -N : N) : 0,
                    n.x = K,
                    n.y = L,
                    n.z = M,
                    n.svg && (n.x -= n.xOrigin - (n.xOrigin * y - n.yOrigin * C),
                    n.y -= n.yOrigin - (n.yOrigin * z - n.xOrigin * D))
                } else if ((!Ba || f || !h.length || n.x !== h[4] || n.y !== h[5] || !n.rotationX && !n.rotationY) && (void 0 === n.x || "none" !== X(a, "display", c))) {
                    var P = h.length >= 6
                      , Q = P ? h[0] : 1
                      , R = h[1] || 0
                      , S = h[2] || 0
                      , T = P ? h[3] : 1;
                    n.x = h[4] || 0,
                    n.y = h[5] || 0,
                    j = Math.sqrt(Q * Q + R * R),
                    k = Math.sqrt(T * T + S * S),
                    l = Q || R ? Math.atan2(R, Q) * I : n.rotation || 0,
                    m = S || T ? Math.atan2(S, T) * I + l : n.skewX || 0,
                    Math.abs(m) > 90 && Math.abs(m) < 270 && (o ? (j *= -1,
                    m += 0 >= l ? 180 : -180,
                    l += 0 >= l ? 180 : -180) : (k *= -1,
                    m += 0 >= m ? 180 : -180)),
                    n.scaleX = j,
                    n.scaleY = k,
                    n.rotation = l,
                    n.skewX = m,
                    Ba && (n.rotationX = n.rotationY = n.z = 0,
                    n.perspective = s,
                    n.scaleZ = 1),
                    n.svg && (n.x -= n.xOrigin - (n.xOrigin * Q + n.yOrigin * S),
                    n.y -= n.yOrigin - (n.xOrigin * R + n.yOrigin * T))
                }
                n.zOrigin = r;
                for (i in n)
                    n[i] < p && n[i] > -p && (n[i] = 0)
            }
            return d && (a._gsTransform = n,
            n.svg && (wa && a.style[ya] ? b.delayedCall(.001, function() {
                Pa(a.style, ya)
            }) : !wa && a.getAttribute("transform") && b.delayedCall(.001, function() {
                a.removeAttribute("transform")
            }))),
            n
        }
        , Ma = function(a) {
            var b, c, d = this.data, e = -d.rotation * H, f = e + d.skewX * H, g = 1e5, h = (Math.cos(e) * d.scaleX * g | 0) / g, i = (Math.sin(e) * d.scaleX * g | 0) / g, j = (Math.sin(f) * -d.scaleY * g | 0) / g, k = (Math.cos(f) * d.scaleY * g | 0) / g, l = this.t.style, m = this.t.currentStyle;
            if (m) {
                c = i,
                i = -j,
                j = -c,
                b = m.filter,
                l.filter = "";
                var n, o, q = this.t.offsetWidth, r = this.t.offsetHeight, s = "absolute" !== m.position, t = "progid:DXImageTransform.Microsoft.Matrix(M11=" + h + ", M12=" + i + ", M21=" + j + ", M22=" + k, w = d.x + q * d.xPercent / 100, x = d.y + r * d.yPercent / 100;
                if (null != d.ox && (n = (d.oxp ? q * d.ox * .01 : d.ox) - q / 2,
                o = (d.oyp ? r * d.oy * .01 : d.oy) - r / 2,
                w += n - (n * h + o * i),
                x += o - (n * j + o * k)),
                s ? (n = q / 2,
                o = r / 2,
                t += ", Dx=" + (n - (n * h + o * i) + w) + ", Dy=" + (o - (n * j + o * k) + x) + ")") : t += ", sizingMethod='auto expand')",
                -1 !== b.indexOf("DXImageTransform.Microsoft.Matrix(") ? l.filter = b.replace(F, t) : l.filter = t + " " + b,
                (0 === a || 1 === a) && 1 === h && 0 === i && 0 === j && 1 === k && (s && -1 === t.indexOf("Dx=0, Dy=0") || v.test(b) && 100 !== parseFloat(RegExp.$1) || -1 === b.indexOf(b.indexOf("Alpha")) && l.removeAttribute("filter")),
                !s) {
                    var y, z, A, B = 8 > p ? 1 : -1;
                    for (n = d.ieOffsetX || 0,
                    o = d.ieOffsetY || 0,
                    d.ieOffsetX = Math.round((q - ((0 > h ? -h : h) * q + (0 > i ? -i : i) * r)) / 2 + w),
                    d.ieOffsetY = Math.round((r - ((0 > k ? -k : k) * r + (0 > j ? -j : j) * q)) / 2 + x),
                    sa = 0; 4 > sa; sa++)
                        z = ba[sa],
                        y = m[z],
                        c = -1 !== y.indexOf("px") ? parseFloat(y) : Y(this.t, z, parseFloat(y), y.replace(u, "")) || 0,
                        A = c !== d[z] ? 2 > sa ? -d.ieOffsetX : -d.ieOffsetY : 2 > sa ? n - d.ieOffsetX : o - d.ieOffsetY,
                        l[z] = (d[z] = Math.round(c - A * (0 === sa || 2 === sa ? 1 : B))) + "px"
                }
            }
        }, Na = O.set3DTransformRatio = O.setTransformRatio = function(a) {
            var b, c, d, e, f, g, h, i, j, k, l, m, o, p, q, r, s, t, u, v, w, x, y, z = this.data, A = this.t.style, B = z.rotation, C = z.rotationX, D = z.rotationY, E = z.scaleX, F = z.scaleY, G = z.scaleZ, I = z.x, J = z.y, K = z.z, L = z.svg, M = z.perspective, N = z.force3D;
            if (((1 === a || 0 === a) && "auto" === N && (this.tween._totalTime === this.tween._totalDuration || !this.tween._totalTime) || !N) && !K && !M && !D && !C && 1 === G || wa && L || !Ba)
                return void (B || z.skewX || L ? (B *= H,
                x = z.skewX * H,
                y = 1e5,
                b = Math.cos(B) * E,
                e = Math.sin(B) * E,
                c = Math.sin(B - x) * -F,
                f = Math.cos(B - x) * F,
                x && "simple" === z.skewType && (s = Math.tan(x),
                s = Math.sqrt(1 + s * s),
                c *= s,
                f *= s,
                z.skewY && (b *= s,
                e *= s)),
                L && (I += z.xOrigin - (z.xOrigin * b + z.yOrigin * c) + z.xOffset,
                J += z.yOrigin - (z.xOrigin * e + z.yOrigin * f) + z.yOffset,
                wa && (z.xPercent || z.yPercent) && (p = this.t.getBBox(),
                I += .01 * z.xPercent * p.width,
                J += .01 * z.yPercent * p.height),
                p = 1e-6,
                p > I && I > -p && (I = 0),
                p > J && J > -p && (J = 0)),
                u = (b * y | 0) / y + "," + (e * y | 0) / y + "," + (c * y | 0) / y + "," + (f * y | 0) / y + "," + I + "," + J + ")",
                L && wa ? this.t.setAttribute("transform", "matrix(" + u) : A[ya] = (z.xPercent || z.yPercent ? "translate(" + z.xPercent + "%," + z.yPercent + "%) matrix(" : "matrix(") + u) : A[ya] = (z.xPercent || z.yPercent ? "translate(" + z.xPercent + "%," + z.yPercent + "%) matrix(" : "matrix(") + E + ",0,0," + F + "," + I + "," + J + ")");
            if (n && (p = 1e-4,
            p > E && E > -p && (E = G = 2e-5),
            p > F && F > -p && (F = G = 2e-5),
            !M || z.z || z.rotationX || z.rotationY || (M = 0)),
            B || z.skewX)
                B *= H,
                q = b = Math.cos(B),
                r = e = Math.sin(B),
                z.skewX && (B -= z.skewX * H,
                q = Math.cos(B),
                r = Math.sin(B),
                "simple" === z.skewType && (s = Math.tan(z.skewX * H),
                s = Math.sqrt(1 + s * s),
                q *= s,
                r *= s,
                z.skewY && (b *= s,
                e *= s))),
                c = -r,
                f = q;
            else {
                if (!(D || C || 1 !== G || M || L))
                    return void (A[ya] = (z.xPercent || z.yPercent ? "translate(" + z.xPercent + "%," + z.yPercent + "%) translate3d(" : "translate3d(") + I + "px," + J + "px," + K + "px)" + (1 !== E || 1 !== F ? " scale(" + E + "," + F + ")" : ""));
                b = f = 1,
                c = e = 0
            }
            j = 1,
            d = g = h = i = k = l = 0,
            m = M ? -1 / M : 0,
            o = z.zOrigin,
            p = 1e-6,
            v = ",",
            w = "0",
            B = D * H,
            B && (q = Math.cos(B),
            r = Math.sin(B),
            h = -r,
            k = m * -r,
            d = b * r,
            g = e * r,
            j = q,
            m *= q,
            b *= q,
            e *= q),
            B = C * H,
            B && (q = Math.cos(B),
            r = Math.sin(B),
            s = c * q + d * r,
            t = f * q + g * r,
            i = j * r,
            l = m * r,
            d = c * -r + d * q,
            g = f * -r + g * q,
            j *= q,
            m *= q,
            c = s,
            f = t),
            1 !== G && (d *= G,
            g *= G,
            j *= G,
            m *= G),
            1 !== F && (c *= F,
            f *= F,
            i *= F,
            l *= F),
            1 !== E && (b *= E,
            e *= E,
            h *= E,
            k *= E),
            (o || L) && (o && (I += d * -o,
            J += g * -o,
            K += j * -o + o),
            L && (I += z.xOrigin - (z.xOrigin * b + z.yOrigin * c) + z.xOffset,
            J += z.yOrigin - (z.xOrigin * e + z.yOrigin * f) + z.yOffset),
            p > I && I > -p && (I = w),
            p > J && J > -p && (J = w),
            p > K && K > -p && (K = 0)),
            u = z.xPercent || z.yPercent ? "translate(" + z.xPercent + "%," + z.yPercent + "%) matrix3d(" : "matrix3d(",
            u += (p > b && b > -p ? w : b) + v + (p > e && e > -p ? w : e) + v + (p > h && h > -p ? w : h),
            u += v + (p > k && k > -p ? w : k) + v + (p > c && c > -p ? w : c) + v + (p > f && f > -p ? w : f),
            C || D || 1 !== G ? (u += v + (p > i && i > -p ? w : i) + v + (p > l && l > -p ? w : l) + v + (p > d && d > -p ? w : d),
            u += v + (p > g && g > -p ? w : g) + v + (p > j && j > -p ? w : j) + v + (p > m && m > -p ? w : m) + v) : u += ",0,0,0,0,1,0,",
            u += I + v + J + v + K + v + (M ? 1 + -K / M : 1) + ")",
            A[ya] = u
        }
        ;
        j = Ca.prototype,
        j.x = j.y = j.z = j.skewX = j.skewY = j.rotation = j.rotationX = j.rotationY = j.zOrigin = j.xPercent = j.yPercent = j.xOffset = j.yOffset = 0,
        j.scaleX = j.scaleY = j.scaleZ = 1,
        ua("transform,scale,scaleX,scaleY,scaleZ,x,y,z,rotation,rotationX,rotationY,rotationZ,skewX,skewY,shortRotation,shortRotationX,shortRotationY,shortRotationZ,transformOrigin,svgOrigin,transformPerspective,directionalRotation,parseTransform,force3D,skewType,xPercent,yPercent,smoothOrigin", {
            parser: function(a, b, c, d, f, h, i) {
                if (d._lastParsedTransform === i)
                    return f;
                d._lastParsedTransform = i;
                var j, k, l, m, n, o, p, q, r, s, t = a._gsTransform, u = a.style, v = 1e-6, w = xa.length, x = i, y = {}, z = "transformOrigin";
                if (i.display ? (m = X(a, "display"),
                u.display = "block",
                j = La(a, e, !0, i.parseTransform),
                u.display = m) : j = La(a, e, !0, i.parseTransform),
                d._transform = j,
                "string" == typeof x.transform && ya)
                    m = M.style,
                    m[ya] = x.transform,
                    m.display = "block",
                    m.position = "absolute",
                    K.body.appendChild(M),
                    k = La(M, null, !1),
                    K.body.removeChild(M),
                    k.perspective || (k.perspective = j.perspective),
                    null != x.xPercent && (k.xPercent = fa(x.xPercent, j.xPercent)),
                    null != x.yPercent && (k.yPercent = fa(x.yPercent, j.yPercent));
                else if ("object" == typeof x) {
                    if (k = {
                        scaleX: fa(null != x.scaleX ? x.scaleX : x.scale, j.scaleX),
                        scaleY: fa(null != x.scaleY ? x.scaleY : x.scale, j.scaleY),
                        scaleZ: fa(x.scaleZ, j.scaleZ),
                        x: fa(x.x, j.x),
                        y: fa(x.y, j.y),
                        z: fa(x.z, j.z),
                        xPercent: fa(x.xPercent, j.xPercent),
                        yPercent: fa(x.yPercent, j.yPercent),
                        perspective: fa(x.transformPerspective, j.perspective)
                    },
                    q = x.directionalRotation,
                    null != q)
                        if ("object" == typeof q)
                            for (m in q)
                                x[m] = q[m];
                        else
                            x.rotation = q;
                    "string" == typeof x.x && -1 !== x.x.indexOf("%") && (k.x = 0,
                    k.xPercent = fa(x.x, j.xPercent)),
                    "string" == typeof x.y && -1 !== x.y.indexOf("%") && (k.y = 0,
                    k.yPercent = fa(x.y, j.yPercent)),
                    k.rotation = ga("rotation"in x ? x.rotation : "shortRotation"in x ? x.shortRotation + "_short" : "rotationZ"in x ? x.rotationZ : j.rotation, j.rotation, "rotation", y),
                    Ba && (k.rotationX = ga("rotationX"in x ? x.rotationX : "shortRotationX"in x ? x.shortRotationX + "_short" : j.rotationX || 0, j.rotationX, "rotationX", y),
                    k.rotationY = ga("rotationY"in x ? x.rotationY : "shortRotationY"in x ? x.shortRotationY + "_short" : j.rotationY || 0, j.rotationY, "rotationY", y)),
                    k.skewX = null == x.skewX ? j.skewX : ga(x.skewX, j.skewX),
                    k.skewY = null == x.skewY ? j.skewY : ga(x.skewY, j.skewY),
                    (l = k.skewY - j.skewY) && (k.skewX += l,
                    k.rotation += l)
                }
                for (Ba && null != x.force3D && (j.force3D = x.force3D,
                p = !0),
                j.skewType = x.skewType || j.skewType || g.defaultSkewType,
                o = j.force3D || j.z || j.rotationX || j.rotationY || k.z || k.rotationX || k.rotationY || k.perspective,
                o || null == x.scale || (k.scaleZ = 1); --w > -1; )
                    c = xa[w],
                    n = k[c] - j[c],
                    (n > v || -v > n || null != x[c] || null != J[c]) && (p = !0,
                    f = new pa(j,c,j[c],n,f),
                    c in y && (f.e = y[c]),
                    f.xs0 = 0,
                    f.plugin = h,
                    d._overwriteProps.push(f.n));
                return n = x.transformOrigin,
                j.svg && (n || x.svgOrigin) && (r = j.xOffset,
                s = j.yOffset,
                Ha(a, da(n), k, x.svgOrigin, x.smoothOrigin),
                f = qa(j, "xOrigin", (t ? j : k).xOrigin, k.xOrigin, f, z),
                f = qa(j, "yOrigin", (t ? j : k).yOrigin, k.yOrigin, f, z),
                (r !== j.xOffset || s !== j.yOffset) && (f = qa(j, "xOffset", t ? r : j.xOffset, j.xOffset, f, z),
                f = qa(j, "yOffset", t ? s : j.yOffset, j.yOffset, f, z)),
                n = wa ? null : "0px 0px"),
                (n || Ba && o && j.zOrigin) && (ya ? (p = !0,
                c = Aa,
                n = (n || X(a, c, e, !1, "50% 50%")) + "",
                f = new pa(u,c,0,0,f,-1,z),
                f.b = u[c],
                f.plugin = h,
                Ba ? (m = j.zOrigin,
                n = n.split(" "),
                j.zOrigin = (n.length > 2 && (0 === m || "0px" !== n[2]) ? parseFloat(n[2]) : m) || 0,
                f.xs0 = f.e = n[0] + " " + (n[1] || "50%") + " 0px",
                f = new pa(j,"zOrigin",0,0,f,-1,f.n),
                f.b = m,
                f.xs0 = f.e = j.zOrigin) : f.xs0 = f.e = n) : da(n + "", j)),
                p && (d._transformType = j.svg && wa || !o && 3 !== this._transformType ? 2 : 3),
                f
            },
            prefix: !0
        }),
        ua("boxShadow", {
            defaultValue: "0px 0px 0px 0px #999",
            prefix: !0,
            color: !0,
            multi: !0,
            keyword: "inset"
        }),
        ua("borderRadius", {
            defaultValue: "0px",
            parser: function(a, b, c, f, g, h) {
                b = this.format(b);
                var i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y = ["borderTopLeftRadius", "borderTopRightRadius", "borderBottomRightRadius", "borderBottomLeftRadius"], z = a.style;
                for (q = parseFloat(a.offsetWidth),
                r = parseFloat(a.offsetHeight),
                i = b.split(" "),
                j = 0; j < y.length; j++)
                    this.p.indexOf("border") && (y[j] = V(y[j])),
                    m = l = X(a, y[j], e, !1, "0px"),
                    -1 !== m.indexOf(" ") && (l = m.split(" "),
                    m = l[0],
                    l = l[1]),
                    n = k = i[j],
                    o = parseFloat(m),
                    t = m.substr((o + "").length),
                    u = "=" === n.charAt(1),
                    u ? (p = parseInt(n.charAt(0) + "1", 10),
                    n = n.substr(2),
                    p *= parseFloat(n),
                    s = n.substr((p + "").length - (0 > p ? 1 : 0)) || "") : (p = parseFloat(n),
                    s = n.substr((p + "").length)),
                    "" === s && (s = d[c] || t),
                    s !== t && (v = Y(a, "borderLeft", o, t),
                    w = Y(a, "borderTop", o, t),
                    "%" === s ? (m = v / q * 100 + "%",
                    l = w / r * 100 + "%") : "em" === s ? (x = Y(a, "borderLeft", 1, "em"),
                    m = v / x + "em",
                    l = w / x + "em") : (m = v + "px",
                    l = w + "px"),
                    u && (n = parseFloat(m) + p + s,
                    k = parseFloat(l) + p + s)),
                    g = ra(z, y[j], m + " " + l, n + " " + k, !1, "0px", g);
                return g
            },
            prefix: !0,
            formatter: ma("0px 0px 0px 0px", !1, !0)
        }),
        ua("backgroundPosition", {
            defaultValue: "0 0",
            parser: function(a, b, c, d, f, g) {
                var h, i, j, k, l, m, n = "background-position", o = e || W(a, null), q = this.format((o ? p ? o.getPropertyValue(n + "-x") + " " + o.getPropertyValue(n + "-y") : o.getPropertyValue(n) : a.currentStyle.backgroundPositionX + " " + a.currentStyle.backgroundPositionY) || "0 0"), r = this.format(b);
                if (-1 !== q.indexOf("%") != (-1 !== r.indexOf("%")) && (m = X(a, "backgroundImage").replace(B, ""),
                m && "none" !== m)) {
                    for (h = q.split(" "),
                    i = r.split(" "),
                    N.setAttribute("src", m),
                    j = 2; --j > -1; )
                        q = h[j],
                        k = -1 !== q.indexOf("%"),
                        k !== (-1 !== i[j].indexOf("%")) && (l = 0 === j ? a.offsetWidth - N.width : a.offsetHeight - N.height,
                        h[j] = k ? parseFloat(q) / 100 * l + "px" : parseFloat(q) / l * 100 + "%");
                    q = h.join(" ")
                }
                return this.parseComplex(a.style, q, r, f, g)
            },
            formatter: da
        }),
        ua("backgroundSize", {
            defaultValue: "0 0",
            formatter: da
        }),
        ua("perspective", {
            defaultValue: "0px",
            prefix: !0
        }),
        ua("perspectiveOrigin", {
            defaultValue: "50% 50%",
            prefix: !0
        }),
        ua("transformStyle", {
            prefix: !0
        }),
        ua("backfaceVisibility", {
            prefix: !0
        }),
        ua("userSelect", {
            prefix: !0
        }),
        ua("margin", {
            parser: na("marginTop,marginRight,marginBottom,marginLeft")
        }),
        ua("padding", {
            parser: na("paddingTop,paddingRight,paddingBottom,paddingLeft")
        }),
        ua("clip", {
            defaultValue: "rect(0px,0px,0px,0px)",
            parser: function(a, b, c, d, f, g) {
                var h, i, j;
                return 9 > p ? (i = a.currentStyle,
                j = 8 > p ? " " : ",",
                h = "rect(" + i.clipTop + j + i.clipRight + j + i.clipBottom + j + i.clipLeft + ")",
                b = this.format(b).split(",").join(j)) : (h = this.format(X(a, this.p, e, !1, this.dflt)),
                b = this.format(b)),
                this.parseComplex(a.style, h, b, f, g)
            }
        }),
        ua("textShadow", {
            defaultValue: "0px 0px 0px #999",
            color: !0,
            multi: !0
        }),
        ua("autoRound,strictUnits", {
            parser: function(a, b, c, d, e) {
                return e
            }
        }),
        ua("border", {
            defaultValue: "0px solid #000",
            parser: function(a, b, c, d, f, g) {
                return this.parseComplex(a.style, this.format(X(a, "borderTopWidth", e, !1, "0px") + " " + X(a, "borderTopStyle", e, !1, "solid") + " " + X(a, "borderTopColor", e, !1, "#000")), this.format(b), f, g)
            },
            color: !0,
            formatter: function(a) {
                var b = a.split(" ");
                return b[0] + " " + (b[1] || "solid") + " " + (a.match(la) || ["#000"])[0]
            }
        }),
        ua("borderWidth", {
            parser: na("borderTopWidth,borderRightWidth,borderBottomWidth,borderLeftWidth")
        }),
        ua("float,cssFloat,styleFloat", {
            parser: function(a, b, c, d, e, f) {
                var g = a.style
                  , h = "cssFloat"in g ? "cssFloat" : "styleFloat";
                return new pa(g,h,0,0,e,-1,c,!1,0,g[h],b)
            }
        });
        var Oa = function(a) {
            var b, c = this.t, d = c.filter || X(this.data, "filter") || "", e = this.s + this.c * a | 0;
            100 === e && (-1 === d.indexOf("atrix(") && -1 === d.indexOf("radient(") && -1 === d.indexOf("oader(") ? (c.removeAttribute("filter"),
            b = !X(this.data, "filter")) : (c.filter = d.replace(x, ""),
            b = !0)),
            b || (this.xn1 && (c.filter = d = d || "alpha(opacity=" + e + ")"),
            -1 === d.indexOf("pacity") ? 0 === e && this.xn1 || (c.filter = d + " alpha(opacity=" + e + ")") : c.filter = d.replace(v, "opacity=" + e))
        };
        ua("opacity,alpha,autoAlpha", {
            defaultValue: "1",
            parser: function(a, b, c, d, f, g) {
                var h = parseFloat(X(a, "opacity", e, !1, "1"))
                  , i = a.style
                  , j = "autoAlpha" === c;
                return "string" == typeof b && "=" === b.charAt(1) && (b = ("-" === b.charAt(0) ? -1 : 1) * parseFloat(b.substr(2)) + h),
                j && 1 === h && "hidden" === X(a, "visibility", e) && 0 !== b && (h = 0),
                Q ? f = new pa(i,"opacity",h,b - h,f) : (f = new pa(i,"opacity",100 * h,100 * (b - h),f),
                f.xn1 = j ? 1 : 0,
                i.zoom = 1,
                f.type = 2,
                f.b = "alpha(opacity=" + f.s + ")",
                f.e = "alpha(opacity=" + (f.s + f.c) + ")",
                f.data = a,
                f.plugin = g,
                f.setRatio = Oa),
                j && (f = new pa(i,"visibility",0,0,f,-1,null,!1,0,0 !== h ? "inherit" : "hidden",0 === b ? "hidden" : "inherit"),
                f.xs0 = "inherit",
                d._overwriteProps.push(f.n),
                d._overwriteProps.push(c)),
                f
            }
        });
        var Pa = function(a, b) {
            b && (a.removeProperty ? (("ms" === b.substr(0, 2) || "webkit" === b.substr(0, 6)) && (b = "-" + b),
            a.removeProperty(b.replace(z, "-$1").toLowerCase())) : a.removeAttribute(b))
        }
          , Qa = function(a) {
            if (this.t._gsClassPT = this,
            1 === a || 0 === a) {
                this.t.setAttribute("class", 0 === a ? this.b : this.e);
                for (var b = this.data, c = this.t.style; b; )
                    b.v ? c[b.p] = b.v : Pa(c, b.p),
                    b = b._next;
                1 === a && this.t._gsClassPT === this && (this.t._gsClassPT = null)
            } else
                this.t.getAttribute("class") !== this.e && this.t.setAttribute("class", this.e)
        };
        ua("className", {
            parser: function(a, b, d, f, g, h, i) {
                var j, k, l, m, n, o = a.getAttribute("class") || "", p = a.style.cssText;
                if (g = f._classNamePT = new pa(a,d,0,0,g,2),
                g.setRatio = Qa,
                g.pr = -11,
                c = !0,
                g.b = o,
                k = $(a, e),
                l = a._gsClassPT) {
                    for (m = {},
                    n = l.data; n; )
                        m[n.p] = 1,
                        n = n._next;
                    l.setRatio(1)
                }
                return a._gsClassPT = g,
                g.e = "=" !== b.charAt(1) ? b : o.replace(new RegExp("\\s*\\b" + b.substr(2) + "\\b"), "") + ("+" === b.charAt(0) ? " " + b.substr(2) : ""),
                a.setAttribute("class", g.e),
                j = _(a, k, $(a), i, m),
                a.setAttribute("class", o),
                g.data = j.firstMPT,
                a.style.cssText = p,
                g = g.xfirst = f.parse(a, j.difs, g, h)
            }
        });
        var Ra = function(a) {
            if ((1 === a || 0 === a) && this.data._totalTime === this.data._totalDuration && "isFromStart" !== this.data.data) {
                var b, c, d, e, f, g = this.t.style, h = i.transform.parse;
                if ("all" === this.e)
                    g.cssText = "",
                    e = !0;
                else
                    for (b = this.e.split(" ").join("").split(","),
                    d = b.length; --d > -1; )
                        c = b[d],
                        i[c] && (i[c].parse === h ? e = !0 : c = "transformOrigin" === c ? Aa : i[c].p),
                        Pa(g, c);
                e && (Pa(g, ya),
                f = this.t._gsTransform,
                f && (f.svg && (this.t.removeAttribute("data-svg-origin"),
                this.t.removeAttribute("transform")),
                delete this.t._gsTransform))
            }
        };
        for (ua("clearProps", {
            parser: function(a, b, d, e, f) {
                return f = new pa(a,d,0,0,f,2),
                f.setRatio = Ra,
                f.e = b,
                f.pr = -10,
                f.data = e._tween,
                c = !0,
                f
            }
        }),
        j = "bezier,throwProps,physicsProps,physics2D".split(","),
        sa = j.length; sa--; )
            va(j[sa]);
        j = g.prototype,
        j._firstPT = j._lastParsedTransform = j._transform = null,
        j._onInitTween = function(a, b, h) {
            if (!a.nodeType)
                return !1;
            this._target = a,
            this._tween = h,
            this._vars = b,
            k = b.autoRound,
            c = !1,
            d = b.suffixMap || g.suffixMap,
            e = W(a, ""),
            f = this._overwriteProps;
            var j, n, p, q, r, s, t, u, v, x = a.style;
            if (l && "" === x.zIndex && (j = X(a, "zIndex", e),
            ("auto" === j || "" === j) && this._addLazySet(x, "zIndex", 0)),
            "string" == typeof b && (q = x.cssText,
            j = $(a, e),
            x.cssText = q + ";" + b,
            j = _(a, j, $(a)).difs,
            !Q && w.test(b) && (j.opacity = parseFloat(RegExp.$1)),
            b = j,
            x.cssText = q),
            b.className ? this._firstPT = n = i.className.parse(a, b.className, "className", this, null, null, b) : this._firstPT = n = this.parse(a, b, null),
            this._transformType) {
                for (v = 3 === this._transformType,
                ya ? m && (l = !0,
                "" === x.zIndex && (t = X(a, "zIndex", e),
                ("auto" === t || "" === t) && this._addLazySet(x, "zIndex", 0)),
                o && this._addLazySet(x, "WebkitBackfaceVisibility", this._vars.WebkitBackfaceVisibility || (v ? "visible" : "hidden"))) : x.zoom = 1,
                p = n; p && p._next; )
                    p = p._next;
                u = new pa(a,"transform",0,0,null,2),
                this._linkCSSP(u, null, p),
                u.setRatio = ya ? Na : Ma,
                u.data = this._transform || La(a, e, !0),
                u.tween = h,
                u.pr = -1,
                f.pop()
            }
            if (c) {
                for (; n; ) {
                    for (s = n._next,
                    p = q; p && p.pr > n.pr; )
                        p = p._next;
                    (n._prev = p ? p._prev : r) ? n._prev._next = n : q = n,
                    (n._next = p) ? p._prev = n : r = n,
                    n = s
                }
                this._firstPT = q
            }
            return !0
        }
        ,
        j.parse = function(a, b, c, f) {
            var g, h, j, l, m, n, o, p, q, r, s = a.style;
            for (g in b)
                n = b[g],
                h = i[g],
                h ? c = h.parse(a, n, g, this, c, f, b) : (m = X(a, g, e) + "",
                q = "string" == typeof n,
                "color" === g || "fill" === g || "stroke" === g || -1 !== g.indexOf("Color") || q && y.test(n) ? (q || (n = ja(n),
                n = (n.length > 3 ? "rgba(" : "rgb(") + n.join(",") + ")"),
                c = ra(s, g, m, n, !0, "transparent", c, 0, f)) : !q || -1 === n.indexOf(" ") && -1 === n.indexOf(",") ? (j = parseFloat(m),
                o = j || 0 === j ? m.substr((j + "").length) : "",
                ("" === m || "auto" === m) && ("width" === g || "height" === g ? (j = ca(a, g, e),
                o = "px") : "left" === g || "top" === g ? (j = Z(a, g, e),
                o = "px") : (j = "opacity" !== g ? 0 : 1,
                o = "")),
                r = q && "=" === n.charAt(1),
                r ? (l = parseInt(n.charAt(0) + "1", 10),
                n = n.substr(2),
                l *= parseFloat(n),
                p = n.replace(u, "")) : (l = parseFloat(n),
                p = q ? n.replace(u, "") : ""),
                "" === p && (p = g in d ? d[g] : o),
                n = l || 0 === l ? (r ? l + j : l) + p : b[g],
                o !== p && "" !== p && (l || 0 === l) && j && (j = Y(a, g, j, o),
                "%" === p ? (j /= Y(a, g, 100, "%") / 100,
                b.strictUnits !== !0 && (m = j + "%")) : "em" === p || "rem" === p || "vw" === p || "vh" === p ? j /= Y(a, g, 1, p) : "px" !== p && (l = Y(a, g, l, p),
                p = "px"),
                r && (l || 0 === l) && (n = l + j + p)),
                r && (l += j),
                !j && 0 !== j || !l && 0 !== l ? void 0 !== s[g] && (n || n + "" != "NaN" && null != n) ? (c = new pa(s,g,l || j || 0,0,c,-1,g,!1,0,m,n),
                c.xs0 = "none" !== n || "display" !== g && -1 === g.indexOf("Style") ? n : m) : S("invalid " + g + " tween value: " + b[g]) : (c = new pa(s,g,j,l - j,c,0,g,k !== !1 && ("px" === p || "zIndex" === g),0,m,n),
                c.xs0 = p)) : c = ra(s, g, m, n, !0, null, c, 0, f)),
                f && c && !c.plugin && (c.plugin = f);
            return c
        }
        ,
        j.setRatio = function(a) {
            var b, c, d, e = this._firstPT, f = 1e-6;
            if (1 !== a || this._tween._time !== this._tween._duration && 0 !== this._tween._time)
                if (a || this._tween._time !== this._tween._duration && 0 !== this._tween._time || this._tween._rawPrevTime === -1e-6)
                    for (; e; ) {
                        if (b = e.c * a + e.s,
                        e.r ? b = Math.round(b) : f > b && b > -f && (b = 0),
                        e.type)
                            if (1 === e.type)
                                if (d = e.l,
                                2 === d)
                                    e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2;
                                else if (3 === d)
                                    e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2 + e.xn2 + e.xs3;
                                else if (4 === d)
                                    e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2 + e.xn2 + e.xs3 + e.xn3 + e.xs4;
                                else if (5 === d)
                                    e.t[e.p] = e.xs0 + b + e.xs1 + e.xn1 + e.xs2 + e.xn2 + e.xs3 + e.xn3 + e.xs4 + e.xn4 + e.xs5;
                                else {
                                    for (c = e.xs0 + b + e.xs1,
                                    d = 1; d < e.l; d++)
                                        c += e["xn" + d] + e["xs" + (d + 1)];
                                    e.t[e.p] = c
                                }
                            else
                                -1 === e.type ? e.t[e.p] = e.xs0 : e.setRatio && e.setRatio(a);
                        else
                            e.t[e.p] = b + e.xs0;
                        e = e._next
                    }
                else
                    for (; e; )
                        2 !== e.type ? e.t[e.p] = e.b : e.setRatio(a),
                        e = e._next;
            else
                for (; e; ) {
                    if (2 !== e.type)
                        if (e.r && -1 !== e.type)
                            if (b = Math.round(e.s + e.c),
                            e.type) {
                                if (1 === e.type) {
                                    for (d = e.l,
                                    c = e.xs0 + b + e.xs1,
                                    d = 1; d < e.l; d++)
                                        c += e["xn" + d] + e["xs" + (d + 1)];
                                    e.t[e.p] = c
                                }
                            } else
                                e.t[e.p] = b + e.xs0;
                        else
                            e.t[e.p] = e.e;
                    else
                        e.setRatio(a);
                    e = e._next
                }
        }
        ,
        j._enableTransforms = function(a) {
            this._transform = this._transform || La(this._target, e, !0),
            this._transformType = this._transform.svg && wa || !a && 3 !== this._transformType ? 2 : 3
        }
        ;
        var Sa = function(a) {
            this.t[this.p] = this.e,
            this.data._linkCSSP(this, this._next, null, !0)
        };
        j._addLazySet = function(a, b, c) {
            var d = this._firstPT = new pa(a,b,0,0,this._firstPT,2);
            d.e = c,
            d.setRatio = Sa,
            d.data = this
        }
        ,
        j._linkCSSP = function(a, b, c, d) {
            return a && (b && (b._prev = a),
            a._next && (a._next._prev = a._prev),
            a._prev ? a._prev._next = a._next : this._firstPT === a && (this._firstPT = a._next,
            d = !0),
            c ? c._next = a : d || null !== this._firstPT || (this._firstPT = a),
            a._next = b,
            a._prev = c),
            a
        }
        ,
        j._kill = function(b) {
            var c, d, e, f = b;
            if (b.autoAlpha || b.alpha) {
                f = {};
                for (d in b)
                    f[d] = b[d];
                f.opacity = 1,
                f.autoAlpha && (f.visibility = 1)
            }
            return b.className && (c = this._classNamePT) && (e = c.xfirst,
            e && e._prev ? this._linkCSSP(e._prev, c._next, e._prev._prev) : e === this._firstPT && (this._firstPT = c._next),
            c._next && this._linkCSSP(c._next, c._next._next, e._prev),
            this._classNamePT = null),
            a.prototype._kill.call(this, f)
        }
        ;
        var Ta = function(a, b, c) {
            var d, e, f, g;
            if (a.slice)
                for (e = a.length; --e > -1; )
                    Ta(a[e], b, c);
            else
                for (d = a.childNodes,
                e = d.length; --e > -1; )
                    f = d[e],
                    g = f.type,
                    f.style && (b.push($(f)),
                    c && c.push(f)),
                    1 !== g && 9 !== g && 11 !== g || !f.childNodes.length || Ta(f, b, c)
        };
        return g.cascadeTo = function(a, c, d) {
            var e, f, g, h, i = b.to(a, c, d), j = [i], k = [], l = [], m = [], n = b._internals.reservedProps;
            for (a = i._targets || i.target,
            Ta(a, k, m),
            i.render(c, !0, !0),
            Ta(a, l),
            i.render(0, !0, !0),
            i._enabled(!0),
            e = m.length; --e > -1; )
                if (f = _(m[e], k[e], l[e]),
                f.firstMPT) {
                    f = f.difs;
                    for (g in d)
                        n[g] && (f[g] = d[g]);
                    h = {};
                    for (g in f)
                        h[g] = k[e][g];
                    j.push(b.fromTo(m[e], c, h, f))
                }
            return j
        }
        ,
        a.activate([g]),
        g
    }, !0),
    function() {
        var a = _gsScope._gsDefine.plugin({
            propName: "roundProps",
            version: "1.5",
            priority: -1,
            API: 2,
            init: function(a, b, c) {
                return this._tween = c,
                !0
            }
        })
          , b = function(a) {
            for (; a; )
                a.f || a.blob || (a.r = 1),
                a = a._next
        }
          , c = a.prototype;
        c._onInitAllProps = function() {
            for (var a, c, d, e = this._tween, f = e.vars.roundProps.join ? e.vars.roundProps : e.vars.roundProps.split(","), g = f.length, h = {}, i = e._propLookup.roundProps; --g > -1; )
                h[f[g]] = 1;
            for (g = f.length; --g > -1; )
                for (a = f[g],
                c = e._firstPT; c; )
                    d = c._next,
                    c.pg ? c.t._roundProps(h, !0) : c.n === a && (2 === c.f && c.t ? b(c.t._firstPT) : (this._add(c.t, a, c.s, c.c),
                    d && (d._prev = c._prev),
                    c._prev ? c._prev._next = d : e._firstPT === c && (e._firstPT = d),
                    c._next = c._prev = null,
                    e._propLookup[a] = i)),
                    c = d;
            return !1
        }
        ,
        c._add = function(a, b, c, d) {
            this._addTween(a, b, c, c + d, b, !0),
            this._overwriteProps.push(b)
        }
    }(),
    function() {
        _gsScope._gsDefine.plugin({
            propName: "attr",
            API: 2,
            version: "0.5.0",
            init: function(a, b, c) {
                var d;
                if ("function" != typeof a.setAttribute)
                    return !1;
                for (d in b)
                    this._addTween(a, "setAttribute", a.getAttribute(d) + "", b[d] + "", d, !1, d),
                    this._overwriteProps.push(d);
                return !0
            }
        })
    }(),
    _gsScope._gsDefine.plugin({
        propName: "directionalRotation",
        version: "0.2.1",
        API: 2,
        init: function(a, b, c) {
            "object" != typeof b && (b = {
                rotation: b
            }),
            this.finals = {};
            var d, e, f, g, h, i, j = b.useRadians === !0 ? 2 * Math.PI : 360, k = 1e-6;
            for (d in b)
                "useRadians" !== d && (i = (b[d] + "").split("_"),
                e = i[0],
                f = parseFloat("function" != typeof a[d] ? a[d] : a[d.indexOf("set") || "function" != typeof a["get" + d.substr(3)] ? d : "get" + d.substr(3)]()),
                g = this.finals[d] = "string" == typeof e && "=" === e.charAt(1) ? f + parseInt(e.charAt(0) + "1", 10) * Number(e.substr(2)) : Number(e) || 0,
                h = g - f,
                i.length && (e = i.join("_"),
                -1 !== e.indexOf("short") && (h %= j,
                h !== h % (j / 2) && (h = 0 > h ? h + j : h - j)),
                -1 !== e.indexOf("_cw") && 0 > h ? h = (h + 9999999999 * j) % j - (h / j | 0) * j : -1 !== e.indexOf("ccw") && h > 0 && (h = (h - 9999999999 * j) % j - (h / j | 0) * j)),
                (h > k || -k > h) && (this._addTween(a, d, f, f + h, d),
                this._overwriteProps.push(d)));
            return !0
        },
        set: function(a) {
            var b;
            if (1 !== a)
                this._super.setRatio.call(this, a);
            else
                for (b = this._firstPT; b; )
                    b.f ? b.t[b.p](this.finals[b.p]) : b.t[b.p] = this.finals[b.p],
                    b = b._next
        }
    })._autoCSS = !0,
    _gsScope._gsDefine("easing.Back", ["easing.Ease"], function(a) {
        var b, c, d, e = _gsScope.GreenSockGlobals || _gsScope, f = e.com.greensock, g = 2 * Math.PI, h = Math.PI / 2, i = f._class, j = function(b, c) {
            var d = i("easing." + b, function() {}, !0)
              , e = d.prototype = new a;
            return e.constructor = d,
            e.getRatio = c,
            d
        }, k = a.register || function() {}
        , l = function(a, b, c, d, e) {
            var f = i("easing." + a, {
                easeOut: new b,
                easeIn: new c,
                easeInOut: new d
            }, !0);
            return k(f, a),
            f
        }, m = function(a, b, c) {
            this.t = a,
            this.v = b,
            c && (this.next = c,
            c.prev = this,
            this.c = c.v - b,
            this.gap = c.t - a)
        }, n = function(b, c) {
            var d = i("easing." + b, function(a) {
                this._p1 = a || 0 === a ? a : 1.70158,
                this._p2 = 1.525 * this._p1
            }, !0)
              , e = d.prototype = new a;
            return e.constructor = d,
            e.getRatio = c,
            e.config = function(a) {
                return new d(a)
            }
            ,
            d
        }, o = l("Back", n("BackOut", function(a) {
            return (a -= 1) * a * ((this._p1 + 1) * a + this._p1) + 1
        }), n("BackIn", function(a) {
            return a * a * ((this._p1 + 1) * a - this._p1)
        }), n("BackInOut", function(a) {
            return (a *= 2) < 1 ? .5 * a * a * ((this._p2 + 1) * a - this._p2) : .5 * ((a -= 2) * a * ((this._p2 + 1) * a + this._p2) + 2)
        })), p = i("easing.SlowMo", function(a, b, c) {
            b = b || 0 === b ? b : .7,
            null == a ? a = .7 : a > 1 && (a = 1),
            this._p = 1 !== a ? b : 0,
            this._p1 = (1 - a) / 2,
            this._p2 = a,
            this._p3 = this._p1 + this._p2,
            this._calcEnd = c === !0
        }, !0), q = p.prototype = new a;
        return q.constructor = p,
        q.getRatio = function(a) {
            var b = a + (.5 - a) * this._p;
            return a < this._p1 ? this._calcEnd ? 1 - (a = 1 - a / this._p1) * a : b - (a = 1 - a / this._p1) * a * a * a * b : a > this._p3 ? this._calcEnd ? 1 - (a = (a - this._p3) / this._p1) * a : b + (a - b) * (a = (a - this._p3) / this._p1) * a * a * a : this._calcEnd ? 1 : b
        }
        ,
        p.ease = new p(.7,.7),
        q.config = p.config = function(a, b, c) {
            return new p(a,b,c)
        }
        ,
        b = i("easing.SteppedEase", function(a) {
            a = a || 1,
            this._p1 = 1 / a,
            this._p2 = a + 1
        }, !0),
        q = b.prototype = new a,
        q.constructor = b,
        q.getRatio = function(a) {
            return 0 > a ? a = 0 : a >= 1 && (a = .999999999),
            (this._p2 * a >> 0) * this._p1
        }
        ,
        q.config = b.config = function(a) {
            return new b(a)
        }
        ,
        c = i("easing.RoughEase", function(b) {
            b = b || {};
            for (var c, d, e, f, g, h, i = b.taper || "none", j = [], k = 0, l = 0 | (b.points || 20), n = l, o = b.randomize !== !1, p = b.clamp === !0, q = b.template instanceof a ? b.template : null, r = "number" == typeof b.strength ? .4 * b.strength : .4; --n > -1; )
                c = o ? Math.random() : 1 / l * n,
                d = q ? q.getRatio(c) : c,
                "none" === i ? e = r : "out" === i ? (f = 1 - c,
                e = f * f * r) : "in" === i ? e = c * c * r : .5 > c ? (f = 2 * c,
                e = f * f * .5 * r) : (f = 2 * (1 - c),
                e = f * f * .5 * r),
                o ? d += Math.random() * e - .5 * e : n % 2 ? d += .5 * e : d -= .5 * e,
                p && (d > 1 ? d = 1 : 0 > d && (d = 0)),
                j[k++] = {
                    x: c,
                    y: d
                };
            for (j.sort(function(a, b) {
                return a.x - b.x
            }),
            h = new m(1,1,null),
            n = l; --n > -1; )
                g = j[n],
                h = new m(g.x,g.y,h);
            this._prev = new m(0,0,0 !== h.t ? h : h.next)
        }, !0),
        q = c.prototype = new a,
        q.constructor = c,
        q.getRatio = function(a) {
            var b = this._prev;
            if (a > b.t) {
                for (; b.next && a >= b.t; )
                    b = b.next;
                b = b.prev
            } else
                for (; b.prev && a <= b.t; )
                    b = b.prev;
            return this._prev = b,
            b.v + (a - b.t) / b.gap * b.c
        }
        ,
        q.config = function(a) {
            return new c(a)
        }
        ,
        c.ease = new c,
        l("Bounce", j("BounceOut", function(a) {
            return 1 / 2.75 > a ? 7.5625 * a * a : 2 / 2.75 > a ? 7.5625 * (a -= 1.5 / 2.75) * a + .75 : 2.5 / 2.75 > a ? 7.5625 * (a -= 2.25 / 2.75) * a + .9375 : 7.5625 * (a -= 2.625 / 2.75) * a + .984375
        }), j("BounceIn", function(a) {
            return (a = 1 - a) < 1 / 2.75 ? 1 - 7.5625 * a * a : 2 / 2.75 > a ? 1 - (7.5625 * (a -= 1.5 / 2.75) * a + .75) : 2.5 / 2.75 > a ? 1 - (7.5625 * (a -= 2.25 / 2.75) * a + .9375) : 1 - (7.5625 * (a -= 2.625 / 2.75) * a + .984375)
        }), j("BounceInOut", function(a) {
            var b = .5 > a;
            return a = b ? 1 - 2 * a : 2 * a - 1,
            a = 1 / 2.75 > a ? 7.5625 * a * a : 2 / 2.75 > a ? 7.5625 * (a -= 1.5 / 2.75) * a + .75 : 2.5 / 2.75 > a ? 7.5625 * (a -= 2.25 / 2.75) * a + .9375 : 7.5625 * (a -= 2.625 / 2.75) * a + .984375,
            b ? .5 * (1 - a) : .5 * a + .5
        })),
        l("Circ", j("CircOut", function(a) {
            return Math.sqrt(1 - (a -= 1) * a)
        }), j("CircIn", function(a) {
            return -(Math.sqrt(1 - a * a) - 1)
        }), j("CircInOut", function(a) {
            return (a *= 2) < 1 ? -.5 * (Math.sqrt(1 - a * a) - 1) : .5 * (Math.sqrt(1 - (a -= 2) * a) + 1)
        })),
        d = function(b, c, d) {
            var e = i("easing." + b, function(a, b) {
                this._p1 = a >= 1 ? a : 1,
                this._p2 = (b || d) / (1 > a ? a : 1),
                this._p3 = this._p2 / g * (Math.asin(1 / this._p1) || 0),
                this._p2 = g / this._p2
            }, !0)
              , f = e.prototype = new a;
            return f.constructor = e,
            f.getRatio = c,
            f.config = function(a, b) {
                return new e(a,b)
            }
            ,
            e
        }
        ,
        l("Elastic", d("ElasticOut", function(a) {
            return this._p1 * Math.pow(2, -10 * a) * Math.sin((a - this._p3) * this._p2) + 1
        }, .3), d("ElasticIn", function(a) {
            return -(this._p1 * Math.pow(2, 10 * (a -= 1)) * Math.sin((a - this._p3) * this._p2))
        }, .3), d("ElasticInOut", function(a) {
            return (a *= 2) < 1 ? -.5 * (this._p1 * Math.pow(2, 10 * (a -= 1)) * Math.sin((a - this._p3) * this._p2)) : this._p1 * Math.pow(2, -10 * (a -= 1)) * Math.sin((a - this._p3) * this._p2) * .5 + 1
        }, .45)),
        l("Expo", j("ExpoOut", function(a) {
            return 1 - Math.pow(2, -10 * a)
        }), j("ExpoIn", function(a) {
            return Math.pow(2, 10 * (a - 1)) - .001
        }), j("ExpoInOut", function(a) {
            return (a *= 2) < 1 ? .5 * Math.pow(2, 10 * (a - 1)) : .5 * (2 - Math.pow(2, -10 * (a - 1)))
        })),
        l("Sine", j("SineOut", function(a) {
            return Math.sin(a * h)
        }), j("SineIn", function(a) {
            return -Math.cos(a * h) + 1
        }), j("SineInOut", function(a) {
            return -.5 * (Math.cos(Math.PI * a) - 1)
        })),
        i("easing.EaseLookup", {
            find: function(b) {
                return a.map[b]
            }
        }, !0),
        k(e.SlowMo, "SlowMo", "ease,"),
        k(c, "RoughEase", "ease,"),
        k(b, "SteppedEase", "ease,"),
        o
    }, !0)
}),
_gsScope._gsDefine && _gsScope._gsQueue.pop()(),
function(a, b) {
    "use strict";
    var c = a.GreenSockGlobals = a.GreenSockGlobals || a;
    if (!c.TweenLite) {
        var d, e, f, g, h, i = function(a) {
            var b, d = a.split("."), e = c;
            for (b = 0; b < d.length; b++)
                e[d[b]] = e = e[d[b]] || {};
            return e
        }, j = i("com.greensock"), k = 1e-10, l = function(a) {
            var b, c = [], d = a.length;
            for (b = 0; b !== d; c.push(a[b++]))
                ;
            return c
        }, m = function() {}, n = function() {
            var a = Object.prototype.toString
              , b = a.call([]);
            return function(c) {
                return null != c && (c instanceof Array || "object" == typeof c && !!c.push && a.call(c) === b)
            }
        }(), o = {}, p = function(d, e, f, g) {
            this.sc = o[d] ? o[d].sc : [],
            o[d] = this,
            this.gsClass = null,
            this.func = f;
            var h = [];
            this.check = function(j) {
                for (var k, l, m, n, q, r = e.length, s = r; --r > -1; )
                    (k = o[e[r]] || new p(e[r],[])).gsClass ? (h[r] = k.gsClass,
                    s--) : j && k.sc.push(this);
                if (0 === s && f)
                    for (l = ("com.greensock." + d).split("."),
                    m = l.pop(),
                    n = i(l.join("."))[m] = this.gsClass = f.apply(f, h),
                    g && (c[m] = n,
                    q = "undefined" != typeof module && module.exports,
                    !q && "function" == typeof define && define.amd ? define((a.GreenSockAMDPath ? a.GreenSockAMDPath + "/" : "") + d.split(".").pop(), [], function() {
                        return n
                    }) : d === b && q && (module.exports = n)),
                    r = 0; r < this.sc.length; r++)
                        this.sc[r].check()
            }
            ,
            this.check(!0)
        }, q = a._gsDefine = function(a, b, c, d) {
            return new p(a,b,c,d)
        }
        , r = j._class = function(a, b, c) {
            return b = b || function() {}
            ,
            q(a, [], function() {
                return b
            }, c),
            b
        }
        ;
        q.globals = c;
        var s = [0, 0, 1, 1]
          , t = []
          , u = r("easing.Ease", function(a, b, c, d) {
            this._func = a,
            this._type = c || 0,
            this._power = d || 0,
            this._params = b ? s.concat(b) : s
        }, !0)
          , v = u.map = {}
          , w = u.register = function(a, b, c, d) {
            for (var e, f, g, h, i = b.split(","), k = i.length, l = (c || "easeIn,easeOut,easeInOut").split(","); --k > -1; )
                for (f = i[k],
                e = d ? r("easing." + f, null, !0) : j.easing[f] || {},
                g = l.length; --g > -1; )
                    h = l[g],
                    v[f + "." + h] = v[h + f] = e[h] = a.getRatio ? a : a[h] || new a
        }
        ;
        for (f = u.prototype,
        f._calcEnd = !1,
        f.getRatio = function(a) {
            if (this._func)
                return this._params[0] = a,
                this._func.apply(null, this._params);
            var b = this._type
              , c = this._power
              , d = 1 === b ? 1 - a : 2 === b ? a : .5 > a ? 2 * a : 2 * (1 - a);
            return 1 === c ? d *= d : 2 === c ? d *= d * d : 3 === c ? d *= d * d * d : 4 === c && (d *= d * d * d * d),
            1 === b ? 1 - d : 2 === b ? d : .5 > a ? d / 2 : 1 - d / 2
        }
        ,
        d = ["Linear", "Quad", "Cubic", "Quart", "Quint,Strong"],
        e = d.length; --e > -1; )
            f = d[e] + ",Power" + e,
            w(new u(null,null,1,e), f, "easeOut", !0),
            w(new u(null,null,2,e), f, "easeIn" + (0 === e ? ",easeNone" : "")),
            w(new u(null,null,3,e), f, "easeInOut");
        v.linear = j.easing.Linear.easeIn,
        v.swing = j.easing.Quad.easeInOut;
        var x = r("events.EventDispatcher", function(a) {
            this._listeners = {},
            this._eventTarget = a || this
                
        });
        f = x.prototype,
        f.addEventListener = function(a, b, c, d, e) {
            e = e || 0;
            var f, i, j = this._listeners[a], k = 0;
            for (null == j && (this._listeners[a] = j = []),
            i = j.length; --i > -1; )
                f = j[i],
                f.c === b && f.s === c ? j.splice(i, 1) : 0 === k && f.pr < e && (k = i + 1);
            j.splice(k, 0, {
                c: b,
                s: c,
                up: d,
                pr: e
            }),
            this !== g || h || g.wake()
        }
        ,
        f.removeEventListener = function(a, b) {
            var c, d = this._listeners[a];
            if (d)
                for (c = d.length; --c > -1; )
                    if (d[c].c === b)
                        return void d.splice(c, 1)
        }
        ,
        f.dispatchEvent = function(a) {
            var b, c, d, e = this._listeners[a];
            if (e)
                for (b = e.length,
                c = this._eventTarget; --b > -1; )
                    d = e[b],
                    d && (d.up ? d.c.call(d.s || c, {
                        type: a,
                        target: c
                    }) : d.c.call(d.s || c))
        }
        ;
        var y = a.requestAnimationFrame
          , z = a.cancelAnimationFrame
          , A = Date.now || function() {
            return (new Date).getTime()
        }
          , B = A();
        for (d = ["ms", "moz", "webkit", "o"],
        e = d.length; --e > -1 && !y; )
            y = a[d[e] + "RequestAnimationFrame"],
            z = a[d[e] + "CancelAnimationFrame"] || a[d[e] + "CancelRequestAnimationFrame"];
        r("Ticker", function(a, b) {
            var c, d, e, f, i, j = this, l = A(), n = b !== !1 && y ? "auto" : !1, o = 500, p = 33, q = "tick", r = function(a) {
                var b, g, h = A() - B;
                h > o && (l += h - p),
                B += h,
                j.time = (B - l) / 1e3,
                b = j.time - i,
                (!c || b > 0 || a === !0) && (j.frame++,
                i += b + (b >= f ? .004 : f - b),
                g = !0),
                a !== !0 && (e = d(r)),
                g && j.dispatchEvent(q)
            };
            x.call(j),
            j.time = j.frame = 0,
            j.tick = function() {
                r(!0)
            }
            ,
            j.lagSmoothing = function(a, b) {
                o = a || 1 / k,
                p = Math.min(b, o, 0)
            }
            ,
            j.sleep = function() {
                null != e && (n && z ? z(e) : clearTimeout(e),
                d = m,
                e = null,
                j === g && (h = !1))
            }
            ,
            j.wake = function(a) {
                null !== e ? j.sleep() : a ? l += -B + (B = A()) : j.frame > 10 && (B = A() - o + 5),
                d = 0 === c ? m : n && y ? y : function(a) {
                    return setTimeout(a, 1e3 * (i - j.time) + 1 | 0)
                }
                ,
                j === g && (h = !0),
                r(2)
            }
            ,
            j.fps = function(a) {
                return arguments.length ? (c = a,
                f = 1 / (c || 60),
                i = this.time + f,
                void j.wake()) : c
            }
            ,
            j.useRAF = function(a) {
                return arguments.length ? (j.sleep(),
                n = a,
                void j.fps(c)) : n
            }
            ,
            j.fps(a),
            setTimeout(function() {
                "auto" === n && j.frame < 5 && "hidden" !== document.visibilityState && j.useRAF(!1)
            }, 1500)
        }),
        f = j.Ticker.prototype = new j.events.EventDispatcher,
        f.constructor = j.Ticker;
        var C = r("core.Animation", function(a, b) {
            if (this.vars = b = b || {},
            this._duration = this._totalDuration = a || 0,
            this._delay = Number(b.delay) || 0,
            this._timeScale = 1,
            this._active = b.immediateRender === !0,
            this.data = b.data,
            this._reversed = b.reversed === !0,
            V) {
                h || g.wake();
                var c = this.vars.useFrames ? U : V;
                c.add(this, c._time),
                this.vars.paused && this.paused(!0)
            }
        });
        g = C.ticker = new j.Ticker,
        f = C.prototype,
        f._dirty = f._gc = f._initted = f._paused = !1,
        f._totalTime = f._time = 0,
        f._rawPrevTime = -1,
        f._next = f._last = f._onUpdate = f._timeline = f.timeline = null,
        f._paused = !1;
        var D = function() {
            h && A() - B > 2e3 && g.wake(),
            setTimeout(D, 2e3)
        };
        D(),
        f.play = function(a, b) {
            return null != a && this.seek(a, b),
            this.reversed(!1).paused(!1)
        }
        ,
        f.pause = function(a, b) {
            return null != a && this.seek(a, b),
            this.paused(!0)
        }
        ,
        f.resume = function(a, b) {
            return null != a && this.seek(a, b),
            this.paused(!1)
        }
        ,
        f.seek = function(a, b) {
            return this.totalTime(Number(a), b !== !1)
        }
        ,
        f.restart = function(a, b) {
            return this.reversed(!1).paused(!1).totalTime(a ? -this._delay : 0, b !== !1, !0)
        }
        ,
        f.reverse = function(a, b) {
            return null != a && this.seek(a || this.totalDuration(), b),
            this.reversed(!0).paused(!1)
        }
        ,
        f.render = function(a, b, c) {}
        ,
        f.invalidate = function() {
            return this._time = this._totalTime = 0,
            this._initted = this._gc = !1,
            this._rawPrevTime = -1,
            (this._gc || !this.timeline) && this._enabled(!0),
            this
        }
        ,
        f.isActive = function() {
            var a, b = this._timeline, c = this._startTime;
            return !b || !this._gc && !this._paused && b.isActive() && (a = b.rawTime()) >= c && a < c + this.totalDuration() / this._timeScale
        }
        ,
        f._enabled = function(a, b) {
            return h || g.wake(),
            this._gc = !a,
            this._active = this.isActive(),
            b !== !0 && (a && !this.timeline ? this._timeline.add(this, this._startTime - this._delay) : !a && this.timeline && this._timeline._remove(this, !0)),
            !1
        }
        ,
        f._kill = function(a, b) {
            return this._enabled(!1, !1)
        }
        ,
        f.kill = function(a, b) {
            return this._kill(a, b),
            this
        }
        ,
        f._uncache = function(a) {
            for (var b = a ? this : this.timeline; b; )
                b._dirty = !0,
                b = b.timeline;
            return this
        }
        ,
        f._swapSelfInParams = function(a) {
            for (var b = a.length, c = a.concat(); --b > -1; )
                "{self}" === a[b] && (c[b] = this);
            return c
        }
        ,
        f._callback = function(a) {
            var b = this.vars;
            b[a].apply(b[a + "Scope"] || b.callbackScope || this, b[a + "Params"] || t)
        }
        ,
        f.eventCallback = function(a, b, c, d) {
            if ("on" === (a || "").substr(0, 2)) {
                var e = this.vars;
                if (1 === arguments.length)
                    return e[a];
                null == b ? delete e[a] : (e[a] = b,
                e[a + "Params"] = n(c) && -1 !== c.join("").indexOf("{self}") ? this._swapSelfInParams(c) : c,
                e[a + "Scope"] = d),
                "onUpdate" === a && (this._onUpdate = b)
            }
            return this
        }
        ,
        f.delay = function(a) {
            return arguments.length ? (this._timeline.smoothChildTiming && this.startTime(this._startTime + a - this._delay),
            this._delay = a,
            this) : this._delay
        }
        ,
        f.duration = function(a) {
            return arguments.length ? (this._duration = this._totalDuration = a,
            this._uncache(!0),
            this._timeline.smoothChildTiming && this._time > 0 && this._time < this._duration && 0 !== a && this.totalTime(this._totalTime * (a / this._duration), !0),
            this) : (this._dirty = !1,
            this._duration)
        }
        ,
        f.totalDuration = function(a) {
            return this._dirty = !1,
            arguments.length ? this.duration(a) : this._totalDuration
        }
        ,
        f.time = function(a, b) {
            return arguments.length ? (this._dirty && this.totalDuration(),
            this.totalTime(a > this._duration ? this._duration : a, b)) : this._time
        }
        ,
        f.totalTime = function(a, b, c) {
            if (h || g.wake(),
            !arguments.length)
                return this._totalTime;
            if (this._timeline) {
                if (0 > a && !c && (a += this.totalDuration()),
                this._timeline.smoothChildTiming) {
                    this._dirty && this.totalDuration();
                    var d = this._totalDuration
                      , e = this._timeline;
                    if (a > d && !c && (a = d),
                    this._startTime = (this._paused ? this._pauseTime : e._time) - (this._reversed ? d - a : a) / this._timeScale,
                    e._dirty || this._uncache(!1),
                    e._timeline)
                        for (; e._timeline; )
                            e._timeline._time !== (e._startTime + e._totalTime) / e._timeScale && e.totalTime(e._totalTime, !0),
                            e = e._timeline
                }
                this._gc && this._enabled(!0, !1),
                (this._totalTime !== a || 0 === this._duration) && (I.length && X(),
                this.render(a, b, !1),
                I.length && X())
            }
            return this
        }
        ,
        f.progress = f.totalProgress = function(a, b) {
            var c = this.duration();
            return arguments.length ? this.totalTime(c * a, b) : c ? this._time / c : this.ratio
        }
        ,
        f.startTime = function(a) {
            return arguments.length ? (a !== this._startTime && (this._startTime = a,
            this.timeline && this.timeline._sortChildren && this.timeline.add(this, a - this._delay)),
            this) : this._startTime
        }
        ,
        f.endTime = function(a) {
            return this._startTime + (0 != a ? this.totalDuration() : this.duration()) / this._timeScale
        }
        ,
        f.timeScale = function(a) {
            if (!arguments.length)
                return this._timeScale;
            if (a = a || k,
            this._timeline && this._timeline.smoothChildTiming) {
                var b = this._pauseTime
                  , c = b || 0 === b ? b : this._timeline.totalTime();
                this._startTime = c - (c - this._startTime) * this._timeScale / a
            }
            return this._timeScale = a,
            this._uncache(!1)
        }
        ,
        f.reversed = function(a) {
            return arguments.length ? (a != this._reversed && (this._reversed = a,
            this.totalTime(this._timeline && !this._timeline.smoothChildTiming ? this.totalDuration() - this._totalTime : this._totalTime, !0)),
            this) : this._reversed
        }
        ,
        f.paused = function(a) {
            if (!arguments.length)
                return this._paused;
            var b, c, d = this._timeline;
            return a != this._paused && d && (h || a || g.wake(),
            b = d.rawTime(),
            c = b - this._pauseTime,
            !a && d.smoothChildTiming && (this._startTime += c,
            this._uncache(!1)),
            this._pauseTime = a ? b : null,
            this._paused = a,
            this._active = this.isActive(),
            !a && 0 !== c && this._initted && this.duration() && (b = d.smoothChildTiming ? this._totalTime : (b - this._startTime) / this._timeScale,
            this.render(b, b === this._totalTime, !0))),
            this._gc && !a && this._enabled(!0, !1),
            this
        }
        ;
        var E = r("core.SimpleTimeline", function(a) {
            C.call(this, 0, a),
            this.autoRemoveChildren = this.smoothChildTiming = !0
        });
        f = E.prototype = new C,
        f.constructor = E,
        f.kill()._gc = !1,
        f._first = f._last = f._recent = null,
        f._sortChildren = !1,
        f.add = f.insert = function(a, b, c, d) {
            var e, f;
            if (a._startTime = Number(b || 0) + a._delay,
            a._paused && this !== a._timeline && (a._pauseTime = a._startTime + (this.rawTime() - a._startTime) / a._timeScale),
            a.timeline && a.timeline._remove(a, !0),
            a.timeline = a._timeline = this,
            a._gc && a._enabled(!0, !0),
            e = this._last,
            this._sortChildren)
                for (f = a._startTime; e && e._startTime > f; )
                    e = e._prev;
            return e ? (a._next = e._next,
            e._next = a) : (a._next = this._first,
            this._first = a),
            a._next ? a._next._prev = a : this._last = a,
            a._prev = e,
            this._recent = a,
            this._timeline && this._uncache(!0),
            this
        }
        ,
        f._remove = function(a, b) {
            return a.timeline === this && (b || a._enabled(!1, !0),
            a._prev ? a._prev._next = a._next : this._first === a && (this._first = a._next),
            a._next ? a._next._prev = a._prev : this._last === a && (this._last = a._prev),
            a._next = a._prev = a.timeline = null,
            a === this._recent && (this._recent = this._last),
            this._timeline && this._uncache(!0)),
            this
        }
        ,
        f.render = function(a, b, c) {
            var d, e = this._first;
            for (this._totalTime = this._time = this._rawPrevTime = a; e; )
                d = e._next,
                (e._active || a >= e._startTime && !e._paused) && (e._reversed ? e.render((e._dirty ? e.totalDuration() : e._totalDuration) - (a - e._startTime) * e._timeScale, b, c) : e.render((a - e._startTime) * e._timeScale, b, c)),
                e = d
        }
        ,
        f.rawTime = function() {
            return h || g.wake(),
            this._totalTime
        }
        ;
        var F = r("TweenLite", function(b, c, d) {
            if (C.call(this, c, d),
            this.render = F.prototype.render,
            null == b)
                throw "Cannot tween a null target.";
            this.target = b = "string" != typeof b ? b : F.selector(b) || b;
            var e, f, g, h = b.jquery || b.length && b !== a && b[0] && (b[0] === a || b[0].nodeType && b[0].style && !b.nodeType), i = this.vars.overwrite;
            if (this._overwrite = i = null == i ? T[F.defaultOverwrite] : "number" == typeof i ? i >> 0 : T[i],
            (h || b instanceof Array || b.push && n(b)) && "number" != typeof b[0])
                for (this._targets = g = l(b),
                this._propLookup = [],
                this._siblings = [],
                e = 0; e < g.length; e++)
                    f = g[e],
                    f ? "string" != typeof f ? f.length && f !== a && f[0] && (f[0] === a || f[0].nodeType && f[0].style && !f.nodeType) ? (g.splice(e--, 1),
                    this._targets = g = g.concat(l(f))) : (this._siblings[e] = Y(f, this, !1),
                    1 === i && this._siblings[e].length > 1 && $(f, this, null, 1, this._siblings[e])) : (f = g[e--] = F.selector(f),
                    "string" == typeof f && g.splice(e + 1, 1)) : g.splice(e--, 1);
            else
                this._propLookup = {},
                this._siblings = Y(b, this, !1),
                1 === i && this._siblings.length > 1 && $(b, this, null, 1, this._siblings);
            (this.vars.immediateRender || 0 === c && 0 === this._delay && this.vars.immediateRender !== !1) && (this._time = -k,
            this.render(-this._delay))
        }, !0)
          , G = function(b) {
            return b && b.length && b !== a && b[0] && (b[0] === a || b[0].nodeType && b[0].style && !b.nodeType)
        }
          , H = function(a, b) {
            var c, d = {};
            for (c in a)
                S[c] || c in b && "transform" !== c && "x" !== c && "y" !== c && "width" !== c && "height" !== c && "className" !== c && "border" !== c || !(!P[c] || P[c] && P[c]._autoCSS) || (d[c] = a[c],
                delete a[c]);
            a.css = d
        };
        f = F.prototype = new C,
        f.constructor = F,
        f.kill()._gc = !1,
        f.ratio = 0,
        f._firstPT = f._targets = f._overwrittenProps = f._startAt = null,
        f._notifyPluginsOfEnabled = f._lazy = !1,
        F.version = "1.18.2",
        F.defaultEase = f._ease = new u(null,null,1,1),
        F.defaultOverwrite = "auto",
        F.ticker = g,
        F.autoSleep = 120,
        F.lagSmoothing = function(a, b) {
            g.lagSmoothing(a, b)
        }
        ,
        F.selector = a.$ || a.jQuery || function(b) {
            var c = a.$ || a.jQuery;
            return c ? (F.selector = c,
            c(b)) : "undefined" == typeof document ? b : document.querySelectorAll ? document.querySelectorAll(b) : document.getElementById("#" === b.charAt(0) ? b.substr(1) : b)
        }
        ;
        var I = []
          , J = {}
          , K = /(?:(-|-=|\+=)?\d*\.?\d*(?:e[\-+]?\d+)?)[0-9]/gi
          , L = function(a) {
            for (var b, c = this._firstPT, d = 1e-6; c; )
                b = c.blob ? a ? this.join("") : this.start : c.c * a + c.s,
                c.r ? b = Math.round(b) : d > b && b > -d && (b = 0),
                c.f ? c.fp ? c.t[c.p](c.fp, b) : c.t[c.p](b) : c.t[c.p] = b,
                c = c._next
        }
          , M = function(a, b, c, d) {
            var e, f, g, h, i, j, k, l = [a, b], m = 0, n = "", o = 0;
            for (l.start = a,
            c && (c(l),
            a = l[0],
            b = l[1]),
            l.length = 0,
            e = a.match(K) || [],
            f = b.match(K) || [],
            d && (d._next = null,
            d.blob = 1,
            l._firstPT = d),
            i = f.length,
            h = 0; i > h; h++)
                k = f[h],
                j = b.substr(m, b.indexOf(k, m) - m),
                n += j || !h ? j : ",",
                m += j.length,
                o ? o = (o + 1) % 5 : "rgba(" === j.substr(-5) && (o = 1),
                k === e[h] || e.length <= h ? n += k : (n && (l.push(n),
                n = ""),
                g = parseFloat(e[h]),
                l.push(g),
                l._firstPT = {
                    _next: l._firstPT,
                    t: l,
                    p: l.length - 1,
                    s: g,
                    c: ("=" === k.charAt(1) ? parseInt(k.charAt(0) + "1", 10) * parseFloat(k.substr(2)) : parseFloat(k) - g) || 0,
                    f: 0,
                    r: o && 4 > o
                }),
                m += k.length;
            return n += b.substr(m),
            n && l.push(n),
            l.setRatio = L,
            l
        }
          , N = function(a, b, c, d, e, f, g, h) {
            var i, j, k = "get" === c ? a[b] : c, l = typeof a[b], m = "string" == typeof d && "=" === d.charAt(1), n = {
                t: a,
                p: b,
                s: k,
                f: "function" === l,
                pg: 0,
                n: e || b,
                r: f,
                pr: 0,
                c: m ? parseInt(d.charAt(0) + "1", 10) * parseFloat(d.substr(2)) : parseFloat(d) - k || 0
            };
            return "number" !== l && ("function" === l && "get" === c && (j = b.indexOf("set") || "function" != typeof a["get" + b.substr(3)] ? b : "get" + b.substr(3),
            n.s = k = g ? a[j](g) : a[j]()),
            "string" == typeof k && (g || isNaN(k)) ? (n.fp = g,
            i = M(k, d, h || F.defaultStringFilter, n),
            n = {
                t: i,
                p: "setRatio",
                s: 0,
                c: 1,
                f: 2,
                pg: 0,
                n: e || b,
                pr: 0
            }) : m || (n.s = parseFloat(k),
            n.c = parseFloat(d) - n.s || 0)),
            n.c ? ((n._next = this._firstPT) && (n._next._prev = n),
            this._firstPT = n,
            n) : void 0
        }
          , O = F._internals = {
            isArray: n,
            isSelector: G,
            lazyTweens: I,
            blobDif: M
        }
          , P = F._plugins = {}
          , Q = O.tweenLookup = {}
          , R = 0
          , S = O.reservedProps = {
            ease: 1,
            delay: 1,
            overwrite: 1,
            onComplete: 1,
            onCompleteParams: 1,
            onCompleteScope: 1,
            useFrames: 1,
            runBackwards: 1,
            startAt: 1,
            onUpdate: 1,
            onUpdateParams: 1,
            onUpdateScope: 1,
            onStart: 1,
            onStartParams: 1,
            onStartScope: 1,
            onReverseComplete: 1,
            onReverseCompleteParams: 1,
            onReverseCompleteScope: 1,
            onRepeat: 1,
            onRepeatParams: 1,
            onRepeatScope: 1,
            easeParams: 1,
            yoyo: 1,
            immediateRender: 1,
            repeat: 1,
            repeatDelay: 1,
            data: 1,
            paused: 1,
            reversed: 1,
            autoCSS: 1,
            lazy: 1,
            onOverwrite: 1,
            callbackScope: 1,
            stringFilter: 1
        }
          , T = {
            none: 0,
            all: 1,
            auto: 2,
            concurrent: 3,
            allOnStart: 4,
            preexisting: 5,
            "true": 1,
            "false": 0
        }
          , U = C._rootFramesTimeline = new E
          , V = C._rootTimeline = new E
          , W = 30
          , X = O.lazyRender = function() {
            var a, b = I.length;
            for (J = {}; --b > -1; )
                a = I[b],
                a && a._lazy !== !1 && (a.render(a._lazy[0], a._lazy[1], !0),
                a._lazy = !1);
            I.length = 0
        }
        ;
        V._startTime = g.time,
        U._startTime = g.frame,
        V._active = U._active = !0,
        setTimeout(X, 1),
        C._updateRoot = F.render = function() {
            var a, b, c;
            if (I.length && X(),
            V.render((g.time - V._startTime) * V._timeScale, !1, !1),
            U.render((g.frame - U._startTime) * U._timeScale, !1, !1),
            I.length && X(),
            g.frame >= W) {
                W = g.frame + (parseInt(F.autoSleep, 10) || 120);
                for (c in Q) {
                    for (b = Q[c].tweens,
                    a = b.length; --a > -1; )
                        b[a]._gc && b.splice(a, 1);
                    0 === b.length && delete Q[c]
                }
                if (c = V._first,
                (!c || c._paused) && F.autoSleep && !U._first && 1 === g._listeners.tick.length) {
                    for (; c && c._paused; )
                        c = c._next;
                    c || g.sleep()
                }
            }
        }
        ,
        g.addEventListener("tick", C._updateRoot);
        var Y = function(a, b, c) {
            var d, e, f = a._gsTweenID;
            if (Q[f || (a._gsTweenID = f = "t" + R++)] || (Q[f] = {
                target: a,
                tweens: []
            }),
            b && (d = Q[f].tweens,
            d[e = d.length] = b,
            c))
                for (; --e > -1; )
                    d[e] === b && d.splice(e, 1);
            return Q[f].tweens
        }
          , Z = function(a, b, c, d) {
            var e, f, g = a.vars.onOverwrite;
            return g && (e = g(a, b, c, d)),
            g = F.onOverwrite,
            g && (f = g(a, b, c, d)),
            e !== !1 && f !== !1
        }
          , $ = function(a, b, c, d, e) {
            var f, g, h, i;
            if (1 === d || d >= 4) {
                for (i = e.length,
                f = 0; i > f; f++)
                    if ((h = e[f]) !== b)
                        h._gc || h._kill(null, a, b) && (g = !0);
                    else if (5 === d)
                        break;
                return g
            }
            var j, l = b._startTime + k, m = [], n = 0, o = 0 === b._duration;
            for (f = e.length; --f > -1; )
                (h = e[f]) === b || h._gc || h._paused || (h._timeline !== b._timeline ? (j = j || _(b, 0, o),
                0 === _(h, j, o) && (m[n++] = h)) : h._startTime <= l && h._startTime + h.totalDuration() / h._timeScale > l && ((o || !h._initted) && l - h._startTime <= 2e-10 || (m[n++] = h)));
            for (f = n; --f > -1; )
                if (h = m[f],
                2 === d && h._kill(c, a, b) && (g = !0),
                2 !== d || !h._firstPT && h._initted) {
                    if (2 !== d && !Z(h, b))
                        continue;
                    h._enabled(!1, !1) && (g = !0)
                }
            return g
        }
          , _ = function(a, b, c) {
            for (var d = a._timeline, e = d._timeScale, f = a._startTime; d._timeline; ) {
                if (f += d._startTime,
                e *= d._timeScale,
                d._paused)
                    return -100;
                d = d._timeline
            }
            return f /= e,
            f > b ? f - b : c && f === b || !a._initted && 2 * k > f - b ? k : (f += a.totalDuration() / a._timeScale / e) > b + k ? 0 : f - b - k
        };
        f._init = function() {
            var a, b, c, d, e, f = this.vars, g = this._overwrittenProps, h = this._duration, i = !!f.immediateRender, j = f.ease;
            if (f.startAt) {
                this._startAt && (this._startAt.render(-1, !0),
                this._startAt.kill()),
                e = {};
                for (d in f.startAt)
                    e[d] = f.startAt[d];
                if (e.overwrite = !1,
                e.immediateRender = !0,
                e.lazy = i && f.lazy !== !1,
                e.startAt = e.delay = null,
                this._startAt = F.to(this.target, 0, e),
                i)
                    if (this._time > 0)
                        this._startAt = null;
                    else if (0 !== h)
                        return
            } else if (f.runBackwards && 0 !== h)
                if (this._startAt)
                    this._startAt.render(-1, !0),
                    this._startAt.kill(),
                    this._startAt = null;
                else {
                    0 !== this._time && (i = !1),
                    c = {};
                    for (d in f)
                        S[d] && "autoCSS" !== d || (c[d] = f[d]);
                    if (c.overwrite = 0,
                    c.data = "isFromStart",
                    c.lazy = i && f.lazy !== !1,
                    c.immediateRender = i,
                    this._startAt = F.to(this.target, 0, c),
                    i) {
                        if (0 === this._time)
                            return
                    } else
                        this._startAt._init(),
                        this._startAt._enabled(!1),
                        this.vars.immediateRender && (this._startAt = null)
                }
            if (this._ease = j = j ? j instanceof u ? j : "function" == typeof j ? new u(j,f.easeParams) : v[j] || F.defaultEase : F.defaultEase,
            f.easeParams instanceof Array && j.config && (this._ease = j.config.apply(j, f.easeParams)),
            this._easeType = this._ease._type,
            this._easePower = this._ease._power,
            this._firstPT = null,
            this._targets)
                for (a = this._targets.length; --a > -1; )
                    this._initProps(this._targets[a], this._propLookup[a] = {}, this._siblings[a], g ? g[a] : null) && (b = !0);
            else
                b = this._initProps(this.target, this._propLookup, this._siblings, g);
            if (b && F._onPluginEvent("_onInitAllProps", this),
            g && (this._firstPT || "function" != typeof this.target && this._enabled(!1, !1)),
            f.runBackwards)
                for (c = this._firstPT; c; )
                    c.s += c.c,
                    c.c = -c.c,
                    c = c._next;
            this._onUpdate = f.onUpdate,
            this._initted = !0
        }
        ,
        f._initProps = function(b, c, d, e) {
            var f, g, h, i, j, k;
            if (null == b)
                return !1;
            J[b._gsTweenID] && X(),
            this.vars.css || b.style && b !== a && b.nodeType && P.css && this.vars.autoCSS !== !1 && H(this.vars, b);
            for (f in this.vars)
                if (k = this.vars[f],
                S[f])
                    k && (k instanceof Array || k.push && n(k)) && -1 !== k.join("").indexOf("{self}") && (this.vars[f] = k = this._swapSelfInParams(k, this));
                else if (P[f] && (i = new P[f])._onInitTween(b, this.vars[f], this)) {
                    for (this._firstPT = j = {
                        _next: this._firstPT,
                        t: i,
                        p: "setRatio",
                        s: 0,
                        c: 1,
                        f: 1,
                        n: f,
                        pg: 1,
                        pr: i._priority
                    },
                    g = i._overwriteProps.length; --g > -1; )
                        c[i._overwriteProps[g]] = this._firstPT;
                    (i._priority || i._onInitAllProps) && (h = !0),
                    (i._onDisable || i._onEnable) && (this._notifyPluginsOfEnabled = !0),
                    j._next && (j._next._prev = j)
                } else
                    c[f] = N.call(this, b, f, "get", k, f, 0, null, this.vars.stringFilter);
            return e && this._kill(e, b) ? this._initProps(b, c, d, e) : this._overwrite > 1 && this._firstPT && d.length > 1 && $(b, this, c, this._overwrite, d) ? (this._kill(c, b),
            this._initProps(b, c, d, e)) : (this._firstPT && (this.vars.lazy !== !1 && this._duration || this.vars.lazy && !this._duration) && (J[b._gsTweenID] = !0),
            h)
        }
        ,
        f.render = function(a, b, c) {
            var d, e, f, g, h = this._time, i = this._duration, j = this._rawPrevTime;
            if (a >= i - 1e-7)
                this._totalTime = this._time = i,
                this.ratio = this._ease._calcEnd ? this._ease.getRatio(1) : 1,
                this._reversed || (d = !0,
                e = "onComplete",
                c = c || this._timeline.autoRemoveChildren),
                0 === i && (this._initted || !this.vars.lazy || c) && (this._startTime === this._timeline._duration && (a = 0),
                (0 > j || 0 >= a && a >= -1e-7 || j === k && "isPause" !== this.data) && j !== a && (c = !0,
                j > k && (e = "onReverseComplete")),
                this._rawPrevTime = g = !b || a || j === a ? a : k);
            else if (1e-7 > a)
                this._totalTime = this._time = 0,
                this.ratio = this._ease._calcEnd ? this._ease.getRatio(0) : 0,
                (0 !== h || 0 === i && j > 0) && (e = "onReverseComplete",
                d = this._reversed),
                0 > a && (this._active = !1,
                0 === i && (this._initted || !this.vars.lazy || c) && (j >= 0 && (j !== k || "isPause" !== this.data) && (c = !0),
                this._rawPrevTime = g = !b || a || j === a ? a : k)),
                this._initted || (c = !0);
            else if (this._totalTime = this._time = a,
            this._easeType) {
                var l = a / i
                  , m = this._easeType
                  , n = this._easePower;
                (1 === m || 3 === m && l >= .5) && (l = 1 - l),
                3 === m && (l *= 2),
                1 === n ? l *= l : 2 === n ? l *= l * l : 3 === n ? l *= l * l * l : 4 === n && (l *= l * l * l * l),
                1 === m ? this.ratio = 1 - l : 2 === m ? this.ratio = l : .5 > a / i ? this.ratio = l / 2 : this.ratio = 1 - l / 2
            } else
                this.ratio = this._ease.getRatio(a / i);
            if (this._time !== h || c) {
                if (!this._initted) {
                    if (this._init(),
                    !this._initted || this._gc)
                        return;
                    if (!c && this._firstPT && (this.vars.lazy !== !1 && this._duration || this.vars.lazy && !this._duration))
                        return this._time = this._totalTime = h,
                        this._rawPrevTime = j,
                        I.push(this),
                        void (this._lazy = [a, b]);
                    this._time && !d ? this.ratio = this._ease.getRatio(this._time / i) : d && this._ease._calcEnd && (this.ratio = this._ease.getRatio(0 === this._time ? 0 : 1))
                }
                for (this._lazy !== !1 && (this._lazy = !1),
                this._active || !this._paused && this._time !== h && a >= 0 && (this._active = !0),
                0 === h && (this._startAt && (a >= 0 ? this._startAt.render(a, b, c) : e || (e = "_dummyGS")),
                this.vars.onStart && (0 !== this._time || 0 === i) && (b || this._callback("onStart"))),
                f = this._firstPT; f; )
                    f.f ? f.t[f.p](f.c * this.ratio + f.s) : f.t[f.p] = f.c * this.ratio + f.s,
                    f = f._next;
                this._onUpdate && (0 > a && this._startAt && a !== -1e-4 && this._startAt.render(a, b, c),
                b || (this._time !== h || d) && this._callback("onUpdate")),
                e && (!this._gc || c) && (0 > a && this._startAt && !this._onUpdate && a !== -1e-4 && this._startAt.render(a, b, c),
                d && (this._timeline.autoRemoveChildren && this._enabled(!1, !1),
                this._active = !1),
                !b && this.vars[e] && this._callback(e),
                0 === i && this._rawPrevTime === k && g !== k && (this._rawPrevTime = 0))
            }
        }
        ,
        f._kill = function(a, b, c) {
            if ("all" === a && (a = null),
            null == a && (null == b || b === this.target))
                return this._lazy = !1,
                this._enabled(!1, !1);
            b = "string" != typeof b ? b || this._targets || this.target : F.selector(b) || b;
            var d, e, f, g, h, i, j, k, l, m = c && this._time && c._startTime === this._startTime && this._timeline === c._timeline;
            if ((n(b) || G(b)) && "number" != typeof b[0])
                for (d = b.length; --d > -1; )
                    this._kill(a, b[d], c) && (i = !0);
            else {
                if (this._targets) {
                    for (d = this._targets.length; --d > -1; )
                        if (b === this._targets[d]) {
                            h = this._propLookup[d] || {},
                            this._overwrittenProps = this._overwrittenProps || [],
                            e = this._overwrittenProps[d] = a ? this._overwrittenProps[d] || {} : "all";
                            break
                        }
                } else {
                    if (b !== this.target)
                        return !1;
                    h = this._propLookup,
                    e = this._overwrittenProps = a ? this._overwrittenProps || {} : "all"
                }
                if (h) {
                    if (j = a || h,
                    k = a !== e && "all" !== e && a !== h && ("object" != typeof a || !a._tempKill),
                    c && (F.onOverwrite || this.vars.onOverwrite)) {
                        for (f in j)
                            h[f] && (l || (l = []),
                            l.push(f));
                        if ((l || !a) && !Z(this, c, b, l))
                            return !1
                    }
                    for (f in j)
                        (g = h[f]) && (m && (g.f ? g.t[g.p](g.s) : g.t[g.p] = g.s,
                        i = !0),
                        g.pg && g.t._kill(j) && (i = !0),
                        g.pg && 0 !== g.t._overwriteProps.length || (g._prev ? g._prev._next = g._next : g === this._firstPT && (this._firstPT = g._next),
                        g._next && (g._next._prev = g._prev),
                        g._next = g._prev = null),
                        delete h[f]),
                        k && (e[f] = 1);
                    !this._firstPT && this._initted && this._enabled(!1, !1)
                }
            }
            return i
        }
        ,
        f.invalidate = function() {
            return this._notifyPluginsOfEnabled && F._onPluginEvent("_onDisable", this),
            this._firstPT = this._overwrittenProps = this._startAt = this._onUpdate = null,
            this._notifyPluginsOfEnabled = this._active = this._lazy = !1,
            this._propLookup = this._targets ? {} : [],
            C.prototype.invalidate.call(this),
            this.vars.immediateRender && (this._time = -k,
            this.render(-this._delay)),
            this
        }
        ,
        f._enabled = function(a, b) {
            if (h || g.wake(),
            a && this._gc) {
                var c, d = this._targets;
                if (d)
                    for (c = d.length; --c > -1; )
                        this._siblings[c] = Y(d[c], this, !0);
                else
                    this._siblings = Y(this.target, this, !0)
            }
            return C.prototype._enabled.call(this, a, b),
            this._notifyPluginsOfEnabled && this._firstPT ? F._onPluginEvent(a ? "_onEnable" : "_onDisable", this) : !1
        }
        ,
        F.to = function(a, b, c) {
            return new F(a,b,c)
        }
        ,
        F.from = function(a, b, c) {
            return c.runBackwards = !0,
            c.immediateRender = 0 != c.immediateRender,
            new F(a,b,c)
        }
        ,
        F.fromTo = function(a, b, c, d) {
            return d.startAt = c,
            d.immediateRender = 0 != d.immediateRender && 0 != c.immediateRender,
            new F(a,b,d)
        }
        ,
        F.delayedCall = function(a, b, c, d, e) {
            return new F(b,0,{
                delay: a,
                onComplete: b,
                onCompleteParams: c,
                callbackScope: d,
                onReverseComplete: b,
                onReverseCompleteParams: c,
                immediateRender: !1,
                lazy: !1,
                useFrames: e,
                overwrite: 0
            })
        }
        ,
        F.set = function(a, b) {
            return new F(a,0,b)
        }
        ,
        F.getTweensOf = function(a, b) {
            if (null == a)
                return [];
            a = "string" != typeof a ? a : F.selector(a) || a;
            var c, d, e, f;
            if ((n(a) || G(a)) && "number" != typeof a[0]) {
                for (c = a.length,
                d = []; --c > -1; )
                    d = d.concat(F.getTweensOf(a[c], b));
                for (c = d.length; --c > -1; )
                    for (f = d[c],
                    e = c; --e > -1; )
                        f === d[e] && d.splice(c, 1)
            } else
                for (d = Y(a).concat(),
                c = d.length; --c > -1; )
                    (d[c]._gc || b && !d[c].isActive()) && d.splice(c, 1);
            return d
        }
        ,
        F.killTweensOf = F.killDelayedCallsTo = function(a, b, c) {
            "object" == typeof b && (c = b,
            b = !1);
            for (var d = F.getTweensOf(a, b), e = d.length; --e > -1; )
                d[e]._kill(c, a)
        }
        ;
        var aa = r("plugins.TweenPlugin", function(a, b) {
            this._overwriteProps = (a || "").split(","),
            this._propName = this._overwriteProps[0],
            this._priority = b || 0,
            this._super = aa.prototype
        }, !0);
        if (f = aa.prototype,
        aa.version = "1.18.0",
        aa.API = 2,
        f._firstPT = null,
        f._addTween = N,
        f.setRatio = L,
        f._kill = function(a) {
            var b, c = this._overwriteProps, d = this._firstPT;
            if (null != a[this._propName])
                this._overwriteProps = [];
            else
                for (b = c.length; --b > -1; )
                    null != a[c[b]] && c.splice(b, 1);
            for (; d; )
                null != a[d.n] && (d._next && (d._next._prev = d._prev),
                d._prev ? (d._prev._next = d._next,
                d._prev = null) : this._firstPT === d && (this._firstPT = d._next)),
                d = d._next;
            return !1
        }
        ,
        f._roundProps = function(a, b) {
            for (var c = this._firstPT; c; )
                (a[this._propName] || null != c.n && a[c.n.split(this._propName + "_").join("")]) && (c.r = b),
                c = c._next
        }
        ,
        F._onPluginEvent = function(a, b) {
            var c, d, e, f, g, h = b._firstPT;
            if ("_onInitAllProps" === a) {
                for (; h; ) {
                    for (g = h._next,
                    d = e; d && d.pr > h.pr; )
                        d = d._next;
                    (h._prev = d ? d._prev : f) ? h._prev._next = h : e = h,
                    (h._next = d) ? d._prev = h : f = h,
                    h = g
                }
                h = b._firstPT = e
            }
            for (; h; )
                h.pg && "function" == typeof h.t[a] && h.t[a]() && (c = !0),
                h = h._next;
            return c
        }
        ,
        aa.activate = function(a) {
            for (var b = a.length; --b > -1; )
                a[b].API === aa.API && (P[(new a[b])._propName] = a[b]);
            return !0
        }
        ,
        q.plugin = function(a) {
            if (!(a && a.propName && a.init && a.API))
                throw "illegal plugin definition.";
            var b, c = a.propName, d = a.priority || 0, e = a.overwriteProps, f = {
                init: "_onInitTween",
                set: "setRatio",
                kill: "_kill",
                round: "_roundProps",
                initAll: "_onInitAllProps"
            }, g = r("plugins." + c.charAt(0).toUpperCase() + c.substr(1) + "Plugin", function() {
                aa.call(this, c, d),
                this._overwriteProps = e || []
            }, a.global === !0), h = g.prototype = new aa(c);
            h.constructor = g,
            g.API = a.API;
            for (b in f)
                "function" == typeof a[b] && (h[f[b]] = a[b]);
            return g.version = a.version,
            aa.activate([g]),
            g
        }
        ,
        d = a._gsQueue) {
            for (e = 0; e < d.length; e++)
                d[e]();
            for (f in o)
                o[f].func || a.console.log("GSAP encountered missing dependency: com.greensock." + f)
        }
        h = !1
    }
}("undefined" != typeof module && module.exports && "undefined" != typeof global ? global : this || window, "TweenMax");

(function(x) {
    x.fn.WCircleMenu = function(N) {
        if (N == "open") {
            this.trigger("WCircleMenuOpen");
            return
        }
        if (N == "close") {
            this.trigger("WCircleMenuClose");
            return
        }
        var P = x.extend({}, x.fn.WCircleMenu.defaults, N);
        P.easingFuncShow = a(P.easingFuncShow);
        P.easingFuncHide = a(P.easingFuncHide);
        this.children("div.wcircle-icon").css({
            position: "absolute",
            top: 0,
            height: 0,
            width: P.width,
            height: P.height,
            display: "block"
        });
        this.children("div.wcircle-menu").css({
            width: P.width,
            height: P.height,
            position: "relative",
            display: "none"
        }).children("div").css({
            position: "absolute",
            top: "0",
            left: "0",
            opacity: "0"
        });
        function O(S) {
            if (S.is(".wcircle-open")) {
                return
            }
            var R = S.children("div.wcircle-menu");
            R.show();
            var T = R.children("div");
            p({
                objek: R.prev(),
                targetX: 0,
                fromX: 0,
                targetY: 0,
                fromY: 0,
                targetO: 1,
                fromO: 1,
                targetRot: P.iconRotation,
                fromRot: 0,
                easingFunc: P.easingFuncShow,
                step: P.step,
            });
            for (var Q = 0; Q < T.length; Q++) {
                (function(U) {
                    var V = false;
                    if (U == T.length - 1) {
                        V = function() {
                            S.removeClass("wcircle-animating");
                            S.addClass("wcircle-open");
                            if (typeof P.openCallback == "function") {
                                P.openCallback()
                            }
                        }
                    }
                    setTimeout(function() {
                        p({
                            objek: T.eq(U),
                            targetX: Math.round(Math.cos(P.angle_interval * U + P.angle_start) * P.distance),
                            fromX: 0,
                            targetY: Math.round(Math.sin(P.angle_interval * U + P.angle_start) * P.distance),
                            fromY: 0,
                            targetO: 1,
                            fromO: 0,
                            targetRot: 0,
                            fromRot: P.itemRotation,
                            easingFunc: P.easingFuncShow,
                            step: P.step,
                            callback: V,
                        })
                    }, P.delay * U)
                }
                )(Q)
            }
        }
        function M(S) {
            if (!S.is(".wcircle-open")) {
                return
            }
            var R = S.children("div.wcircle-menu");
            var T = R.children("div");
            p({
                objek: R.prev(),
                targetX: 0,
                fromX: 0,
                targetY: 0,
                fromY: 0,
                targetO: 1,
                fromO: 1,
                targetRot: 0,
                fromRot: P.iconRotation,
                easingFunc: P.easingFuncHide,
                step: P.step,
            });
            for (var Q = (T.length - 1); Q >= 0; Q--) {
                (function(U) {
                    var V = false;
                    if (U == 0) {
                        V = function() {
                            R.hide();
                            S.removeClass("wcircle-animating");
                            S.removeClass("wcircle-open");
                            if (typeof P.closeCallback == "function") {
                                P.closeCallback()
                            }
                        }
                    }
                    setTimeout(function() {
                        p({
                            objek: T.eq(U),
                            targetX: 0,
                            fromX: Math.round(Math.cos(P.angle_interval * U + P.angle_start) * P.distance),
                            targetY: 0,
                            fromY: Math.round(Math.sin(P.angle_interval * U + P.angle_start) * P.distance),
                            targetO: 0,
                            fromO: 1,
                            targetRot: P.itemRotation,
                            fromRot: 0,
                            easingFunc: P.easingFuncHide,
                            step: P.step,
                            callback: V,
                        })
                    }, P.delay * (T.length - (U + 1)))
                }
                )(Q)
            }
        }
        this.off("WCircleMenuOpen").on("WCircleMenuOpen", function() {
            self = x(this);
            O(self)
        });
        this.off("WCircleMenuClose").on("WCircleMenuClose", function() {
            self = x(this);
            M(self)
        });
        return this.off("click").on("click", function(S) {
            var Q = x(this);
            if (Q.is(".wcircle-animating")) {
                return
            }
            Q.addClass("wcircle-animating");
            var R = Q.children("div.wcircle-menu");
            if (R.is(":visible")) {
                M(Q)
            } else {
                O(Q)
            }
        })
    }
    ;
    x.fn.WCircleMenu.defaults = {
        width: "50px",
        height: "50px",
        angle_start: -Math.PI / 2,
        delay: 50,
        distance: 100,
        angle_interval: Math.PI / 6,
        easingFuncShow: "easeOutBack",
        easingFuncHide: "easeInBack",
        step: 15,
        openCallback: false,
        closeCallback: false,
        itemRotation: 360,
        iconRotation: 180,
    };
    function p(R) {
        if (typeof R.objek == "undefined") {
            return false
        }
        var M = (R.objek instanceof jQuery) ? R.objek : x(R.objek);
        if (M.is(".animatingTranslateXYO")) {
            return false
        }
        var X = (typeof R.targetX == "undefined") ? false : R.targetX;
        var Y = (typeof R.fromX == "undefined") ? false : R.fromX;
        var V = (typeof R.targetY == "undefined") ? false : R.targetY;
        var W = (typeof R.fromY == "undefined") ? false : R.fromY;
        var N = (typeof R.targetO == "undefined") ? false : R.targetO;
        var O = (typeof R.fromO == "undefined") ? false : R.fromO;
        var S = (typeof R.targetRot == "undefined") ? false : R.targetRot;
        var T = (typeof R.fromRot == "undefined") ? false : R.fromRot;
        var Z = (typeof R.callback == "undefined") ? false : R.callback;
        var Q = (typeof R.easingFunc != "function") ? d : R.easingFunc;
        var P = (typeof R.step == "undefined") ? 15 : R.step;
        var U = "transform";
        ["webkit", "Moz", "O", "ms"].every(function(aa) {
            var ab = aa + "Transform";
            if (typeof document.body.style[ab] !== "undefined") {
                U = ab
            }
        });
        M.addClass("animatingTranslateXYO");
        F(M, X, Y, V, W, N, O, S, T, P, 0, Z, Q, U)
    }
    function F(ae, V, X, U, W, aa, ab, Q, ad, S, T, P, N, M) {
        if (ae.is(".animatingTranslateXYO")) {
            if (typeof X === "undefined" || X === false) {
                X = parseInt(s(ae[0]))
            }
            if (typeof V === "undefined" || V === false) {
                V = X
            }
            if (typeof W === "undefined" || W === false) {
                W = parseInt(r(ae[0]))
            }
            if (typeof U === "undefined" || U === false) {
                U = W
            }
            if (typeof ab === "undefined" || ab === false) {
                ab = parseFloat(l(ae[0]))
            }
            if (typeof aa === "undefined" || aa === false) {
                aa = ab
            }
            if (typeof ad === "undefined" || ad === false) {
                ad = 0
            }
            if (typeof Q === "undefined" || Q === false) {
                Q = ad
            }
            var O = {};
            if (T <= S) {
                var Z = N(T, X, V - X, S);
                var Y = N(T, W, U - W, S);
                var ac = N(T, ab, aa - ab, S);
                var R = N(T, ad, Q - ad, S);
                O[M] = "translate3d(" + Z + "px, " + Y + "px, 0)rotate(" + R + "deg)";
                O.opacity = ac;
                T = T + 1;
                window.requestAnimationFrame(function() {
                    F(ae, V, X, U, W, aa, ab, Q, ad, S, T, P, N, M)
                });
                ae.css(O)
            } else {
                O[M] = "translate3d(" + V + "px, " + U + "px, 0)rotate(" + Q + "deg)";
                O.opacity = aa;
                ae.css(O);
                ae.removeClass("animatingTranslateXYO");
                if (typeof P == "function") {
                    P()
                }
            }
        }
    }
    function s(N) {
        var M = new WebKitCSSMatrix(window.getComputedStyle(N, null).webkitTransform);
        return M.m41
    }
    function r(N) {
        var M = new WebKitCSSMatrix(window.getComputedStyle(N, null).webkitTransform);
        return M.m42
    }
    function l(M) {
        return window.getComputedStyle(M).opacity
    }
    function a(M) {
        switch (M) {
        case "linearEase":
            return o;
        case "easeInQuad":
            return e;
        case "easeOutQuad":
            return L;
        case "easeInOutQuad":
            return C;
        case "easeInCubic":
            return f;
        case "easeOutCubic":
            return b;
        case "easeInOutCubic":
            return g;
        case "easeInQuart":
            return m;
        case "easeOutQuart":
            return j;
        case "easeInOutQuart":
            return n;
        case "easeInQuint":
            return y;
        case "easeOutQuint":
            return w;
        case "easeInOutQuint":
            return z;
        case "easeInSine":
            return c;
        case "easeOutSine":
            return J;
        case "easeInOutSine":
            return B;
        case "easeInExpo":
            return E;
        case "easeOutExpo":
            return A;
        case "easeInOutExpo":
            return t;
        case "easeInCirc":
            return i;
        case "easeOutCirc":
            return d;
        case "easeInOutCirc":
            return H;
        case "easeInElastic":
            return D;
        case "easeOutElastic":
            return G;
        case "easeInOutElastic":
            return v;
        case "easeInBack":
            return u;
        case "easeOutBack":
            return q;
        case "easeInOutBack":
            return h;
        case "easeInBounce":
            return k;
        case "easeOutBounce":
            return I;
        case "easeInOutBounce":
            return K;
            defaults: {
                return false
            }
        }
    }
    function o(N, M, P, O) {
        return P * N / O + M
    }
    function e(N, M, P, O) {
        return P * (N /= O) * N + M
    }
    function L(N, M, P, O) {
        return -P * (N /= O) * (N - 2) + M
    }
    function C(N, M, P, O) {
        if ((N /= O / 2) < 1) {
            return P / 2 * N * N + M
        }
        return -P / 2 * ((--N) * (N - 2) - 1) + M
    }
    function f(N, M, P, O) {
        return P * Math.pow(N / O, 3) + M
    }
    function b(N, M, P, O) {
        return P * (Math.pow(N / O - 1, 3) + 1) + M
    }
    function g(N, M, P, O) {
        if ((N /= O / 2) < 1) {
            return P / 2 * Math.pow(N, 3) + M
        }
        return P / 2 * (Math.pow(N - 2, 3) + 2) + M
    }
    function m(N, M, P, O) {
        return P * Math.pow(N / O, 4) + M
    }
    function j(N, M, P, O) {
        return -P * (Math.pow(N / O - 1, 4) - 1) + M
    }
    function n(N, M, P, O) {
        if ((N /= O / 2) < 1) {
            return P / 2 * Math.pow(N, 4) + M
        }
        return -P / 2 * (Math.pow(N - 2, 4) - 2) + M
    }
    function y(N, M, P, O) {
        return P * Math.pow(N / O, 5) + M
    }
    function w(N, M, P, O) {
        return P * (Math.pow(N / O - 1, 5) + 1) + M
    }
    function z(N, M, P, O) {
        if ((N /= O / 2) < 1) {
            return P / 2 * Math.pow(N, 5) + M
        }
        return P / 2 * (Math.pow(N - 2, 5) + 2) + M
    }
    function c(N, M, P, O) {
        return P * (1 - Math.cos(N / O * (Math.PI / 2))) + M
    }
    function J(N, M, P, O) {
        return P * Math.sin(N / O * (Math.PI / 2)) + M
    }
    function B(N, M, P, O) {
        return P / 2 * (1 - Math.cos(Math.PI * N / O)) + M
    }
    function E(N, M, P, O) {
        return P * Math.pow(2, 10 * (N / O - 1)) + M
    }
    function A(N, M, P, O) {
        return P * (-Math.pow(2, -10 * N / O) + 1) + M
    }
    function t(N, M, P, O) {
        if ((N /= O / 2) < 1) {
            return P / 2 * Math.pow(2, 10 * (N - 1)) + M
        }
        return P / 2 * (-Math.pow(2, -10 * --N) + 2) + M
    }
    function i(N, M, P, O) {
        return P * (1 - Math.sqrt(1 - (N /= O) * N)) + M
    }
    function d(N, M, P, O) {
        return P * Math.sqrt(1 - (N = N / O - 1) * N) + M
    }
    function H(N, M, P, O) {
        if ((N /= O / 2) < 1) {
            return P / 2 * (1 - Math.sqrt(1 - N * N)) + M
        }
        return P / 2 * (Math.sqrt(1 - (N -= 2) * N) + 1) + M
    }
    function D(O, M, S, R) {
        var P = 1.70158
          , Q = 0
          , N = S;
        if (S == 0) {
            return M
        }
        if (O == 0) {
            return M
        }
        if ((O /= R) == 1) {
            return M + S
        }
        if (!Q) {
            Q = R * 0.3
        }
        if (N < Math.abs(S)) {
            N = S;
            P = Q / 4
        } else {
            P = Q / (2 * Math.PI) * Math.asin(S / N)
        }
        return -(N * Math.pow(2, 10 * (O -= 1)) * Math.sin((O * R - P) * (2 * Math.PI) / Q)) + M
    }
    function G(O, M, S, R) {
        var P = 1.70158
          , Q = 0
          , N = S;
        if (S == 0) {
            return M
        }
        if (O == 0) {
            return M
        }
        if ((O /= R) == 1) {
            return M + S
        }
        if (!Q) {
            Q = R * 0.3
        }
        if (N < Math.abs(S)) {
            N = S;
            P = Q / 4
        } else {
            P = Q / (2 * Math.PI) * Math.asin(S / N)
        }
        return N * Math.pow(2, -10 * O) * Math.sin((O * R - P) * (2 * Math.PI) / Q) + S + M
    }
    function v(O, M, S, R) {
        var P = 1.70158
          , Q = 0
          , N = S;
        if (S == 0) {
            return M
        }
        if (O == 0) {
            return M
        }
        if ((O /= R / 2) == 2) {
            return M + S
        }
        if (!Q) {
            Q = R * (0.3 * 1.5)
        }
        if (N < Math.abs(S)) {
            N = S;
            P = Q / 4
        } else {
            P = Q / (2 * Math.PI) * Math.asin(S / N)
        }
        if (O < 1) {
            return -0.5 * (N * Math.pow(2, 10 * (O -= 1)) * Math.sin((O * R - P) * (2 * Math.PI) / Q)) + M
        }
        return N * Math.pow(2, -10 * (O -= 1)) * Math.sin((O * R - P) * (2 * Math.PI) / Q) * 0.5 + S + M
    }
    function u(N, M, R, P, Q) {
        var O = (typeof Q == "undefined") ? 1.70158 : Q;
        return R * (N /= P) * N * ((O + 1) * N - O) + M
    }
    function q(N, M, R, P, Q) {
        var O = (typeof Q == "undefined") ? 1.70158 : Q;
        return R * ((N = N / P - 1) * N * ((O + 1) * N + O) + 1) + M
    }
    function h(N, M, R, P, Q) {
        var O = (typeof Q == "undefined") ? 1.70158 : Q;
        if ((N /= P / 2) < 1) {
            return R / 2 * (R * R * (((O *= (1.525)) + 1) * N)) + M
        }
        return R / 2 * ((N -= 2) * N * (((O *= (1.525)) + 1) * N + O) + 2) + M
    }
    function k(N, M, P, O) {
        return P - easing.easeOutBounce(O - N, 0, P, O) + M
    }
    function I(N, M, P, O) {
        if ((N /= O) < (1 / 2.75)) {
            return P * (7.5625 * N * N) + M
        } else {
            if (N < (2 / 2.75)) {
                return P * (7.5625 * (N -= (1.5 / 2.75)) * N + 0.75) + M
            } else {
                if (N < (2.5 / 2.75)) {
                    return P * (7.5625 * (N -= (2.25 / 2.75)) * N + 0.9375) + M
                } else {
                    return P * (7.5625 * (N -= (2.625 / 2.75)) * N + 0.984375) + M
                }
            }
        }
    }
    function K(N, M, P, O) {
        if (N < O / 2) {
            return easing.easeOutBounce(N * 2, 0, P, O) * 0.5 + M
        } else {
            return easing.easeOutBounce(N * 2 - O, 0, P, O) * 0.5 + P * 0.5 + M
        }
    }
}
)(jQuery);

/*
 * transform: A jQuery cssHooks adding cross-browser 2d transform capabilities to $.fn.css() and $.fn.animate()
 *
 * limitations:
 * - requires jQuery 1.4.3+
 * - Should you use the *translate* property, then your elements need to be absolutely positionned in a relatively positionned wrapper **or it will fail in IE678**.
 * - transformOrigin is not accessible
 *
 * latest version and complete README available on Github:
 * https://github.com/louisremi/jquery.transform.js
 *
 * Copyright 2011 @louis_remi
 * Licensed under the MIT license.
 *
 * This saved you an hour of work?
 * Send me music http://www.amazon.co.uk/wishlist/HNTU0468LQON
 *
 */
(function($, window, document, Math, undefined) {

    /*
	 * Feature tests and global variables
	 */
    var div = document.createElement("div"), divStyle = div.style, suffix = "Transform", testProperties = ["O" + suffix, "ms" + suffix, "Webkit" + suffix, "Moz" + suffix], i = testProperties.length, supportProperty, supportMatrixFilter, supportFloat32Array = "Float32Array"in window, propertyHook, propertyGet, rMatrix = /Matrix([^)]*)/, rAffine = /^\s*matrix\(\s*1\s*,\s*0\s*,\s*0\s*,\s*1\s*(?:,\s*0(?:px)?\s*){2}\)\s*$/, _transform = "transform", _transformOrigin = "transformOrigin", _translate = "translate", _rotate = "rotate", _scale = "scale", _skew = "skew", _matrix = "matrix";

    // test different vendor prefixes of these properties
    while (i--) {
        if (testProperties[i]in divStyle) {
            $.support[_transform] = supportProperty = testProperties[i];
            $.support[_transformOrigin] = supportProperty + "Origin";
            continue;
        }
    }
    // IE678 alternative
    if (!supportProperty) {
        $.support.matrixFilter = supportMatrixFilter = divStyle.filter === "";
    }

    // px isn't the default unit of these properties
    $.cssNumber[_transform] = $.cssNumber[_transformOrigin] = true;

    /*
	 * fn.css() hooks
	 */
    if (supportProperty && supportProperty != _transform) {
        // Modern browsers can use jQuery.cssProps as a basic hook
        $.cssProps[_transform] = supportProperty;
        $.cssProps[_transformOrigin] = supportProperty + "Origin";

        // Firefox needs a complete hook because it stuffs matrix with "px"
        if (supportProperty == "Moz" + suffix) {
            propertyHook = {
                get: function(elem, computed) {
                    return (computed ? // remove "px" from the computed matrix
                    $.css(elem, supportProperty).split("px").join("") : elem.style[supportProperty]);
                },
                set: function(elem, value) {
                    // add "px" to matrices
                    elem.style[supportProperty] = /matrix\([^)p]*\)/.test(value) ? value.replace(/matrix((?:[^,]*,){4})([^,]*),([^)]*)/, _matrix + "$1$2px,$3px") : value;
                }
            };
            /* Fix two jQuery bugs still present in 1.5.1
			 * - rupper is incompatible with IE9, see http://jqbug.com/8346
			 * - jQuery.css is not really jQuery.cssProps aware, see http://jqbug.com/8402
			 */
        } else if (/^1\.[0-5](?:\.|$)/.test($.fn.jquery)) {
            propertyHook = {
                get: function(elem, computed) {
                    return (computed ? $.css(elem, supportProperty.replace(/^ms/, "Ms")) : elem.style[supportProperty]);
                }
            };
        }
        /* TODO: leverage hardware acceleration of 3d transform in Webkit only
		else if ( supportProperty == "Webkit" + suffix && support3dTransform ) {
			propertyHook = {
				set: function( elem, value ) {
					elem.style[supportProperty] =
						value.replace();
				}
			}
		}*/

    } else if (supportMatrixFilter) {
        propertyHook = {
            get: function(elem, computed, asArray) {
                var elemStyle = (computed && elem.currentStyle ? elem.currentStyle : elem.style), matrix, data;

                if (elemStyle && rMatrix.test(elemStyle.filter)) {
                    matrix = RegExp.$1.split(",");
                    matrix = [matrix[0].split("=")[1], matrix[2].split("=")[1], matrix[1].split("=")[1], matrix[3].split("=")[1]];
                } else {
                    matrix = [1, 0, 0, 1];
                }

                if (!$.cssHooks[_transformOrigin]) {
                    matrix[4] = elemStyle ? parseInt(elemStyle.left, 10) || 0 : 0;
                    matrix[5] = elemStyle ? parseInt(elemStyle.top, 10) || 0 : 0;

                } else {
                    data = $._data(elem, "transformTranslate", undefined);
                    matrix[4] = data ? data[0] : 0;
                    matrix[5] = data ? data[1] : 0;
                }

                return asArray ? matrix : _matrix + "(" + matrix + ")";
            },
            set: function(elem, value, animate) {
                var elemStyle = elem.style, currentStyle, Matrix, filter, centerOrigin;

                if (!animate) {
                    elemStyle.zoom = 1;
                }

                value = matrix(value);

                // rotate, scale and skew
                Matrix = ["Matrix(" + "M11=" + value[0], "M12=" + value[2], "M21=" + value[1], "M22=" + value[3], "SizingMethod='auto expand'"].join();
                filter = (currentStyle = elem.currentStyle) && currentStyle.filter || elemStyle.filter || "";

                elemStyle.filter = rMatrix.test(filter) ? filter.replace(rMatrix, Matrix) : filter + " progid:DXImageTransform.Microsoft." + Matrix + ")";

                if (!$.cssHooks[_transformOrigin]) {

                    // center the transform origin, from pbakaus's Transformie http://github.com/pbakaus/transformie
                    if ((centerOrigin = $.transform.centerOrigin)) {
                        elemStyle[centerOrigin == "margin" ? "marginLeft" : "left"] = -(elem.offsetWidth / 2) + (elem.clientWidth / 2) + "px";
                        elemStyle[centerOrigin == "margin" ? "marginTop" : "top"] = -(elem.offsetHeight / 2) + (elem.clientHeight / 2) + "px";
                    }

                    // translate
                    // We assume that the elements are absolute positionned inside a relative positionned wrapper
                    elemStyle.left = value[4] + "px";
                    elemStyle.top = value[5] + "px";

                } else {
                    $.cssHooks[_transformOrigin].set(elem, value);
                }
            }
        };
    }
    // populate jQuery.cssHooks with the appropriate hook if necessary
    if (propertyHook) {
        $.cssHooks[_transform] = propertyHook;
    }
    // we need a unique setter for the animation logic
    propertyGet = propertyHook && propertyHook.get || $.css;

    /*
	 * fn.animate() hooks
	 */
    $.fx.step.transform = function(fx) {
        var elem = fx.elem, start = fx.start, end = fx.end, pos = fx.pos, transform = "", precision = 1E5, i, startVal, endVal, unit;

        // fx.end and fx.start need to be converted to interpolation lists
        if (!start || typeof start === "string") {

            // the following block can be commented out with jQuery 1.5.1+, see #7912
            if (!start) {
                start = propertyGet(elem, supportProperty);
            }

            // force layout only once per animation
            if (supportMatrixFilter) {
                elem.style.zoom = 1;
            }

            // replace "+=" in relative animations (-= is meaningless with transforms)
            end = end.split("+=").join(start);

            // parse both transform to generate interpolation list of same length
            $.extend(fx, interpolationList(start, end));
            start = fx.start;
            end = fx.end;
        }

        i = start.length;

        // interpolate functions of the list one by one
        while (i--) {
            startVal = start[i];
            endVal = end[i];
            unit = +false;

            switch (startVal[0]) {

            case _translate:
                unit = "px";
            case _scale:
                unit || (unit = "");

                transform = startVal[0] + "(" + Math.round((startVal[1][0] + (endVal[1][0] - startVal[1][0]) * pos) * precision) / precision + unit + "," + Math.round((startVal[1][1] + (endVal[1][1] - startVal[1][1]) * pos) * precision) / precision + unit + ")" + transform;
                break;

            case _skew + "X":
            case _skew + "Y":
            case _rotate:
                transform = startVal[0] + "(" + Math.round((startVal[1] + (endVal[1] - startVal[1]) * pos) * precision) / precision + "rad)" + transform;
                break;
            }
        }

        fx.origin && (transform = fx.origin + transform);

        propertyHook && propertyHook.set ? propertyHook.set(elem, transform, +true) : elem.style[supportProperty] = transform;
    }
    ;

    /*
	 * Utility functions
	 */

    // turns a transform string into its "matrix(A,B,C,D,X,Y)" form (as an array, though)
    function matrix(transform) {
        transform = transform.split(")");
        var trim = $.trim, i = -1 // last element of the array is an empty string, get rid of it
        , l = transform.length - 1, split, prop, val, prev = supportFloat32Array ? new Float32Array(6) : [], curr = supportFloat32Array ? new Float32Array(6) : [], rslt = supportFloat32Array ? new Float32Array(6) : [1, 0, 0, 1, 0, 0];

        prev[0] = prev[3] = rslt[0] = rslt[3] = 1;
        prev[1] = prev[2] = prev[4] = prev[5] = 0;

        // Loop through the transform properties, parse and multiply them
        while (++i < l) {
            split = transform[i].split("(");
            prop = trim(split[0]);
            val = split[1];
            curr[0] = curr[3] = 1;
            curr[1] = curr[2] = curr[4] = curr[5] = 0;

            switch (prop) {
            case _translate + "X":
                curr[4] = parseInt(val, 10);
                break;

            case _translate + "Y":
                curr[5] = parseInt(val, 10);
                break;

            case _translate:
                val = val.split(",");
                curr[4] = parseInt(val[0], 10);
                curr[5] = parseInt(val[1] || 0, 10);
                break;

            case _rotate:
                val = toRadian(val);
                curr[0] = Math.cos(val);
                curr[1] = Math.sin(val);
                curr[2] = -Math.sin(val);
                curr[3] = Math.cos(val);
                break;

            case _scale + "X":
                curr[0] = +val;
                break;

            case _scale + "Y":
                curr[3] = val;
                break;

            case _scale:
                val = val.split(",");
                curr[0] = val[0];
                curr[3] = val.length > 1 ? val[1] : val[0];
                break;

            case _skew + "X":
                curr[2] = Math.tan(toRadian(val));
                break;

            case _skew + "Y":
                curr[1] = Math.tan(toRadian(val));
                break;

            case _matrix:
                val = val.split(",");
                curr[0] = val[0];
                curr[1] = val[1];
                curr[2] = val[2];
                curr[3] = val[3];
                curr[4] = parseInt(val[4], 10);
                curr[5] = parseInt(val[5], 10);
                break;
            }

            // Matrix product (array in column-major order)
            rslt[0] = prev[0] * curr[0] + prev[2] * curr[1];
            rslt[1] = prev[1] * curr[0] + prev[3] * curr[1];
            rslt[2] = prev[0] * curr[2] + prev[2] * curr[3];
            rslt[3] = prev[1] * curr[2] + prev[3] * curr[3];
            rslt[4] = prev[0] * curr[4] + prev[2] * curr[5] + prev[4];
            rslt[5] = prev[1] * curr[4] + prev[3] * curr[5] + prev[5];

            prev = [rslt[0], rslt[1], rslt[2], rslt[3], rslt[4], rslt[5]];
        }
        return rslt;
    }

    // turns a matrix into its rotate, scale and skew components
    // algorithm from http://hg.mozilla.org/mozilla-central/file/7cb3e9795d04/layout/style/nsStyleAnimation.cpp
    function unmatrix(matrix) {
        var scaleX, scaleY, skew, A = matrix[0], B = matrix[1], C = matrix[2], D = matrix[3];

        // Make sure matrix is not singular
        if (A * D - B * C) {
            // step (3)
            scaleX = Math.sqrt(A * A + B * B);
            A /= scaleX;
            B /= scaleX;
            // step (4)
            skew = A * C + B * D;
            C -= A * skew;
            D -= B * skew;
            // step (5)
            scaleY = Math.sqrt(C * C + D * D);
            C /= scaleY;
            D /= scaleY;
            skew /= scaleY;
            // step (6)
            if (A * D < B * C) {
                A = -A;
                B = -B;
                skew = -skew;
                scaleX = -scaleX;
            }

            // matrix is singular and cannot be interpolated
        } else {
            // In this case the elem shouldn't be rendered, hence scale == 0
            scaleX = scaleY = skew = 0;
        }

        // The recomposition order is very important
        // see http://hg.mozilla.org/mozilla-central/file/7cb3e9795d04/layout/style/nsStyleAnimation.cpp#l971
        return [[_translate, [+matrix[4], +matrix[5]]], [_rotate, Math.atan2(B, A)], [_skew + "X", Math.atan(skew)], [_scale, [scaleX, scaleY]]];
    }

    // build the list of transform functions to interpolate
    // use the algorithm described at http://dev.w3.org/csswg/css3-2d-transforms/#animation
    function interpolationList(start, end) {
        var list = {
            start: [],
            end: []
        }, i = -1, l, currStart, currEnd, currType;

        // get rid of affine transform matrix
        (start == "none" || isAffine(start)) && (start = "");
        (end == "none" || isAffine(end)) && (end = "");

        // if end starts with the current computed style, this is a relative animation
        // store computed style as the origin, remove it from start and end
        if (start && end && !end.indexOf("matrix") && toArray(start).join() == toArray(end.split(")")[0]).join()) {
            list.origin = start;
            start = "";
            end = end.slice(end.indexOf(")") + 1);
        }

        if (!start && !end) {
            return;
        }

        // start or end are affine, or list of transform functions are identical
        // => functions will be interpolated individually
        if (!start || !end || functionList(start) == functionList(end)) {

            start && (start = start.split(")")) && (l = start.length);
            end && (end = end.split(")")) && (l = end.length);

            while (++i < l - 1) {
                start[i] && (currStart = start[i].split("("));
                end[i] && (currEnd = end[i].split("("));
                currType = $.trim((currStart || currEnd)[0]);

                append(list.start, parseFunction(currType, currStart ? currStart[1] : 0));
                append(list.end, parseFunction(currType, currEnd ? currEnd[1] : 0));
            }

            // otherwise, functions will be composed to a single matrix
        } else {
            list.start = unmatrix(matrix(start));
            list.end = unmatrix(matrix(end))
        }

        return list;
    }

    function parseFunction(type, value) {
        var // default value is 1 for scale, 0 otherwise
        defaultValue = +(!type.indexOf(_scale)), scaleX, // remove X/Y from scaleX/Y & translateX/Y, not from skew
        cat = type.replace(/e[XY]/, "e");

        switch (type) {
        case _translate + "Y":
        case _scale + "Y":

            value = [defaultValue, value ? parseFloat(value) : defaultValue];
            break;

        case _translate + "X":
        case _translate:
        case _scale + "X":
            scaleX = 1;
        case _scale:

            value = value ? (value = value.split(",")) && [parseFloat(value[0]), parseFloat(value.length > 1 ? value[1] : type == _scale ? scaleX || value[0] : defaultValue + "")] : [defaultValue, defaultValue];
            break;

        case _skew + "X":
        case _skew + "Y":
        case _rotate:
            value = value ? toRadian(value) : 0;
            break;

        case _matrix:
            return unmatrix(value ? toArray(value) : [1, 0, 0, 1, 0, 0]);
            break;
        }

        return [[cat, value]];
    }

    function isAffine(matrix) {
        return rAffine.test(matrix);
    }

    function functionList(transform) {
        return transform.replace(/(?:\([^)]*\))|\s/g, "");
    }

    function append(arr1, arr2, value) {
        while (value = arr2.shift()) {
            arr1.push(value);
        }
    }

    // converts an angle string in any unit to a radian Float
    function toRadian(value) {
        return ~value.indexOf("deg") ? parseInt(value, 10) * (Math.PI * 2 / 360) : ~value.indexOf("grad") ? parseInt(value, 10) * (Math.PI / 200) : parseFloat(value);
    }

    // Converts "matrix(A,B,C,D,X,Y)" to [A,B,C,D,X,Y]
    function toArray(matrix) {
        // remove the unit of X and Y for Firefox
        matrix = /([^,]*),([^,]*),([^,]*),([^,]*),([^,p]*)(?:px)?,([^)p]*)(?:px)?/.exec(matrix);
        return [matrix[1], matrix[2], matrix[3], matrix[4], matrix[5], matrix[6]];
    }

    $.transform = {
        centerOrigin: "margin"
    };

}
)(jQuery, window, document, Math);

/*!
* jquery.counterup.js 1.0
*
* Copyright 2013, Benjamin Intal http://gambit.ph @bfintal
* Released under the GPL v2 License
*
* Date: Nov 26, 2013
*/
(function(e) {
    "use strict";
    e.fn.counterUp = function(t) {
        var n = e.extend({
            time: 400,
            delay: 10
        }, t);
        return this.each(function() {
            var t = e(this)
              , r = n
              , i = function() {
                var e = []
                  , n = r.time / r.delay
                  , i = t.text()
                  , s = /[0-9]+,[0-9]+/.test(i);
                i = i.replace(/,/g, "");
                var o = /^[0-9]+$/.test(i)
                  , u = /^[0-9]+\.[0-9]+$/.test(i)
                  , a = u ? (i.split(".")[1] || []).length : 0;
                for (var f = n; f >= 1; f--) {
                    var l = parseInt(i / n * f);
                    u && (l = parseFloat(i / n * f).toFixed(a));
                    if (s)
                        while (/(\d+)(\d{3})/.test(l.toString()))
                            l = l.toString().replace(/(\d+)(\d{3})/, "$1,$2");
                    e.unshift(l)
                }
                t.data("counterup-nums", e);
                t.text("0");
                var c = function() {
                    t.text(t.data("counterup-nums").shift());
                    if (t.data("counterup-nums").length)
                        setTimeout(t.data("counterup-func"), r.delay);
                    else {
                        delete t.data("counterup-nums");
                        t.data("counterup-nums", null);
                        t.data("counterup-func", null)
                    }
                };
                t.data("counterup-func", c);
                setTimeout(t.data("counterup-func"), r.delay)
            };
            t.waypoint(i, {
                offset: "100%",
                triggerOnce: !0
            })
        })
    }
}
)(jQuery);

$.browser = {};
(function() {
    jQuery.browser.msie = false;
    $.browser.version = 0;
    if (navigator.userAgent.match(/MSIE/) || navigator.userAgent.match(/Trident/)) {
        $.browser.msie = true;
    }
}
)();

var pcOnly = false;
var isDevice = "pc";
function gnb(dep1, dep2, type, myWedding) {
    var gnbWrap = $(".gnbWrap");
    var gnbSet = gnbWrap.find(".gnb");
    var dep1Li = gnbWrap.find(".dep1 > li");
    var dep1A = gnbWrap.find(".dep1 > li > a");
    var dep2Li = gnbWrap.find(".dep2 > li");
    var dep2A = gnbWrap.find(".dep2 > li > a");
    var subMenuArea = $(".subMenu");
    var btnMobileMenu = $(".mobileMenu");
    var btnMobileMenuClose = $(".btnMobileClose, .gnb_dim_bg");
    var gnbTime;
    var utilTime;
    //gnb관련 resize 이벤트
    $(window).resize(function() {
        var mobileWidth = 1025;
        var tableWidth = 768;
        if (!pcOnly) {
            if (window.innerWidth < mobileWidth && !$("body").hasClass("mobile")) {
                isDevice = "mobile";
                $("body").removeClass("pc");
                $("body").addClass("mobile");
                gnbSet.css("height", $(window).height() - 55);
                $(".gnbSet").hide();
                if (type == "myWedding") {
                    // if(type == "detail" || type == "myWedding"){ // 모바일 메뉴버튼 없는 헤더
                    var subTitle = $(".wrap h2").eq(0).text();

                    $("body").addClass("titleType");
                    $("h1").append("<div class='mobileTitle'>" + subTitle + "</div>")
                } else {
                    $("body").addClass("overviewType");
                }
            }
            if (window.innerWidth > mobileWidth && !$("body").hasClass("pc")) {
                isDevice = "pc";
                $("body").addClass("pc");
                $("body").removeClass("mobile");
                $("body").removeClass("mobileGnbOpen");
                $(".gnb_dim_bg").hide();
                $(".gnbSet").show();
                gnbSet.css("height", "auto");
                subMenuArea.removeAttr("style")

                if (type == "detail" || type == "myWedding") {
                    $("body").removeClass("titleType");
                    if ($("h1 .mobileTitle").length > 0) {
                        $("h1 .mobileTitle").remove();
                    }
                }
                //마이페이지 메뉴있을시 이벤트
                setTimeout(function() {
                    if ($(".myWeddingMenuWrap").length > 0) {
                        var onIdx = $(".myWeddingMenu .swiper-slide.on").index();
                        myWeddingMenuSlide.slideTo(onIdx);
                    }
                }, 100)

            }
            if ($(".myWeddingMenuWrap").length > 0 && window.innerWidth < tableWidth && !$("body").hasClass("mobile2") && !$("body").hasClass("mobile")) {
                isDevice = "mobile2";
                $("body").addClass("mobile2");
                if ($(".swiper-container").hasClass("swiper-container-horizontal")) {
                    myWeddingMenuSlide.destroy();
                }
            }

            if ($(".myWeddingMenuWrap").length > 0 && window.innerWidth > tableWidth && $("body").hasClass("mobile2")) {
                isDevice = "pc";
                $("body").removeClass("mobile2");
                var onIdx = $(".myWeddingMenu .swiper-slide.on").index();
                myWeddingMenu(onIdx);
                myWeddingMenuSlide.slideTo(onIdx);
            }
        } else {
            isDevice = "pc";
            $("body").addClass("pc");
        }
        gnbReset();
        $(window).scroll();
    }).resize();
    function gnbReset() {
        dep1Li.removeClass("on");
        dep2Li.removeClass("on hover");
        $("[data-menucode=" + dep1 + "]").addClass("on");
        $("[data-menucode=" + dep2 + "]").addClass("on");
        subMenuArea.removeClass("open");
        if ($("body").hasClass("pc")) {
            gnbWrap.removeClass("open");
            gnbWrap.find(".gnbBottom").removeAttr("style");
        }
        if ($("body").hasClass("mobile")) {
            $("[data-menucode=" + dep1 + "] .subMenu").show();
        }
        $("header .btnSearch").removeClass("on");
        gnbWrap.removeClass("open");
        gnbWrap.find(".gnbBottom").height(0);
        $(".gnbSearchArea").slideUp(100);
    }
    gnbReset();
    if (type == "myWedding") {
        $("body").addClass("myWeddingType");
        setTimeout(function() {
            if ($(".contents.myWedding").hasClass("overView")) {
                $(".myWeddingMenuWrap").addClass("onlyMoblieShow")
            }
        }, 100)

    }
    //gnb 웹이벤트 : s
    gnbWrap.find(".moreMenuBtn").on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            gnbWrap.find(".moreMenuBtn").addClass("on");
            gnbWrap.find(".moreBox").addClass("on");
            clearTimeout(utilTime);
        }
    })
    gnbWrap.find(".moreMenuBtn").on("mouseleave blur", function() {
        if ($("body").hasClass("pc")) {
            utilTime = setTimeout(function() {
                gnbWrap.find(".moreMenuBtn").removeClass("on");
                gnbWrap.find(".moreBox").removeClass("on");
            }, 300)
        }
    })
    gnbWrap.find(".moreBox").on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            gnbWrap.find(".moreMenuBtn").addClass("on");
            gnbWrap.find(".fixedMoreMenuBtn").addClass("on");
            gnbWrap.find(".moreBox").addClass("on");
            clearTimeout(utilTime);
        }
    })
    gnbWrap.find(".moreBox").on("mouseleave blur", function() {
        if ($("body").hasClass("pc")) {
            utilTime = setTimeout(function() {
                gnbWrap.find(".moreMenuBtn").removeClass("on");
                gnbWrap.find(".fixedMoreMenuBtn").removeClass("on");
                gnbWrap.find(".moreBox").removeClass("on");
            }, 300)
        }
    })

    gnbWrap.find(".fixedMoreMenuBtn").on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            gnbWrap.find(".fixedBox .moreBox").addClass("on");
            clearTimeout(utilTime);
        }
    })
    gnbWrap.find(".fixedMoreMenuBtn").on("mouseleave blur", function() {
        if ($("body").hasClass("pc")) {
            utilTime = setTimeout(function() {
                gnbWrap.find(".fixedBox .moreBox").removeClass("on");
            }, 300)
        }
    })

    dep1A.on("mouseenter focus", function() {
        if ($("body").hasClass("pc")) {
            dep1Li.removeClass("on");
            $(".gnbSearchArea").hide();
            $(this).parent().addClass("on");
            subMenuArea.removeClass("open");
            $(this).parent().find("> .subMenu").addClass("open");
            var subHeight = $(this).parent().find("> .subMenu").outerHeight();
            gnbWrap.addClass("open");
            gnbWrap.find(".gnbBottom").height(subHeight);
        }
    })

    gnbSet.on("mouseenter focusin", function() {
        if ($("body").hasClass("pc")) {
            clearTimeout(gnbTime);
        }
    })
    gnbSet.on("mouseleave focusout", function() {
        if ($("body").hasClass("pc")) {
            clearTimeout(gnbTime);
            gnbTime = setTimeout(function() {
                gnbReset()
            }, 300)
        }
    })
    //gnb 웹이벤트 : e

    //gnb 모바일 이벤트 : s
    dep1A.on("click", function(e) {
        if ($("body").hasClass("mobile")) {
            e.preventDefault();
            if (!$(this).parent().hasClass("on")) {
                dep1Li.removeClass("on");
                $(this).parent().addClass("on");
                subMenuArea.slideUp();
                $(this).parent().find("> .subMenu").slideDown();
            } else {// 2020.03.06 모바일 > 이벤트 상세에서 메뉴슬라이드 닫힘 현상
            //dep1Li.removeClass("on");
            //subMenuArea.slideUp();
            }
        }
    })

    btnMobileMenu.off('click').on("click", function(e) {
        e.preventDefault();

        var scrollTop = $(window).scrollTop();
        if (!$("body").hasClass("mobileGnbOpen")) {
            // mainTopBanner 있을시
            if ($(".mainTopBanner").length > 0) {
                $(".mainTopBanner .btnClose").click();
            }
            $(".gnb_dim_bg").fadeIn();
            $(".mobile .gnbSet").show();
            setTimeout(function() {
                $("body").addClass("mobileGnbOpen").css("top", -scrollTop);
            }, 100);
        } else {
            btnMobileMenuClose.click();
        }
    })

    btnMobileMenuClose.on("click", function(e) {
        e.preventDefault();
        var scrollTop = Number($("body").css("top").split("px")[0]) * -1;
        $("body").removeClass("mobileGnbOpen").removeAttr("style");
        $(window).scrollTop(scrollTop);
        $(".gnb_dim_bg").fadeOut();
        setTimeout(function() {
            $(".mobile .gnbSet").hide();
            gnbReset();
        }, 400)
    })
    $(".mobileBack").click(function() {
        // 뒤로갈 히스토리가 있을 경우
        if (document.referrer) {
            history.back(-1);
        } else {
            location.href = "/";
        }
    })
    $(window).scroll(function() {
        if ($(".topVisual").length > 0) {
            var contentTop = $(".topVisual").offset().top + $(".topVisual").height();
            if ($(this).scrollTop() > contentTop) {
                $(".gnbWrap").addClass("fixed");
            } else {
                $(".gnbWrap").removeClass("fixed");
            }
        }
        if ($(".prodDetailArea").length > 0) {
            var tabWrapTop = $(".prodDetailArea").offset().top;
            if ($(this).scrollTop() > tabWrapTop) {
                $("body").addClass("tabWrapFixed");
            } else {
                $("body").removeClass("tabWrapFixed");
            }
        }

        //mainTopBanner 있을시
        if ($("body").hasClass("mobile") && $(".mainTopBanner").length > 0) {
            if ($(this).scrollTop() > $(".mainTopBanner .inner").height()) {
                gnbWrap.addClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55);
            } else {
                gnbWrap.removeClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55 + $(".mainTopBanner .inner").height());
            }

        }

    }).scroll();

    setTimeout(function() {
        //mainTopBanner 있을시
        if ($("body").hasClass("mobile") && $(".mainTopBanner").length > 0) {
            if ($(this).scrollTop() > $(".mainTopBanner .inner").height()) {
                gnbWrap.addClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55);
            } else {
                gnbWrap.removeClass("mobileGnbFixed");
                $(".rouletteFixed").css("top", 55 + $(".mainTopBanner .inner").height());
            }
        }
    }, 100)
    //마이웨딩 메뉴 이벤트
    $(document).on("click", ".myWeddingType .moreMenuBtn", function(e) {
        e.preventDefault();
        var scrollTop = $(window).scrollTop();
        if (!$("body").hasClass("myWeddingMenuOpen")) {
            $(".myWedding_dim_bg").fadeIn();
            $(".myWeddingMenuWrap").show();
            setTimeout(function() {
                $("body").addClass("myWeddingMenuOpen").css("top", -scrollTop);
            }, 100);
        } else {
            $(".myWeddingMenuWrap .btnMobileClose").click();
        }
    })
    $(document).on("click", ".myWeddingType .btnMobileClose, .myWedding_dim_bg", function(e) {
        e.preventDefault();
        var scrollTop = Number($("body").css("top").split("px")[0]) * -1;
        $("body").removeClass("myWeddingMenuOpen").removeAttr("style");
        $(window).scrollTop(scrollTop);
        $(".myWedding_dim_bg").fadeOut();
        setTimeout(function() {
            $(".myWeddingMenuWrap").hide();
        }, 400)
    })
    //btnSearch
    $("header .btnSearch").off('click').on("click", function(e) {
        e.preventDefault();
        if (!$(this).hasClass("on")) {
            $(this).addClass("on");
            gnbWrap.addClass("open");
            gnbWrap.find(".gnbBottom").height(148);
            $(".gnbSearchArea").slideDown(100);
        } else {
            $(this).removeClass("on");
            gnbWrap.removeClass("open");
            gnbWrap.find(".gnbBottom").height(0);
            $(".gnbSearchArea").slideUp(100);
        }
    })

    $("header .btnSearchClose").on("click", function(e) {
        e.preventDefault();
        $("header .btnSearch").removeClass("on");
        gnbWrap.removeClass("open");
        gnbWrap.find(".gnbBottom").height(0);
        $(".gnbSearchArea").slideUp(100);
    })

    //btnOpenFamily

    $(".btnOpenFamily").off('click').on("click", function(e) {
        e.preventDefault();
        if (!$(this).hasClass("on")) {
            $(this).addClass("on");
            $(".familySiteWrap").slideDown(200);
        } else {
            $(this).removeClass("on");
            $(".familySiteWrap").slideUp(200);
        }

    })

    $('#my-menu').WCircleMenu({
        width: '45px',
        height: '45px',
        angle_start: -Math.PI,
        delay: 60,
        distance: 90,
        angle_interval: Math.PI / 4,
        easingFuncShow: "easeOutBack",
        easingFuncHide: "easeInBack",
        step: 10,
        openCallback: false,
        closeCallback: false,
        itemRotation: 1080,
        iconRotation: 0,
    });
    $(".wcircle-icon").click(function(e) {
        e.preventDefault();
        if (!$("#my-menu").hasClass("wcircle-open")) {
            $(".quickMenuDimBg").fadeIn();
        } else {
            $(".quickMenuDimBg").fadeOut();
        }
    })
    $(".wcircle-menu-item").click(function(e) {
        $('#my-menu').WCircleMenu("close");
        $(".quickMenuDimBg").fadeOut();
    })
    $(".btnScrollTop").click(function(e) {
        e.preventDefault();
        $("html,body").animate({
            scrollTop: 0
        }, 500)

    })
}
//레이어 팝업 함수
var layerPopCloseReturn;
function layerPop(option) {
    layerPopCloseReturn = $(":focus");
    var target = $("#" + option.target);
    var zindex = 0;
    if (option.type == "open") {
        if (target.css("display") == "none") {
            $("body").addClass("layerPopOpen");
            $(".layerPop").each(function() {
                if (zindex < Number($(this).css("z-index"))) {
                    zindex = Number($(this).css("z-index"));
                }
            })
            var top = ($(window).scrollTop() + ($(window).height() - target.height()) / 2);
            // 팝업 높이가 윈도우 높이 보다 클경우
            if ($(window).outerHeight() - 100 <= target.outerHeight()) {
                target.css({
                    top: $(window).scrollTop()
                });
            } else {
                //가운데 정렬
                target.css({
                    top: top
                });
            }
            target.css("z-index", zindex + 2).fadeIn().attr("tabindex", "0").focus();
            $("body").append("<div class='dim' id='" + option.target + "_bg' style='z-index:" + (zindex + 1) + "'></div>")
            $("#" + option.target + "_bg").fadeIn();
        }
    } else {
        target.fadeOut();
        $("#" + option.target + "_bg").fadeOut(function() {
            $("#" + option.target + "_bg").remove()
        });
        layerPopCloseReturn.focus();
    }
    target.find(".close, .btnClose").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + option.target + "_bg").fadeOut(function() {
            $("#" + option.target + "_bg").remove();
            $("body").removeClass("layerPopOpen");
        });
        if (typeof option.close === 'function') {
            option.close();
        }
        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }
    })
}

//커스텀 얼럿
function _alert(option) {

    layerPopCloseReturn = $(":focus");
    var cssFlag = option.cssFlag;
    var message = option.message;
    var close = option.close;
    var callback = option.callback;
    var length = $(".layerPop.alert").length + 1;
    var targetName = "alert" + ($(".layerPop.alert").length + 1);
    var btnTxt = "확인";

    if (option.btnTxt) {
        btnTxt = option.btnTxt;
    }
    var zindex = 0;

    // 20190325 cjh 특정팝업만 폰트 조절 요청건
    var cssClass = "";
    if (cssFlag == "other") {
        cssClass = "font-size:16px;"
    }

    var alertHtml = '';

    alertHtml += '<div class="layerPop alert" id="' + targetName + '">';
    alertHtml += '  <div class="popConts">';
    alertHtml += '      <div class="' + cssClass + '"><p class="alertTitle" "style="' + cssClass + '">' + message + '</p></div>';
    alertHtml += '      <div class="btnArea"><a href="#" class="btn btnBrown icoArr btnOk"><span>' + btnTxt + '</span></a></div>';
    alertHtml += '  </div>';
    alertHtml += ' 	<a href="#" class="close"><span>해당 팝업닫기</span></a>';
    alertHtml += '</div>';

    $("body").append(alertHtml);
    $(".layerPop").each(function() {
        if (zindex < Number($(this).css("z-index"))) {
            zindex = Number($(this).css("z-index"));
        }
    })

    var target = $("#" + targetName);
    target.css("z-index", zindex + 2).fadeIn(function() {
        target.find(".btnOk").focus();
    });
    $("body").append("<div class='dim' id='" + targetName + "_bg' style='z-index:" + (zindex + 1) + "'></div>")
    $("#" + targetName + "_bg").fadeIn();

    target.find(".close, .btnOk").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove();
            $("#" + targetName).remove();
        });
        if (typeof option.close === 'function') {
            option.close();
        }

        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

}

//커스텀 confirm
function _confirm(option) {
    layerPopCloseReturn = $(":focus");
    var message = option.message;
    var close = option.close;
    var callback = option.callback;
    var length = $(".layerPop.alert").length + 1;
    var targetName = "confirm" + ($(".layerPop.alert").length + 1);
    var zindex = 0;
    var confirmTxt = "확인";

    if (option.confirmTxt) {
        confirmTxt = option.confirmTxt;
    }

    var alertHtml = '';
    alertHtml += '<div class="layerPop alert confirm" id="' + targetName + '">';
    alertHtml += '  <div class="popConts">';
    // alertHtml += '      <div class="popTxtArea"><p class="alertTitle">'+message+'</p></div>';
    alertHtml += '      <p class="alertTitle">' + message + '</p>';
    alertHtml += '      <div class="btnArea"><a href="#" class="btn btnGray icoCancel btnCancel"><span>취소</span></a><a href="#" class="btn btnBrown icoArr btnOk"><span>' + confirmTxt + '</span></a></div>';
    alertHtml += '  </div>';
    alertHtml += ' 	<a href="#" class="close"><span>해당 팝업닫기</span></a>';
    alertHtml += '</div>';

    $("body").append(alertHtml);
    $(".layerPop").each(function() {
        if (zindex < Number($(this).css("z-index"))) {
            zindex = Number($(this).css("z-index"));
        }
    })

    var target = $("#" + targetName);
    target.css("z-index", zindex + 2).fadeIn().attr("tabindex", "0").focus();
    $("body").append("<div class='dim' id='" + targetName + "_bg' style='z-index:" + (zindex + 1) + "'></div>")
    $("#" + targetName + "_bg").fadeIn();
    target.find(".btnOk").focus();

    target.find(".close").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove();
            $("#" + targetName).remove();
        });
        if (typeof option.close === 'function') {
            option.close();
        }
        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

    target.find(".btnOk").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove();
            $("#" + targetName).remove();
        });
        if (typeof option.confirm === 'function') {
            option.confirm();
        }

        if (typeof option.close === 'function') {
            option.close(true);
        }

        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

    target.find(".btnCancel").on('click', function(e) {
        e.preventDefault();
        target.fadeOut();
        $("#" + targetName + "_bg").fadeOut(function() {
            $("#" + targetName + "_bg").remove()
            $("#" + targetName).remove();
        });
        if (typeof option.cancel === 'function') {
            option.cancel();
        }

        if (typeof option.close === 'function') {
            option.close();
        }

        if (option.focus == undefined) {
            layerPopCloseReturn.focus();
        } else {
            option.focus()
        }

    })

}
var tagListResizeTime;
function tagListToggle() {
    //태그 토글
    $(".tagListWrap.toggle .btnOpenClose").click(function(e) {
        e.preventDefault();
        var target = $(this).closest(".tagListWrap");
        if (!target.hasClass("open")) {
            target.addClass("open");
            var tagHeight = target.find(".tagList .inner").height();
            target.find(".tagList").animate({
                height: tagHeight
            }, 300)
        } else {
            target.removeClass("open");
            target.find(".tagList").animate({
                height: 42
            }, 300);
        }
    })
    $(window).resize(function() {
        clearTimeout(tagListResizeTime);
        tagListResizeTime = setTimeout(function() {
            $(".tagListWrap.open").each(function() {
                var target = $(this);
                var tagHeight = target.find(".tagList .inner").height();
                target.find(".tagList").css({
                    height: tagHeight
                })
            })
        }, 100)
    })
}
function listTypeChg() {
    $(".btnListType a").click(function(e) {
        e.preventDefault();
        if ($(this).hasClass("btnList")) {
            $(".btnListType a").removeClass("on");
            $(this).addClass("on");
            $(this).closest(".communityList").attr("class", "communityList txtList");
        }
        if ($(this).hasClass("btnGallery")) {
            $(".btnListType a").removeClass("on");
            $(this).addClass("on");
            $(this).closest(".communityList").attr("class", "communityList");
        }
    })
}
var myWeddingMenuSlide;
function myWeddingMenu(idx) {
    myWeddingMenuSlide = new Swiper('.myWeddingMenuWrap .swiper-container',{
        slidesPerView: "auto",
        slidesPerGroup: 1,
        spaceBetween: 65,
        navigation: {
            nextEl: '.myWeddingMenuWrap .next',
            prevEl: '.myWeddingMenuWrap .prev',
        },
        breakpoints: {
            30000: {
                spaceBetween: 65,
            },
            1024: {
                spaceBetween: 40,
            }
        }
    });
    if (idx >= myWeddingMenuSlide.slides.length - 1) {
        idx = myWeddingMenuSlide.slides.length - 1
    }
    myWeddingMenuSlide.slideTo(idx);
    $(".myWeddingMenu .swiper-slide").eq(idx).addClass("on");
}

// tooltipFn
function tooltipFn() {
    var el = $('.toolTipLayer');
    var elBtn = $('.toolTip');

    if (el.length <= 0 && elBtn.length <= 0) {
        return;
    }

    elBtn.on('click', function(e) {
        if ($("body").hasClass("pc")) {
            e.preventDefault();
        }
    });

    elBtn.on('mouseenter focus', function() {
        if ($("body").hasClass("pc")) {
            TweenMax.set($(this).next(el), {
                opacity: 0,
                y: 30,
                display: 'block'
            });
            TweenMax.to($(this).next(el), 0.3, {
                opacity: 1,
                y: 0
            });
        }

    });
    elBtn.on('mouseleave blur', function() {
        if ($("body").hasClass("pc")) {
            TweenMax.to($(this).next(el), 0.3, {
                opacity: 0,
                y: 30,
                onComplete: function() {
                    el.removeAttr('style');
                }
            });
        }
    });

    elBtn.on('click', function(e) {
        if ($("body").hasClass("mobile")) {
            e.preventDefault();
            var posX = $(this).offset().left;
            //console.log(posX)
            $('.toolTipBox').prepend('<div class="dim" style="display:block"></div>')
            if ($(this).hasClass('on')) {
                $(this).removeClass('on');
                TweenMax.to($(this).next(el), 0.3, {
                    opacity: 0,
                    y: 30,
                    onComplete: function() {
                        $(this).next(el).removeAttr('style');
                    }
                });
            } else {
                $(this).addClass('on');
                TweenMax.set($(this).next(el), {
                    opacity: 0,
                    y: 30,
                    display: 'block'
                });
                TweenMax.to($(this).next(el), 0.3, {
                    opacity: 1,
                    y: 0
                });
            }
            $('.toolTipLayer .toolTipClose').on('click', function(e) {
                e.preventDefault();
                $('.toolTipBox .dim').remove();
                elBtn.removeClass('on');
                TweenMax.to(el, 0.3, {
                    opacity: 0,
                    y: 30,
                    onComplete: function() {
                        el.removeAttr('style');
                    }
                });
            });
        }
    });
}

// gallery
var galleryThumbs;
var galleryTop;
var resizeTiming;
function gallery() {
    var el = $('.photoViewArea');

    if (el.length <= 0) {
        return;
    }

    galleryThumbs = new Swiper('.gallery-thumbs',{
        direction: 'vertical',
        slidesPerView: 5,
        freeMode: true,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        breakpoints: {
            // when window width is <= 768px
            1023: {
                direction: 'horizontal',
                slidesPerView: 'auto'
            },
            100000: {
                direction: 'vertical',
                slidesPerView: 5,
            }
        },
        on: {
            init: function() {
                $(".gallery-thumbs .swiper-slide a").click(function(e) {
                    e.preventDefault();
                })
            }
        }
    });
    galleryTop = new Swiper('.gallery-top',{
        effect: 'fade',
        autoHeight: true,
        navigation: {
            nextEl: '.controls .btnDown',
            prevEl: '.controls .btnUp',
        },
        thumbs: {
            swiper: galleryThumbs
        }
    });
    $(window).resize(function() {
        clearTimeout(resizeTiming);
        resizeTiming = setTimeout(function() {
            galleryThumbs.destroy();
            galleryTop.destroy();
            gallery();
        }, 10)
    });
}

//상세페이지 토글버튼
function imgList() {
    var el = $('.boardView, .prodInfoArea');

    if (el.length <= 0) {
        return;
    }

    //웨딩TIP
    $(".imgList a.more").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".imgList");
        if (!target.hasClass("open")) {
            target.addClass("open");
        } else {
            target.removeClass("open");
        }
    });

    //상품상세 리뷰 썸네일&big
    $(".reviewImg .btnView").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".list");
        $(this).closest('.list').toggleClass('thumb');
        if (!target.hasClass("thumb")) {
            target.removeClass("thumb");
            $(this).children().text("작게보기");
        } else {
            target.addClass("thumb");
            $(this).children().text("크게보기");
        }
    });

    //후기인증 URL
    $(".afterConfirm .btnView").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".afterConfirm");
        if (!target.hasClass("open")) {
            target.addClass("open");
            $(this).children().text("후기인증 URL 닫기");
        } else {
            target.removeClass("open");
            $(this).children().text("후기인증 URL 보기");
        }
    });
}

//레이어팝업 가운데 정렬
function layerPopMid() {
    var top = ($(window).scrollTop() + ($(window).height() - $('.layerPop').height()) / 2);
    // 팝업 높이가 윈도우 높이 보다 클경우
    if ($(window).outerHeight() - 100 <= $('.layerPop').outerHeight()) {
        $('.layerPop').css({
            top: $(window).scrollTop()
        });
    } else {
        //가운데 정렬
        $('.layerPop').css({
            top: top
        });
    }
}

//일정레이어
function schLayer() {
    var el = $('.calendarWrap');

    if (el.length <= 0) {
        return;
    }

    el.find('.list > li').on('mouseenter', function() {
        if ($("body").hasClass("pc")) {
            $(this).find('.layer').show().stop().animate({
                'left': '23px',
                'opacity': '1'
            }, 300)
        }
    });
    el.find('.list > li').on('mouseleave', function() {
        if ($("body").hasClass("pc")) {
            $(this).find('.layer').stop().animate({
                'left': '50px',
                'opacity': '0'
            }, 300, function() {
                $(this).hide();
            });
        }
    });

}

//예산계산기
function inputToggle() {
    var el = $('.budgetWrap');

    if (el.length <= 0) {
        return;
    }

    //input 열림
    $(".modify a").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".titArea");
        target.addClass("open");
        target.find(".tit").hide();
        target.find(".save").show();
    });

    //input 닫힘
    $(".save a").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".titArea");
        target.removeClass("open");
        target.find(".tit").show();
        target.find(".save").hide();
    });
}

//룰렛이벤트
function rouletteAni(flag) {
    var el = $('.rouletteArea');

    if (el.length <= 0) {
        return;
    }

    var _flag = true;
    $(".roulette .rouletteBtn").on('click', function(e) {
        e.preventDefault();
        var target = $(this).closest(".roulette");
        target.addClass("active")
        var arr = ['succ', 'fail'];
        if (_flag == true) {
            target.addClass(arr[flag]);

            var idx = 0;
            var len = $('.panel div').length;
            setup(idx);
            function setup(i) {
                $(".panel div").eq(i).addClass('on').siblings().removeClass('on');
            }
            function motion() {
                idx == len ? idx = 0 : idx++;
                setup(idx)
            }
            var timer = setInterval(motion, 100);

            setTimeout(function() {
                clearInterval(timer);
            }, 3000);

            _flag = false;
        }
    });
}

function tabControl(tab, con) {

    var tc = $(tab);

    tc.find('li>a').on('click', function() {
        var idx = $(this).parent().index();

        if (!$(this).parent().hasClass('on')) {
            $(this).parent().parent().parent().find('li').removeClass('on');
            $(this).parent().parent().parent().parent().find(con).removeClass('on');
            $(this).parent().addClass('on');
            $(this).parent().parent().parent().parent().find(con).eq(idx).addClass('on');
        }
    });

}

$(function() {
    //토글 슬라이드
    $(".toggleWrap .toggleBtn").click(function(e) {
        e.preventDefault();
        var target = $(this).closest(".toggleList");
        if (!$(this).parent().hasClass("on")) {
            target.find("li").removeClass("on");
            $(this).parent().addClass("on");
            target.find(".toggleCon").slideUp();
            $(this).parent().find(".toggleCon").slideDown();
        } else {
            $(this).parent().removeClass("on")
            target.find(".toggleCon").slideUp();
        }
    });
    $(".toggleWrap2 .toggleBtn").click(function(e) {
        e.preventDefault();
        var target = $(this).closest(".toggleList");

        if (!$(this).parent().hasClass("on")) {
            if (target.find('.subTabCon').length > 0) {
                target.find('.subTabCon').find('li:first-child').addClass('on');
            }

            /*			
 			// 쿠폰북 탭지정처리 (쇼콜라 이벤트 전용 임시)
			if(oParams.tabId != null && oParams.subtab != null) {
				if(oParams.tabId == 4 && oParams.subtab == 8) {
					target.find('.subTabCon').find('li:first-child').removeClass('on');
				}
			}
*/

            $(".toggleWrap2").find('.toggleList').removeClass('on');
            $(".toggleWrap2").find('.toggleCon').hide();

            //target.find("li").removeClass("on");
            $(this).parent().addClass("on");
            target.find(".toggleCon").slideUp();

            $(this).parent().find(".toggleCon").slideDown();
        } else {
            $(this).parent().removeClass("on");
            target.find(".toggleCon").slideUp();
            target.find('.subTabCon').find('li').removeClass('on');
        }
    });

    //검색시 활성화
    $(".searchBar input").focus(function() {
        $(this).closest(".searchBar").addClass("on")
    })
    $(".searchBar input").blur(function() {
        $(this).closest(".searchBar").removeClass("on")
    })
    $(".myWeddingInofoBox .btnScroll").click(function(e) {
        e.preventDefault();
        if (!$(this).hasClass("on")) {
            $(this).addClass("on");
            $(this).closest(".mobileScrollArea").animate({
                "scrollLeft": $(window).width()
            }, 500);
        } else {
            $(this).removeClass("on");
            $(this).closest(".mobileScrollArea").animate({
                "scrollLeft": 0
            }, 500);
        }
    })
    $(".mobileScrollArea").scroll(function() {
        console.log();
        if ($(this).scrollLeft() > 0) {
            $(".myWeddingInofoBox .btnScroll").addClass("on");
        } else {
            $(".myWeddingInofoBox .btnScroll").removeClass("on");
        }
    })
    $("input").each(function() {
        if ($(this).prop("readonly")) {
            $(this).addClass("readonly");
        }
    })

    $(".layerPop").appendTo("body");
    tagListToggle()
    listTypeChg();

    tooltipFn();
    gallery();
    imgList();
    schLayer();
    layerPopMid();
    //보여주기위한 팝업센터 정렬 실페이지에선 없어도됨
    inputToggle();
    setTimeout(function() {
        $(".tui-calendar-body-inner").on('touchend', function(e) {
            e.preventDefault();
        })
    }, 1000)

    tabControl('.tabCon', '.tabContentCon');
    tabControl('.subTabCon', '.subTabContentCon');
})

// 20200805 추가
// 플로팅 배너

function startFloatingBanner() {
    //mainTopBanner 있을시 5초 뒤 실행
    if ($(".mainTopBanner").length > 0) {
        setTimeout(function() {
            setFloatingBanner();
        }, 500);
    } else {
        setTimeout(function() {
            setFloatingBanner();
        }, 0);
    }

}

$(window).on('resize', function() {
    if ($(".mainTopBanner").length > 0) {
        setTimeout(function() {
            setFloatingBanner();
        }, 500);
    } else {
        setTimeout(function() {
            setFloatingBanner();
        }, 0);
    }

});

function setFloatingBanner() {
    var $bannerText;
    var $slide = $('.floating-swiper-container').find('.swiper-slide');

    //duplicate swiper 초기화
    swiperTextController();

    // 플로팅 배너 스와이퍼
    var floatingBannerSwiper = new Swiper('.floating-swiper-container',{
        slidesPerView: 1,
        loop: true,
        followFinger: false,
        //20200820 추가
        simulateTouch: true,
        //20200820 추가
        autoplay: {
            delay: 3000,
            disableOnInteraction: false
        },
        pagination: {
            el: '.swiper-pagination',
            type: 'fraction',
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        }
    });

    // 플로팅 배너 글씨 줄바꿈
    function swiperTextController() {
        var arr = [];

        $slide.each(function(index, item) {
            $bannerText = $(item).find('.banner-txt');
            arr.push($bannerText.text())

            if (arr[index].length > 6) {
                $bannerText.text('');
                $bannerText.append(arr[index].substr(0, 6) + '<br/>' + arr[index].substr(6));
            }
        })
    }
    ;
    var TopBanner = $(".mainTopBanner");
    var TopBannerCloseBtn = $(".mainTopBanner .btnClose");
    var FloatingBanner = $(".floatingFixed");
    var FloatingBannerCloseBtn = $('.floatingFixed .close-btn');
    var MainTopVisual = $('.mainTopVisual');

    // 플로팅 배너 닫기
    FloatingBannerCloseBtn.on('click', function() {
        FloatingBanner.css({
            'opacity': 0,
            'visibility': 'hidden'
        });
        // FloatingBanner.hide();
    });

    // 플로팅 배너 위치

    //모바일
    if ($('body').hasClass('mobile')) {
        var _bottom = MainTopVisual[0] ? 140 : 15;
        FloatingBanner.css({
            'bottom': _bottom,
            'top': 'auto',
            'opacity': 1
        });
    } else {
        //PC 메인페이지
        if (MainTopVisual[0]) {
            changeFloatingBannerPosition();
        } else {
            //서브페이지
            FloatingBanner.css({
                'top': 321,
                'opacity': 1
            });
        }
    }

    function changeFloatingBannerPosition() {
        mainFloatingBannerPosition();

        TopBannerCloseBtn.click(function(e) {

            setTimeout(function() {
                mainFloatingBannerPosition();

            }, 500);
        });
    }

    function mainFloatingBannerPosition() {
        var mainTop = (MainTopVisual.offset().top + MainTopVisual.height()) - FloatingBanner.height();
        FloatingBanner.css({
            'top': mainTop,
            'opacity': 1
        });
    }

}


