package com.marry.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public int bbsWrite(BbsDTO dto);
	
	public int bbsReWrite(BbsDTO dto);
	
	public int getWritePoint(int midx);
	
	public int getMemberPoint(int midx);
	
	public int writeInsertPoint(int midx, int point);
	
	public int replyWrite(ReplyDTO dto);
	
	public int getWriteMember(int bidx);
	
	public int replyNoti(int midx, int bidx);
	
	public List<BbsViewDTO> bbsNotiList(int cp, int ls);
	
	public List<BbsViewDTO> bbsAfterList(int cp, int ls);
	
	public List<BbsViewDTO> bbsTalkList(int cp, int ls);
	
	public List<BbsViewDTO> bbsNotiMini();
	
	public List<BbsViewDTO> bbsAfterMini();
	
	public List<BbsViewDTO> bbsTalkMini();
	
	public List<BbsViewDTO> bbsAfterBest();
	
	public List<BbsViewDTO> bbsTalkBest();
	
	public List<BbsViewDTO> bbsNotiFix();
	
	public List<BbsViewDTO> bbsAfterFix();
	
	public List<BbsViewDTO> bbsTalkFix();
	
	public List<BbsViewDTO> searchNoti(String kind, String content, int cp, int ls);
	
	public List<BbsViewDTO> searchSubject(String kind, String subject, int cp, int ls);
	
	public int searchSubjectCount(String kind, String subject);
	
	public List<BbsViewDTO> searchWriter(String kind, String nick, int cp, int ls);
	
	public int searchWriterCount(String kind, String nick);
	
	public List<BbsViewDTO> searchContent(String kind, String content, int cp, int ls);
	
	public int searchContentCount(String kind, String content);
	
	public List<ReplyViewDTO> replyList(int bidx);
	
	public int deleteReply(int ridx);
	
	public BbsContentDTO bbsContent(int bidx);
	
	public int bbsNotiCount();
	
	public int bbsAfterCount();
	
	public int bbsTalkCount();
	
	public int watchUp(int bidx);
	
	public int bestCount(int bidx, int midx);
	
	public int worstCount(int bidx, int midx);
	
	public int checkClick(int bidx, int midx);
	
	public int contentDelete(int bidx);

}
