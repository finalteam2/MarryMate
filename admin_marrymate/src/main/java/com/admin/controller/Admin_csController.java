package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/content_m.do")
	public ModelAndView sendContent_m(int midx,String content) {
		
		admin_csDao.sendContent_m(midx,content);
		List<M_a_csDTO> dtos=admin_csDao.loadContent_m(midx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/load_m.do")
	public ModelAndView loadContent_m(int midx,HttpSession session) {
		
		session.setAttribute("midx",midx);
		
		admin_csDao.read_m(midx);
		List<M_a_csDTO> dtos=admin_csDao.loadContent_m(midx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/content_c.do")
	public ModelAndView sendContent_c(int cidx,String content) {
		
		admin_csDao.sendContent_c(cidx,content);
		List<C_a_csDTO> dtos=admin_csDao.loadContent_c(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/load_c.do")
	public ModelAndView loadContent_c(int cidx,HttpSession session) {
		
		session.setAttribute("cidx",cidx);
		
		admin_csDao.read_c(cidx);
		List<C_a_csDTO> dtos=admin_csDao.loadContent_c(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}

}
