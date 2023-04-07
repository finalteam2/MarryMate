package com.marry.calender.model;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.marry.book.model.BookDTO;

public class ComcalendarDAOImple implements ComcalendarDAO {

	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int calendarShow(int cidx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int date(String loginMD) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Date dateInfo(String loginMD) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDTO> bookInfo(int cidx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDTO> moneyBook(int cidx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDTO> moneyLeft(int cidx) {
		// TODO Auto-generated method stub
		return null;
	}

}
