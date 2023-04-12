package com.marry.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.book.model.BookDAOImple;
import com.marry.book.model.CartDTO;
import com.marry.book.model.FilterDTO;
import com.marry.book.model.HallDTO;
import com.marry.company.model.CompanyDTO;

@Controller
public class BookController {

	@Autowired
	private BookDAOImple bookDao;
	
	/**통합예약 페이지이동*/
	@RequestMapping("/allBook.do")
	public String allBook() {
		return "book/allBook";
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
	
	/**홀제외 업체 정보 결제페이지로*/
	@RequestMapping(value = "/notHallSubmit.do", method = RequestMethod.POST)
	public ModelAndView notHallSubmit(HttpServletRequest req) {
		
		String[] cidxs=req.getParameterValues("cidx");
		String[] bk_dates=req.getParameterValues("bk_date");
		String[] bk_times=req.getParameterValues("bk_time");
		String[] imgs=req.getParameterValues("img");
		String[] pays=req.getParameterValues("pay");
		String[] cnames=req.getParameterValues("cname");
		String[] kinds=req.getParameterValues("kind");
		
		List<CartDTO> cartList=new ArrayList<CartDTO>();
		
		for(int i=0;i<cidxs.length;i++) {
			CartDTO dto=new CartDTO(cidxs[i], bk_dates[i], bk_times[i], imgs[i], pays[i], cnames[i], kinds[i]);
			cartList.add(dto);
		}

		ModelAndView mav=new ModelAndView();
		mav.addObject("cartList", cartList);
		mav.setViewName("book/payment");
		return mav;
	}
	
	/**홀 업체 정보 결제페이지로*/
	@RequestMapping(value = "/hallSubmit.do", method = RequestMethod.POST)
	public ModelAndView hallSubmit(HallDTO hallDto, 
			@RequestParam(value = "hstr", required = false)String hstr,
			@RequestParam(value = "fstr", required = false)String fstr) {
		//홀, 식당 정보 문자열로 받아서 재설정
		try {
			String hdata[] =  hstr.split(" ");
			int hidx = Integer.parseInt(hdata[0]);
			String h_name = hdata[1];
			int h_pay = Integer.parseInt(hdata[2]);
			int guest_num = Integer.parseInt(hdata[3]);
			hallDto.setHidx(hidx);
			hallDto.setH_name(h_name);
			hallDto.setH_pay(h_pay);
			hallDto.setGuest_num(guest_num);
			
			String fdata[] =  fstr.split(" ");
			int fidx = Integer.parseInt(fdata[0]);
			String f_name = fdata[1];
			int f_pay = Integer.parseInt(fdata[2]);
			hallDto.setFidx(fidx);
			hallDto.setF_name(f_name);
			hallDto.setF_pay(f_pay);
			
			//최종 금액 계산 및 설정
			hallDto.setPay(h_pay + guest_num * f_pay);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("cidx:"+hallDto.getCidx());
		System.out.println("hidx:"+hallDto.getHidx());
		System.out.println("fidx:"+hallDto.getFidx());
		System.out.println("h_name:"+hallDto.getH_name());
		System.out.println("h_pay:"+hallDto.getH_pay());
		System.out.println("guest_num:"+hallDto.getGuest_num());
		System.out.println("f_name:"+hallDto.getF_name());
		System.out.println("f_pay:"+hallDto.getF_pay());
		System.out.println("bk_date:"+hallDto.getBk_date());
		System.out.println("bk_time:"+hallDto.getBk_time());
		System.out.println("kind:"+hallDto.getKind());
		System.out.println("pay:"+hallDto.getPay());
		System.out.println("img:"+hallDto.getImg());
		System.out.println("name:"+hallDto.getName());
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("book/payment");
		return mav;
	}
	
	
	/**결제시 결제정보받고 DB에 저장*/
	@RequestMapping("/payment.do")
	public ModelAndView payment(
			@RequestParam(name = "midx",defaultValue = "")int midx,
			@RequestParam(name = "cidx",defaultValue = "")int cidx,
			@RequestParam(name = "bk_date",defaultValue = "")String bk_date,
			@RequestParam(name = "bk_time",defaultValue = "")String bk_time,
			@RequestParam(name = "hall_nothall",defaultValue = "")int hall_nothall,
			@RequestParam(name = "pay_point",defaultValue = "")int pay_point,
			@RequestParam(name = "pay_money",defaultValue = "")int pay_money) {
		
		
		System.out.println(midx);
		System.out.println(cidx);
		System.out.println(bk_date);
		System.out.println(bk_time);
		System.out.println(hall_nothall);
		System.out.println(pay_point);
		System.out.println(pay_money);
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("book/paymentResult");
		return mav;
	}
	
	
	/**결제완료후 결제정보페이지로 이동*/
	@RequestMapping("/payResult.do")
	public ModelAndView payResult() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("book/paymentResult");
		return mav;
	}
}
