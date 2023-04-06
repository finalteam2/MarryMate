package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.admin_cs.model.*;

@Controller
public class Admin_csController {
	
	@Autowired
	private Admin_csDAO admin_csDao;
	
	@RequestMapping("/cs_a_m.do")
	public ModelAndView cs_a_m() {
		
		List<M_a_csListDTO> m_a_cs_List=admin_csDao.m_a_cs_List();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("mc","m");
		mav.addObject("m_a_cs_List",m_a_cs_List);
		mav.setViewName("cs_a");
		
		return mav;
	}
	
	@RequestMapping("/cs_a_c.do")
	public ModelAndView cs_a_c() {
		
		List<C_a_csListDTO> c_a_cs_List=admin_csDao.c_a_cs_List();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("mc","c");
		mav.addObject("c_a_cs_List",c_a_cs_List);
		mav.setViewName("cs_a");
		
		return mav;
	}

}
