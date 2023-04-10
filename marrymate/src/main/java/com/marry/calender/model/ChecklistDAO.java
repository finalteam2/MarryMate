package com.marry.calender.model;

import java.util.List;

public interface ChecklistDAO {
	public int checklistAdd(ChecklistDTO cdto);
	
	public int checklistDel(String schedule);
	
	public List<ChecklistDTO> checklistAll();
	
}
