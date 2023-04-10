package com.marry.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.CompanyDAO;
import com.marry.company.model.CompanyDTO;
import com.marry.member.model.MemberDAO;
import com.marry.member.model.MemberDTO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private CompanyDAO companyDao;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "login/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(
			@RequestParam(value = "saveid", required = false)String saveid,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session) {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		MemberDTO dto=memberDao.memberLogin(id, pwd);
		
		ModelAndView mav=new ModelAndView();
		
		if(dto==null) {
			mav.addObject("msg", "로그인 정보가 올바르지 않습니다.");
			mav.addObject("url", "login.do");
			mav.setViewName("login/loginMsg");
			return mav;
		}else {			
			
			if(saveid==null) {
				Cookie ck=new Cookie("saveid", dto.getId());
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else {
				Cookie ck=new Cookie("saveid", dto.getId());
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
			
			session.setAttribute("loginMidx", dto.getMidx());
			session.setAttribute("loginId", dto.getId());
			session.setAttribute("loginNick", dto.getNick());
			session.setAttribute("loginName", dto.getName());
			session.setAttribute("loginMD", dto.getMarrydate());
			session.setAttribute("loginPname", dto.getPname());
			session.setAttribute("loginPoint", dto.getPoint());
			session.setAttribute("loginTel", dto.getTel());
			
			mav.addObject("msg", dto.getName()+"님 즐거운 하루 되세요~!");
			mav.addObject("url", "index.do");
			mav.setViewName("login/loginMsg");
			return mav;
			
		}
	}
	
	@RequestMapping(value = "/login_com.do", method = RequestMethod.POST)
	public ModelAndView companyLoginSubmit(
			@RequestParam(value = "comSaveid", required = false)String comSaveid,
			HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session) {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		CompanyDTO dto=companyDao.companyLogin(id, pwd);
		
		ModelAndView mav = new ModelAndView();
		
		if(dto==null) {
			mav.addObject("msg", "로그인 정보가 올바르지 않습니다.");
			mav.addObject("url", "login.do");
			mav.setViewName("login/loginMsg");
			return mav;
		}else {
			
			if(comSaveid==null) {
				Cookie ck=new Cookie("comSaveid", dto.getId());
				ck.setMaxAge(0);
				resp.addCookie(ck);
			}else {
				Cookie ck=new Cookie("comSaveid", dto.getId());
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
			}
			
			session.setAttribute("com_cidx", dto.getCidx());
			session.setAttribute("com_id", dto.getId());
			session.setAttribute("com_cname", dto.getCname());
			
			mav.addObject("msg", dto.getCname()+", 환영합니다.");
			mav.addObject("url", "index.do");
			mav.setViewName("login/loginMsg");
			return mav;
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}
	
}
