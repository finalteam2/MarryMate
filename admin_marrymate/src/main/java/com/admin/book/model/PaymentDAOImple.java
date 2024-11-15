package com.admin.book.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		int amount1_s=sqlMap.selectOne("amount1_s");
		int amount2_s=sqlMap.selectOne("amount2_s");
		int amount3_s=sqlMap.selectOne("amount3_s");
		int amount4_s=sqlMap.selectOne("amount4_s");
		int amount5_s=sqlMap.selectOne("amount5_s");
		
		amount_s.add(amount1_s/1000);
		amount_s.add(amount2_s/1000);
		amount_s.add(amount3_s/1000);
		amount_s.add(amount4_s/1000);
		amount_s.add(amount5_s/1000);
		return amount_s;
	}
	
	@Override
	public List<Integer> amount_b() {
		List<Integer> amount_b=new ArrayList<Integer>();
		
		int amount1_b=sqlMap.selectOne("amount1_b");
		int amount1_b2=sqlMap.selectOne("amount1_b2");
		int amount2_b=sqlMap.selectOne("amount2_b");
		int amount2_b2=sqlMap.selectOne("amount2_b2");
		int amount3_b=sqlMap.selectOne("amount3_b");
		int amount3_b2=sqlMap.selectOne("amount3_b2");
		int amount4_b=sqlMap.selectOne("amount4_b");
		int amount4_b2=sqlMap.selectOne("amount4_b2");
		int amount5_b=sqlMap.selectOne("amount5_b");
		int amount5_b2=sqlMap.selectOne("amount5_b2");
		
		amount_b.add((amount1_b+amount1_b2)/1000);
		amount_b.add((amount2_b+amount2_b2)/1000);
		amount_b.add((amount3_b+amount3_b2)/1000);
		amount_b.add((amount4_b+amount4_b2)/1000);
		amount_b.add((amount5_b+amount5_b2)/1000);
		return amount_b;
	}
	
	@Override
	public List<PaymentDTO> amount_all(int cp, int listSize){
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<PaymentDTO> amount_all=sqlMap.selectList("amount_all",map);
		return amount_all;
		
	}
	
	@Override
	public List<RefundDTO> amount_all_b(int cp, int listSize){
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start",start);
		map.put("end",end);
		
		List<RefundDTO> amount_all_b=sqlMap.selectList("amount_all_b",map);
		return amount_all_b;
	}
	
	@Override
	public int getTotalCnt_all() {
		int count=sqlMap.selectOne("getTotalCnt_all");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public int getTotalCnt_all_b() {
		int count=sqlMap.selectOne("getTotalCnt_all_b");
		count=count==0?1:count;
		return count;
	}

}
