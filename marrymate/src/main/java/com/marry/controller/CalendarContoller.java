package com.marry.controller;

import java.sql.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.book.model.BookListDTO;
import com.marry.calender.model.CalendarDAO;
import com.marry.calender.model.CalendarDAOImple;
import com.marry.calender.model.ChecklistDAO;
import com.marry.calender.model.ChecklistDAOImple;
import com.marry.calender.model.ChecklistDTO;
import com.marry.calender.model.PlanDAO;
import com.marry.calender.model.PlanDTO;
import com.marry.member.model.MemberDAO;
import com.marry.member.model.MemberDTO;
import com.marry.notification.model.NotificationDTO;

@Controller
public class CalendarContoller {
	
	
	@Autowired
	private PlanDAO planDao;
	
	@Autowired
	private ChecklistDAO checklistDao;
	
	@Autowired
	private CalendarDAO calendarDao;
	

	
	@RequestMapping(value="/calendarMain.do", method = RequestMethod.GET)
	public String calendarMain() {
		return "calendar/calendarMain";
	}
	
	@RequestMapping("/calendarMainCom.do")
	public String CalendarMainCom() {
		return "calendar/calendarMainCom";
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
	
	@RequestMapping(value="/checklistAdd.do", method = RequestMethod.GET)
	public String checklistaddForm() {
		return "calendar/checklistAdd";
	}
	
	@RequestMapping(value="/checklistAdd.do", method = RequestMethod.POST)
	public ModelAndView checklistAdd(ChecklistDTO cdto) {
		
		int result=checklistDao.checklistAdd(cdto);
		String msg=result>0?"체크리스트 등록 완료!":"체크리스트 등록 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMain.do");
		mav.setViewName("calendar/checklistMsg");
		return mav;
	}
	
	@RequestMapping("/checklistDel.do")
	public ModelAndView checklistDel(String schedule) {
		int result=checklistDao.checklistDel(schedule);
		String msg=result>=0?"체크리스트 삭제 완료!":"체크리스트 삭제 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("calendar/checklistMsg");
		return mav;
	}
	
	@RequestMapping("/calendarMain.do")
	public ModelAndView checklistAll() {
		
		List<ChecklistDTO> list = checklistDao.checklistAll();
		ModelAndView mav = new ModelAndView();
		mav.addObject("checklistItems", list);
		mav.setViewName("calendar/calendarMain");
		return mav;
		
	}
	
		
	
}
