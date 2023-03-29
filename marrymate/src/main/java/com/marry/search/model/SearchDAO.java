package com.marry.search.model;

import java.util.List;

import com.marry.company.model.CompanyDTO;

public interface SearchDAO {

	public int searchTest();
	public List searchTest2(SearchDTO dto);
	public List<CompanyDTO> searchAll(SearchDTO dto);
}
