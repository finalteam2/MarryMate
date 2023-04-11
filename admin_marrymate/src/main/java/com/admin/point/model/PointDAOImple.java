package com.admin.point.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.admin.company.model.CompanyDTO;
import com.admin.member.model.MemberDTO;

public class PointDAOImple implements PointDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<PointListDTO> pointMinusList(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<PointListDTO> dtos=sqlMap.selectList("pointMinusList",map);
		return dtos;
	}
	
	@Override
	public List<PointListDTO> pointPlusList(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<PointListDTO> dtos=sqlMap.selectList("pointPlusList",map);
		return dtos;
	}
	
	@Override
	public int getTotalCnt_m() {
		
		int count=sqlMap.selectOne("getTotalCnt_m");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_p() {
		
		int count=sqlMap.selectOne("getTotalCnt_p");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<PointListDTO> listSelect_midx(int cp, int listSize, String mp, int midx){
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("midx", midx);
		
		if(mp.equals("m")) {
			List<PointListDTO> dtos=sqlMap.selectList("listSelect_midx_m",map);
			return dtos;
		}else {
			List<PointListDTO> dtos=sqlMap.selectList("listSelect_midx_p",map);
			return dtos;
		}
	}
	
	@Override
	public List<PointListDTO> listSelect_name(int cp, int listSize, String mp, String selectText){
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("name", selectText);
		
		if(mp.equals("m")) {
			List<PointListDTO> dtos=sqlMap.selectList("listSelect_name_m",map);
			return dtos;
		}else {
			List<PointListDTO> dtos=sqlMap.selectList("listSelect_name_p",map);
			return dtos;
		}
	}
	
	@Override
	public List<PointListDTO> listSelect_cname(int cp, int listSize, String selectText){
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("cname", selectText);
		
		List<PointListDTO> dtos=sqlMap.selectList("listSelect_cname_m",map);
		return dtos;
	}
	
	@Override
	public int getTotalCnt_midx(int midx, String mp) {
		
		PointDTO pointDto=new PointDTO();
		pointDto.setMidx(midx);
		
		if(mp.equals("m")) {
			int count=sqlMap.selectOne("getTotalCnt_midx_m",pointDto);
			count=count==0?1:count;
			return count;
		}else {
			int count=sqlMap.selectOne("getTotalCnt_midx_p",pointDto);
			count=count==0?1:count;
			return count;
		}
	}
	
	@Override
	public int getTotalCnt_name(String selectText, String mp) {
		
		if(mp.equals("m")) {
			int count=sqlMap.selectOne("getTotalCnt_name_m",selectText);
			count=count==0?1:count;
			return count;
		}else {
			int count=sqlMap.selectOne("getTotalCnt_name_p",selectText);
			count=count==0?1:count;
			return count;
		}
	}
	
	@Override
	public int getTotalCnt_cname(String selectText) {
		
		int count=sqlMap.selectOne("getTotalCnt_cname_m",selectText);
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public void pointPlus(int midx, int p_cal) {
		
		MemberDTO mdto_s=sqlMap.selectOne("memberInfo",midx);
		
		int point=mdto_s.getPoint()+p_cal;
		
		MemberDTO mdto=new MemberDTO();
		mdto.setMidx(midx);
		mdto.setPoint(point);
		sqlMap.update("memberUpd",mdto);
		
		PointDTO pdto=new PointDTO();
		pdto.setMidx(midx);
		pdto.setP_cal(p_cal);
		pdto.setP_total(point);
		sqlMap.insert("pointPlus",pdto);
		
	}
	

}
