package com.marry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/myInfo_m.do")
	public String myInfo() {
		return "/mypage/myInfo_m";
	}
}
