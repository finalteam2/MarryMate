package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.company.model.*;
import com.admin.member.model.*;
import com.admin.notification.model.*;

@Controller
public class Mem_com_aController {
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private CompanyDAO companyDao;
	
	@Autowired
	private NotificationDAO notiDao;
	
	@RequestMapping("/memberList.do")
	public ModelAndView memberList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=memberDao.getTotalCnt_mem();
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_p.makePage("memberList.do",totalCnt,listSize,pageSize,cp);
		
		List<MemberDTO> dtos=memberDao.memberList(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("mem_a");
		
		return mav;
	}
	
	@RequestMapping("/companyList.do")
	public ModelAndView companyList(@RequestParam(value="cp",defaultValue="1")int cp, String kind) {
		
		int totalCnt=companyDao.getTotalCnt_com(kind);
		int listSize=5;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_c.makePage("companyList.do",totalCnt,listSize,pageSize,cp,kind);
		
		List<CompanyDTO> dtos=companyDao.companyList(cp,listSize,kind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("com_a");
		
		return mav;
	}
	
	@RequestMapping("/companyList_b.do")
	public ModelAndView companyList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=companyDao.getTotalCnt_com_b();
		int listSize=5;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_p.makePage("companyList_b.do",totalCnt,listSize,pageSize,cp);
		
		List<CompanyDTO> dtos=companyDao.companyList_b(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("com_b_a");
		
		return mav;
	}
	
	
	@RequestMapping("/pop.do")
	public ModelAndView pop(int midx) {
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("midx",midx);
		mav.setViewName("pop");
		
		return mav;
	}
	
	@RequestMapping("/pop_all.do")
	public String pop_all() {
		return "pop_all";
	}
	
	@RequestMapping("/noti.do")
	public ModelAndView noti(String midx, String title, String content) {
		
		ModelAndView mav=new ModelAndView();
		
		int midx_i=Integer.parseInt(midx);
		MemberDTO mdto=memberDao.memberInfo(midx_i);
		
		notiDao.noti(midx_i,title,content);
		
		mav.addObject("msg","회원번호: "+midx+" / 회원명: "+mdto.getName()+"님께 알림을 보냈습니다.");
		mav.setViewName("adminClose");
		
		return mav;	
	}
	
	@RequestMapping("/noti_all.do")
	public ModelAndView noti_all(String recv, String title, String content) {
		
		ModelAndView mav=new ModelAndView();
		
		if(recv.equals("일반회원")) {
			List<Integer> midx=notiDao.selMidx();
			
			for(int i=0;i<midx.size();i++) {
				notiDao.noti_mem(midx.get(i),recv,title,content);
			}
		}else if(recv.equals("기업회원")) {
			List<Integer> cidx=notiDao.selCidx();
			
			for(int i=0;i<cidx.size();i++) {
				notiDao.noti_com(cidx.get(i),recv,title,content);
			}
		}else if(recv.equals("전체")) {
			List<Integer> midx=notiDao.selMidx();
			
			for(int i=0;i<midx.size();i++) {
				notiDao.noti_mem(midx.get(i),recv,title,content);
			}
			
			List<Integer> cidx=notiDao.selCidx();
			
			for(int i=0;i<cidx.size();i++) {
				notiDao.noti_com(cidx.get(i),recv,title,content);
			}
		}
		
		mav.addObject("msg","["+recv+"] 에게 알림을 보냈습니다.");
		mav.setViewName("adminClose");
		
		return mav;	
	}
	
	@RequestMapping("/listSelect_mem.do")
	public ModelAndView listSelect(@RequestParam(value="cp",defaultValue="1")int cp, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("회원번호")) {
			
			try {
				int midx=Integer.parseInt(selectText);
				List<MemberDTO> dtos=memberDao.listSel_midx(midx);
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("회원명")) {
			int totalCnt=memberDao.getTotalCnt_name(selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_m_n.makePage("listSelect_mem.do",totalCnt,listSize,pageSize,cp,selectType,selectText);
			
			List<MemberDTO> dtos=memberDao.listSel_name(cp,listSize,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("mem_a");
		
		return mav;
	}
	
	@RequestMapping("/listSelect_com.do")
	public ModelAndView listSelect(@RequestParam(value="cp",defaultValue="1")int cp, String kind, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("업체번호")) {
			
			try {
				int cidx=Integer.parseInt(selectText);
				List<CompanyDTO> dtos=companyDao.listSel_cidx(kind,cidx);
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("업체명")) {
			int totalCnt=companyDao.getTotalCnt_cname(kind,selectText);
			int listSize=5;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_c_cn.makePage("listSelect_com.do",totalCnt,listSize,pageSize,cp,kind,selectType,selectText);
			
			List<CompanyDTO> dtos=companyDao.listSel_cname(cp,listSize,kind,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("com_a");
		
		return mav;
	}
	
	@RequestMapping("/listSelect_com_b.do")
	public ModelAndView listSelect_b(@RequestParam(value="cp",defaultValue="1")int cp, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("업체번호")) {
			
			try {
				int cidx=Integer.parseInt(selectText);
				List<CompanyDTO> dtos=companyDao.listSel_cidx_b(cidx);
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("업체명")) {
			int totalCnt=companyDao.getTotalCnt_cname_b(selectText);
			int listSize=5;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_m_n.makePage("listSelect_com_b.do",totalCnt,listSize,pageSize,cp,selectType,selectText);
			
			List<CompanyDTO> dtos=companyDao.listSel_cname_b(cp,listSize,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("com_b_a");
		
		return mav;
	}
	
	@RequestMapping("/companyDetails.do")
	public ModelAndView companyList(String kind, int cidx, int clevel) {
		
		ModelAndView mav=new ModelAndView();
		
		CompanyDTO comDto=companyDao.companyInfo(cidx);
		
		mav.addObject("comDto",comDto);
		
		if(kind.equals("예식장")) {
			List<HallDTO> hallDtos=companyDao.hallInfo(cidx);
			List<FoodDTO> foodDtos=companyDao.foodInfo(cidx);
			
			mav.addObject("hallDtos",hallDtos);
			mav.addObject("foodDtos",foodDtos);
		}
		
		mav.addObject("kind",kind);
		mav.addObject("clevel",clevel);
		mav.setViewName("com_d_a");
		
		return mav;
	}
	
	@RequestMapping("/ok.do")
	public ModelAndView ok(int cidx, String kind) {
		
		ModelAndView mav=new ModelAndView();
		
		CompanyDTO cdto=companyDao.companyInfo(cidx);
		
		companyDao.companyOk(cidx);
		
		mav.addObject("msg","업체번호: "+cidx+" / 업체명: "+cdto.getCname()+" 기업이 [승인]되었습니다.");
		mav.addObject("goUrl","companyList.do?kind="+kind);
		mav.setViewName("adminMsg");
		
		return mav;
	}
	
	@RequestMapping("/no.do")
	public ModelAndView no(int cidx, String kind) {
		
		ModelAndView mav=new ModelAndView();
		
		CompanyDTO cdto=companyDao.companyInfo(cidx);
		
		companyDao.companyNo(cidx);

		mav.addObject("msg","업체번호: "+cidx+" / 업체명: "+cdto.getCname()+" 승인이 [거절]되었습니다.");
		mav.addObject("goUrl","companyList.do?kind="+kind);
		mav.setViewName("adminMsg");
		
		return mav;
	}

}
