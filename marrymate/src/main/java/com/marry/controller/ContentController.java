package com.marry.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.CompanyDTO;
import com.marry.company.model.ContentDAOImple;
import com.marry.company.model.ReviewDTO;

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
	
	
	@RequestMapping(value = "/review.do",method = RequestMethod.POST)
	public ModelAndView insertReview(ReviewDTO dto,
			HttpServletRequest req
			) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		HttpSession session = req.getSession();
		int midx = 0;
		
		try {
			midx = (int) session.getAttribute("loginMidx");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		int result = 0;
		if(midx == 0) {
			msg = "잘못된 접근입니다.";
		}else {
			dto.setMidx(midx);
			result = contentDao.insertReview(dto);
		}
		
		if (result > 0) {
			msg = "리뷰 작성 완료";
		}else {
			msg = "리뷰 작성 실패";
		}
		mav.addObject("msg", msg);
		mav.addObject("url", "/marrymate/companyContent.do?cidx="+dto.getCidx());
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	
	
}
