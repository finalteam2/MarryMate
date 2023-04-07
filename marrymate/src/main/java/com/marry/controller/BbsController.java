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
	public ModelAndView bbsNotiList() {
		
		List<BbsDTO> list=bbsDao.bbsNotiList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listNoti", list);
		mav.setViewName("community/community_after");
		return mav;
		
	}
	
	@RequestMapping("/afterList.do")
	public ModelAndView bbsAfterList() {
		
		List<BbsDTO> list=bbsDao.bbsAfterList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listAfter", list);
		mav.setViewName("community/community_after");
		return mav;
		
	}
	
	@RequestMapping("/talkList.do")
	public ModelAndView bbsTalkList() {
		
		List<BbsDTO> list=bbsDao.bbsTalkList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listTalk", list);
		mav.setViewName("community/community_talk");
		return mav;
		
	}
	
	@RequestMapping("/allCommunity.do")
	public ModelAndView bbsAllList() {
		
		List<BbsDTO> listNoti=bbsDao.bbsNotiList();
		List<BbsDTO> listAfter=bbsDao.bbsAfterList();
		List<BbsDTO> listTalk=bbsDao.bbsTalkList();
		
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
	
}
