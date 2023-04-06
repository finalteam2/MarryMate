package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.company.model.Book_TimeDTO;
import com.marry.company.model.CompanyDAO;
import com.marry.company.model.CompanyDTO;
import com.marry.company.model.FoodDTO;
import com.marry.company.model.HallDTO;

@Controller
public class CompanyController {

	@Autowired
	private CompanyDAO companyDao;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/companyJoin.do", method = RequestMethod.GET)
	public String joinForm_cp() {
		return "company/companyJoin";
	}
	
	@RequestMapping(value = "/companyJoin.do", method = RequestMethod.POST)
	public ModelAndView join_cp(CompanyDTO dto, MultipartHttpServletRequest req) {
		
		MultipartFile cnumfile=req.getFile("cnumfile");
		copyFile_cnum(cnumfile);
		
		MultipartFile bestimg=req.getFile("bestimg");
		copyFile_best(bestimg);
		
		String cfile=cnumfile.getOriginalFilename();
		String img=bestimg.getOriginalFilename();
		
		dto.setCfile(cfile);
		dto.setImg(img);
		
		String hallInfo=req.getParameter("kind");
		
		int result=companyDao.coJoin(dto);
		String msg=result>0?"정보를 입력해주세요":"가입 실패";
		
		String id=req.getParameter("id");
		int cidx=companyDao.getCidx(id);
		
		HttpSession session=req.getSession();
		session.setAttribute("cidx", cidx);
		
		ModelAndView mav = new ModelAndView();
		
		if(hallInfo.equals("예식장")) {
			mav.addObject("msg", msg);
			mav.addObject("url", "hallInfo.do");
			mav.addObject("cidx", cidx);
			mav.setViewName("company/companyMsg");
		}else {
			mav.addObject("msg", msg);
			mav.addObject("url", "companyInfo.do");
			mav.setViewName("company/companyMsg");
		}
		return mav;
		
	}
	
	//파일 경로 지정 필요
	public void copyFile_images(MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			String imagepath = context.getRealPath("/img/com_img/");
			File outfile=new File(imagepath+upload.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void copyFile_best(MultipartFile upload) {
			
		try {
			byte bytes[]=upload.getBytes();
			String imagepath = context.getRealPath("/img/com_best/");
			File outfile=new File(imagepath+upload.getOriginalFilename());
				
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	public void copyFile_cnum(MultipartFile upload) {
		
		try {
			byte bytes[]=upload.getBytes();
			String imagepath = context.getRealPath("/img/cnumFile/");
			File outfile=new File(imagepath+upload.getOriginalFilename());
			
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
	
	@RequestMapping(value = "/companyInfo.do", method = RequestMethod.GET)
	public String companyInfoForm() {
		return "company/companyInfo";
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
		mav.addObject("url", "hallInfo.do");
		mav.setViewName("company/companyMsg");
		return mav;
	}
	
	@RequestMapping(value = "/food.do", method = RequestMethod.POST)
	public ModelAndView food(FoodDTO dto) {
		
		int result=companyDao.foodInsert(dto);
		String msg=result>0?"작성 완료":"작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hallInfo.do");
		mav.setViewName("company/companyMsg");
		return mav;
		
	}
	
	@RequestMapping(value = "/hall.do", method = RequestMethod.POST)
	public ModelAndView hall(HallDTO dto) {
		
		int result=companyDao.hallInsert(dto);
		String msg=result>0?"작성 완료":"작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "hallInfo.do");
		mav.setViewName("company/companyMsg");
		return mav;
		
	}
	
	@RequestMapping(value = "/img.do", method = RequestMethod.POST)
	public ModelAndView img(
			MultipartHttpServletRequest req) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=0;
		String fileLoad="";
		
		MultipartFile Inimg1=req.getFile("img1");
		if(Inimg1 == null) {
		    
		}else {
			copyFile_images(Inimg1);
			String cidx=req.getParameter("cidx");
			String img=fileLoad+Inimg1.getOriginalFilename();
			
			mav.addObject("imgSrc", img);
			
			result+=companyDao.imgInsert(cidx, img);
		}

		MultipartFile Inimg2=req.getFile("img2");
		if (Inimg2 == null) {

		} else {
			copyFile_images(Inimg2);
			String cidx = req.getParameter("cidx");
			String img = fileLoad+Inimg2.getOriginalFilename();
			result += companyDao.imgInsert(cidx, img);
		}
		
		MultipartFile Inimg3=req.getFile("img3");
		if (Inimg3 == null) {
		    
		}else {
			copyFile_images(Inimg3);
			
			String cidx=req.getParameter("cidx");
			String img=fileLoad+Inimg3.getOriginalFilename();
			
			result+=companyDao.imgInsert(cidx, img);
		}
		
		MultipartFile Inimg4=req.getFile("img4");
		if (Inimg4 == null) {
		    
		}else {
			copyFile_images(Inimg4);
			
			String cidx=req.getParameter("cidx");
			String img=fileLoad+Inimg4.getOriginalFilename();
			
			result+=companyDao.imgInsert(cidx, img);
		}
		
		MultipartFile Inimg5=req.getFile("img5");
		if (Inimg5 == null) {
		    
		}else {
			copyFile_images(Inimg5);
			
			String cidx=req.getParameter("cidx");
			String img=fileLoad+Inimg5.getOriginalFilename();
			
			result+=companyDao.imgInsert(cidx, img);
		}
		
	    String msg=result>0?"파일 등록 완료":"파일 등록 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "hallInfo.do");
		mav.setViewName("company/companyMsg");
		return mav;
		
	}
	
}
