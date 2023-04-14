package com.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.admin.book.model.*;

@Controller
public class Book_aController {
	
	@Autowired
	private BookDAO bookDao;
	
	@RequestMapping("/bookList.do")
	public ModelAndView bookList(@RequestParam(value="cp",defaultValue="1")int cp,String kind) {
		
		int totalCnt=bookDao.getTotalCnt_bk(kind);
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_c.makePage("bookList.do",totalCnt,listSize,pageSize,cp,kind);
		
		List<BookListDTO> dtos=bookDao.bookList(cp,listSize,kind);
		
		for(int i = 0; i < dtos.size(); i++) {
			BookListDTO dto = dtos.get(i);
			if(dto.getIs_after() == 1 && dto.getBk_state() ==3) {
				dto.setBk_state(7);
			}
		}
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("book_a");
		
		return mav;
	}
	
	@RequestMapping("/bookList_b.do")
	public ModelAndView bookList_b(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=bookDao.getTotalCnt_bk_b();
		int listSize=10;
		int pageSize=5;
		String pageStr=com.admin.page.module.PageModule_p.makePage("bookList_b.do",totalCnt,listSize,pageSize,cp);
		
		List<BookListDTO> dtos=bookDao.bookList_b(cp,listSize);
		
		for(int i = 0; i < dtos.size(); i++) {
			BookListDTO dto = dtos.get(i);
			if(dto.getIs_after() == 1 && dto.getBk_state() ==3) {
				dto.setBk_state(7);
			}
		}
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dtos",dtos);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("book_b_a");
		
		return mav;
	}
	
	@RequestMapping("/listSel_bk.do")
	public ModelAndView listSelect(@RequestParam(value="cp",defaultValue="1")int cp, String kind, String selectType, String selectText) {
		
		ModelAndView mav=new ModelAndView();
		
		if(selectType.equals("예약번호")) {
			
			try {
				int bk_idx=Integer.parseInt(selectText);
				List<BookListDTO> dtos=bookDao.listSel_bk_idx(kind,bk_idx);
				
				for(int i = 0; i < dtos.size(); i++) {
					BookListDTO dto = dtos.get(i);
					if(dto.getIs_after() == 1 && dto.getBk_state() ==3) {
						dto.setBk_state(7);
					}
				}
				
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("회원번호")) {
			
			try {
				int midx=Integer.parseInt(selectText);
				List<BookListDTO> dtos=bookDao.listSel_bk_midx(kind,midx);
				
				for(int i = 0; i < dtos.size(); i++) {
					BookListDTO dto = dtos.get(i);
					if(dto.getIs_after() == 1 && dto.getBk_state() ==3) {
						dto.setBk_state(7);
					}
				}
				
				mav.addObject("dtos",dtos);
			}catch(Exception e) {}
			
		}else if(selectType.equals("회원명")) {
			int totalCnt=bookDao.getTotalCnt_bk_n(kind,selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_c_cn.makePage("listSel_bk.do",totalCnt,listSize,pageSize,cp,kind,selectType,selectText);
			
			List<BookListDTO> dtos=bookDao.listSel_bk_name(cp,listSize,kind,selectText);
			
			for(int i = 0; i < dtos.size(); i++) {
				BookListDTO dto = dtos.get(i);
				if(dto.getIs_after() == 1 && dto.getBk_state() ==3) {
					dto.setBk_state(7);
				}
			}
			
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}else if(selectType.equals("업체명")) {
			int totalCnt=bookDao.getTotalCnt_bk_cn(kind,selectText);
			int listSize=10;
			int pageSize=5;
			String pageStr=com.admin.page.module.PageModule_c_cn.makePage("listSel_bk.do",totalCnt,listSize,pageSize,cp,kind,selectType,selectText);
			
			List<BookListDTO> dtos=bookDao.listSel_bk_cname(cp,listSize,kind,selectText);
			
			for(int i = 0; i < dtos.size(); i++) {
				BookListDTO dto = dtos.get(i);
				if(dto.getIs_after() == 1 && dto.getBk_state() ==3) {
					dto.setBk_state(7);
				}
			}
			
			mav.addObject("dtos",dtos);
			mav.addObject("pageStr",pageStr);
		}
		
		mav.setViewName("book_a");
		
		return mav;
	}
	
	@RequestMapping("/bookDetails.do")
	public ModelAndView bookDetails(int bk_state, int bk_idx, String kind) {
		
		BookDetailsDTO dto=bookDao.bookDetails(bk_idx,kind);
		
		String pay_date=bookDao.pay_date(bk_idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("bk_state",bk_state);
		mav.addObject("dto",dto);
		mav.addObject("pay_date",pay_date);
		mav.addObject("kind",kind);
		mav.setViewName("book_d_a");
		
		return mav;
	}
	
	@RequestMapping("/cancle.do")
	public ModelAndView cancle(int bk_idx, int midx) {
		
		bookDao.cancle(bk_idx,midx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("msg","예약번호:"+bk_idx+"번이 취소되었습니다.");
		mav.addObject("goUrl","bookList_b.do");
		mav.setViewName("adminMsg");
		
		return mav;
	}
	
}
