package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.admin.model.AdminDAO;
import com.admin.company.model.*;

@Controller
public class Collection_aController {
	
	@Autowired
	private CompanyDAO companyDao;
	
	@RequestMapping("/collectionList.do")
	public ModelAndView collectionList(@RequestParam(value="cp",defaultValue="1")int cp, String kind) {
		
		int totalCnt=companyDao.getTotalCnt(kind);
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_c.makePage("collectionList.do",totalCnt,listSize,pageSize,cp,kind);
		
		List<CompanyDTO> dtos=companyDao.collectionList(cp,listSize,kind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("collection_a");
		
		return mav;
	}
	
	@RequestMapping("/listSelect.do")
	public ModelAndView listSelect(@RequestParam(value="cp",defaultValue="1")int cp, String kind, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("업체번호")) {
			
			try {
				int cidx=Integer.parseInt(selectText);
				List<CompanyDTO> dtos=companyDao.listSelect_cidx(kind,cidx);
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("업체명")) {
			int totalCnt=companyDao.getTotalCnt_cn(kind,selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_c_cn.makePage("listSelect.do",totalCnt,listSize,pageSize,cp,kind,selectType,selectText);
			
			List<CompanyDTO> dtos=companyDao.listSelect_cname(cp,listSize,kind,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("collection_a");
		
		return mav;
	}
	
	@RequestMapping("/bi.do")
	public ModelAndView bi(int cidx) {
		
		int topfix=companyDao.bi(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("topfix",topfix);
		mav.addObject("cidx",cidx);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/sd.do")
	public ModelAndView sd(int cidx) {
		
		companyDao.sd(cidx);
		CompanyDTO dto=companyDao.companyInfo(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","업체번호: "+cidx+"\n업체명: "+dto.getCname()+"을 [상단고정]하였습니다.");
		mav.addObject("goUrl","collectionList.do?kind="+dto.getKind());
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/hj.do")
	public ModelAndView hj(int cidx) {
		
		companyDao.hj(cidx);
		CompanyDTO dto=companyDao.companyInfo(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","업체번호: "+cidx+"\n업체명: "+dto.getCname()+"을 [고정해제]하였습니다.");
		mav.addObject("goUrl","collectionList.do?kind="+dto.getKind());
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/sg.do")
	public ModelAndView sg(int cidx) {
		
		companyDao.sg(cidx);
		CompanyDTO dto=companyDao.companyInfo(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","업체번호: "+cidx+"\n업체명: "+dto.getCname()+"을 [숨김처리]하였습니다.");
		mav.addObject("goUrl","collectionList.do?kind="+dto.getKind());
		mav.setViewName("finalJson");
		
		return mav;
	}

}
