package com.marry.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.marry.member.model.MemberDAO;
import com.marry.member.model.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO memberDao;

	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.GET)
	public String joinForm() {
		return "member/memberJoin";
	}

	@RequestMapping(value = "/memberJoin.do", method = RequestMethod.POST)
	public ModelAndView memberJoin(MemberDTO dto) {

		int result=memberDao.memberJoin(dto);
		String msg=result>0?"회원 가입 완료":"회원 가입 실패";

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "index.do");
		mav.setViewName("member/memberMsg");
		return mav;

	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, HttpSession session) {
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		MemberDTO dto = memberDao.memberLogin(id, pwd);
		
		if (dto == null) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", "로그인 정보가 올바르지 않습니다.");
			mav.addObject("url", "login.do");
			mav.setViewName("member/memberMsg");
			return mav;
		} else {
			String nick=memberDao.getNick(id);
			String name=memberDao.getName(id);
			String marrydate=memberDao.getMarryDate(id);
			String pname=memberDao.getPname(id);
			
			
			session.setAttribute("loginId", id);
			session.setAttribute("loginNick", nick);
			session.setAttribute("loginName", name);
			session.setAttribute("loginMD", marrydate);
			session.setAttribute("loginPname", pname);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", dto.getName()+"님 즐거운 하루 되세요~!");
			mav.addObject("url", "index.do");
			mav.setViewName("member/memberMsg");
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