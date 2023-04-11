package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.bbs.model.BbsDAO;
import com.marry.bbs.model.BbsDTO;
import com.marry.bbs.model.BbsViewDTO;
import com.marry.bbs.model.ReplyDTO;

@Controller
public class BbsController {
	
	@Autowired
	private BbsDAO bbsDao;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String writeForm() {
		return "community/write";
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView writeSubmit(BbsDTO dto, MultipartHttpServletRequest req) {
		
		String img="";
		
		MultipartFile imgfile=req.getFile("bbsimg");
		if(imgfile.isEmpty()) {
			img="없음";
			dto.setImg(img);
		}else {
			img=imgfile.getOriginalFilename();
			
			copyFile_bbs(imgfile);
			dto.setImg(img);
		}
		
		int result=bbsDao.bbsWrite(dto);
		String msg=result>0?"게시글 작성 완료":"게시글 작성 실패";
		
		ModelAndView mav=new ModelAndView();
		//mav.addObject("msg", msg);
		//mav.addObject("url", "index.do");
		mav.setViewName("community/content");
		return mav;
		
	}
	
	//게시글 이미지 첨부
	public void copyFile_bbs(MultipartFile upload) {		
	    try {
	        byte[] bytes = upload.getBytes();
	        String imagepath = context.getRealPath("/img/bbs_img/");
			File outfile=new File(imagepath+upload.getOriginalFilename());
	        FileOutputStream fos = new FileOutputStream(outfile);
	        fos.write(bytes);
	        fos.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }		
	}
	
	@RequestMapping("/reply.do")
	public String replyWrite(ReplyDTO dto, @RequestParam("bidx")int bidx) {
		
		bbsDao.replyWrite(dto);
		
		return "redirect:/content.do?bidx="+bidx;
		
	}
	
	@RequestMapping("/notiList.do")
	public ModelAndView bbsNotiList(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.bbsTotalCount();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("notiList.do", totalCnt, listSize, pageSize, cp);
		
		List<BbsViewDTO> list=bbsDao.bbsNotiList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listNoti", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("community/community_noti");
		return mav;
		
	}
	
	@RequestMapping("/afterList.do")
	public ModelAndView bbsAfterList(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.bbsTotalCount();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("afterList.do", totalCnt, listSize, pageSize, cp);
		
		List<BbsViewDTO> list=bbsDao.bbsAfterList(cp, listSize);
		List<BbsViewDTO> listBest=bbsDao.bbsAfterBest();
		List<BbsViewDTO> listFix=bbsDao.bbsAfterFix();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listAfter", list);
		mav.addObject("listBestA", listBest);
		mav.addObject("listFixA", listFix);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("community/community_after");
		return mav;
		
	}
	
	@RequestMapping("/talkList.do")
	public ModelAndView bbsTalkList(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.bbsTotalCount();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("talkList.do", totalCnt, listSize, pageSize, cp);
		
		List<BbsViewDTO> list=bbsDao.bbsTalkList(cp, listSize);
		List<BbsViewDTO> listBest=bbsDao.bbsTalkBest();
		List<BbsViewDTO> listFix=bbsDao.bbsAfterFix();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listTalk", list);
		mav.addObject("listBestT", listBest);
		mav.addObject("listFixT", listFix);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("community/community_talk");
		return mav;
		
	}
	
	@RequestMapping("/allCommunity.do")
	public ModelAndView bbsAllList() {
		
		List<BbsViewDTO> listNoti=bbsDao.bbsNotiMini();
		List<BbsViewDTO> listAfter=bbsDao.bbsAfterMini();
		List<BbsViewDTO> listTalk=bbsDao.bbsTalkMini();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listNoti", listNoti);
		mav.addObject("listAfter", listAfter);
		mav.addObject("listTalk", listTalk);
		mav.setViewName("community/allCommunity");
		return mav;
		
	}
	
	@RequestMapping("/content.do")
	public ModelAndView content(@RequestParam("bidx")int bidx) {
		
		bbsDao.watchUp(bidx);
		BbsViewDTO dto=bbsDao.bbsContent(bidx);
		List<ReplyDTO> list=bbsDao.replyList(bidx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.setViewName("community/content");
		return mav;
		
	}
	
	@RequestMapping("/best.do")
	@ResponseBody
	public String best(@RequestParam("bidx")int bidx, @RequestParam("midx")int midx) {
		int result=bbsDao.checkClick(bidx, midx);
		
        if(result>0) {
        	return "false";
        }else {
        	bbsDao.bestCount(bidx, midx);
        	return "true";
        }
		
	}
	
	@RequestMapping("/worst.do")
	@ResponseBody
	public String worst(@RequestParam("bidx")int bidx, @RequestParam("midx")int midx) {
		int result=bbsDao.checkClick(bidx, midx);
		
        if(result>0) {
        	return "false";
        }else {
        	bbsDao.worstCount(bidx, midx);
        	return "true";
        }
		
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(@RequestParam("bidx")int bidx) {
		
		int result=bbsDao.contentDelete(bidx);
		String msg=result>0?"게시물 삭제 완료":"게시물 삭제 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("url", "allCommunity.do");
		mav.addObject("msg", msg);
		mav.setViewName("community/communityMsg");
		return mav;
		
	}
	
	@RequestMapping(value = "/reWrite.do", method = RequestMethod.GET)
	public ModelAndView reWriteForm(@RequestParam("bidx")int bidx) {
		
		BbsViewDTO dto=bbsDao.bbsContent(bidx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("community/reWrite");
		return mav;
		
	}
	
	@RequestMapping(value = "/reWrite.do", method = RequestMethod.POST)
	public ModelAndView reWriteSubmit(BbsDTO dto, MultipartHttpServletRequest req) {
		
		String img="";
		
		MultipartFile imgfile=req.getFile("bbsimg");
		if(imgfile.isEmpty()) {
			img="없음";
			dto.setImg(img);
		}else {
			img=imgfile.getOriginalFilename();
			
			copyFile_bbs(imgfile);
			dto.setImg(img);
		}
		
		int result=bbsDao.bbsWrite(dto);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("re");
		return mav;
		
	}
	
}
