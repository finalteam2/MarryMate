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
	
	@RequestMapping("/point_a.do")
	public ModelAndView point_a() {
		
		List<PointDTO> dtos=pointDao.pointList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("point_a");
		
		return mav;
	}

}
