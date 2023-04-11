package com.marry.mypage.model;

import java.util.*;
import java.sql.*;

import org.mybatis.spring.SqlSessionTemplate;

import com.marry.member.model.MemberDTO;
import com.marry.company.model.*;
import com.marry.bbs.model.*;

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
	public int companyInfoUpdate(CompanyDTO dto) {
		
		int count=sqlMap.update("companyInfoUpdate", dto);
		return count;
	}
	
	@Override
	public int hallInfoUpdate(HallDTO dto) {
		
		int count=sqlMap.update("hallInfoUpdate", dto);
		return count;
	}
	
	@Override
	public int foodInfoUpdate(FoodDTO dto) {
		
		int count=sqlMap.update("foodInfoUpdate", dto);
		return count;
	}
	
	@Override
	public MemberDTO myInfoSelect(MemberDTO dto) {
	
		MemberDTO dto2=sqlMap.selectOne("myInfoSelect",dto);
		return dto2;
	}
	
	@Override
	public CompanyDTO comInfoSelect(CompanyDTO dto) {
		
		CompanyDTO dto3=sqlMap.selectOne("comInfoSelect",dto);
		return dto3;
	}
	
	@Override
	public List<HallDTO> hallInfoSelect(int cidx) {
		
		List<HallDTO> dto4=sqlMap.selectList("hallInfoSelect",cidx);
		return dto4;
	}
	
	@Override
	public List<FoodDTO> foodInfoSelect(int cidx) {
		
		List<FoodDTO> dto5=sqlMap.selectList("foodInfoSelect",cidx);
		return dto5;
	}
	
	@Override
	public List<BbsDTO> subjectSelect(int midx) {
	
		List<BbsDTO> dto6=sqlMap.selectList("subjectSelect", midx);
		return dto6;
	}
	
	@Override
	public List<ReplyDTO> replySelect(int midx) {
	
		List<ReplyDTO> dto7=sqlMap.selectList("replySelect", midx);
		return dto7;
	}
	
	@Override
	public int imgChange(MemberDTO dto) {
		
		int count=sqlMap.update("imgChange", dto);
		return count;
	}
}