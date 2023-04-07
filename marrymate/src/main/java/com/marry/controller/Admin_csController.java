package com.marry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.marry.admin_cs.model.*;

@Controller
public class Admin_csController {
	
	@Autowired
	private Admin_csDAO admin_csDao;
	
	@RequestMapping("/questions.do")
	public ModelAndView questions() {
		
		List<Admin_csDTO> dtos=admin_csDao.questions();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/answer.do")
	public ModelAndView answer(int acsidx) {
		
		Admin_csDTO dto=admin_csDao.answer(acsidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dto",dto);
		mav.setViewName("finalJson");
		
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
	public ModelAndView loadContent_m(int midx) {
		
		admin_csDao.read_m(midx);
		List<M_a_csDTO> dtos=admin_csDao.loadContent_m(midx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/readNum_m.do")
	public ModelAndView readNum_m(int midx) {
		
		int read=admin_csDao.readNum_m(midx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("read",read);
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
	public ModelAndView loadContent_c(int cidx) {
		
		admin_csDao.read_c(cidx);
		List<C_a_csDTO> dtos=admin_csDao.loadContent_c(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("finalJson");
		
		return mav;
	}
	
	@RequestMapping("/readNum_c.do")
	public ModelAndView readNum_c(int cidx) {
		
		int read=admin_csDao.readNum_c(cidx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("read",read);
		mav.setViewName("finalJson");
		
		return mav;
	}

}
