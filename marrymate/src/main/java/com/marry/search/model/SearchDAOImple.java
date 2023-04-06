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
	public List<CompanyDTO> searchAll(SearchDTO dto) {
		List arr = new ArrayList();
		arr = sqlMap.selectList("searchAll", dto);
		return arr;
	}
	
	@Override
	public int totalCnt(SearchDTO dto) {
		int cnt = sqlMap.selectOne("totalCnt", dto);
		return cnt;
	}
	
	@Override
	public List<CompanyDTO> likeHall(int midx) {
		List<CompanyDTO> arr = sqlMap.selectList("likehall",midx); 
		return arr;
	}
	@Override
	public List<CompanyDTO> likeSdm(int midx) {
		List<CompanyDTO> arr = sqlMap.selectList("likesdm",midx); 
		return arr;
	}
	@Override
	public List<CompanyDTO> likeEtc(int midx) {
		List<CompanyDTO> arr = sqlMap.selectList("likeetc",midx); 
		return arr;
	}
	
	
}
