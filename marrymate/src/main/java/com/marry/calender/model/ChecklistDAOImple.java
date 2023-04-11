package com.marry.calender.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ChecklistDAOImple implements ChecklistDAO {

	
	private SqlSessionTemplate sqlMap;
	
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	

	@Override
	public int checklistAdd(ChecklistDTO dto) {
		int count=sqlMap.insert("checklistAdd", dto);
		return count;
	}
	
	@Override
	public int checklistDel(int ch_idx) {
		int count=sqlMap.delete("checklistDel", ch_idx);
		return count;
	}

	@Override
	public List<ChecklistDTO> checklistAll(int midx) {
		return sqlMap.selectList("checklistAll", midx);

	}

	
	
}
