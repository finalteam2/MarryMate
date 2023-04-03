package com.admin.bbs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<BbsListDTO> bbsList(String kind) {
		
		if(kind.equals("공지사항")) {
			List<BbsListDTO> dtos=sqlMap.selectList("bbsList_g",kind);
			return dtos;
		}else {
			List<BbsListDTO> dtos=sqlMap.selectList("bbsList_w",kind);
			return dtos;
		}
			
		
	}
	
	@Override
	public List<BbsListDTO> bbsList_b() {
		List<BbsListDTO> dtos=sqlMap.selectList("bbsList_b");
		return dtos;
	}

}
