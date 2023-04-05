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
	
	cookiedata = document.cookie;
	if(cookiedata.indexOf("close=Y") < 0){
		startFloatingBanner();
	} else {
		var divObj = document.getElementById("roul");
		divObj.style.visibility = "hidden";
	}
});




	function viewCheckList(){
		$(".checkListArea .item .checkToggle").click(function(e){
			e.preventDefault();
			var $this = $(this);
			var $target = $this.closest(".item");
			if(!$target.hasClass("on")){
				ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
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
						ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
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
					ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
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
					ajaxCall('/mywedding/checklist/edit', encodeURIComponent(JSON.stringify({
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
