package com.marry.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.book.model.BookDAOImple;
import com.marry.book.model.BookpayDTO;
import com.marry.book.model.CartDTO;
import com.marry.book.model.FilterDTO;
import com.marry.book.model.HallDTO;
import com.marry.company.model.CompanyDTO;
import com.marry.company.model.FoodDTO;

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
			@RequestParam(name = "filterCate",defaultValue = "스튜디오")String filterCate,
			@RequestParam(name = "filterOrder",defaultValue = "")String filterOrder) {
		
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
		
		FilterDTO dto=new FilterDTO(filterText, filterDate, filterSido, filterPriceMin, filterPriceMax, filterOrder, filterCate);
		
		
		List<CompanyDTO> arr=bookDao.searchBookList(dto);
		
		
		
		List<List<String>> bookTimeLists=new ArrayList<List<String>>();
		List<List<String>> exceptTimeLists=new ArrayList<List<String>>();
		
		
		for(int i=0;i<arr.size();i++) {
			List<String> bookTimes=bookDao.bookTimeList(arr.get(i).getCidx(), filterDate);
			bookTimeLists.add(bookTimes);
			List<String> exceptTimes=bookDao.exceptTimeList(arr.get(i).getCidx(), strFilterDate);
			exceptTimeLists.add(exceptTimes);
			for(int j=0;j<bookTimes.size();j++) {
				for(int z=0;z<exceptTimes.size();z++) {
					if(bookTimes.get(j).equals(exceptTimes.get(z))) {
						bookTimes.remove(bookTimes.get(j));
					}
				}
			}
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("strFilterDate",strFilterDate);
		mav.addObject("comList",arr);
		mav.addObject("bookTimeLists",bookTimeLists);
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
		
		HttpSession session=req.getSession();
		int midx=(int)session.getAttribute("loginMidx");
		int point=bookDao.memberPoint(midx);		
		
		List<CartDTO> cartList=new ArrayList<CartDTO>();
		
		for(int i=0;i<cidxs.length;i++) {
			CartDTO dto=new CartDTO(cidxs[i], bk_dates[i], bk_times[i], imgs[i], pays[i], cnames[i], kinds[i]);
			cartList.add(dto);
		}

		ModelAndView mav=new ModelAndView();
		mav.addObject("cartList", cartList);
		mav.addObject("point", point);
		mav.setViewName("book/payment");
		return mav;
	}
	
	/**홀 업체 정보 결제페이지로*/
	@RequestMapping(value = "/hallSubmit.do", method = RequestMethod.POST)
	public ModelAndView hallSubmit(HallDTO hallDto, 
			@RequestParam(value = "hstr", required = false)String hstr,
			@RequestParam(value = "fstr", required = false)String fstr,
			HttpServletRequest req) {
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
		
		HttpSession session=req.getSession();
		int midx=(int)session.getAttribute("loginMidx");
		int point=bookDao.memberPoint(midx);	
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("hallDto", hallDto);
		mav.addObject("point", point);
		mav.setViewName("book/payment_h");
		return mav;
	}
	
	/**홀 제외 결제시 db 저장*/
	@RequestMapping(value = "/notHallPay.do", method = RequestMethod.POST)
	public ModelAndView notHallPay(HttpServletRequest req) {
		
		String[] midxs=req.getParameterValues("midx");
		String[] cidxs=req.getParameterValues("cidx");
		String[] bk_dates=req.getParameterValues("bk_date");
		String[] bk_times=req.getParameterValues("bk_time");
		String[] pay_points=req.getParameterValues("usePoint");
		String[] pay_moneys=req.getParameterValues("finalPrice");	
		
		List<BookpayDTO> bookPayList=new ArrayList<BookpayDTO>();
		
		
		for(int i=0;i<cidxs.length;i++) {
			if(i==0) {
				BookpayDTO dto=new BookpayDTO(midxs[0], cidxs[i], bk_dates[i], bk_times[i], pay_points[0], pay_moneys[i]);
				bookPayList.add(dto);
			}else {				
				BookpayDTO dto=new BookpayDTO(midxs[0], cidxs[i], bk_dates[i], bk_times[i], "0", pay_moneys[i]);
				bookPayList.add(dto);
			}
		}
		
		List<Integer> pay_idx=bookDao.notHallPay(bookPayList);

		ModelAndView mav=new ModelAndView();
		mav.addObject("pay_idx", pay_idx);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**홀 결제시 db 저장*/
	@RequestMapping(value = "/hallPay.do", method = RequestMethod.POST)
	public ModelAndView hallPay(HttpServletRequest req) {
		
		String[] midxs=req.getParameterValues("midx");
		String[] cidxs=req.getParameterValues("cidx");
		String[] bk_dates=req.getParameterValues("bk_date");
		String[] bk_times=req.getParameterValues("bk_time");
		String[] pay_points=req.getParameterValues("usePoint");
		String[] pay_moneys=req.getParameterValues("finalPrice");
		String[] hidxs=req.getParameterValues("hidx");
		String[] fidxs=req.getParameterValues("fidx");
		
		List<BookpayDTO> bookPayList=new ArrayList<BookpayDTO>();
		

		BookpayDTO dto=new BookpayDTO(midxs[0], cidxs[0], bk_dates[0], bk_times[0], pay_points[0], pay_moneys[0], hidxs[0], fidxs[0]);
		bookPayList.add(dto);

		
		List<Integer> pay_idx=bookDao.hallPay(bookPayList);

		ModelAndView mav=new ModelAndView();
		mav.addObject("pay_idx", pay_idx);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**예약금 결제시 포인트내역 업데이트 및 알림*/
	@RequestMapping("/bookPointUpdate.do")
	public void bookPointUpdate(
			@RequestParam(value = "midx", defaultValue = "")int midx ,
			@RequestParam(value = "usePoint", defaultValue = "")int usePoint,
			@RequestParam(value = "pay_idx", defaultValue = "")int pay_idx) {

		bookDao.bookPointUpdate(midx, usePoint, pay_idx);
	}
	
	/**잔금 결제시 포인트내역 업데이트 및 알림*/
	@RequestMapping("/janPointUpdate.do")
	public void janPointUpdate(
			@RequestParam(value = "midx", defaultValue = "")int midx ,
			@RequestParam(value = "usePoint", defaultValue = "")int usePoint,
			@RequestParam(value = "pay_idx", defaultValue = "")int pay_idx) {

		bookDao.janPointUpdate(midx, usePoint, pay_idx);
	}
	
	/**홀 제외 잔금 결제 파라미터 넘기기*/
	@RequestMapping(value = "/notHallJanPay.do", method = RequestMethod.POST)
	public ModelAndView notHallJanPay(
			@RequestParam(value = "bk_idx", defaultValue = "")int bk_idx,
			@RequestParam(value = "cidx", defaultValue = "")int cidx,
			HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		int midx=(int)session.getAttribute("loginMidx");
		int point=bookDao.memberPoint(midx);
		
		BookpayDTO bookPayDto=bookDao.janPayInfos(bk_idx);
		CompanyDTO comDto=bookDao.addBookCart(cidx);
		
		int bookPrice=(int)(comDto.getPay()*0.2);
		int janPrice=(int)(comDto.getPay()*0.8);
		
		String bk_date=bookPayDto.getBk_date().substring(0, 10);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("bk_idx", bk_idx);
		mav.addObject("bookPayDto", bookPayDto);
		mav.addObject("bookPrice", bookPrice);
		mav.addObject("janPrice", janPrice);
		mav.addObject("bk_date", bk_date);
		mav.addObject("comDto", comDto);
		mav.addObject("point", point);
		mav.setViewName("book/payment_jan");
		return mav;
	}
	
	/**홀 제외 잔금 결제시 DB 저장*/
	@RequestMapping(value = "/notHallJanPayment.do", method = RequestMethod.POST)
	public ModelAndView notHallJanPayment(
			@RequestParam(value = "midx", defaultValue = "")int midx,
			@RequestParam(value = "cidx", defaultValue = "")int cidx,
			@RequestParam(value = "bk_date", defaultValue = "")String bk_date,
			@RequestParam(value = "bk_time", defaultValue = "")String bk_time,
			@RequestParam(value = "usePoint", defaultValue = "")int usePoint,
			@RequestParam(value = "finalPrice", defaultValue = "")int finalPrice,
			@RequestParam(value = "bk_idx", defaultValue = "")int bk_idx) {
		
		
		//bk_state 3으로 update
		bookDao.updateBkState(bk_idx);
		//payment DB 저장
		bookDao.insertJanPay(bk_idx, midx, usePoint, finalPrice);
		//pay_idx 가져오기
		int pay_idx=bookDao.janPayIdx(bk_idx);
		//잔금결제시 업체에게 알림보내기
		bookDao.janNoti(cidx);

		ModelAndView mav=new ModelAndView();
		mav.addObject("pay_idx", pay_idx);
		mav.setViewName("finalJson");
		return mav;
	}
	
	/**홀 잔금 결제 파라미터 넘기기*/
	@RequestMapping(value = "/hallJanPay.do", method = RequestMethod.POST)
	public ModelAndView hallJanPay(
			@RequestParam(value = "bk_idx", defaultValue = "")int bk_idx,
			@RequestParam(value = "cidx", defaultValue = "")int cidx,
			@RequestParam(value = "hidx", defaultValue = "")int hidx,
			@RequestParam(value = "fidx", defaultValue = "")int fidx,
			@RequestParam(value = "allpay", defaultValue = "")int allpay,
			HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		int midx=(int)session.getAttribute("loginMidx");
		int point=bookDao.memberPoint(midx);
		
		com.marry.company.model.HallDTO hallDto=bookDao.bookHallInfo(hidx);
		FoodDTO foodDto=bookDao.bookFoodInfo(fidx);
		BookpayDTO bookPayDto=bookDao.janPayInfos(bk_idx);
		CompanyDTO comDto=bookDao.addBookCart(cidx);
		
		int bookPrice=(int)(allpay*0.2);
		int janPrice=(int)(allpay*0.8);
		
		String bk_date=bookPayDto.getBk_date().substring(0, 10);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("bk_idx", bk_idx);
		mav.addObject("foodDto", foodDto);
		mav.addObject("hallDto", hallDto);
		mav.addObject("bookPayDto", bookPayDto);
		mav.addObject("bk_date", bk_date);
		mav.addObject("comDto", comDto);
		mav.addObject("allpay", allpay);
		mav.addObject("bookPrice", bookPrice);
		mav.addObject("janPrice", janPrice);
		mav.addObject("point", point);
		mav.setViewName("book/payment_jan_h");
		return mav;
	}
	
	/**홀 잔금 결제시 DB 저장*/
	@RequestMapping(value = "/hallJanPayment.do", method = RequestMethod.POST)
	public ModelAndView hallJanPayment(
			@RequestParam(value = "midx", defaultValue = "")int midx,
			@RequestParam(value = "cidx", defaultValue = "")int cidx,
			@RequestParam(value = "bk_date", defaultValue = "")String bk_date,
			@RequestParam(value = "bk_time", defaultValue = "")String bk_time,
			@RequestParam(value = "usePoint", defaultValue = "")int usePoint,
			@RequestParam(value = "finalPrice", defaultValue = "")int finalPrice,
			@RequestParam(value = "bk_idx", defaultValue = "")int bk_idx,
			@RequestParam(value = "hidx", defaultValue = "")int hidx,
			@RequestParam(value = "fidx", defaultValue = "")int fidx) {
		
		
		//bk_state 3으로 update
		bookDao.updateBkState(bk_idx);
		//payment DB 저장
		bookDao.insertJanPay(bk_idx, midx, usePoint, finalPrice);
		//pay_idx 가져오기
		int pay_idx=bookDao.janPayIdx(bk_idx);
		//잔금결제시 업체에게 알림보내기
		bookDao.janNoti(cidx);

		ModelAndView mav=new ModelAndView();
		mav.addObject("pay_idx", pay_idx);
		mav.setViewName("finalJson");
		return mav;
	}
}
