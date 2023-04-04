package com.marry.member.model;

public interface MemberDAO {
	
	public int memberJoin(MemberDTO dto);
	
	public MemberDTO memberLogin(String id, String pwd);
	
	public String getNick(String id);
	
	public String getName(String id);
	
	public String getMarryDate(String id);
	
	public String getPname(String id);
	
}
