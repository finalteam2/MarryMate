package com.marry.controller;

import java.util.*;
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
	public ModelAndView myInfo_m() {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = new MemberDTO();
		dto.setId("asd");
		mav.addObject("userInfo", mypageDao.myInfoSelect(dto));
		mav.setViewName("/mypage/myInfo_m");
		return mav;
	}
	
	@RequestMapping("/myInfo_c.do")
	public ModelAndView myInfo_c() {
		ModelAndView mav=new ModelAndView();
		CompanyDTO dto_c= new CompanyDTO();
		dto_c.setId("hall1");
		mav.addObject("comInfo", mypageDao.comInfoSelect(dto_c));
		mav.addObject("hallInfo", mypageDao.hallInfoSelect(1));
		mav.addObject("foodInfo", mypageDao.foodInfoSelect(1));
		mav.setViewName("/mypage/myInfo_c");
		return mav;
	}
	
	@RequestMapping("/reserve.do")
	public String reserve() {
		return "/mypage/reserve";
	}
	
	@RequestMapping("/qna.do")
	public String qna() {
		return "/mypage/qna";
	}
	
	@RequestMapping("/point.do")
	public String point() {
		return "/mypage/myPoint";
	}
	
	@RequestMapping("/community.do")
	public String community() {
		return "/mypage/community";
	}
	
	@RequestMapping("/favorite.do")
	public String favorite() {
		return "/mypage/favorite";
	}
}
