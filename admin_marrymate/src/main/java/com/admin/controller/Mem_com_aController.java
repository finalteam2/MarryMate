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
	
	@RequestMapping("/mem_com_a.do")
	public ModelAndView mem_com_a() {
		
		List<MemberDTO> dtos=memberDao.memberList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("mem_com_a");
		
		return mav;
	}
	
	@RequestMapping("/memberList.do")
	public ModelAndView memberList() {
		
		List<MemberDTO> dtos=memberDao.memberList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("mem_com_a");
		
		return mav;
	}
	
	@RequestMapping("/companyList.do")
	public ModelAndView companyList(String kind) {
		
		List<CompanyDTO> dtos=companyDao.companyList(kind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("mem_com_a");
		
		return mav;
	}

}
