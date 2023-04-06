package com.marry.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.*;
import com.marry.member.model.*;
import com.marry.mypage.model.MypageDAO;

@Controller
public class MypageController {

	@Autowired
	private MypageDAO mypageDao;
	
	@RequestMapping("/myInfo_m.do")
	public ModelAndView myInfo_m(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		mav.addObject("userInfo", mypageDao.myInfoSelect(dto));
		mav.setViewName("/mypage/myInfo_m");
		return mav;
	}
	
	@RequestMapping("/myInfo_c.do")
	public ModelAndView myInfo_c(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("com_id");
		int cidx = (Integer) session.getAttribute("com_cidx");
		ModelAndView mav = new ModelAndView();
		CompanyDTO dto_c = new CompanyDTO();
		dto_c.setId(id);
		mav.addObject("comInfo", mypageDao.comInfoSelect(dto_c));
		mav.addObject("hallInfo", mypageDao.hallInfoSelect(cidx));
		mav.addObject("foodInfo", mypageDao.foodInfoSelect(cidx));
		mav.setViewName("/mypage/myInfo_c");
		return mav;
	}
	
	@RequestMapping("/update.do")
	public ModelAndView update(MemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/comUpdate.do")
	public ModelAndView comUpdate(CompanyDTO dto) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/hallUpdate.do")
	public ModelAndView hallUpdate(HallDTO dto) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/foodUpdate.do")
	public ModelAndView foodUpdate(FoodDTO dto) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	@RequestMapping("/reserve.do")
	public String reserve() {
		return "/mypage/reserve";
	}
	
	
	public String qna() {
		return "/mypage/qna";
	}
	
	@RequestMapping("/point.do")
	public String point() {
		return "/mypage/myPoint";
	}
	
	@RequestMapping("/myCommunity.do")
	public String community() {
		return "/mypage/myCommunity";
	}
	
	@RequestMapping("/favorite.do")
	public String favorite() {
		return "/mypage/favorite";
	}
}
