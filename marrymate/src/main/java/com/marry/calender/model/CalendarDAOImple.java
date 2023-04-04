package com.marry.calender.model;

import java.sql.Date;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;

import com.marry.book.model.BookDTO;

public class CalendarDAOImple implements CalendarDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int coupleInfo(int cal_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int englishName(int cal_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int calendarShow(int cidx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Date dateInfo() {
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
