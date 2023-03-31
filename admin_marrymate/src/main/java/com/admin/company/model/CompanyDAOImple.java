package com.admin.company.model;

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

}
