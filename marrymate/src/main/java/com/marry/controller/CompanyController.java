package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@RequestMapping("/comIdCheck.do")
    @ResponseBody
    public String idCheck(@RequestParam("id") String id) {
        
        int result=companyDao.comIdCheck(id);
		
        if(result==0) {
        	return "true";
        }else {
        	return "false";
        }
        
    }
	
	@RequestMapping(value = "/companyJoin.do", method = RequestMethod.POST)
	public ModelAndView join_cp(CompanyDTO dto, MultipartHttpServletRequest req) {
		
		String cfile="";
		String img="";
		
		MultipartFile cnumfile=req.getFile("cnumfile");
		if (cnumfile==null) {
			cfile="nomal.png";
			dto.setCfile(cfile);
		}else {
			cfile = copyFile(cnumfile, "/img/cnumFile/");
			dto.setCfile(cfile);
		}
		
		
		MultipartFile bestimg=req.getFile("bestimg");
		if (bestimg==null) {
			img="nomal.png";
			dto.setImg(img);
		}else {
			img = copyFile(bestimg, "/img/com_best/");
			dto.setImg(img);
		}
		
		String hallInfo=req.getParameter("kind");
		
		int result=companyDao.coJoin(dto);
		String msg=result>0?"정보를 입력해주세요":"가입 실패";
		
		String id=req.getParameter("id");
		int cidx=companyDao.getCidx(id);
		
		HttpSession session=req.getSession();
		session.setAttribute("cidx", cidx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("url", "index.do");
		mav.setViewName("company/companyMsg");
		return mav;
		
	}
	
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
		mav.addObject("url", "myInfo_c.do");
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
		String img;
		String cidx=req.getParameter("cidx");
		//mav.addObject("imgSrc", img);
		MultipartFile upload=req.getFile("img");
		if(upload==null) {
		}else {
			img = copyFile(upload, "/img/com_img/");
			result += companyDao.imgInsert(cidx, img);
		}
	    String msg=result>0?"파일 "+result+"개 등록 완료":"파일 등록 실패";
		
		mav.addObject("msg", msg);
		mav.addObject("url", "myInfo_c.do");
		mav.setViewName("company/companyMsg");
		return mav;
		
	}
	
}
