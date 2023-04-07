<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="layerPop popSchedul" id="myPop101" style="top: 168px; z-index: 1003;" tabindex="0">
	<!-- popTitle -->
	<div class="popTitle">
		<h4 class="tit">일정 등록</h4>
		<a href="#" class="close"><span>해당 팝업닫기</span></a>
	</div>
	<!--// popTitle -->
	
	<!-- popConts -->
	<div class="popConts">
		<form name="schedulForm">
			<!-- 입력요소 -->
			


<ul class="formList">
	<li>
		<label for="tit" class="icoRequire">일정</label>
		<div class="inputSet">
		
		
		
			<input type="text" class="inp" name="sche_nm" id="sche_nm" maxlength="20" value="">
			<a href="#" class="btnDel"><span>입력텍스트 삭제</span></a><!-- 텍스트 입력시 노출 -->
			<span class="errTxt">일정을 입력해 주세요.</span>
		</div>
	</li>
	<li>
		<label for="due_dt" class="icoRequire">일시</label>
		<div class="multiBox"><!-- 입력필드 누락시 class error 추가 -->
			<div id="sche-date-DatepickerWrapper" class="tui-datepicker-input tui-datetime-input tui-has-focus inputSet"><!-- 입력필드 누락시 class error 추가 -->
				<input type="text" id="sche_dt" class="inp" name="sche_dt" aria-label="Date-Time" value="">
				<span class="tui-ico-date"></span>
			<div class="tui-datepicker" style="display: none;">
        <div class="tui-datepicker-body tui-datepicker-type-date"><div class="tui-calendar">
    <div class="tui-calendar-header"><div class="tui-calendar-header-inner">
            <a href="#" class="tui-calendar-btn-prev-month">Prev month</a>
            <em class="tui-calendar-title tui-calendar-title-month">2023.04</em>
            <a href="#" class="tui-calendar-btn-next-month">Next month</a>
        </div>

    <div class="tui-calendar-header-info">
        <p class="tui-calendar-title-today">오늘: 2023.04.07 (금)</p>
    </div></div>
    <div class="tui-calendar-body"><table class="tui-calendar-body-inner" cellspacing="0" cellpadding="0">
    <caption><span>Dates</span></caption>
    <thead class="tui-calendar-body-header">
        <tr>
            <th class="tui-sun" scope="col">일</th>
            <th scope="col">월</th>
            <th scope="col">화</th>
            <th scope="col">수</th>
            <th scope="col">목</th>
            <th scope="col">금</th>
            <th class="tui-sat" scope="col">토</th>
        </tr>
    </thead>
    <tbody>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-prev-month tui-calendar-sun tui-is-selectable" data-timestamp="1679756400000">26</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1679842800000">27</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1679929200000">28</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1680015600000">29</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1680102000000">30</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1680188400000">31</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1680274800000">1</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1680361200000">2</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1680447600000">3</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1680534000000">4</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1680620400000">5</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1680706800000">6</td>
                    <td class="tui-calendar-date tui-calendar-today tui-is-selectable tui-is-selected" data-timestamp="1680793200000">7</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1680879600000">8</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1680966000000">9</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681052400000">10</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681138800000">11</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681225200000">12</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681311600000">13</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681398000000">14</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1681484400000">15</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1681570800000">16</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681657200000">17</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681743600000">18</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681830000000">19</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1681916400000">20</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1682002800000">21</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1682089200000">22</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1682175600000">23</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1682262000000">24</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1682348400000">25</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1682434800000">26</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1682521200000">27</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1682607600000">28</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1682694000000">29</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1682780400000">30</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1682866800000">1</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1682953200000">2</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1683039600000">3</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1683126000000">4</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1683212400000">5</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-sat tui-is-selectable" data-timestamp="1683298800000">6</td>
            </tr>
    </tbody>
