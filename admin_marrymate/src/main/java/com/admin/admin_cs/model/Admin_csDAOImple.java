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
	
	@Override
	public void sendContent_m(int midx, String content) {
		
		M_a_csDTO dto=new M_a_csDTO();
		dto.setMidx(midx);
		dto.setContent(content);
		
		sqlMap.insert("sendContent_m",dto);
	}
	
	@Override
	public List<M_a_csDTO> loadContent_m(int midx) {
		List<M_a_csDTO> dtos=sqlMap.selectList("loadContent_m",midx);
		return dtos;
	}
	
	@Override
	public void read_m(int midx) {
		sqlMap.update("read_m",midx);
		
	}
	
	@Override
	public void sendContent_c(int cidx, String content) {
		
		C_a_csDTO dto=new C_a_csDTO();
		dto.setCidx(cidx);
		dto.setContent(content);
		
		sqlMap.insert("sendContent_c",dto);
	}
	
	@Override
	public List<C_a_csDTO> loadContent_c(int cidx) {
		List<C_a_csDTO> dtos=sqlMap.selectList("loadContent_c",cidx);
		return dtos;
	}
	
	@Override
	public void read_c(int cidx) {
		sqlMap.update("read_c",cidx);
	}

}
