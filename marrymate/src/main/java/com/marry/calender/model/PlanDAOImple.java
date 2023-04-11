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
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<PlanDTO> planlistAll(int midx) {
		return sqlMap.selectList("planlistAll", midx);
	}

}
