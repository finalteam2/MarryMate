package com.marry.company.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyDAOImple implements CompanyDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int coJoin(CompanyDTO dto) {
		int count=sqlMap.insert("companyJoin", dto);
		return count;
	}
	
	@Override
	public int selectCidx(String id) {
		int count=sqlMap.selectOne("selectCidx", id);
		return count;
	}
	
	@Override
	public int timeInsert(Book_TimeDTO dto) {
		int count=sqlMap.insert("timeInsert", dto);
		return count;
	}
	
	@Override
	public int foodInsert(FoodDTO dto) {
		int count=sqlMap.insert("foodInsert", dto);
		return count;
	}
	
	@Override
	public int hallInsert(HallDTO dto) {
		return sqlMap.insert("hallInsert", dto);
	}
	
	@Override
	public int imgInsert(String cidx, String img) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cidx", cidx);
		map.put("img", img);
		return sqlMap.insert("imgInsert", map);
	}
	
}
