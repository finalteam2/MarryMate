package com.marry.calender.model;

import java.util.List;

public interface PlanDAO {
	public int planWrite(PlanDTO dto);
	
	public int planlistDel(int myp_idx);
	
	public List<PlanDTO> planlistAll(int midx);
	
	public int planWriteCom(PlanDTO dto);
	
	public int planlistDelCom(int myp_idx);
	
	public List<PlanDTO> planlistAllCom(int cidx);
}
