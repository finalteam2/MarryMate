package com.marry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@PostMapping("/checkId.do")
    @ResponseBody
    public int checkId(@RequestBody String id) {
		return memberDao.checkId(id);
    }
	  
}