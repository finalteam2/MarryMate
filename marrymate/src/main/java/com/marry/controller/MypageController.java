package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.*;
import com.marry.member.model.*;
import com.marry.mypage.model.MypageDAO;
import com.marry.bbs.model.*;

@Controller
public class MypageController {

	@Autowired
	private MypageDAO mypageDao;
	
	@Autowired
	ServletContext context;
	
	public String copyFile(MultipartFile upload,String path) {
		
	    try {
	        byte[] bytes = upload.getBytes();
	        String originalFilename = upload.getOriginalFilename();
	        String extension = FilenameUtils.getExtension(originalFilename); // 파일 확장자 추출
	        String fileName = FilenameUtils.getBaseName(originalFilename); // 파일 이름 추출
	        String imagepath = context.getRealPath(path);
	        File outfile = new File(imagepath, fileName + "." + extension);

	        int index = 1;
	        while (outfile.exists()) { // 파일 이름 중복일 경우
	            fileName = FilenameUtils.getBaseName(originalFilename) + "_" + index; // 넘버링 추가
	            outfile = new File(imagepath, fileName + "." + extension);
	            index++;
	        }

	        FileOutputStream fos = new FileOutputStream(outfile);
	        fos.write(bytes);
	        fos.close();
	        return fileName + "." + extension;
	    } catch (IOException e) {
	        e.printStackTrace();
	        return "";
	    }
		
	}
	
	@RequestMapping("/myInfo_m.do")
	public ModelAndView myInfo_m(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		mav.addObject("userInfo", mypageDao.myInfoSelect(dto));
		mav.setViewName("/mypage/myInfo_m");
		return mav;
	}
	
	@RequestMapping("/myInfo_c.do")
	public ModelAndView myInfo_c(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("com_id");
		int cidx = (Integer) session.getAttribute("com_cidx");
		ModelAndView mav = new ModelAndView();
		CompanyDTO dto_c = new CompanyDTO();
		dto_c.setId(id);
		mav.addObject("comInfo", mypageDao.comInfoSelect(dto_c));
		mav.addObject("hallInfo", mypageDao.hallInfoSelect(cidx));
		mav.addObject("foodInfo", mypageDao.foodInfoSelect(cidx));
		mav.addObject("barr", mypageDao.booktimeSelect(cidx));
		mav.addObject("iarr", mypageDao.comimgSelect(cidx));
		mav.setViewName("/mypage/myInfo_c");
		return mav;
	}
	
	@RequestMapping("/update.do")
	public ModelAndView update(MemberDTO dto) {
		ModelAndView mav=new ModelAndView();
		mypageDao.myInfoUpdate(dto);
		mav.addObject("msg", "정보수정 성공!");
		mav.addObject("goUrl", "/marrymate/myInfo_m.do");
		mav.setViewName("mypage/myPageMsg");
		return mav;
	}
	
	@RequestMapping("/comUpdate.do")
	public ModelAndView comUpdate(CompanyDTO dto) {
		ModelAndView mav=new ModelAndView();
		mypageDao.companyInfoUpdate(dto);
		mav.addObject("msg", "정보수정 성공!");
		mav.addObject("goUrl", "/marrymate/myInfo_c.do");
		mav.setViewName("mypage/myPageMsg");
		return mav;
	}
	
	@RequestMapping("/hallUpdate.do")
	public ModelAndView hallUpdate(HallDTO dto) {
		ModelAndView mav=new ModelAndView();
		mypageDao.hallInfoUpdate(dto);
		mav.addObject("msg", "정보수정 성공!");
		mav.addObject("goUrl", "/marrymate/myInfo_c.do");
		mav.setViewName("mypage/myPageMsg");
		return mav;
	}
	
	@RequestMapping("/foodUpdate.do")
	public ModelAndView foodUpdate(FoodDTO dto) {
		ModelAndView mav=new ModelAndView();
		mypageDao.foodInfoUpdate(dto);
		mav.addObject("msg", "정보수정 성공!");
		mav.addObject("goUrl", "/marrymate/myInfo_c.do");
		mav.setViewName("mypage/myPageMsg");
		return mav;
	}
		
	@RequestMapping("/myCommunity.do")
	public ModelAndView comSelect(HttpServletRequest req) {
		HttpSession session = req.getSession();
		int midx = (Integer) session.getAttribute("loginMidx");
		ModelAndView mav = new ModelAndView();
		mav.addObject("subInfo", mypageDao.subjectSelect(midx));
		mav.addObject("replyInfo", mypageDao.replySelect(midx));
		mav.setViewName("mypage/myCommunity");
		return mav;
	}
	
	@RequestMapping(value = "/imgChange.do", method = RequestMethod.POST)
	public ModelAndView imgChange(MultipartHttpServletRequest req, MemberDTO dto) {
		ModelAndView mav= new ModelAndView();
		int result=0;
		String img;
		MultipartFile updateMimg=req.getFile("mimg");
		if(updateMimg==null) {
		}else {
			img = copyFile(updateMimg, "/img/member/");
			dto.setImg(img);
//			System.out.println("img: "+dto.getImg()+"/ midx: "+dto.getMidx());
			result += mypageDao.imgChange(dto);
//			System.out.println(result);
		}
		String msg=result>0?"프로필 등록 완료":"프로필 등록 실패";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/marrymate/myInfo_m.do");
		mav.setViewName("mypage/myPageMsg");
		return mav;
	}
}
