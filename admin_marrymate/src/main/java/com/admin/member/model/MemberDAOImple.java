package com.admin.member.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<MemberDTO> memberList(int cp, int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<MemberDTO> dtos=sqlMap.selectList("memberList",map);
		return dtos;
	}
	
	@Override
	public List<Integer> traffic() {
		List<Integer> traffic=new ArrayList<Integer>();
		
		traffic.add(sqlMap.selectOne("traffic1_m"));
		traffic.add(sqlMap.selectOne("traffic2_m"));
		traffic.add(sqlMap.selectOne("traffic3_m"));
		traffic.add(sqlMap.selectOne("traffic4_m"));
		traffic.add(sqlMap.selectOne("traffic5_m"));
		return traffic;
	}
	
	@Override
	public List<Integer> traffic_all() {
		List<Integer> traffic_all=new ArrayList<Integer>();
		
		traffic_all.add(sqlMap.selectOne("traffic11_m"));
		traffic_all.add(sqlMap.selectOne("traffic22_m"));
		traffic_all.add(sqlMap.selectOne("traffic33_m"));
		traffic_all.add(sqlMap.selectOne("traffic44_m"));
		traffic_all.add(sqlMap.selectOne("traffic55_m"));
		traffic_all.add(sqlMap.selectOne("traffic66_m"));
		traffic_all.add(sqlMap.selectOne("traffic77_m"));
		
		traffic_all.add(sqlMap.selectOne("traffic1_m"));
		traffic_all.add(sqlMap.selectOne("traffic2_m"));
		traffic_all.add(sqlMap.selectOne("traffic3_m"));
		traffic_all.add(sqlMap.selectOne("traffic4_m"));
		traffic_all.add(sqlMap.selectOne("traffic5_m"));
		return traffic_all;
	}
	
	@Override
	public MemberDTO memberInfo(int midx) {
		MemberDTO dto=sqlMap.selectOne("memberInfo",midx);
		return dto;
	}
	
	@Override
	public int getTotalCnt_mem() {
		int count=sqlMap.selectOne("getTotalCnt_mem");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<MemberDTO> listSel_midx(int midx) {
		MemberDTO memDto=new MemberDTO();
		memDto.setMidx(midx);
		
		List<MemberDTO> dtos=sqlMap.selectList("listSel_midx",memDto);
		return dtos;
	}
	@Override
	public List<MemberDTO> listSel_name(int cp, int listSize, String selectText) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		map.put("name", selectText);
		
		List<MemberDTO> dtos=sqlMap.selectList("listSel_name",map);
		return dtos;
	}
	@Override
	public int getTotalCnt_name(String selectText) {
		Map map=new HashMap();
		map.put("name", selectText);
		
		int count=sqlMap.selectOne("getTotalCnt_name",map);
		count=count==0?1:count;
		return count;
	}

}
