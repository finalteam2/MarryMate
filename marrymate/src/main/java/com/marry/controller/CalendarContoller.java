package com.marry.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar/calendar";
	}
	

	@RequestMapping("/calendarMain.do")
	public ModelAndView calendarMain(
			HttpSession session) {
		int midx= (int) session.getAttribute("loginMidx");
		List<ChecklistDTO> list = checklistDao.checklistAll(midx);
		List<PlanDTO> plist = planDao.planlistAll(midx);
	    
		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-DD");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("M월");
	    String thisMonth = sdf.format(cal.getTime());
	    String month = sdf2.format(cal.getTime());
			
	    List<PlanDTO> pdto = planDao.planlistAll(0);
			
	    JSONArray jsonArray = new JSONArray();
	    int allnum = 0;
	    int paynum = 0;
	    int reservnum = 0;
	    for(PlanDTO dto: pdto) {
				
	        JSONObject jsonObject = new JSONObject();
				
	        jsonObject.put("start", dto.getPdate()+":00");
	        jsonObject.put("backgroundColor", "red");
	        jsonObject.put("textColor","white" ); // 폰트 색상을 지정
	        jsonObject.put("borderColor", "red");
	        jsonObject.put("borderWidth", "1px");
	        jsonObject.put("url", dto.getMidx());
	        jsonObject.put("className", dto.getTitle());

	        jsonArray.add(jsonObject);
	    }
	    String jsonStr = jsonArray.toString();
			
	    ModelAndView mav = new ModelAndView();
	    
	    mav.addObject("allnum",allnum);
	    mav.addObject("paynum",paynum);
	    mav.addObject("reservnum",reservnum);
	    mav.addObject("month",month);
	    mav.addObject("svcDTO", pdto);
	    mav.addObject("svcJson", jsonStr); // jsonStr을 svcJson이라는 이름으로 전달
	    mav.addObject("jsonArray", jsonArray);
	    mav.addObject("planlists", plist);
		mav.addObject("checklistItems", list);
		mav.setViewName("calendar/calendarMain");
		return mav;
	}
	
	@RequestMapping("/calendarInfo.do")
	public ModelAndView planForm(HttpSession session) {
			int midx= (int) session.getAttribute("loginMidx");
			List<PlanDTO> plist = planDao.planlistAll(midx);
		    
			Calendar cal = Calendar.getInstance();
		    SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-DD");
		    SimpleDateFormat sdf2 = new SimpleDateFormat("M월");
		    String thisMonth = sdf.format(cal.getTime());
		    String month = sdf2.format(cal.getTime());
				
		    List<PlanDTO> svcing = planDao.planlistAll(0);
				
		    JSONArray jsonArray = new JSONArray();
		    int svcing_count = 0;
		    int svc_count = 0;
		    for(PlanDTO dto: svcing) {
					
		        JSONObject jsonObject = new JSONObject();
					
		        jsonObject.put("start", dto.getPdate()+":00");
		        jsonObject.put("backgroundColor", "red");
		        jsonObject.put("textColor","white" ); // 폰트 색상을 지정
		        jsonObject.put("borderColor", "red");
		        jsonObject.put("borderWidth", "1px");
		        jsonObject.put("url", dto.getMidx());
		        jsonObject.put("className", dto.getTitle());

		        jsonArray.add(jsonObject);
		    }
		    String jsonStr = jsonArray.toString();
				
		    ModelAndView mav = new ModelAndView();
		    
		    mav.addObject("svcing_count",svcing_count);
		    mav.addObject("svc_count",svc_count);
		    mav.addObject("month",month);
		    mav.addObject("planlists", plist);
		    mav.addObject("svcDTO", svcing);
		    mav.addObject("svcJson", jsonStr); // jsonStr을 svcJson이라는 이름으로 전달
		    mav.addObject("jsonArray", jsonArray);
		 
			mav.setViewName("calendar/calendarInfo");
			return mav;
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
	public ModelAndView checklistDel(ChecklistDTO cdto) {
		
		int result=checklistDao.checklistDel(cdto.getCh_idx());
		String msg=result>0?"체크리스트 삭제 완료!":"체크리스트 삭제 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMain.do");
		mav.setViewName("calendar/checklistMsg");
		return mav;
	}
	
	
	@RequestMapping("/planlistDel.do" )
	public ModelAndView planlistDel(PlanDTO pdto) {
		
		int result=planDao.planlistDel(pdto.getMyp_idx());
		String msg=result>0?"일정 삭제 완료!":"일정 삭제 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMain.do");
		mav.setViewName("calendar/planlistMsg");
		return mav;
	}

}
