package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.company.model.*;
import com.admin.member.model.*;

@Controller
public class Mem_com_aController {
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private CompanyDAO companyDao;
	
	@RequestMapping("/memberList.do")
	public ModelAndView memberList() {
		
		List<MemberDTO> dtos=memberDao.memberList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("mem_a");
		
		return mav;
	}
	
	@RequestMapping("/companyList.do")
	public ModelAndView companyList() {
		
		List<CompanyDTO> dtos=companyDao.companyList("예식장");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("com_a");
		
		return mav;
	}

}
