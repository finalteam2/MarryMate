package com.marry.calender.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.marry.book.model.BookDTO;
import com.marry.company.model.CompanyDTO;
import com.marry.member.model.MemberDTO;

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
	
	private SqlSessionTemplate sqlMap;
	
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
	public int date(String loginMD) {
		LocalDate loginDate = LocalDate.parse(loginMD, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate today = LocalDate.now();
		long diffInDays = ChronoUnit.DAYS.between(today, loginDate);
		int dDay = (int) diffInDays;
		return dDay;
	}

	@Override
	public Date dateInfo(String loginMD) {
		return null;
	}


	@Override
	public List<BookinfoDTO> booklistAll(int midx) {
		return sqlMap.selectList("booklistAll", midx);
	}

	@Override
	public List<CompanyDTO> bookInfoTwo(int midx) {
		return sqlMap.selectList("booklistAlltwo", midx);
	}
	@Override
	public List<BookDTO> moneyBook(int midx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookDTO> moneyLeft(int midx) {
		// TODO Auto-generated method stub
		return null;
	}

}
