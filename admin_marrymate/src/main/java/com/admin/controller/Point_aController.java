package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.member.model.*;
import com.admin.point.model.*;

@Controller
public class Point_aController {
	
	@Autowired
	private PointDAO pointDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/pointMinusList.do")
	public ModelAndView pointMinusList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=pointDao.getTotalCnt_m();
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_p.makePage("pointMinusList.do",totalCnt,listSize,pageSize,cp);
		
		List<PointListDTO> dtos=pointDao.pointMinusList(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("mp","m");
		mav.addObject("pageStr",pageStr);
		mav.setViewName("point_a");
		
		return mav;
	}
	

	@RequestMapping("/pointPlusList.do")
	public ModelAndView pointPlusList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=pointDao.getTotalCnt_p();
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_p.makePage("pointPlusList.do",totalCnt,listSize,pageSize,cp);
		
		List<PointListDTO> dtos=pointDao.pointPlusList(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("mp","p");
		mav.addObject("pageStr",pageStr);
		mav.setViewName("point_a");
		
		return mav;
	}
	
	@RequestMapping("/listSelect_p.do")
	public ModelAndView listSelect_p(@RequestParam(value="cp",defaultValue="1")int cp, String mp, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("회원번호")) {
			
			try {
				int midx=Integer.parseInt(selectText);
				
				int totalCnt=pointDao.getTotalCnt_midx(midx,mp);
				int listSize=10;
				int pageSize=5;
				String pageStr=com.admin.page.module.PageModule_p_pr.makePage("listSelect_p.do",totalCnt,listSize,pageSize,cp,mp,selectType,selectText);
				
				List<PointListDTO> dtos=pointDao.listSelect_midx(cp,listSize,mp,midx);
				mav.addObject("dtos",dtos);
				mav.addObject("mp",mp);
				mav.addObject("pageStr",pageStr);
				
				mav.setViewName("point_a");
			}catch(Exception e) {
				mav.addObject("msg","회원번호는 숫자만 입력하세요.");

				if(mp.equals("m")) {
					mav.addObject("goUrl","pointMinusList.do");
				}else if(mp.equals("p")){
					mav.addObject("goUrl","pointPlusList.do");
				}
				
				mav.setViewName("adminMsg");
			}
			
		}else if(selectType.equals("회원명")) {
			int totalCnt=pointDao.getTotalCnt_name(selectText,mp);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_p_pr.makePage("listSelect_p.do",totalCnt,listSize,pageSize,cp,mp,selectType,selectText);
			
			List<PointListDTO> dtos=pointDao.listSelect_name(cp,listSize,mp,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("mp",mp);
			mav.addObject("pageStr",pageStr);
			
			mav.setViewName("point_a");
		}else if(selectType.equals("업체명")) {
			int totalCnt=pointDao.getTotalCnt_cname(selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_p_pr.makePage("listSelect_p.do",totalCnt,listSize,pageSize,cp,mp,selectType,selectText);
			
			List<PointListDTO> dtos=pointDao.listSelect_cname(cp,listSize,selectText);
			mav.addObject("dtos",dtos);
			mav.addObject("mp",mp);
			mav.addObject("pageStr",pageStr);
			
			mav.setViewName("point_a");
		}
		
		return mav;
	}
	
	@RequestMapping("/popup.do")
	public String popup() {
		return "popup";
	}
	
	@RequestMapping("/popup2.do")
	public String popup2() {
		return "popup2";
	}
	
	@RequestMapping("/pointPlus.do")
	public ModelAndView pointPlus(String midx, String p_cal) {
		
		ModelAndView mav=new ModelAndView();
		
		try {
			int midx_i=Integer.parseInt(midx);
			MemberDTO mdto=memberDao.memberInfo(midx_i);
			
			int p_cal_i=Integer.parseInt(p_cal);
			
			pointDao.pointPlus(midx_i,p_cal_i);
			
			mav.addObject("msg","회원번호: "+midx+" / 회원명: "+mdto.getName()+"님께 "+p_cal+"포인트를 지급하였습니다.");
			mav.setViewName("adminClose");
			
		}catch(Exception e) {
			mav.addObject("msg","회원번호 or 포인트는 숫자만 입력하세요.");
			mav.setViewName("popup");
		}
		
		return mav;
	}
	
	@RequestMapping("/pointMinus.do")
	public ModelAndView pointMinus(String midx, String p_cal) {
		
		ModelAndView mav=new ModelAndView();
		
		try {
			int midx_i=Integer.parseInt(midx);
			MemberDTO mdto=memberDao.memberInfo(midx_i);
			
			int p_cal_i=Integer.parseInt(p_cal);
			
			pointDao.pointMinus(midx_i,p_cal_i);
			
			mav.addObject("msg","회원번호: "+midx+" / 회원명: "+mdto.getName()+"님으로부터 "+p_cal+"포인트를 회수하였습니다.");
			mav.setViewName("adminClose");
			
		}catch(Exception e) {
			mav.addObject("msg","회원번호 or 포인트는 숫자만 입력하세요.");
			mav.setViewName("popup2");
		}
		
		return mav;
	}

}
