package com.marry.bbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class BbsDAOImple implements BbsDAO {

	private SqlSessionTemplate sqlMap;
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int bbsWrite(BbsDTO dto) {
		return sqlMap.insert("bbsWrite", dto);
	}
	
	@Override
	public int replyWrite(ReplyDTO dto) {
		return sqlMap.insert("replyWrite", dto);
	}
	
	@Override
	public List<BbsDTO> bbsNotiList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		return sqlMap.selectList("bbsNotiList", map);
	}
	
	@Override
	public List<BbsDTO> bbsAfterList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		return sqlMap.selectList("bbsAfterList", map);
	}
	
	@Override
	public List<BbsDTO> bbsTalkList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		return sqlMap.selectList("bbsTalkList", map);
	}
	
	@Override
	public List<BbsDTO> bbsNotiMini() {
		return sqlMap.selectList("bbsNotiMini");
	}
	
	@Override
	public List<BbsDTO> bbsAfterMini() {
		return sqlMap.selectList("bbsAfterMini");
	}
	
	@Override
	public List<BbsDTO> bbsTalkMini() {
		return sqlMap.selectList("bbsTalkMini");
	}
	
	@Override
	public List<ReplyDTO> replyList(int bidx) {
		return sqlMap.selectList("replyList", bidx);
	}
	
	@Override
	public BbsDTO bbsContent(int bidx) {
		return sqlMap.selectOne("bbsContent", bidx);
	}
	
	@Override
	public int bbsTotalCount() {
		return sqlMap.selectOne("bbsTotalCount");
	}
	
	@Override
	public int watchUp(int bidx) {
		return sqlMap.update("watchUp", bidx);
	}
	
	@Override
	public int bestCount(int bidx, int midx) {
		Map map=new HashMap<String, Integer>();
		map.put("bidx", bidx);
		map.put("midx", midx);
		return sqlMap.insert("bestCount", map);
	}
	
	@Override
	public int worstCount(int bidx, int midx) {
		Map map=new HashMap<String, Integer>();
		map.put("bidx", bidx);
		map.put("midx", midx);
		return sqlMap.insert("worstCount", map);
	}
	
	@Override
	public int contentDelete(int bidx) {
		return sqlMap.delete("contentDelete", bidx);
	}

}
