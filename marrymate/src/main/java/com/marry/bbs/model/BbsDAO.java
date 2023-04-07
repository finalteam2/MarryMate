package com.marry.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public int bbsWrite(BbsDTO dto);
	
	public int replyWrite(ReplyDTO dto);
	
	public List<BbsDTO> bbsNotiList();
	
	public List<BbsDTO> bbsAfterList();
	
	public List<BbsDTO> bbsTalkList();
	
	public List<ReplyDTO> replyList(int bidx);
	
	public BbsDTO bbsContent(int bidx);
	
	public int watchUp(int bidx);
	
	public int bestCount(int bidx, int midx);
	
	public int worstCount(int bidx, int midx);
	
	public int contentDelete(int bidx);

}
