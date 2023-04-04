package com.admin.book.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class PaymentDAOImple implements PaymentDAO {
	
	private SqlSessionTemplate sqlMap;

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public List<Integer> amount_s() {
		List<Integer> amount_s=new ArrayList<Integer>();
		
		amount_s.add(sqlMap.selectOne("amount1_s"));
		amount_s.add(sqlMap.selectOne("amount2_s"));
		amount_s.add(sqlMap.selectOne("amount3_s"));
		amount_s.add(sqlMap.selectOne("amount4_s"));
		amount_s.add(sqlMap.selectOne("amount5_s"));
		return amount_s;
	}
	
	@Override
	public List<Integer> amount_b() {
		List<Integer> amount_b=new ArrayList<Integer>();
		
		amount_b.add(sqlMap.selectOne("amount1_b"));
		amount_b.add(sqlMap.selectOne("amount2_b"));
		amount_b.add(sqlMap.selectOne("amount3_b"));
		amount_b.add(sqlMap.selectOne("amount4_b"));
		amount_b.add(sqlMap.selectOne("amount5_b"));
		return amount_b;
	}

}
