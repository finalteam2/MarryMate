package com.admin.company.model;

import java.util.List;

public interface CompanyDAO {
	
	public List<CompanyDTO> companyList(String kind);
	
	public List<CompanyDTO> collectionList(int cp,int listSize,String kind);
	
	public CompanyDTO companyInfo(int cidx);
	
	public List<Integer> traffic();
	
	public List<CompanyDTO> listSelect_cidx(String kind, int cidx);
	
	public List<CompanyDTO> listSelect_cname(int cp, int listSize, String kind, String selectText);
	
	public int getTotalCnt(String kind);
	
	public int getTotalCnt_cn(String kind, String selectText);
	
	public int bi(int cidx);
	
	public void sd(int cidx);
	
	public void hj(int cidx);
	
	public void sg(int cidx);

}
