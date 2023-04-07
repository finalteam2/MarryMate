package com.marry.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.marry.calender.model.CalendarDAO;

@Controller
public class CalendarContoller {
	
	@RequestMapping("/calendarMain.do")
	public String CalendarMain() {
		return "calendar/calendarMain";
	}
	
	@RequestMapping("/calendarMainCom.do")
	public String CalendarMainCom() {
		return "calendar/calendarMainCom";
	}
	
	@RequestMapping("/calendarInfo.do")
	public String CalendarInfo() {
		return "calendar/calendarInfo";
	}
	
	@RequestMapping("/planList.do")
	public String planList() {
		return "calendar/plan/planList";
	}
	
	@RequestMapping("/planWrite.do")
	public String planWrite() {
		return "calendar/plan/planWrite";
	}
	
	@Autowired
	private CalendarDAO calendarDAO;
	
	

}
