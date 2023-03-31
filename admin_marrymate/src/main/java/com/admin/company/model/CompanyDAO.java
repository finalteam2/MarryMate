package com.admin.company.model;

import java.util.List;

public interface CompanyDAO {
	
	public List<CompanyDTO> companyList(String kind);
	
	public List<CompanyDTO> collectionList(String kind);
	
	public String findKind(int cidx);

}
