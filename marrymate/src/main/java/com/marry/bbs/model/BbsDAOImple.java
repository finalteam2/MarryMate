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
	public int getWritePoint(int midx) {
		return sqlMap.update("getWritePoint", midx);
	}
	
	@Override
	public int getMemberPoint(int midx) {
		return sqlMap.selectOne("getMemberPoint", midx);
	}
	
	@Override
	public int writeInsertPoint(int midx, int point) {
		Map map=new HashMap<String, Integer>();
		map.put("midx", midx);
		map.put("point", point);
		return sqlMap.insert("writeInsertPoint", map);
	}
	
	@Override
	public int replyWrite(ReplyDTO dto) {
		return sqlMap.insert("replyWrite", dto);
	}
	
	@Override
	public List<BbsViewDTO> bbsNotiList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		return sqlMap.selectList("bbsNotiList", map);
	}
	
	@Override
	public List<BbsViewDTO> bbsAfterList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		return sqlMap.selectList("bbsAfterList", map);
	}
	
	@Override
	public List<BbsViewDTO> bbsTalkList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		return sqlMap.selectList("bbsTalkList", map);
	}
	
	@Override
	public List<BbsViewDTO> bbsNotiMini() {
		return sqlMap.selectList("bbsNotiMini");
	}
	
	@Override
	public List<BbsViewDTO> bbsAfterMini() {
		return sqlMap.selectList("bbsAfterMini");
	}
	
	@Override
	public List<BbsViewDTO> bbsTalkMini() {
		return sqlMap.selectList("bbsTalkMini");
	}
	
	@Override
	public List<BbsViewDTO> bbsAfterBest() {
		return sqlMap.selectList("bbsAfterBest");
	}
	
	@Override
	public List<BbsViewDTO> bbsTalkBest() {
		return sqlMap.selectList("bbsTalkBest");
	}
	
	@Override
	public List<BbsViewDTO> bbsAfterFix() {
		return sqlMap.selectList("bbsAfterFix");
	}
	
	@Override
	public List<BbsViewDTO> bbsTalkFix() {
		return sqlMap.selectList("bbsTalkFix");
	}
	
	@Override
	public List<ReplyDTO> replyList(int bidx) {
		return sqlMap.selectList("replyList", bidx);
	}
	
	@Override
	public BbsViewDTO bbsContent(int bidx) {
		return sqlMap.selectOne("bbsContent", bidx);
	}
	
	@Override
	public int bbsNotiCount() {
		return sqlMap.selectOne("bbsNotiCount");
	}
	
	@Override
	public int bbsAfterCount() {
		return sqlMap.selectOne("bbsAfterCount");
	}
	
	@Override
	public int bbsTalkCount() {
		return sqlMap.selectOne("bbsTalkCount");
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
	public int checkClick(int bidx, int midx) {
		Map map=new HashMap<String, Integer>();
		map.put("bidx", bidx);
		map.put("midx", midx);
		return sqlMap.selectOne("checkClick", map);
	}
	
	@Override
	public int contentDelete(int bidx) {
		return sqlMap.delete("contentDelete", bidx);
	}

}
