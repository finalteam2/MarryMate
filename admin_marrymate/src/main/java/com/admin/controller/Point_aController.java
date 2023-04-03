package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.point.model.*;

@Controller
public class Point_aController {
	
	@Autowired
	private PointDAO pointDao;
	
	@RequestMapping("/pointMinusList.do")
	public ModelAndView pointMinusList() {
		
		List<PointListDTO> dtos=pointDao.pointMinusList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("mp","m");
		mav.setViewName("point_a");
		
		return mav;
	}
	

	@RequestMapping("/pointPlusList.do")
	public ModelAndView pointPlusList() {
		
		List<PointListDTO> dtos=pointDao.pointPlusList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("mp","p");
		mav.setViewName("point_a");
		
		return mav;
	}

}
