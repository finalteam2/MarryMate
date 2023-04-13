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
	
	//기능 구현 테스트 진입
	@RequestMapping("/test.do")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test");
		return mav;
	}

	//노티 추가 메서드
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
	public ModelAndView ckNoti(HttpServletRequest req
			) {
		HttpSession session = req.getSession();
		int midx = 0;
		int cidx = 0;
		try {
			Object st = session.getAttribute("loginMidx");
			if(st != null) {
				midx = (int)st;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			Object st = session.getAttribute("com_cidx");
			if(st != null) {
				cidx = (int)st;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		System.out.println("midx"+midx);
//		System.out.println("cidx"+cidx);
		
		ModelAndView mav = new ModelAndView();
		if (midx > 0) {
//			System.out.println("midx 실행"+midx);
			List<NotificationDTO> arr = notificationDao.selectMemNoti(midx);
//			for(int i = 0; i < arr.size(); i++) {
//				System.out.println(arr.get(i).getTitle());
//			}
			int cnt = notificationDao.cntMemNoti(midx);
			mav.addObject("arr", arr);
			mav.addObject("cnt", cnt);
		}else if(cidx > 0) {
//			System.out.println("cidx 실행"+cidx);
			List<NotificationDTO> arr = notificationDao.selectComNoti(cidx);
			int cnt = notificationDao.cntComNoti(cidx);
//			for(int i = 0; i < arr.size(); i++) {
//				System.out.println(arr.get(i).getTitle());
//			}
			mav.addObject("arr", arr);
			mav.addObject("cnt", cnt);
		}
		mav.setViewName("index");
		return mav;
	}
	
	//노티 읽음 처리 및 페이지 이동
	@RequestMapping("/goNoti.do")
	public ModelAndView goNoti(
			@RequestParam(value="page", defaultValue = "index.do")String page, 
			@RequestParam(value="nidx", defaultValue = "0")int nidx
			) {
		ModelAndView mav = new ModelAndView();
		int result = notificationDao.checkNoti(nidx);
//		mav.addObject("msg", result>0?"성공":"실패");
		if (page.length() == 0) {
			page = "index.do";
		}
//		mav.addObject("url", page);
//		mav.setViewName("company/companyMsg");
		mav.setViewName("redirect:/"+page);
		return mav;
	}
}
