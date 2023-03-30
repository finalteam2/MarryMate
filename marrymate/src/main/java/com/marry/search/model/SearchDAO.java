package com.marry.search.model;

import java.util.List;

import com.marry.company.model.CompanyDTO;

public interface SearchDAO {

	public List<CompanyDTO> searchAll(SearchDTO dto);
	public int totalCnt(SearchDTO dto);
}
