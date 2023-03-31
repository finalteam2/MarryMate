package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.admin.model.AdminDAO;
import com.admin.company.model.*;

@Controller
public class Collection_aController {
	
	@Autowired
	private CompanyDAO companyDao;
	
	@RequestMapping("/collection_a.do")
	public ModelAndView collection_a() {
		
		List<CompanyDTO> dtos=companyDao.companyList("예식장");
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("collection_a");
		
		return mav;
	}
	
	@RequestMapping("/companyList.do")
	public ModelAndView companyList(String kind) {
		
		List<CompanyDTO> dtos=companyDao.companyList(kind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("collection_a");
		
		return mav;
	}

}
