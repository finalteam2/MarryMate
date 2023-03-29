package com.marry.company.model;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyDAOImple implements CompanyDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int coJoin(CompanyDTO dto) {
		
		int count=sqlMap.insert("companyJoin", dto);
		return count;
		
	}

}
