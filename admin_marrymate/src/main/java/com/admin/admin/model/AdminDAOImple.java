package com.admin.admin.model;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminDAOImple implements AdminDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int loginCheck(String id, String pwd, HttpSession session) {
		
		String db_pwd=sqlMap.selectOne("loginCheck",id);
		
		if(db_pwd!=null) {
			if(db_pwd.equals(pwd)) {
				AdminDTO dto=sqlMap.selectOne("getInfo",id);
				session.setAttribute("name", dto.getName());
				session.setAttribute("dept", dto.getDept());
				
				return LOGIN_OK;
			}else {
				return NOT_PWD;
			}
		}else {
			return NOT_ID;
		}
	}
	
	@Override
	public AdminDTO getInfo(String id) {
		AdminDTO dto=sqlMap.selectOne("getInfo",id);
		return dto;
	}

}
