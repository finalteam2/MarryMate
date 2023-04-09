package com.marry.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView memberJoin(MemberDTO dto, HttpServletRequest req) {

		String id=req.getParameter("id");
		String gname=req.getParameter("gname");
		
		int result=memberDao.memberJoin(dto);
		String msg=result>0?"회원 가입 완료":"회원 가입 실패";
		
		if(gname!=null && !gname.equals("")) {
			int midx=memberDao.getMidx(id);
			memberDao.gnameInsertPoint(midx);
			
			int gnameMidx=memberDao.getMidx(gname);
			memberDao.updatePoint(gname);
			
			int point=memberDao.getPoint(gname);
			memberDao.memberInsertPoint(gnameMidx, point);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "index.do");
		mav.setViewName("member/memberMsg");
		return mav;

	}
	
	@RequestMapping("/checkNick.do")
    @ResponseBody
    public String nickCheck(@RequestParam("nick") String nick) {
        
        int result=memberDao.nickCheck(nick);
		
        if(result==0) {
        	return "true";
        }else {
        	return "false";
        }
        
    }
	
	@RequestMapping("/checkId.do")
    @ResponseBody
    public String idCheck(@RequestParam("id") String id) {
        
        int result=memberDao.idCheck(id);
		
        if(result==0) {
        	return "true";
        }else {
        	return "false";
        }
        
    }
	
	@RequestMapping("/checkGname.do")
    @ResponseBody
    public String gnameCheck(@RequestParam("gname") String gname) {
        
        int result=memberDao.gnameCheck(gname);
		
        if(result==1) {
        	return "true";
        }else {
        	return "false";
        }
        
    }
	
}