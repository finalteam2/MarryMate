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

import com.marry.notification.model.NotificationDAOImple;
import com.marry.notification.model.NotificationDTO;

@Controller
public class NotificationController {
	
	@Autowired
	NotificationDAOImple notificationDao;
	
	@RequestMapping("/test.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		return mav;
	}

	@RequestMapping(value = "/addNoti.do", method = RequestMethod.POST)
	public ModelAndView addNoti(NotificationDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = notificationDao.insertNoti(dto);
		mav.addObject("msg", result>0?"성공":"실패");
		mav.addObject("url","test.do");
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	//알림 수 확인 및 목록 조회
	@RequestMapping("/checkNoti.do")
	public ModelAndView ckNoti(HttpServletRequest req,
			@RequestParam(value = "midx",defaultValue = "0")int midx,
			@RequestParam(value = "cidx",defaultValue = "0")int cidx
			) {
//		로그인 된 노티 확인용
//		HttpSession session = req.getSession();
//		try {
//			midx = (int) session.getAttribute("loginMidx");
//		} catch (Exception e) {
//			e.printStackTrace();
//			// TODO: handle exception
//		}
//		try {
//			cidx = (int) session.getAttribute("com_cidx");
//		} catch (Exception e) {
//			e.printStackTrace();
//			// TODO: handle exception
//		}
		ModelAndView mav = new ModelAndView();
		if (midx > 0) {
			List<NotificationDTO> arr = notificationDao.selectMemNoti(midx);
			int cnt = notificationDao.cntMemNoti(midx);
			mav.addObject("arr", arr);
			mav.addObject("cnt", cnt);
		}else if(cidx > 0) {
			List<NotificationDTO> arr = notificationDao.selectComNoti(cidx);
			int cnt = notificationDao.cntComNoti(cidx);
			mav.addObject("arr", arr);
			mav.addObject("cnt", cnt);
		}
		mav.setViewName("test");
		return mav;
	}
	
	@RequestMapping("/goNoti.do")
	public ModelAndView goNoti(
			@RequestParam(value="page", defaultValue = "index.do")String page, 
			@RequestParam(value="nidx", defaultValue = "0")int nidx
			) {
		ModelAndView mav = new ModelAndView();
		int result = notificationDao.checkNoti(nidx);
		mav.addObject("msg", result>0?"성공":"실패");
		mav.addObject("url", page);
		mav.setViewName("company/companyMsg");
		return mav;
	}
}
