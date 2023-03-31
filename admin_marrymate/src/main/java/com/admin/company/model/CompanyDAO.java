package com.admin.company.model;

import java.util.List;

public interface CompanyDAO {
	
	public List<CompanyDTO> companyList(String kind);

}
