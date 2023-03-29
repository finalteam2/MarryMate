package com.marry.search.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
//		System.out.println("dao 테스트 결과 : " + result);
		return result;
	}

	@Override
	public List searchTest2(SearchDTO dto) {
		List<String> result = sqlMap.selectList("searchTest2", dto);
//		System.out.println("dao 테스트 결과 : " + result.get(0));
		return result;
	}
}
