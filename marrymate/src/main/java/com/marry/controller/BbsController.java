package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.bbs.model.BbsDAO;
import com.marry.bbs.model.BbsDTO;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO bbsDao;
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String writeForm() {
		return "community/write";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView writeSubmit(BbsDTO dto, MultipartHttpServletRequest req) {
		
		MultipartFile imgfile=req.getFile("img");
		copyFile_bbs(imgfile);
		
		String img="C:/student_java/finalproject/marrymate/src/main/webapp/img/bbs_img/"+imgfile.getOriginalFilename();
		
		dto.setImg(img);
		
		int result=bbsDao.bbsWrite(dto);
		String msg=result>0?"게시글 작성 완료":"게시글 작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "index.do");
		mav.setViewName("member/memberMsg");
		return mav;
		
	}
	
	//게시글 이미지 첨부
	public void copyFile_bbs(MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			File outfile=new File("C:/student_java/finalproject/marrymate/src/main/webapp/img/bbs_img/"+upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
