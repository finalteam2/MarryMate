package com.marry.calender.model;

import java.sql.Date;
import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.marry.book.model.BookDTO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;


public class CalendarDAOImple implements CalendarDAO {
	
	public CalendarDAOImple() {
		this.calendarDTO = new CalendarDTO();
		this.calendarDAO = null;
	
	}
	
	private final CalendarDTO calendarDTO;

    public CalendarDAOImple(CalendarDTO calendarDTO) {
        this.calendarDTO = calendarDTO;
		this.calendarDAO = null;
    }
	
	private HttpServletRequest request;

	public CalendarDAOImple(HttpServletRequest request) {
		this.calendarDTO = new CalendarDTO();
		this.request = request;
		this.calendarDAO = null;
	}
	
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
	public int date() {
		return (int) calendarDTO.getCdate().getTime();
	}
	
	@Override
	public Date dateInfo() {
		return calendarDTO.getCdate();
	}
	
	private final CalendarDAO calendarDAO;

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
