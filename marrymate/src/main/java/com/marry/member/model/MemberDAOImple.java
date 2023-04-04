package com.marry.member.model;

import java.util.HashMap;
import java.util.Map;

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
	
	@Override
	public MemberDTO memberLogin(String id, String pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlMap.selectOne("memberLogin", map);
	}
	
	@Override
	public int getMidx(String id) {
		return sqlMap.selectOne("getMidx", id);
	}
	
	@Override
	public String getNick(String id) {
		return sqlMap.selectOne("getNick", id);
	}
	
	@Override
	public String getName(String id) {
		return sqlMap.selectOne("getName", id);
	}
	
	@Override
	public String getMarryDate(String id) {
		return sqlMap.selectOne("getMarryDate", id);
	}
	
	@Override
	public String getPname(String id) {
		return sqlMap.selectOne("getPname", id);
	}
	
}
