package com.marry.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.marry.notification.model.NotificationDAOImple;

@Controller
public class NotificationController {
	
	@Autowired
	NotificationDAOImple notificationDao;
	
	@RequestMapping("checkNoti.do")
	public ModelAndView noti(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int midx = 0;
		int cidx = 0;
		try {
			midx = (int) session.getAttribute("loginMidx");
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			cidx = (int) session.getAttribute("com_cidx");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if (midx > 0) {
			
		}else if(cidx > 0) {
		
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("finalJson");
		return mav;
	}
	
}
