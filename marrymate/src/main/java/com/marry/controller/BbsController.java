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

import com.marry.bbs.model.BbsContentDTO;
import com.marry.bbs.model.BbsDAO;
import com.marry.bbs.model.BbsDTO;
import com.marry.bbs.model.BbsViewDTO;
import com.marry.bbs.model.ReplyDTO;
import com.marry.bbs.model.ReplyViewDTO;

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
	public ModelAndView writeSubmit(BbsDTO dto, MultipartHttpServletRequest req,@RequestParam("midx")int midx) {
		
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
		
		bbsDao.getWritePoint(midx);
		int point=bbsDao.getMemberPoint(midx);
		bbsDao.writeInsertPoint(midx, point);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", "allCommunity.do");
		mav.setViewName("community/communityMsg");
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
		
		int midx=bbsDao.getWriteMember(bidx);
		bbsDao.replyNoti(bidx, midx);
		
		return "redirect:/content.do?bidx="+bidx;
		
	}
	
	@RequestMapping("/notiList.do")
	public ModelAndView bbsNotiList(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.bbsNotiCount();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("notiList.do", totalCnt, listSize, pageSize, cp);
		
		List<BbsViewDTO> list=bbsDao.bbsNotiList(cp, listSize);
		List<BbsViewDTO> listFix=bbsDao.bbsNotiFix();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("listNoti", list);
		mav.addObject("listFixN", listFix);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("community/community_noti");
		return mav;
		
	}
	
	@RequestMapping("/afterList.do")
	public ModelAndView bbsAfterList(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.bbsAfterCount();
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
		
		int totalCnt=bbsDao.bbsTalkCount();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("talkList.do", totalCnt, listSize, pageSize, cp);
		
		List<BbsViewDTO> list=bbsDao.bbsTalkList(cp, listSize);
		List<BbsViewDTO> listBest=bbsDao.bbsTalkBest();
		List<BbsViewDTO> listFix=bbsDao.bbsTalkFix();
		
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
	
	@RequestMapping("/searchSubject.do")
	public ModelAndView searchSubject(
			@RequestParam("kind")String kind,
			@RequestParam("subject")String subject,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.searchSubjectCount(kind, subject);
		int listSize=9;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("searchSubject.do", totalCnt, listSize, pageSize, cp);
		List<BbsViewDTO> list=bbsDao.searchSubject(kind, subject, cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("searchWord", subject);
		mav.setViewName("community/searchCommunity");
		return mav;
		
	}
	
	@RequestMapping("/searchWriter.do")
	public ModelAndView searchWriter(
			@RequestParam("kind")String kind,
			@RequestParam("nick")String nick,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.searchWriterCount(kind, nick);
		int listSize=9;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("searchWriter.do", totalCnt, listSize, pageSize, cp);
		List<BbsViewDTO> list=bbsDao.searchWriter(kind, nick, cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("searchWord", nick);
		mav.setViewName("community/searchCommunity");
		return mav;
	}
	@RequestMapping("/searchContent.do")
	public ModelAndView searchContent(
			@RequestParam("kind")String kind,
			@RequestParam("content")String content,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=bbsDao.searchContentCount(kind, content);
		int listSize=9;
		int pageSize=5;
		
		String pageStr=com.marry.page.module.pageModule_normal
				.makePage("searchContent.do", totalCnt, listSize, pageSize, cp);
		List<BbsViewDTO> list=bbsDao.searchContent(kind, content, cp, pageSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("searchWord", content);
		mav.setViewName("community/searchCommunity");
		return mav;
		
	}
	
	@RequestMapping("/content.do")
	public ModelAndView content(@RequestParam("bidx")int bidx) {
		
		bbsDao.watchUp(bidx);
		BbsContentDTO dto=bbsDao.bbsContent(bidx);
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		List<ReplyViewDTO> list=bbsDao.replyList(bidx);
		
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
		
		BbsContentDTO dto=bbsDao.bbsContent(bidx);
		
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
		
		bbsDao.bbsReWrite(dto);
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("community/allCommunity");
		return mav;
		
	}
	
}
