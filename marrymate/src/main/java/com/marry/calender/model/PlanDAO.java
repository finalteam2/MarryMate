package com.marry.calender.model;

import java.util.List;

public interface PlanDAO {
	public int planWrite(PlanDTO dto);
	
	public List<PlanDTO> planlistAll(int midx);
}
