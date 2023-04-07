package com.marry.admin_cs.model;

import java.util.*;

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
	public List<Admin_csDTO> questions() {
		List<Admin_csDTO> dtos=sqlMap.selectList("questions");
		return dtos;
	}
	
	@Override
	public Admin_csDTO answer(int acsidx) {
		Admin_csDTO dto=sqlMap.selectOne("answer",acsidx);
		return dto;
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
	public int readNum_m(int midx) {
		int read=sqlMap.selectOne("readNum_m",midx);
		return read;
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

}
