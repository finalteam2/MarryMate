package com.marry.calender.model;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.marry.book.model.BookDTO;
import com.marry.company.model.CompanyDTO;
import com.marry.member.model.MemberDTO;

public interface CalendarDAO {

	public int coupleInfo(int cal_idx);
	public int englishName(int cal_idx);
	public int calendarShow(int cidx);
	public int date(String loginMD);
	public List<BookDTO> bookcount(int midx);
	public Date dateInfo(String loginMD);
	public List<BookinfoDTO> booklistAll(int midx);
	public List<CompanyDTO> bookInfoTwo(int midx);
	public List<BookDTO> memberbook(int midx);
	public List<MemberDTO> myInfo(int midx);
	public List<MemberDTO> comInfo(int midx);
	public List<BookDTO> memberbookCom(int cidx);
	
}
