package com.marry.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	
	/**통합예약내 담기 클릭시*/
	@RequestMapping("/addCart.do")
	public ModelAndView addCart(
			@RequestParam(name = "cidx",defaultValue = "0")int cidx) {
		CompanyDTO dto=bookDao.addBookCart(cidx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**통합예약내 조건 통합검색시*/
	@RequestMapping("/searchList.do")
	public ModelAndView searchList(
			@RequestParam(name = "filterText",defaultValue = "")String beforeFilterText,
			@RequestParam(name = "strFilterDate",defaultValue = "")String strFilterDate,
			@RequestParam(name = "filterSido",defaultValue = "")String beforeFilterSido,
			@RequestParam(name = "filterPriceMin",defaultValue = "1")int filterPriceMin,
			@RequestParam(name = "filterPriceMax",defaultValue = "295")int filterPriceMax,
			@RequestParam(name = "filterCate",defaultValue = "스튜디오")String filterCate) {
		
		//검색어 설정
		String filterText="%"+beforeFilterText+"%";
		String filterSido="%"+beforeFilterSido+"%";
		
		//문자열 strFilterDate를 Date 타입으로 변환 후 요일만 가져오기
		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DayOfWeek yoilFilterDate=null;
		
		if(!strFilterDate.equals("")) {
			LocalDate dateFilterDate=LocalDate.parse(strFilterDate, formatter);
			yoilFilterDate=dateFilterDate.getDayOfWeek();
		}
		
		String filterDate="";
		if(yoilFilterDate==null) {
			filterDate="%%";
		}else if (yoilFilterDate.getValue() == 1) {
			filterDate = "월";
		}else if (yoilFilterDate.getValue() == 2) {
			filterDate = "화";
		}else if (yoilFilterDate.getValue() == 3) {
			filterDate = "수";
		}else if (yoilFilterDate.getValue() == 4) {
			filterDate = "목";
		}else if (yoilFilterDate.getValue() == 5) {
			filterDate = "금";
		}else if (yoilFilterDate.getValue() == 6) {
			filterDate = "토";
		}else if (yoilFilterDate.getValue() == 7) {
			filterDate = "일";
		}
		
		FilterDTO dto=new FilterDTO(filterText, filterDate, filterSido, filterPriceMin, filterPriceMax, filterCate);
		
		List<CompanyDTO> arr=bookDao.searchBookList(dto);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("comList",arr);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**통합예약내 예약하기 클릭시*/
	@RequestMapping("/bookSubmit.do")
	public ModelAndView bookSubmit(
			@RequestParam(name = "test",defaultValue = "")String test) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("test",test);
		mav.setViewName("book/payment");
		return mav;
	}
	
}
