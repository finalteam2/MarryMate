package com.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.bbs.model.*;

@Controller
public class Community_aController {
	
	@Autowired
	private BbsDAO bbsDao;
	
	@RequestMapping("/bbsList.do")
	public ModelAndView bbsList(HttpServletRequest request) {
		
		String kind=request.getParameter("kind");
		
		List<BbsListDTO> dtos=bbsDao.bbsList(kind);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("community_a");
		
		return mav;
	}

}
