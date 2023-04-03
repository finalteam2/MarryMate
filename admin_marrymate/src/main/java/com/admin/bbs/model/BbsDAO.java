package com.admin.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public List<BbsListDTO> bbsList(String kind);
	
	public List<BbsListDTO> bbsList_b();

}
