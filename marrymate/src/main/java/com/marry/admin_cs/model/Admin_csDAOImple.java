package com.marry.admin_cs.model;

import org.mybatis.spring.SqlSessionTemplate;

public class Admin_csDAOImple implements Admin_csDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

}
