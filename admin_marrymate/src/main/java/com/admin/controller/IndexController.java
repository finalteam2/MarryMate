package com.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.admin.admin.model.*;

@Controller
public class IndexController {
	
	@Autowired
	private AdminDAO adminDao;
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView loginCheck(String id,String pwd, HttpSession session) {
		
		int result=adminDao.loginCheck(id,pwd,session);
		
		ModelAndView mav=new ModelAndView();
		
		if(result==adminDao.LOGIN_OK) {
			AdminDTO dto=adminDao.getInfo(id);
			mav.addObject("msg",dto.getName()+"님 환영합니다!");
			mav.addObject("goUrl","index.do");
			mav.setViewName("adminMsg");
		}else if(result==adminDao.NOT_ID || result==adminDao.NOT_PWD) {
			mav.addObject("msg","아이디 또는 비밀번호가 잘못되었습니다.");
			mav.addObject("goUrl","login.do");
			mav.setViewName("adminMsg");
		}
		
		return mav;
	}
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		session.invalidate();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","로그아웃 되었습니다.");
		mav.addObject("goUrl","login.do");
		mav.setViewName("adminMsg");
		
		return mav;
	}
	
	@RequestMapping("/community_a.do")
	public String community_a() {
		return "community_a";
	}
	
	@RequestMapping("/cs_a.do")
	public String cs_a() {
		return "cs_a";
	}
	
	@RequestMapping("/analytics.do")
	public String analytics() {
		return "analytics";
	}

}
