package com.admin.admin_cs.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class Admin_csDAOImple implements Admin_csDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<M_a_csListDTO> m_a_cs_List() {
		List<M_a_csListDTO> dtos=sqlMap.selectList("m_a_cs_List");
		return dtos;
	}
	
	@Override
	public List<C_a_csListDTO> c_a_cs_List() {
		List<C_a_csListDTO> dtos=sqlMap.selectList("c_a_cs_List");
		return dtos;
	}

}
