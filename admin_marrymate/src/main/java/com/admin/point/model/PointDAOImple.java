package com.admin.point.model;

import java.util.ArrayList;
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
	public List<PointListDTO> pointMinusList() {
		List<PointListDTO> dtos=sqlMap.selectList("pointMinusList");
		return dtos;
	}
	
	@Override
	public List<PointListDTO> pointPlusList() {
		List<PointListDTO> dtos=sqlMap.selectList("pointPlusList");
		return dtos;
	}

}
