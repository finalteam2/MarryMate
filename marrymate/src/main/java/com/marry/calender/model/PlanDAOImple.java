package com.marry.calender.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class PlanDAOImple implements PlanDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
    @Autowired
    private PlanDAO planDao;

    
	@Override
	public int planWrite(PlanDTO dto) {
		int count=sqlMap.insert("planWrite", dto);
		return count;
	}
	
	@Override
	public int planlistDel(int myp_idx) {
		int count=sqlMap.delete("planlistDel", myp_idx);
		return count;
	}

	@Override
	public List<PlanDTO> planlistAll(int midx) {
		return sqlMap.selectList("planlistAll", midx);
	}

	@Override
	public List<PlanDTO> planlistAllCom(int cidx) {
		return sqlMap.selectList("planlistAllCom", cidx);
	}
	
	@Override
	public int planlistDelCom(int myp_idx) {
		int count=sqlMap.delete("planlistDelCom", myp_idx);
		return count;
	}
	
	@Override
	public int planWriteCom(PlanDTO dto) {
		int count=sqlMap.insert("planWriteCom", dto);
		return count;
	}
}
