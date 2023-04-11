<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8' />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href='/marrymate/css/fullcalendar.main.min.css' rel='stylesheet' />
	<script src='/marrymate/js/ko.js'></script>
    <script src='/marrymate/js/fullcalendar.main.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
	
	
	<script type="text/javascript">
var today = new Date();
function buildCalendar(){
  var row = null
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);

  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();

  
  for(i = 0; i < firstDate.getDay(); i++){
  	cell = row.insertCell();
  	cnt += 1;
		
  } 

  row = calendarTable.insertRow();

  for(i = 1; i <= lastDate.getDate(); i++){
   if (cnt % 7 == 0) {
	      row = calendarTable.insertRow();
	    }
   
  	cell = row.insertCell();
  	cnt += 1;

    cell.setAttribute('id', i);
  	cell.innerHTML = i;
  	cell.align = "center";

    cell.onclick = function(){
    	clickedYear = today.getFullYear();
    	clickedMonth = ( 1 + today.getMonth() );
    	clickedDate = this.getAttribute('id');

    	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
    	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
    	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

    	opener.document.getElementById("date").value = clickedYMD;
    	self.close();
    }

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
    }

    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=skyblue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}
</script>
		
	<table id="calendar" align="center" style="">
		<tr>
			<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
			<td colspan="5" align="center" id="calendarTitle">yyyy년
				&nbsp;&nbsp;&nbsp; m월</td>
			<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
		</tr>
		<tr>
			<td align="center"><font color="#F79DC2">일</font></td>
			<td align="center">월</td>
			<td align="center">화</td>
			<td align="center">수</td>
			<td align="center">목</td>
			<td align="center">금</td>
			<td align="center"><font color="skyblue">토</font></td>
		</tr>
		<script type="text/javascript">buildCalendar();</script>
	</table>
	
	
	
 <script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				  locale: "ko",
				  initialView: 'dayGridMonth',
				  headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				  },
				  googleCalendarApiKey: 'AIzaSyApQkLavc0ttR7NIRHvdf6ncX1DMc9OAhM',
				  events: {
				  googleCalendarId: '7bbd24c0dfa76e1a7c63eaaeb126d9bd0442f78cd7800e222947fccd06257cfc@group.calendar.google.com',
				  className: 'gcal-event' // an option!
				  },
				  eventClick: function(info) {
					  let start_year = info.event.start.getUTCFullYear();
					  let start_month = info.event.start.getMonth() + 1;
					  let start_date = info.event.start.getUTCDate();
					  let start_hour = info.event.start.getHours();
					  let start_minute = info.event.start.getMinutes();
					  let start_second = info.event.start.getSeconds();
					  let end_hour = info.event.end.getHours();

					  let start = start_year + "-" + start_month + "-" + start_date + " " + start_hour + "시 ~ " + end_hour + "시";

					  let attends = "";
					  info.event.extendedProps.attachments.forEach(function(item) {
						  attends += "<div><a href='"+item.fileUrl+"' target='_blank'>[첨부파일]</a></div>"
					  });

					  if(!info.event.extendedProps.description) {
						  info.event.extendedProps.description = "";
					  }
					  let contents = `
						<div style='font-weight:bold; font-size:20px; margin-bottom:30px; text-align:center'>
							${start}
						</div>
						<div style='font-size:18px; margin-bottom:20px'>
							제목: ${info.event.title}
						</div>
						<div style='width:500px'>
							${info.event.extendedProps.description}
							${attends}
						</div>
					  `;
					  
					  $("#popup").html(contents);
					  $("#popup").bPopup({
						speed: 650,
						transition: 'slideIn',
						transitionClose: 'slideBack',
						position: [($(document).width()-500)/2, 30] //x, y
					  });
					  info.jsEvent.stopPropagation();
					  info.jsEvent.preventDefault();
				  }
			});
			calendar.render();
		});
    </script>
    
    <script type="text/javascript">
    var calendar = new Calendar(calendarEl, {
    	  events: [
    	    { 
    	      title: 'The Title', // 제목
    	      start: '2018-09-01', // 시작일자
    	      end: '2018-09-02' // 종료일자
    	    },
    	    {
    	      title: 'The Title', // 제목
    	      start: '2018-09-01', // 시작일자
    	      end: '2018-09-02' // 종료일자
    	    },{ 
    	      title: 'The Title', // 제목
    	      start: '2018-09-01', // 시작일자
    	      end: '2018-09-02' // 종료일자
    	    }
    	  ]
    	})
    $(function(){
		
		var request = $.ajax({
		  url: "/calendar/calendarMain",
		  method: "GET",
		  dataType: "json"
		});
		 
		request.done(function( data ) {
			console.log(data);
				
				var calendarEl = document.getElementById('calendar');
				
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      initialView: 'dayGridMonth',
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay'
			      },
			      events: data
			    });
		
			    calendar.render();								
		});
		 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
});

    </script>
	
  </head>
  <body>
    <div id='calendar'></div>
	<div id='popup' style="width:500px; height:600px; display:none; background-color:white; padding:20px; border-radius:14px; border:2px solid #eeeeee"></div>
  </body>
</html>