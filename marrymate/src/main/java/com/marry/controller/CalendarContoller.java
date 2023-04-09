package com.marry.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.marry.calender.model.CalendarDAO;
import com.marry.calender.model.PlanDAO;
import com.marry.calender.model.PlanDTO;
import com.marry.member.model.MemberDAO;
import com.marry.member.model.MemberDTO;

@Controller
public class CalendarContoller {
	
	@Autowired
	private CalendarDAO calendarDao;
	
	@Autowired
	private PlanDAO planDao;
	
	
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
	
	@RequestMapping("/checklist.do")
	public String checklist() {
		return "/mywedding/checklist";
	}
	
	@RequestMapping(value = "/planWrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "calendar/plan/planWrite";
	}
	
	@RequestMapping(value="/planWrite.do", method = RequestMethod.POST)
	public ModelAndView planWrite(PlanDTO dto) {
		
		int result=planDao.planWrite(dto);
		String msg=result>0?"일정 저장 완료":"일정 저장 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMain.do");
		mav.setViewName("calendar/plan/planMsg");
		return mav;
		
	}
	
	
	

}
