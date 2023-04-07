package com.marry.book.model;

import java.util.List;

import com.marry.company.model.CompanyDTO;

public interface BookDAO {

	public List<CompanyDTO> firstBookList();
	public List<CompanyDTO> cateBookList(String filterCate);
	public List<CompanyDTO> orderBookList(FilterDTO dto);
	public CompanyDTO addBookCart(int cidx);
	public List<CompanyDTO> searchBookList(FilterDTO dto);
}