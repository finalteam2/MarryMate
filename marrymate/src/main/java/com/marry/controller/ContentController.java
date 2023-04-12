package com.marry.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.book.model.BookListDTO;
import com.marry.company.model.Com_CsDTO;
import com.marry.company.model.Com_ImgDTO;
import com.marry.company.model.Com_LikeDTO;
import com.marry.company.model.CompanyDTO;
import com.marry.company.model.ContentDAOImple;
import com.marry.company.model.FoodDTO;
import com.marry.company.model.HallDTO;
import com.marry.company.model.ReviewDTO;
import com.marry.point.model.PointDTO;

@Controller
public class ContentController {
	
	@Autowired
	private ContentDAOImple contentDao;
	
	//업체 상세 페이지 접속
	@RequestMapping(value = "/companyContent.do", method = RequestMethod.GET)
	public ModelAndView companyContent(
			@RequestParam(value = "cidx", defaultValue = "0")int cidx,
			HttpServletRequest req
			) {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();
		CompanyDTO dto = contentDao.companySelectOne(cidx);
		if(cidx == 0 || dto == null) {
			String msg = "잘못된 접근입니다";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
			mav.setViewName("company/companyMsg");
		}else {
			contentDao.updateWatch(cidx);
			mav.addObject("dto", dto);
			List<Com_ImgDTO> iarr = contentDao.selectCom_Img(cidx);
			mav.addObject("iarr", iarr);
			List<Com_CsDTO> csarr = contentDao.answeredCs(cidx);
			mav.addObject("csarr", csarr);
			//예식장 확인, 예식장일 때만 홀과 식사 조회
			if(dto.getKind().equals("예식장")) {
				List<HallDTO> harr = contentDao.selectHall(cidx);
				List<FoodDTO> farr = contentDao.selectFood(cidx);
				mav.addObject("harr", harr);
				mav.addObject("farr", farr);
			}
			//로그인 여부 확인, 로그인 중일 때만 즐겨찾기 여부 조회
			try {
				int midx = (int) session.getAttribute("loginMidx");
				Com_LikeDTO ldto = new Com_LikeDTO(0, midx, cidx);
				ldto = contentDao.selectCom_Like(ldto);
				mav.addObject("ldto", ldto);
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			List<ReviewDTO> rarr = contentDao.selectReview(cidx);
			mav.addObject("rarr", rarr);
			mav.setViewName("company/companyContent");
		}
		return mav;
	}
	
	//리뷰 작성
	@RequestMapping(value = "/review.do",method = RequestMethod.POST)
	public ModelAndView insertReview(ReviewDTO dto,
			HttpServletRequest req
			) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		HttpSession session = req.getSession();
		int midx = 0;
		
		try {
			midx = (int) session.getAttribute("loginMidx");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		int result = 0;
		if(midx == 0) {
			msg = "잘못된 접근입니다.";
		}else {
			dto.setMidx(midx);
			result = contentDao.insertReview(dto);
		}
		
		if (result > 0) {
			msg = "리뷰 작성 완료";
		}else {
			msg = "리뷰 작성 실패";
		}
		mav.addObject("msg", msg);
		mav.addObject("url", "/marrymate/companyContent.do?cidx="+dto.getCidx());
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	//즐겨찾기 등록, 취소
	@RequestMapping("/com_like.do")
	public ModelAndView com_like(
			Com_LikeDTO dto
			) {
		ModelAndView mav = new ModelAndView();
		String msg = "";
		int result = 0;
		if(dto.getLidx() != 0) {
			//delete like
			result = contentDao.deleteCom_Like(dto);
			if (result > 0) {
				msg = "즐겨찾기 삭제 성공";
			}else {
				msg = "즐겨찾기 삭제 실패";
			}
		}else {
			//insert like
			result = contentDao.insertCom_Like(dto);
			if (result > 0) {
				msg = "즐겨찾기 등록 성공";
			}else {
				msg = "즐겨찾기 등록 실패";
			}
		}
		mav.addObject("msg", msg);
		mav.addObject("url", "/marrymate/companyContent.do?cidx="+dto.getCidx());
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	//문의 등록
	@RequestMapping("/com_cs.do")
	public ModelAndView comcs(Com_CsDTO dto,
			@RequestParam(value="is_private", defaultValue = "0")int is_private
			) {
		ModelAndView mav = new ModelAndView();
		//System.out.println("is_paivate : "+is_private);
		//dto.setIs_private(is_private);
		int cnt = contentDao.insertCom_cs(dto);
		String msg = "";
		if (cnt > 0) {
			msg = "문의 등록 성공";
		}else {
			msg = "문의 등록 실패";
		}
		mav.addObject("msg", msg);
		mav.addObject("url", "/marrymate/companyContent.do?cidx="+dto.getCidx());
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	//내 문의 조회 페이지 진입
	@RequestMapping("/qna.do")
	public ModelAndView qna(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		int midx = 0;
		int cidx = 0;
		try {
			midx = (int) session.getAttribute("loginMidx");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			cidx = (int) session.getAttribute("com_cidx");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//로그인 유저에 따라 다른 방식으로 조회
		if (midx > 0) {
			List<Com_CsDTO> marr = contentDao.selectMemCs(midx);
			mav.addObject("marr",marr);
		}else if(cidx > 0) {
			List<Com_CsDTO> carr = contentDao.selectComCs(cidx);
			mav.addObject("carr",carr);
		}
		mav.setViewName("/mypage/qna");
		return mav;
	}
	
	//문의 답변하기
	@RequestMapping("/qnaUpadate.do")
	public ModelAndView qnaUpadte(Com_CsDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = contentDao.updateComCs(dto);
		String msg = "";
		if (result > 0) {
			msg = "업데이트성공";
		}else {
			msg = "업데이트실패";
		}
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "qna.do");
		mav.setViewName("/mypage/myPageMsg");
		return mav;
	}
	
	
	//내 예약 목록 조회 및 페이지 진입
	@RequestMapping("/myBook.do")
	public ModelAndView myBook(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		int midx = 0;
		int cidx = 0;
		try {
			midx = (int) session.getAttribute("loginMidx");
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			cidx = (int) session.getAttribute("com_cidx");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//로그인 유저에 따라 페이지 나뉨
		if (midx > 0) {
			//회원 페이지
			List<BookListDTO> arr = contentDao.selectMemBook(midx);
			for(int i = 0; i < arr.size(); i++) {
				BookListDTO dto = arr.get(i);
				if(dto.getIs_after() == 1 && dto.getBk_state() != 4) {
					dto.setBk_state(6);
				}
				if(dto.getCkind().equals("예식장")) {
					//System.out.println("대관료"+dto.getHpay()+"인원수"+dto.getHnum()+"식대"+dto.getFpay());
					dto.setAllpay(dto.getHpay()+dto.getHnum()*dto.getFpay());
				}else {
					dto.setAllpay(dto.getCpay());
				}
			}
			String mname = (String) session.getAttribute("loginName");
			mav.addObject("mname", mname);
			mav.addObject("arr", arr);
			mav.setViewName("mypage/myBook_m");
		}else if(cidx > 0) {
			//업체 페이지
			List<BookListDTO> arr = contentDao.selectComBook(cidx);
			for(int i = 0; i < arr.size(); i++) {
				BookListDTO dto = arr.get(i);
//				System.out.println("is_after : "+dto.getIs_after());
				if(dto.getIs_after() == 1 && dto.getBk_state() != 4) {
					dto.setBk_state(5);
				}
				if(dto.getCkind().equals("예식장")) {
					dto.setAllpay(dto.getHpay()+dto.getHnum()*dto.getFpay());
					mav.addObject("hall", "hall");
				}else {
					dto.setAllpay(dto.getCpay());
				}
			}
			String cname = (String) session.getAttribute("com_cname");
			mav.addObject("cname", cname);
			mav.addObject("arr", arr);
			mav.setViewName("mypage/myBook_c");
		}
		return mav;
	}
	
	
	//내 포인트 내역 조회 및 페이지 진입
	@RequestMapping("/myPoint.do")
	public ModelAndView myPoint(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		int midx = (int) session.getAttribute("loginMidx");
		List<PointDTO> arr = contentDao.selectpoint(midx);
		mav.addObject("arr", arr);
		mav.setViewName("mypage/myPoint");
		return mav;
	}
	
	//홀 추가
	@RequestMapping("/insertHall.do")
	public ModelAndView insertHall(HallDTO dto) {
		
		int result = contentDao.insertHall(dto);
		String msg=result>0?"홀 추가 성공":"홀 추가 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "myInfo_c.do");
		mav.setViewName("/mypage/myPageMsg");
		return mav;
	}
	
	//식사 추가
	@RequestMapping("/insertFood.do")
	public ModelAndView insertFood(FoodDTO dto) {
		
		int result = contentDao.insertFood(dto);
		String msg=result>0?"식사 추가 성공":"식사 추가 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "myInfo_c.do");
		mav.setViewName("/mypage/myPageMsg");
		return mav;
	}
	
	@RequestMapping("/deleteHall.do")
	public ModelAndView deleteHall(@RequestParam("hidx")int hidx) {
		
		int result = contentDao.deleteHall(hidx);
		String msg=result>0?"홀 삭제 성공":"홀 삭제 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "myInfo_c.do");
		mav.setViewName("/mypage/myPageMsg");
		return mav;
	}
	@RequestMapping("/deleteFood.do")
	public ModelAndView deleteFood(@RequestParam("fidx")int fidx) {
		
		int result = contentDao.deletefood(fidx);
		String msg=result>0?"식사 삭제 성공":"식사 삭제 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "myInfo_c.do");
		mav.setViewName("/mypage/myPageMsg");
		return mav;
	}
}
