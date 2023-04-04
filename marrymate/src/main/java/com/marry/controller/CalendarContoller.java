package com.marry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarContoller {
	
	@RequestMapping("/calendarMain.do")
	public String allBook() {
		return "calendar/calendarMain";
	}
	

}
