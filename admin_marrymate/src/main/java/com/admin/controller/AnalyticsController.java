package com.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/traffic_all.do")
	public ModelAndView traffic_all(String mc) {
		
		List<Integer> traffic_all_m=memberDao.traffic_all();
		List<Integer> traffic_all_c=companyDao.traffic_all();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("mc",mc);
		mav.addObject("traffic_all_m",traffic_all_m);
		mav.addObject("traffic_all_c",traffic_all_c);
		
		if(mc.equals("m")) {
			mav.setViewName("analytics_all_m");
		}else if(mc.equals("c")) {
			mav.setViewName("analytics_all_c");
		}
		
		return mav;
	}
	
	@RequestMapping("/amount_all.do")
	public ModelAndView amount_all(@RequestParam(value="cp",defaultValue="1")int cp, String sb) {
		
		List<PaymentDTO> amount_all=paymentDao.amount_all();
		List<RefundDTO> amount_all_b=paymentDao.amount_all_b();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("sb",sb);
		mav.addObject("amount_all",amount_all);
		mav.addObject("amount_all_b",amount_all_b);
		
		mav.setViewName("analytics_list");
		
		return mav;
	}

}
