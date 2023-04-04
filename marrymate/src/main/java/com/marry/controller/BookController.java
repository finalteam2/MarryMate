package com.marry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.book.model.BookDAOImple;
import com.marry.book.model.FilterDTO;
import com.marry.company.model.CompanyDTO;

@Controller
public class BookController {

	@Autowired
	private BookDAOImple bookDao;
	
	/**통합예약 페이지이동*/
	@RequestMapping("/allBook.do")
	public ModelAndView allBook() {
		List<CompanyDTO> arr=bookDao.firstBookList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("arr", arr);
		mav.setViewName("book/allBook");
		return mav;
	}

	/**통합예약내 카테고리선택시*/
	@RequestMapping("/selectCate.do")
	public ModelAndView selectCate(
			@RequestParam(name = "filterCate",defaultValue = "스튜디오")String filterCate) {
		List<CompanyDTO> arr=bookDao.cateBookList(filterCate);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("comList",arr);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**통합예약내 정렬순선택시*/
	@RequestMapping("/selectOrder.do")
	public ModelAndView selectOrder(
			@RequestParam(name = "filterOrder",defaultValue = "이름순")String filterOrder,
			@RequestParam(name = "filterCate",defaultValue = "스튜디오")String filterCate) {
		FilterDTO dto=new FilterDTO(filterOrder, filterCate);
		List<CompanyDTO> arr=bookDao.orderBookList(dto);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("comList",arr);
		mav.setViewName("finalJson");
		return mav;
	}
}
