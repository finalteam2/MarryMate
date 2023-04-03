package com.marry.calender.model;

import java.sql.Date;
import java.util.List;

import com.marry.book.model.BookDTO;

public interface CalendarDAO {

	public int coupleInfo(int cal_idx);
	public int englishName(int cal_idx);
	public int calendarShow(int cidx);
	public Date dateInfo();
	public List<BookDTO> bookInfo(int cidx);
	public List<BookDTO> moneyBook(int cidx);
	public List<BookDTO> moneyLeft(int cidx);
	
}
