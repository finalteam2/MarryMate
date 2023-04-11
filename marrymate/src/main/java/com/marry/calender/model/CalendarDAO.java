package com.marry.calender.model;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.marry.book.model.BookDTO;
import com.marry.member.model.MemberDTO;

public interface CalendarDAO {

	public int coupleInfo(int cal_idx);
	public int englishName(int cal_idx);
	public int calendarShow(int cidx);
	public int date(String loginMD);
	public Date dateInfo(String loginMD);
	public List<BookDTO> bookInfo(int midx);
	public List<BookDTO> moneyBook(int midx);
	public List<BookDTO> moneyLeft(int midx);
	
	
}
