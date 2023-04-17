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
import com.marry.company.model.CompanyDAO;
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
	
	@Autowired
	private CompanyDAO companyDao;

	
	

	@RequestMapping("/weddingtest.do")
	public String mbti() {
		return "calendar/plan/weddingtest";
	}
	
	@RequestMapping("/result1.do")
	public String result1() {
		return "calendar/plan/result1";
	}
	
	@RequestMapping("/result2.do")
	public String result2() {
		return "calendar/plan/result2";
	}
	@RequestMapping("/result3.do")
	public String result3() {
		return "calendar/plan/result3";
	}
	@RequestMapping("/result4.do")
	public String result4() {
		return "calendar/plan/result4";
	}
	@RequestMapping("/result5.do")
	public String result5() {
		return "calendar/plan/result5";
	}
	
	@RequestMapping("/notitest.do")
	public String notitest() {
		return "calendar/notitest";
	}
	
	@RequestMapping("/calendarInfo.do")
	public String calendarInfo() {
			return "calendar/calendarInfo";
		}

	@RequestMapping("/weddingInfo.do")
	public String weddingInfo() {
			return "calendar/weddingInfo";
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

	@RequestMapping("/calendarMainCom.do")
	public ModelAndView CalendarMainCom(
			HttpSession session) {
		int cidx= (int) session.getAttribute("com_cidx");
		List<ChecklistDTO> listcom = checklistDao.checklistAllCom(cidx);
		List<PlanDTO> plistcom = planDao.planlistAllCom(cidx);
		List<BookDTO> blistcom = calendarDao.memberbookCom(cidx);
		List<BookListDTO> booklistcom=contentDao.selectComBook(cidx);
		
		List<MemberDTO> cominfo = calendarDao.comInfo(cidx);

		Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-DD");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("M월");
	    String thisMonth = sdf.format(cal.getTime());
	    String month = sdf2.format(cal.getTime());
		
	    JSONArray jsonArray = new JSONArray();
	    JSONArray jsonArray2 = new JSONArray();
	    
	    int allnum = 0;
	    int paynum = 0;
	    int reservnum = 0;
	    
	    for(PlanDTO dto: plistcom) {
				
	        JSONObject jsonObject = new JSONObject();
	        
	        jsonObject.put("start", dto.getPdate());
	        jsonObject.put("end", dto.getPdate());
	        jsonObject.put("title", dto.getTitle());
	        jsonObject.put("backgroundColor", "#E5CCFF");
	        jsonObject.put("textColor","black" ); 
	        jsonObject.put("borderColor", "#E5CCFF");
	        jsonObject.put("borderWidth", "1px");
	        jsonObject.put("className", dto.getTitle());

	        jsonArray.add(jsonObject);
	    }
	    /*
	    for(BookDTO bdto: blistcom) {
			
	        JSONObject jsonObject2 = new JSONObject();
	        
	        jsonObject2.put("start", bdto.getBdate());
	        jsonObject2.put("end", bdto.getBdate());
	        jsonObject2.put("title", bdto.getName());
	        jsonObject2.put("backgroundColor", "#FFE5CC");
	        jsonObject2.put("textColor","black" ); 
	        jsonObject2.put("borderColor", "#FFE5CC");
	        jsonObject2.put("borderWidth", "1px");
	        jsonObject2.put("className",  bdto.getName());

	        jsonArray2.add(jsonObject2);
	        System.out.println(bdto.getName());
	    }*/ 
	    for(BookDTO bdto: blistcom) {
		    for(BookListDTO bookdto: booklistcom) {
				
		        JSONObject jsonObject2 = new JSONObject();
		        
		        jsonObject2.put("start", bdto.getBdate());
		        jsonObject2.put("end", bdto.getBdate());
		        jsonObject2.put("title", bookdto.getMname()+"님 예약일");
		        jsonObject2.put("backgroundColor", "#FFE5CC");
		        jsonObject2.put("textColor","black" ); 
		        jsonObject2.put("borderColor", "#FFE5CC");
		        jsonObject2.put("borderWidth", "1px");
		        jsonObject2.put("className", bookdto.getMname());
	
		        jsonArray2.add(jsonObject2);
		    } 
	    }
	    
	    String jsonStr = jsonArray.toString();
	    String jsonStr2 = jsonArray2.toString();
	    
	    int ptotalcom=plistcom.size();
	    int btotalcom=booklistcom.size();
	    int ctotalcom=listcom.size();
	    
	    
	    ModelAndView mav = new ModelAndView();
	    
	    mav.addObject("allnum",allnum);
	    mav.addObject("paynum",paynum);
	    mav.addObject("reservnum",reservnum);
	    mav.addObject("month",month);
	    
	    mav.addObject("svcJson", jsonStr);
	    mav.addObject("svcJson2", jsonStr2);
	
	    mav.addObject("jsonArray", jsonArray);
	    mav.addObject("jsonArray2", jsonArray2);

	    mav.addObject("checklistItemscom", listcom);
	    mav.addObject("planlistscom", plistcom);
	    mav.addObject("booklistscom", booklistcom);
	    
	    mav.addObject("ptotalcom", ptotalcom);
	    mav.addObject("btotalcom", btotalcom);
	    mav.addObject("ctotalcom", ctotalcom);
	    
	    mav.addObject("cominfo", cominfo);
		mav.setViewName("calendar/calendarMainCom");
		return mav;
	}
	
	/*Member*/
	
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
	
	/*Company*/
	
	@RequestMapping(value = "/planWriteCom.do", method = RequestMethod.GET)
	public String writeFormCom() {
		return "calendar/plan/planWriteCom";
	}
	
	@RequestMapping(value="/planWriteCom.do", method = RequestMethod.POST)
	public ModelAndView planWriteCom(PlanDTO dto) {
		
		int result=planDao.planWriteCom(dto);
		String msg=result>0?"일정 저장 완료":"일정 저장 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMainCom.do");
		mav.setViewName("calendar/plan/planMsg");
		return mav;
		
	}
	
	@RequestMapping(value="/checklistAddCom.do", method = RequestMethod.GET)
	public String checklistaddFormCom() {
		return "calendar/checklistAddCom";
	}
	
	@RequestMapping(value="/checklistAddCom.do", method = RequestMethod.POST)
	public ModelAndView checklistAddCom(ChecklistDTO cdto) {
		
		int result=checklistDao.checklistAddCom(cdto);
		String msg=result>0?"체크리스트 등록 완료!":"체크리스트 등록 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMainCom.do");
		mav.setViewName("calendar/checklistMsg");
		return mav;
	}
	
	@RequestMapping("/checklistDelCom.do")
	public ModelAndView checklistDelCom(ChecklistDTO cdto) {
		
		int result=checklistDao.checklistDelCom(cdto.getCh_idx());
		String msg=result>0?"체크리스트 삭제 완료!":"체크리스트 삭제 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMainCom.do");
		mav.setViewName("calendar/checklistMsg");
		return mav;
	}
	
	@RequestMapping("/planlistDelCom.do" )
	public ModelAndView planlistDelCom(PlanDTO pdto) {
		
		int result=planDao.planlistDelCom(pdto.getMyp_idx());
		String msg=result>0?"일정 삭제 완료!":"일정 삭제 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "calendarMainCom.do");
		mav.setViewName("calendar/planlistMsg");
		return mav;
	}
}
