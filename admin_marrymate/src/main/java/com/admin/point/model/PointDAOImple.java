package com.admin.point.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class PointDAOImple implements PointDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<PointDTO> pointList() {
		List<PointDTO> dtos=sqlMap.selectList("pointList");
		return dtos;
	}

}
