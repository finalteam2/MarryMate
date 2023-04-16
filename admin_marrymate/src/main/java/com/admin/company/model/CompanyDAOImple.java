
package com.admin.company.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyDAOImple implements CompanyDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<CompanyDTO> companyList(int cp, int listSize, String kind) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		
		List<CompanyDTO> dtos=sqlMap.selectList("companyList",map);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> companyList_b(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<CompanyDTO> dtos=sqlMap.selectList("companyList_b",map);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> collectionList(int cp, int listSize, String kind) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		
		List<CompanyDTO> dtos=sqlMap.selectList("collectionList",map);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> collectionList_b(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<CompanyDTO> dtos=sqlMap.selectList("collectionList_b",map);
		return dtos;
	}
	
	@Override
	public CompanyDTO companyInfo(int cidx) {
		CompanyDTO dto=sqlMap.selectOne("companyInfo",cidx);
		return dto;
	}
	
	@Override
	public List<Integer> traffic() {
		List<Integer> traffic=new ArrayList<Integer>();
		
		traffic.add(sqlMap.selectOne("traffic1_c"));
		traffic.add(sqlMap.selectOne("traffic2_c"));
		traffic.add(sqlMap.selectOne("traffic3_c"));
		traffic.add(sqlMap.selectOne("traffic4_c"));
		traffic.add(sqlMap.selectOne("traffic5_c"));
		return traffic;
	}
	
	@Override
	public List<Integer> traffic_all() {
		List<Integer> traffic_all=new ArrayList<Integer>();
		
		traffic_all.add(sqlMap.selectOne("traffic11_c"));
		traffic_all.add(sqlMap.selectOne("traffic22_c"));
		traffic_all.add(sqlMap.selectOne("traffic33_c"));
		traffic_all.add(sqlMap.selectOne("traffic44_c"));
		traffic_all.add(sqlMap.selectOne("traffic55_c"));
		traffic_all.add(sqlMap.selectOne("traffic66_c"));
		traffic_all.add(sqlMap.selectOne("traffic77_c"));
		
		traffic_all.add(sqlMap.selectOne("traffic1_c"));
		traffic_all.add(sqlMap.selectOne("traffic2_c"));
		traffic_all.add(sqlMap.selectOne("traffic3_c"));
		traffic_all.add(sqlMap.selectOne("traffic4_c"));
		traffic_all.add(sqlMap.selectOne("traffic5_c"));
		return traffic_all;
	}
	
	@Override
	public List<CompanyDTO> listSelect_cidx(String kind, int cidx) {
		
		CompanyDTO comDto=new CompanyDTO();
		comDto.setKind(kind);
		comDto.setCidx(cidx);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSelect_cidx",comDto);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> listSelect_cname(int cp, int listSize, String kind, String selectText) {

		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		map.put("cname", selectText);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSelect_cname",map);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> listSelect_cidx_b(int cidx) {
		
		CompanyDTO comDto=new CompanyDTO();
		comDto.setCidx(cidx);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSelect_cidx_b",comDto);
		return dtos;
	}
	
	@Override
	public List<CompanyDTO> listSelect_cname_b(int cp, int listSize, String selectText) {

		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("cname", selectText);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSelect_cname_b",map);
		return dtos;
	}
	
	@Override
	public int getTotalCnt(String kind) {
		int count=sqlMap.selectOne("getTotalCnt",kind);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_cn(String kind, String selectText) {
		
		Map map=new HashMap();
		map.put("kind", kind);
		map.put("cname", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_cn",map);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_b() {
		int count=sqlMap.selectOne("getTotalCnt_b");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_cn_b(String selectText) {
		
		Map map=new HashMap();
		map.put("cname", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_cn_b",map);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int bi(int cidx) {
		int topfix=sqlMap.selectOne("bi",cidx);
		return topfix;
	}
	
	@Override
	public void sd(int cidx) {
		sqlMap.update("sd",cidx);
	}
	
	@Override
	public void hj(int cidx) {
		sqlMap.update("hj",cidx);
	}
	
	@Override
	public void sg(int cidx) {
		sqlMap.update("sg",cidx);
	}
	
	@Override
	public void sghj(int cidx) {
		sqlMap.update("sghj",cidx);
	}
	
	@Override
	public int getTotalCnt_com(String kind) {
		int count=sqlMap.selectOne("getTotalCnt_com",kind);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_com_b() {
		int count=sqlMap.selectOne("getTotalCnt_com_b");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<CompanyDTO> listSel_cidx(String kind, int cidx) {
		CompanyDTO comDto=new CompanyDTO();
		comDto.setKind(kind);
		comDto.setCidx(cidx);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSel_cidx",comDto);
		return dtos;
	}
	@Override
	public List<CompanyDTO> listSel_cname(int cp, int listSize, String kind, String selectText) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("kind", kind);
		map.put("cname", selectText);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSel_cname",map);
		return dtos;
	}
	@Override
	public int getTotalCnt_cname(String kind, String selectText) {
		Map map=new HashMap();
		map.put("kind", kind);
		map.put("cname", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_cname",map);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<CompanyDTO> listSel_cidx_b(int cidx) {
		CompanyDTO comDto=new CompanyDTO();
		comDto.setCidx(cidx);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSel_cidx_b",comDto);
		return dtos;
	}
	@Override
	public List<CompanyDTO> listSel_cname_b(int cp, int listSize, String selectText) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("cname", selectText);
		
		List<CompanyDTO> dtos=sqlMap.selectList("listSel_cname_b",map);
		return dtos;
	}
	@Override
	public int getTotalCnt_cname_b(String selectText) {
		Map map=new HashMap();
		map.put("cname", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_cname_b",map);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<HallDTO> hallInfo(int cidx) {
		List<HallDTO> dtos=sqlMap.selectList("hallInfo",cidx);
		return dtos;
	}
	
	@Override
	public List<FoodDTO> foodInfo(int cidx) {
		List<FoodDTO> dtos=sqlMap.selectList("foodInfo",cidx);
		return dtos;
	}
	
	@Override
	public void companyOk(int cidx) {
		sqlMap.update("companyOk",cidx);
		
	}
	
	@Override
	public void companyNo(int cidx) {
		sqlMap.update("companyNo",cidx);
		
	}

}
