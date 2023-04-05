package com.marry.mypage.model;

import java.util.*;
import java.sql.*;

import org.mybatis.spring.SqlSessionTemplate;

import com.marry.member.model.MemberDTO;
import com.marry.company.model.*;

public class MypageDAOImple implements MypageDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	public MypageDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int myInfoUpdate(MemberDTO dto) {
	
		int count=sqlMap.update("myInfoUpdate",dto);
		return count;
	}
	
	@Override
	public MemberDTO myInfoSelect(MemberDTO dto) {
	
		MemberDTO dto2=sqlMap.selectOne("myInfoSelect",dto);
		return dto2;
	}
	
	
	public CompanyDTO comInfoSelect(CompanyDTO dto) {
		
		CompanyDTO dto3=sqlMap.selectOne("comInfoSelect",dto);
		return dto3;
	}
	
	
	public List<HallDTO> hallInfoSelect(int cidx) {
		
		List<HallDTO> dto4=sqlMap.selectList("hallInfoSelect",1);
		return dto4;
	}
	
	
	public List<FoodDTO> foodInfoSelect(int cidx) {
		
		List<FoodDTO> dto5=sqlMap.selectList("foodInfoSelect",1);
		return dto5;
	}

}