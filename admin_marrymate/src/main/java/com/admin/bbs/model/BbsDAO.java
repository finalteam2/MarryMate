package com.admin.bbs.model;

import java.util.List;

public interface BbsDAO {
	
	public List<BbsListDTO> bbsList(String kind);

}
