package com.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.bbs.model.*;
import com.admin.notification.model.NotificationDAO;

@Controller
public class Community_aController {
	
	@Autowired
	private BbsDAO bbsDao;
	
	@Autowired
	private NotificationDAO notiDao;
	
	@RequestMapping("/bbsList.do")
	public ModelAndView bbsList(@RequestParam(value="cp",defaultValue="1")int cp, HttpServletRequest request) {
		
		String kind=request.getParameter("kind");
		
		int totalCnt=bbsDao.getTotalCnt_bbs(kind);
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_c.makePage("bbsList.do",totalCnt,listSize,pageSize,cp,kind);
		
		List<BbsListDTO> dtos=bbsDao.bbsList(cp,listSize,kind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("community_a");
		
		return mav;
	}
	
	@RequestMapping("/bbsList_b.do")
	public ModelAndView bbsList_b(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=bbsDao.getTotalCnt_bbs_b();
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_p.makePage("bbsList_b.do",totalCnt,listSize,pageSize,cp);
		
		List<BbsListDTO> dtos=bbsDao.bbsList_b(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("community_b_a");
		
		return mav;
	}
	
	@RequestMapping("/listSel_bbs.do")
	public ModelAndView listSel_bbs(@RequestParam(value="cp",defaultValue="1")int cp, String kind, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("게시글번호")) {
			
			try {
				int bidx=Integer.parseInt(selectText);
				List<BbsDTO> dtos=bbsDao.listSel_bidx(kind,bidx);
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("제목")) {
			int totalCnt=bbsDao.getTotalCnt_subject(kind,selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_c_cn.makePage("listSel_bbs.do",totalCnt,listSize,pageSize,cp,kind,selectType,selectText);
			
			List<BbsDTO> dtos=bbsDao.listSel_subject(cp,listSize,kind,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("community_a");
		
		return mav;
	}
	
	@RequestMapping("/listSel_bbs_b.do")
	public ModelAndView listSel_bbs_b(@RequestParam(value="cp",defaultValue="1")int cp, String kind, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("게시글번호")) {
			
			try {
				int bidx=Integer.parseInt(selectText);
				List<BbsDTO> dtos=bbsDao.listSel_bidx_b(kind,bidx);
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("제목")) {
			int totalCnt=bbsDao.getTotalCnt_subject_b(kind,selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_c_cn.makePage("listSel_bbs_b.do",totalCnt,listSize,pageSize,cp,kind,selectType,selectText);
			
			List<BbsDTO> dtos=bbsDao.listSel_subject_b(cp,listSize,kind,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("community_a");
		
		return mav;
	}
	
	@RequestMapping("/bi_bbs.do")
	public ModelAndView bi_bbs(int bidx) {
		
		int topfix=bbsDao.bi_bbs(bidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("topfix",topfix);
		mav.addObject("bidx",bidx);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/sd_bbs.do")
	public ModelAndView sd_bbs(int bidx) {
		
		bbsDao.sd_bbs(bidx);
		BbsDTO dto=bbsDao.bbsInfo(bidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","게시글번호: "+bidx+" / 제목: "+dto.getSubject()+"을 [상단고정]하였습니다.");
		mav.addObject("goUrl","bbsList.do?kind="+dto.getKind());
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/hj_bbs.do")
	public ModelAndView hj_bbs(int bidx) {
		
		bbsDao.hj_bbs(bidx);
		BbsDTO dto=bbsDao.bbsInfo(bidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","게시글번호: "+bidx+" / 제목: "+dto.getSubject()+"을 [고정해제]하였습니다.");
		mav.addObject("goUrl","bbsList.do?kind="+dto.getKind());
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/pop_bbs.do")
	public String pop_bbs() {
		return "pop_bbs";
	}
	
	@RequestMapping("/bbs.do")
	public ModelAndView bbs(String subject, String content) {
		
		bbsDao.bbs(subject,content);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","글 작성을 완료하였습니다.");
		mav.setViewName("adminClose");
		
		return mav;
	}
	
	@RequestMapping("/bbsContent.do")
	public ModelAndView bbsContent(String nick, int bidx) {
		
		ModelAndView mav=new ModelAndView();
		
		BbsDTO dto=bbsDao.bbsContent(bidx);
		
		mav.addObject("nick",nick);
		mav.addObject("dto",dto);
		mav.setViewName("community_d_a");
		
		return mav;
	}
	
	@RequestMapping("/heajae.do")
	public ModelAndView heajae(int bidx, String kind) {
		
		ModelAndView mav=new ModelAndView();
		
		bbsDao.heajae(bidx);
		
		mav.addObject("msg","게시글번호:"+bidx+"가 [숨김해제] 되었습니다.");
		mav.addObject("goUrl","bbsList.do?kind="+kind);
		mav.setViewName("adminMsg");
		
		return mav;
	}
	
	@RequestMapping("/ceolee.do")
	public ModelAndView ceolee(int bidx, String kind) {
		
		ModelAndView mav=new ModelAndView();
		
		bbsDao.ceolee(bidx);
		
		mav.addObject("msg","게시글번호:"+bidx+"가 [숨김처리] 되었습니다.");
		mav.addObject("goUrl","bbsList.do?kind="+kind);
		mav.setViewName("adminMsg");
		
		return mav;
	}
	
	@RequestMapping("/chehoi.do")
	public ModelAndView chehoi(int bidx, int midx) {
		
		ModelAndView mav=new ModelAndView();
		
		bbsDao.heajae(bidx);

		String title="[불량글 철회 안내]";
		String content="게시글번호:"+bidx+"가 불량글에서 철회되었습니다.";
		notiDao.noti(midx,title,content);
		
		mav.addObject("msg","게시글번호:"+bidx+"가 [불량글 철회] 되었습니다.");
		mav.addObject("goUrl","bbsList_b.do");
		mav.setViewName("adminMsg");
		
		return mav;
	}
	
	@RequestMapping("/deuloc.do")
	public ModelAndView deuloc(int bidx, int midx, String kind) {
		
		ModelAndView mav=new ModelAndView();
		
		bbsDao.ceolee(bidx);
		
		String title="[불량글 등록 안내]";
		String content="게시글번호:"+bidx+"가 불량글로 등록되었습니다.";
		notiDao.noti(midx,title,content);
		
		mav.addObject("msg","게시글번호:"+bidx+"가 [불량글 등록] 되었습니다.");
		mav.addObject("goUrl","bbsList.do?kind="+kind);
		mav.setViewName("adminMsg");
		
		return mav;
	}

}
