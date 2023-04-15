package com.admin.book.model;

import java.util.List;

import com.admin.company.model.CompanyDTO;

public interface BookDAO {
	
	public List<BookListDTO> bookList(int cp, int listSize, String kind);
	
	public List<BookListDTO> bookList_b(int cp, int listSize);
	
	public List<BookListDTO> listSel_bk_idx(String kind,int bk_idx);
	
	public List<BookListDTO> listSel_bk_midx(String kind,int midx);
	
	public List<BookListDTO> listSel_bk_name(int cp, int listSize, String kind, String selectText);
	
	public List<BookListDTO> listSel_bk_cname(int cp, int listSize, String kind, String selectText);
	
	public int getTotalCnt_bk(String kind);
	
	public int getTotalCnt_bk_n(String kind, String selectText);
	
	public int getTotalCnt_bk_cn(String kind, String selectText);
	
	public int getTotalCnt_bk_b();
	
	public BookDetailsDTO bookDetails(int bk_idx,String kind);
	
	public int cb(int bk_idx);
	
	public String pay_date(int bk_idx);
	
	public void cancle(int bk_idx,int midx);

}
