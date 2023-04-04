package com.admin.company.model;

import java.util.List;

public interface CompanyDAO {
	
	public List<CompanyDTO> companyList(String kind);
	
	public List<CompanyDTO> collectionList(String kind);
	
	public CompanyDTO companyInfo(int cidx);
	
	public List<Integer> traffic();

}
