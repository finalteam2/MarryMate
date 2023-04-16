package com.marry.book.model;

import java.util.List;

import com.marry.company.model.CompanyDTO;

public interface BookDAO {
	public List<CompanyDTO> cateBookList(String filterCate);
	public CompanyDTO addBookCart(int cidx);
	public List<CompanyDTO> searchBookList(FilterDTO dto);
	public List<Integer> notHallPay(List<BookpayDTO> bookPayList);
	public List<Integer> hallPay(List<BookpayDTO> bookPayList);
	public void pointUpdate(int midx, int usePoint, int pay_idx);
	public int memberPoint(int midx);
	public List<String> bookTimeList(int cidx, String filterDate);
	public List<String> exceptTimeList(int cidx, String strFilterDate);
}