package com.marry.bbs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int bbsWrite(BbsDTO dto) {
		return sqlMap.insert("bbsWrite", dto);
	}
	
	@Override
	public List<BbsDTO> bbsNotiList() {
		return sqlMap.selectList("bbsNotiList");
	}
	
	@Override
	public List<BbsDTO> bbsAfterList() {
		return sqlMap.selectList("bbsAfterList");
	}
	
	@Override
	public List<BbsDTO> bbsTalkList() {
		return sqlMap.selectList("bbsTalkList");
	}

}
