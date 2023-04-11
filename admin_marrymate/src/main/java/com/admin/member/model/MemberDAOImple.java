package com.admin.member.model;

import java.util.ArrayList;
import java.util.List;

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
	public List<MemberDTO> memberList() {
		List<MemberDTO> dtos=sqlMap.selectList("memberList");
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
	public MemberDTO memberInfo(int midx) {
		MemberDTO dto=sqlMap.selectOne("memberInfo",midx);
		return dto;
	}

}
