package com.admin.company.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyDAOImple implements CompanyDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<CompanyDTO> companyList(String kind) {
		List<CompanyDTO> dtos=sqlMap.selectList("companyList",kind);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> collectionList(String kind) {
		List<CompanyDTO> dtos=sqlMap.selectList("collectionList",kind);
		return dtos;
	}
	
	@Override
	public CompanyDTO companyInfo(int cidx) {
		CompanyDTO dto=sqlMap.selectOne("companyInfo",cidx);
		return dto;
	}
	
	@Override
	public List<Integer> traffic() {
		List<Integer> traffic=new ArrayList<Integer>();
		
		traffic.add(sqlMap.selectOne("traffic1_c"));
		traffic.add(sqlMap.selectOne("traffic2_c"));
		traffic.add(sqlMap.selectOne("traffic3_c"));
		traffic.add(sqlMap.selectOne("traffic4_c"));
		traffic.add(sqlMap.selectOne("traffic5_c"));
		return traffic;
	}

}
