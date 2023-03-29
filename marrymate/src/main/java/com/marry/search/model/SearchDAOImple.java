package com.marry.search.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.marry.company.model.CompanyDTO;

public class SearchDAOImple implements SearchDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int searchTest() {
		int result = sqlMap.selectOne("searchTest");
		return result;
	}

	@Override
	public List searchTest2(SearchDTO dto) {
		List<String> result = sqlMap.selectList("searchTest2", dto);
		return result;
	}
	
	@Override
	public List<CompanyDTO> searchAll(SearchDTO dto) {
		List arr = new ArrayList();
		arr = sqlMap.selectList("searchAll", dto);
		return arr;
	}
}
