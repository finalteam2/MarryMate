package com.marry.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.marry.bbs.model.BbsDAO;
import com.marry.bbs.model.BbsDTO;
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
		
		MultipartFile imgfile=req.getFile("bbsimg");
		copyFile_bbs(imgfile);
		
		String img=imgfile.getOriginalFilename();
		
		dto.setImg(img);
		
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
	
	@RequestMapping("reply.do")
	public ModelAndView replyWrite(ReplyDTO dto) {
		
		int result=bbsDao.replyWrite(dto);
		String msg=result>0?"댓글 작성 완료":"댓글 작성 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("community/content");
		return mav;
		
	}
	
	@RequestMapping("/notiList.do")
	public ModelAndView bbsNotiList(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.bbsTotalCount();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("notiList.do", totalCnt, listSize, pageSize, cp);
		
		List<BbsDTO> list=bbsDao.bbsNotiList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listNoti", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("community/community_after");
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
		
		List<BbsDTO> list=bbsDao.bbsAfterList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listAfter", list);
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
		
		List<BbsDTO> list=bbsDao.bbsTalkList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listTalk", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("community/community_talk");
		return mav;
		
	}
	
	@RequestMapping("/allCommunity.do")
	public ModelAndView bbsAllList() {
		
		List<BbsDTO> listNoti=bbsDao.bbsNotiMini();
		List<BbsDTO> listAfter=bbsDao.bbsAfterMini();
		List<BbsDTO> listTalk=bbsDao.bbsTalkMini();
		
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
		BbsDTO dto=bbsDao.bbsContent(bidx);
		List<ReplyDTO> list=bbsDao.replyList(bidx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.setViewName("community/content");
		return mav;
		
	}
	
	@RequestMapping("/best.do")
	public ModelAndView best(@RequestParam("bidx")int bidx, @RequestParam("midx")int midx) {
		
		bbsDao.bestCount(bidx, midx);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("community/allCommunity");
		return mav;
		
	}
	
	@RequestMapping("/worst.do")
	public ModelAndView worst(@RequestParam("bidx")int bidx, @RequestParam("midx")int midx) {
		
		bbsDao.worstCount(bidx, midx);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("community/allCommunity");
		return mav;
		
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
	
}
