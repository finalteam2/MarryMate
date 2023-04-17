package com.marry.book.model;

import java.util.List;

import com.marry.company.model.CompanyDTO;
import com.marry.company.model.FoodDTO;

public interface BookDAO {
	public List<CompanyDTO> cateBookList(String filterCate);
	public CompanyDTO addBookCart(int cidx);
	public List<CompanyDTO> searchBookList(FilterDTO dto);
	public List<Integer> notHallPay(List<BookpayDTO> bookPayList);
	public List<Integer> hallPay(List<BookpayDTO> bookPayList);
	public void bookPointUpdate(int midx, int usePoint, int pay_idx);
	public void janPointUpdate(int midx, int usePoint, int pay_idx);
	public int memberPoint(int midx);
	public List<String> bookTimeList(int cidx, String filterDate);
	public List<String> exceptTimeList(int cidx, String strFilterDate);
	public BookpayDTO janPayInfos(int bk_idx);
	public com.marry.company.model.HallDTO bookHallInfo(int hidx);
	public FoodDTO bookFoodInfo(int fidx);
	public void updateBkState(int bk_idx);
	public void insertJanPay(int bk_idx, int midx, int usePoint, int finalPrice);
	public void janNoti(int cidx);
	public int janPayIdx(int bk_idx);
}