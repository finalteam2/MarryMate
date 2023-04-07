package com.marry.calender.model;

import java.sql.Date;
import java.util.List;

import com.marry.book.model.BookDTO;

public interface ComcalendarDAO {

	public int calendarShow(int cidx);
	public int date(String loginMD);
	public Date dateInfo(String loginMD);
	public List<BookDTO> bookInfo(int cidx);
	public List<BookDTO> moneyBook(int cidx);
	public List<BookDTO> moneyLeft(int cidx);
}
