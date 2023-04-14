package com.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.book.model.*;
import com.admin.company.model.*;
import com.admin.member.model.*;
import com.admin.point.model.*;

@Controller
public class AnalyticsController {
	
	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private CompanyDAO companyDao;
	
	@Autowired
	private PaymentDAO paymentDao;
	
	@RequestMapping("/traffic.do")
	public ModelAndView traffic() {
		
		List<Integer> traffic_m=memberDao.traffic();
		List<Integer> traffic_c=companyDao.traffic();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("traffic_m",traffic_m);
		mav.addObject("traffic_c",traffic_c);
		mav.setViewName("analytics");
		
		return mav;
	}
	
	@RequestMapping("/amount.do")
	public ModelAndView amount() {
		
		List<Integer> amount_s=paymentDao.amount_s();
		List<Integer> amount_b=paymentDao.amount_b();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("amount_s",amount_s);
		mav.addObject("amount_b",amount_b);
		mav.setViewName("analytics_g");
		
		return mav;
	}
	
	@RequestMapping("/analytics_all.do")
	public ModelAndView analytics_all() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("analytics_all");
		
		return mav;
	}


}
