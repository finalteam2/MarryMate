package com.admin.book.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BookDAOImple implements BookDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<BookListDTO> bookList() {
		List<BookListDTO> dtos=sqlMap.selectList("bookList_h");
		return dtos;
	}

}
