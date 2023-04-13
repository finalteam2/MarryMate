package com.marry.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public int bbsWrite(BbsDTO dto);
	
	public int getWritePoint(int midx);
	
	public int getMemberPoint(int midx);
	
	public int writeInsertPoint(int midx, int point);
	
	public int replyWrite(ReplyDTO dto);
	
	public List<BbsViewDTO> bbsNotiList(int cp, int ls);
	
	public List<BbsViewDTO> bbsAfterList(int cp, int ls);
	
	public List<BbsViewDTO> bbsTalkList(int cp, int ls);
	
	public List<BbsViewDTO> bbsNotiMini();
	
	public List<BbsViewDTO> bbsAfterMini();
	
	public List<BbsViewDTO> bbsTalkMini();
	
	public List<BbsViewDTO> bbsAfterBest();
	
	public List<BbsViewDTO> bbsTalkBest();
	
	public List<BbsViewDTO> bbsAfterFix();
	
	public List<BbsViewDTO> bbsTalkFix();
	
	public List<ReplyDTO> replyList(int bidx);
	
	public BbsViewDTO bbsContent(int bidx);
	
	public int bbsNotiCount();
	
	public int bbsAfterCount();
	
	public int bbsTalkCount();
	
	public int watchUp(int bidx);
	
	public int bestCount(int bidx, int midx);
	
	public int worstCount(int bidx, int midx);
	
	public int checkClick(int bidx, int midx);
	
	public int contentDelete(int bidx);

}
