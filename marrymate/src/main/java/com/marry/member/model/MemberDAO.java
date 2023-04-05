package com.marry.member.model;

public interface MemberDAO {
	
	public int memberJoin(MemberDTO dto);
	
	public MemberDTO memberLogin(String id, String pwd);
	
}
