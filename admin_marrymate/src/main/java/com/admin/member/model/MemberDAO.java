package com.admin.member.model;

import java.util.List;

public interface MemberDAO {
	
	public List<MemberDTO> memberList(int cp, int listSize);
	
	public List<Integer> traffic();
	
	public List<Integer> traffic_all();
	
	public MemberDTO memberInfo(int midx);
	
	public int getTotalCnt_mem();

	public List<MemberDTO> listSel_midx(int midx);
	
	public List<MemberDTO> listSel_name(int cp, int listSize, String selectText);
	
	public int getTotalCnt_name(String selectText);

}
