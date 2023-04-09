package com.marry.member.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.marry.point.model.PointDTO;

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
	public int nickCheck(String nick) {
		return sqlMap.selectOne("nickCheck", nick);
	}
	
	@Override
	public int idCheck(String id) {
		return sqlMap.selectOne("idCheck", id);
	}
	
	@Override
	public int gnameCheck(String gname) {
		return sqlMap.selectOne("gnameCheck", gname);
	}
	
	@Override
	public int getMidx(String id) {
		return sqlMap.selectOne("getMidx", id);
	}
	
	@Override
	public int getPoint(String id) {
		return sqlMap.selectOne("getPoint", id);
	}
	
	@Override
	public int gnameInsertPoint(int midx) {
		return sqlMap.insert("gnameInsertPoint", midx);
	}
	
	@Override
	public int memberInsertPoint(int midx, int point) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("midx", midx);
		map.put("point", point);
		return sqlMap.insert("memberInsertPoint", map);
	}
	
	@Override
	public int updatePoint(String gname) {
		return sqlMap.update("updatePoint", gname);
	}
	
}
