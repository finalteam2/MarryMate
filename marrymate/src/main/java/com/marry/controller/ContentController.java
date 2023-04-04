package com.marry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.CompanyDTO;
import com.marry.company.model.ContentDAOImple;

@Controller
public class ContentController {
	
	@Autowired
	private ContentDAOImple contentDao;
	
	@RequestMapping(value = "/companyContent.do", method = RequestMethod.GET)
	public ModelAndView companyContent(
			@RequestParam(value = "cidx", defaultValue = "0")int cidx
			) {
		ModelAndView mav = new ModelAndView();
		CompanyDTO dto = contentDao.companySelectOne(cidx);
		if(cidx == 0 || dto == null) {
			String msg = "잘못된 접근입니다";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
			mav.setViewName("company/companyMsg");
		}else {
			mav.addObject("dto", dto);
			List iarr = contentDao.selectCom_Img(cidx);
			mav.addObject("iarr", iarr);
			if(dto.getKind().equals("예식장")) {
				List harr = contentDao.selectHall(cidx);
				List farr = contentDao.selectFood(cidx);
				mav.addObject("harr", harr);
				mav.addObject("farr", farr);
			}
			mav.setViewName("company/companyContent");
		}
		return mav;
	}
	
	
	@RequestMapping(value = "/test.do",method = RequestMethod.POST)
	public ModelAndView insertReview() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
	
}
