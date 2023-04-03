package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.Book_TimeDTO;
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
		
		MultipartFile aimg=req.getFile("aimg");
		copyFile2(aimg);
		
		String cfile=afile.getOriginalFilename();
		String img=aimg.getOriginalFilename();
		
		dto.setCfile(cfile);
		dto.setImg(img);
		
		String hallInfo=req.getParameter("kind");
		
		int result=companyDao.coJoin(dto);
		String msg=result>0?"정보를 입력해주세요":"가입 실패";
		
		String id=req.getParameter("id");
		int cidx=companyDao.selectCidx(id);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		if(hallInfo.equals("예식장")) {
			mav.addObject("url", "hallInfo.do");
			mav.addObject("cidx", cidx);
			mav.setViewName("company/hallInfo");
		}else {
			mav.addObject("url", "index.do");
			mav.setViewName("company/companyMsg");
		}
		return mav;
		
	}
	
	//사업자 파일 업로드 메서드
	public void copyFile(MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			File outfile=new File("C:/student_java/cfileUpload/"+upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//기업 이미지 업로드 메서드
	public void copyFile2(MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			File outfile=new File("C:/student_java/imgUpload/"+upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "/hallInfo.do", method = RequestMethod.GET)
	public String hallInfoForm() {
		return "company/hallInfo";
	}
	
	@RequestMapping(value = "/hallInfo.do", method = RequestMethod.POST)
	public ModelAndView hallInfoInsert(Book_TimeDTO dto, HttpServletRequest req) {
		
		int result = 0;
		
		String yoil1=req.getParameter("yoil1");
		if(yoil1==null || yoil1.equals("")) {
			
		}else {
			dto.setYoil(yoil1);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		
		String yoil2=req.getParameter("yoil2");
		if(yoil2==null || yoil2.equals("")) {
			
		}else {
			dto.setYoil(yoil2);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		String yoil3=req.getParameter("yoil3");
		if(yoil3==null || yoil3.equals("")) {
			
		}else {
			dto.setYoil(yoil3);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		String yoil4=req.getParameter("yoil4");
		if(yoil4==null || yoil4.equals("")) {
			
		}else {
			dto.setYoil(yoil4);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		String yoil5=req.getParameter("yoil5");
		if(yoil5==null || yoil5.equals("")) {
			
		}else {
			dto.setYoil(yoil5);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		String yoil6=req.getParameter("yoil6");
		if(yoil6==null || yoil6.equals("")) {
			
		}else {
			dto.setYoil(yoil6);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		String yoil7=req.getParameter("yoil7");
		if(yoil7==null || yoil4.equals("")) {
			
		}else {
			dto.setYoil(yoil7);
			companyDao.timeInsert(dto);
			result+=1;
		}
		
		String msg=result>0?"작성 완료":"작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "index.do");
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	@RequestMapping(value = "/companyContent.do", method = RequestMethod.GET)
	public ModelAndView companyContent(
			@RequestParam(value = "cidx", defaultValue = "0")int cidx
			) {
		ModelAndView mav = new ModelAndView();
		CompanyDTO dto = companyDao.companySelectOne(cidx);
		if(cidx == 0 || dto == null) {
			String msg = "잘못된 접근입니다";
			mav.addObject("msg", msg);
			mav.addObject("url", "index.do");
			mav.setViewName("company/companyMsg");
		}else {
			mav.addObject("dto", dto);
			List iarr = companyDao.selectCom_Img(cidx);
			mav.addObject("iarr", iarr);
			if(dto.getKind().equals("예식장")) {
				List harr = companyDao.selectHall(cidx);
				List farr = companyDao.selectFood(cidx);
				mav.addObject("harr", harr);
				mav.addObject("farr", farr);
			}
			mav.setViewName("company/companyContent");
		}
		return mav;
	}
	
}
