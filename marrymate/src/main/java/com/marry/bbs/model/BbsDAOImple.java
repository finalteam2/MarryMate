package com.marry.bbs.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class BbsDAOImple implements BbsDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int bbsWrite(BbsDTO dto) {
		return sqlMap.insert("bbsWrite", dto);
	}

}
