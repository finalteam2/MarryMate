package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.CompanyDAO;
import com.marry.company.model.CompanyDTO;

@Controller
public class CompanyController {

	@Autowired
	private CompanyDAO companyDao;
	
	@RequestMapping(value = "/companyJoin.do", method = RequestMethod.GET)
	public String joinForm_cp() {
		return "company/companyJoin";
	}
	
	@RequestMapping(value = "/companyJoin.do", method = RequestMethod.POST)
	public ModelAndView join_cp(CompanyDTO dto, MultipartHttpServletRequest req) {
		
		MultipartFile afile=req.getFile("afile");
		copyFile(afile);
		
		String cfile=afile.getOriginalFilename();
		
		dto.setCfile(cfile);
		
		int result=companyDao.coJoin(dto);
		String msg=result>0?"가입 완료":"가입 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "index.do");
		mav.setViewName("company/companyMsg");
		return mav;
		
	}
	
	@RequestMapping("/hallInfo.do")
	public String hallInfo() {
		return "company/hallInfo";
	}
	
	//업로드 메서드
	public void copyFile(MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			//용지
			File outfile=new File("C:/student_java/cfileUpload/"+upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
