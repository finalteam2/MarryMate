package com.admin.bbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BbsDAO {
	
	public List<BbsListDTO> bbsList(int cp, int listSize, String kind);
	
	public List<BbsListDTO> bbsList_b(int cp, int listSize);
	
	public int getTotalCnt_bbs(String kind);
	
	public int getTotalCnt_bbs_b();
	
	public BbsDTO bbsInfo(int bidx);
	
	public int bi_bbs(int bidx);
	
	public void sd_bbs(int bidx);
	
	public void hj_bbs(int bidx);
	
	public List<BbsDTO> listSel_bidx(String kind, int bidx);
	
	public List<BbsDTO> listSel_subject(int cp, int listSize, String kind, String selectText);
	
	public List<BbsDTO> listSel_bidx_b(String kind, int bidx);
	
	public List<BbsDTO> listSel_subject_b(int cp, int listSize, String kind, String selectText);
	
	public int getTotalCnt_subject(String kind, String selectText);
	
	public int getTotalCnt_subject_b(String kind, String selectText);
	
	public void bbs(String subject,String content);
	
	public BbsDTO bbsContent(int bidx);
	
	public void heajae(int bidx);
	
	public void ceolee(int bidx);

}
