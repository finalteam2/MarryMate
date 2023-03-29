package com.marry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/myInfo_m.do")
	public String myInfo_m() {
		return "/mypage/myInfo_m";
	}
	
	@RequestMapping("/myInfo_c.do")
	public String myInfo_c() {
		return "/mypage/myInfo_c";
	}
}
