package com.marry.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public int bbsWrite(BbsDTO dto);
	
	public List<BbsDTO> bbsNotiList();
	
	public List<BbsDTO> bbsAfterList();
	
	public List<BbsDTO> bbsTalkList();

}
