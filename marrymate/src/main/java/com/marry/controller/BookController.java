package com.marry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	@RequestMapping("/allBook.do")
	public String allBook() {
		return "book/allBook";
	}
}
