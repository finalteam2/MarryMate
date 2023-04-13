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

import com.marry.book.model.BookDAO;
import com.marry.book.model.BookDTO;
import com.marry.book.model.BookListDTO;
import com.marry.calender.model.BookinfoDTO;
import com.marry.calender.model.CalendarDAO;
import com.marry.calender.model.CalendarDAOImple;
import com.marry.calender.model.ChecklistDAO;
import com.marry.calender.model.ChecklistDAOImple;
import com.marry.calender.model.ChecklistDTO;
import com.marry.calender.model.PlanDAO;
import com.marry.calender.model.PlanDTO;
import com.marry.company.model.CompanyDTO;
import com.marry.company.model.ContentDAO;
import com.marry.member.model.MemberDAO;
import com.marry.member.model.MemberDTO;
import com.marry.mypage.model.MypageDAO;
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
	private BookDAO bookDao;
	
	@Autowired
	private ContentDAO contentDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private MypageDAO mypageDao;
	
	
	@RequestMapping("/calendar.do")
	public String calendar() {
		return "calendar/calendar";
	}
	@RequestMapping("/mbti.do")
	public String mbti() {
		return "calendar/plan/mbti";
	}
	
	@RequestMapping("/notitest.do")
	public String notitest() {
		return "calendar/notitest";
	}

	@RequestMapping("/calendarMain.do")
	public ModelAndView calendarMain(
			HttpSession session) {
		int midx= (int) session.getAttribute("loginMidx");
		List<ChecklistDTO> list = checklistDao.checklistAll(midx);
		List<PlanDTO> plist = planDao.planlistAll(midx);
		List<BookDTO> blist = calendarDao.memberbook(midx);
		
		List<MemberDTO> myinfo = calendarDao.myInfo(midx);

		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-DD");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("M월");
	    String thisMonth = sdf.format(cal.getTime());
	    String month = sdf2.format(cal.getTime());
		
	    JSONArray jsonArray3 = new JSONArray();
	    JSONArray jsonArray4 = new JSONArray();
	    
	    int allnum = 0;
	    int paynum = 0;
	    int reservnum = 0;
	    
	    for(PlanDTO dto: plist) {
				
	        JSONObject jsonObject3 = new JSONObject();
	        
	        jsonObject3.put("start", dto.getPdate());
	        jsonObject3.put("end", dto.getPdate());
	        jsonObject3.put("title", dto.getTitle());
	        jsonObject3.put("backgroundColor", "#E5CCFF");
	        jsonObject3.put("textColor","black" ); 
	        jsonObject3.put("borderColor", "#E5CCFF");
	        jsonObject3.put("borderWidth", "1px");
	        jsonObject3.put("className", dto.getTitle());

	        jsonArray3.add(jsonObject3);
	    }
	    
	    for(BookDTO bdto: blist) {
			
	        JSONObject jsonObject4 = new JSONObject();
	        
	        jsonObject4.put("start", bdto.getBdate());
	        jsonObject4.put("end", bdto.getBdate());
	        jsonObject4.put("title", bdto.getCname());
	        jsonObject4.put("backgroundColor", "#FFE5CC");
	        jsonObject4.put("textColor","black" ); 
	        jsonObject4.put("borderColor", "#FFE5CC");
	        jsonObject4.put("borderWidth", "1px");
	        jsonObject4.put("className",  bdto.getCname());

	        jsonArray4.add(jsonObject4);
	    } 

	    String jsonStr3 = jsonArray3.toString();
	    String jsonStr4 = jsonArray4.toString();

	    int ptotal=plist.size();
	    int btotal=blist.size();
	    int ctotal=list.size();
	    
	    
	    ModelAndView mav = new ModelAndView();
	    
	    mav.addObject("allnum",allnum);
	    mav.addObject("paynum",paynum);
	    mav.addObject("reservnum",reservnum);
	    mav.addObject("month",month);
	    
	    mav.addObject("svcJson3", jsonStr3);
	    mav.addObject("svcJson4", jsonStr4);
	
	    mav.addObject("jsonArray3", jsonArray3);
	    mav.addObject("jsonArray4", jsonArray4);

	    mav.addObject("checklistItems", list);
	    mav.addObject("planlists", plist);
	    mav.addObject("blists", blist);
	    
	    mav.addObject("ptotal", ptotal);
	    mav.addObject("btotal", btotal);
	    mav.addObject("ctotal", ctotal);
	    
	    mav.addObject("myinfo", myinfo);
		mav.setViewName("calendar/calendarMain");
		return mav;
	}
	
	@RequestMapping("/calendarInfo.do")
	public String calendarInfo() {
			return "calendar/calendarInfo";
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
