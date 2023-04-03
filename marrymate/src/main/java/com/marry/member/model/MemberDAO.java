package com.marry.member.model;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	
	public int checkId(String id);
	
}
