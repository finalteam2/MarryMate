package com.marry.calender.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ChecklistDAOImple implements ChecklistDAO {

	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	public ChecklistDAOImple() {
		this.checklistDAO = null;
		this.checklistDTO = new ChecklistDTO();
	}
	private final ChecklistDAO checklistDAO;
	
	private final ChecklistDTO checklistDTO;
	
	@Override
	public List<ChecklistDTO> checklist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkdataInfo() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkStatus() {
		// TODO Auto-generated method stub
		return 0;
	}

}
