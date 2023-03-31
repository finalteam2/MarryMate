package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.admin.book.model.*;

@Controller
public class book_aController {
	
	@Autowired
	private BookDAO bookDao;
	
	@RequestMapping("/book_a.do")
	public ModelAndView book_a() {
		
		List<BookListDTO> dtos=bookDao.bookList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("book_a");
		
		return mav;
	}
	
	@RequestMapping("/bookList.do")
	public ModelAndView bookList() {
		
		List<BookListDTO> dtos=bookDao.bookList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.setViewName("book_a");
		
		return mav;
	}

}
