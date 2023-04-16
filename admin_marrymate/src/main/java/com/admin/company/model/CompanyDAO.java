package com.admin.company.model;

import java.util.List;

public interface CompanyDAO {
	
	public List<CompanyDTO> companyList(int cp, int listSize, String kind);
	
	public List<CompanyDTO> companyList_b(int cp, int listSize);
	
	public List<CompanyDTO> collectionList(int cp,int listSize,String kind);
	
	public List<CompanyDTO> collectionList_b(int cp,int listSize);
	
	public CompanyDTO companyInfo(int cidx);
	
	public List<Integer> traffic();
	
	public List<Integer> traffic_all();
	
	public List<CompanyDTO> listSelect_cidx(String kind, int cidx);
	
	public List<CompanyDTO> listSelect_cname(int cp, int listSize, String kind, String selectText);
	
	public List<CompanyDTO> listSelect_cidx_b(int cidx);
	
	public List<CompanyDTO> listSelect_cname_b(int cp, int listSize, String selectText);
	
	public int getTotalCnt(String kind);
	
	public int getTotalCnt_cn(String kind, String selectText);
	
	public int getTotalCnt_b();
	
	public int getTotalCnt_cn_b(String selectText);
	
	public int bi(int cidx);
	
	public void sd(int cidx);
	
	public void hj(int cidx);
	
	public void sg(int cidx);
	
	public void sghj(int cidx);
	
	public int getTotalCnt_com(String kind);
	
	public int getTotalCnt_com_b();
	
	public List<CompanyDTO> listSel_cidx(String kind, int cidx);
	
	public List<CompanyDTO> listSel_cname(int cp, int listSize, String kind, String selectText);
	
	public int getTotalCnt_cname(String kind, String selectText);
	
	public List<CompanyDTO> listSel_cidx_b(int cidx);
	
	public List<CompanyDTO> listSel_cname_b(int cp, int listSize, String selectText);
	
	public int getTotalCnt_cname_b(String selectText);
	
	public List<HallDTO> hallInfo(int cidx);
	
	public List<FoodDTO> foodInfo(int cidx);
	
	public void companyOk(int cidx);
	
	public void companyNo(int cidx);

}
