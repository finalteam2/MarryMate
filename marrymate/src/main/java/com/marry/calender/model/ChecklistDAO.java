package com.marry.calender.model;

import java.util.List;

public interface ChecklistDAO {
	public List<ChecklistDTO> checklist();
	public int checkdataInfo();
	public int checkStatus();
}
