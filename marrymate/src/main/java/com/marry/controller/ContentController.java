package com.marry.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.Com_CsDTO;
import com.marry.company.model.Com_LikeDTO;
import com.marry.company.model.CompanyDTO;
import com.marry.company.model.ContentDAOImple;
import com.marry.company.model.ReviewDTO;

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
			mav.addObject("dto", dto);
			List iarr = contentDao.selectCom_Img(cidx);
			mav.addObject("iarr", iarr);
			List csarr = contentDao.answeredCs(cidx);
			mav.addObject("csarr", csarr);
			//예식장 확인, 예식장일 때만 홀과 식사 조회
			if(dto.getKind().equals("예식장")) {
				List harr = contentDao.selectHall(cidx);
				List farr = contentDao.selectFood(cidx);
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
			
			List rarr = contentDao.selectReview(cidx);
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
	public ModelAndView myBook() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
	//내 포인트 내역 조회 및 페이지 진입
	@RequestMapping("/myPoint.do")
	public ModelAndView myPoint() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	
}
