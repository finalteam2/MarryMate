package com.marry.book.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.marry.company.model.CompanyDTO;

public class BookDAOImple implements BookDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	/**통합예약내 업체리스트 출력(첫화면)*/
	@Override
	public List<CompanyDTO> firstBookList() {
		List<CompanyDTO> list=sqlMap.selectList("firstList");
		return list;
	}
	
	/**통합예약내 업체리스트 출력(카테고리별)*/
	@Override
	public List<CompanyDTO> cateBookList(String filterCate) {
		List<CompanyDTO> list=sqlMap.selectList("cateList",filterCate);
		return list;
	}
	
	/**통합예약내 업체리스트 출력(정렬순)*/
	@Override
	public List<CompanyDTO> orderBookList(FilterDTO dto) {
		List<CompanyDTO> list=sqlMap.selectList("orderList",dto);
		return list;
	}
}