package com.marry.calender.model;

import org.mybatis.spring.SqlSessionTemplate;

public class PlanDAOImple implements PlanDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int planWrite(PlanDTO dto) {
		int count=sqlMap.insert("planWrite", dto);
		return count;
	}

}
