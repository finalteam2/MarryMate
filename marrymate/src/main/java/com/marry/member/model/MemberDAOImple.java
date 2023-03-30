package com.marry.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int memberJoin(MemberDTO dto) {
		
		int count=sqlMap.insert("memberJoin", dto);
		return count;
		
	}

}
