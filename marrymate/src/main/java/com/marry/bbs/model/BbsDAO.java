package com.marry.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public int bbsWrite(BbsDTO dto);
	
	public int replyWrite(ReplyDTO dto);
	
	public List<BbsDTO> bbsNotiList(int cp, int ls);
	
	public List<BbsDTO> bbsAfterList(int cp, int ls);
	
	public List<BbsDTO> bbsTalkList(int cp, int ls);
	
	public List<BbsDTO> bbsNotiMini();
	
	public List<BbsDTO> bbsAfterMini();
	
	public List<BbsDTO> bbsTalkMini();
	
	public List<ReplyDTO> replyList(int bidx);
	
	public BbsDTO bbsContent(int bidx);
	
	public int bbsTotalCount();
	
	public int watchUp(int bidx);
	
	public int bestCount(int bidx, int midx);
	
	public int worstCount(int bidx, int midx);
	
	public int contentDelete(int bidx);

}
