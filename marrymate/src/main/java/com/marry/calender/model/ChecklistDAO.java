package com.marry.calender.model;

import java.util.List;

public interface ChecklistDAO {
	public int checklistAdd(ChecklistDTO cdto);
	
	public int checklistDel(int ch_idx);
	
	public List<ChecklistDTO> checklistAll(int midx);
	
}
