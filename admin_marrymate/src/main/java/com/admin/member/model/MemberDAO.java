package com.admin.member.model;

import java.util.List;

public interface MemberDAO {
	
	public List<MemberDTO> memberList();
	
	public List<Integer> traffic();
	
	public MemberDTO memberInfo(int midx);

}