</table></div>
</div></div>
</div></div>
			<div class="selectSetWrap">
				<div class="inputSet"><!-- 입력필드 누락시 class error 추가 -->
					<span class="selectWrap error">
						<select class="selectBox" title="시 선택" name="sche_hh" id="sche_hh">
							
								<option value="0">00시</option>
							
								<option value="1">01시</option>
							
								<option value="2">02시</option>
							
								<option value="3">03시</option>
							
								<option value="4">04시</option>
							
								<option value="5">05시</option>
							
								<option value="6">06시</option>
							
								<option value="7">07시</option>
							
								<option value="8">08시</option>
							
								<option value="9">09시</option>
							
								<option value="10">10시</option>
							
								<option value="11">11시</option>
							
								<option value="12">12시</option>
							
								<option value="13">13시</option>
							
								<option value="14">14시</option>
							
								<option value="15">15시</option>
							
								<option value="16">16시</option>
							
								<option value="17">17시</option>
							
								<option value="18">18시</option>
							
								<option value="19">19시</option>
							
								<option value="20">20시</option>
							
								<option value="21">21시</option>
							
								<option value="22">22시</option>
							
								<option value="23">23시</option>
							
						</select>
					</span>
				</div>
				<div class="inputSet"><!-- 입력필드 누락시 class error 추가 -->
					<span class="selectWrap">
						<select class="selectBox" title="분 선택" name="sche_mi" id="sche_mi">
							
								<option value="0">00분</option>
							
								<option value="1">01분</option>
							
								<option value="2">02분</option>
							
								<option value="3">03분</option>
							
								<option value="4">04분</option>
							
								<option value="5">05분</option>
							
								<option value="6">06분</option>
							
								<option value="7">07분</option>
							
								<option value="8">08분</option>
							
								<option value="9">09분</option>
							
								<option value="10">10분</option>
							
								<option value="11">11분</option>
							
								<option value="12">12분</option>
							
								<option value="13">13분</option>
							
								<option value="14">14분</option>
							
								<option value="15">15분</option>
							
								<option value="16">16분</option>
							
								<option value="17">17분</option>
							
								<option value="18">18분</option>
							
								<option value="19">19분</option>
							
								<option value="20">20분</option>
							
								<option value="21">21분</option>
							
								<option value="22">22분</option>
							
								<option value="23">23분</option>
							
								<option value="24">24분</option>
							
								<option value="25">25분</option>
							
								<option value="26">26분</option>
							
								<option value="27">27분</option>
							
								<option value="28">28분</option>
							
								<option value="29">29분</option>
							
								<option value="30">30분</option>
							
								<option value="31">31분</option>
							
								<option value="32">32분</option>
							
								<option value="33">33분</option>
							
								<option value="34">34분</option>
							
								<option value="35">35분</option>
							
								<option value="36">36분</option>
							
								<option value="37">37분</option>
							
								<option value="38">38분</option>
							
								<option value="39">39분</option>
							
								<option value="40">40분</option>
							
								<option value="41">41분</option>
							
								<option value="42">42분</option>
							
								<option value="43">43분</option>
							
								<option value="44">44분</option>
							
								<option value="45">45분</option>
							
								<option value="46">46분</option>
							
								<option value="47">47분</option>
							
								<option value="48">48분</option>
							
								<option value="49">49분</option>
							
								<option value="50">50분</option>
							
								<option value="51">51분</option>
							
								<option value="52">52분</option>
							
								<option value="53">53분</option>
							
								<option value="54">54분</option>
							
								<option value="55">55분</option>
							
								<option value="56">56분</option>
							
								<option value="57">57분</option>
							
								<option value="58">58분</option>
							
								<option value="59">59분</option>
							
						</select>
					</span>
				</div>
			</div>
			<span class="errTxt">일시를 선택해 주세요.</span>
		</div>
	</li>
	<li>
		<label for="memo">메모</label>
		<div class="inputSet textArea h150">
			<textarea id="sche_tx" name="sche_tx" placeholder="200자 이하로 작성해 주세요." max="200" class="jsSWO01Ev"></textarea>
		</div>
	</li>
</ul>

<script>


	
		var tgr_dt = new Date();
	
	


Due_dt = new tui.DatePicker('#sche-date-DatepickerWrapper', {
	date: tgr_dt
	,language: 'ko'
	, input: {
		element: '#sche_dt',
		format: 'yyyy-MM-dd'
	}
	, language:"ko"
});

$(Due_dt).on('change', function() {
	$("#due_dt").val($(Due_dt).getDate().format("yyyyMMdd"));
});

console.log('aaaaaaa');

$("#sche_tx").on("keyup", function(e){
	
	console.log('aaaaaaa');
	
	var target = $(e.currentTarget).closest('.jsSWO01Ev');
	$(target).closest('div.inputSet.error').removeClass("error");
	$(target).closest('div.inputSetWrap.error').removeClass("error");
	
	var max = $(target).attr("max");
	if(max && (max < $(target).val().length)) {
		_alert({title:"알림", message:'내용을 200자 내외로 입력해 주세요.', close:function(){
			$(target).val($(target).val().substr(0, 199));
		}});
	}
});
</script>
			<!--// 입력요소 -->
		</form>

		<div class="btnArea">
			<a href="javascript:void(0);" class="btn btnGray icoCancel jsMP01Ev" data-id="close"><span>닫기</span></a>
			<a href="javascript:void(0);" class="btn btnBrown icoConfirm jsMP01Ev" data-id="confirm"><span class="confirm">등록</span></a>
		</div>
	</div>
	<!--// popConts -->
</div>
</body>
</html>